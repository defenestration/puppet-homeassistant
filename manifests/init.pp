class homeassistant (
  String $location_name,
  Numeric $latitude,
  Numeric $longitude,
  Numeric $elevation,
  Enum['imperial', 'metric'] $unit_system,
  String $time_zone,
  Optional[Hash] $known_devices = undef,
  Optional String $python_version = 'python3',
  Stdlib::Absolutepath $home   = '/srv/homeassistant',
  Stdlib::Absolutepath $confdir = '/etc/homeassistant',
  Boolean $known_devices_replace = false,
) {

  class{'::homeassistant::install':}
  -> class{'::homeassistant::config':}
  ~> class{'::homeassistant::service':}

  contain ::homeassistant::install
  contain ::homeassistant::config
  contain ::homeassistant::service

}
