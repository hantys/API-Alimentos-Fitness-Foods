module InfoModule
  def version
    '1.0'
  end

  def description
    "API de informação nutricional dos alimentos que os usuários publicam pela aplicação móvel, dados do projeto Open Food Facts"
  end

  def status_database
    ActiveRecord::Base.connected? ? 'OK' : 'FAILURE'
  end

  def last_cron_jobs
    Rails.cache.read('last_job_time')
  end

  def time_online
    info_string = `uptime`
    parts = info_string.split

    # Extrair o tempo online e a carga média
    uptime = parts[2]
    load_average = parts[-3..-1].join(' ') # 0.70, 0.64, 0.67 (carga média)
    {
      online: uptime,
      load_average:
    }
  end

  def memory_usage
    memory_info = `free -m`

    # Dividir a string em linhas
    lines = memory_info.split("\n")

    # Extrair informações de memória (linha 2)
    mem_info = lines[1].split

    {
      total: "#{mem_info[1]} MB",
      used: "#{mem_info[2]} MB",
      free: "#{mem_info[3]} MB"
    }
  end
end