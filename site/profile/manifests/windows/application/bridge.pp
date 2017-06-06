class profile::windows::application::bridge (
  $application_name = 'Exporter',
  $log_path         = hiera('base::app_logs_path'),
) {

  filebeat::prospector { $application_name:
    paths    => [
      "$log_path\*\*.log",
    ],
    doc_type => 'log',
    fields   => { 'applicationName' => $application_name, 'environment' => $::stage }
  }

}