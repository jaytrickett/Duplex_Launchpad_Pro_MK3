--[[----------------------------------------------------------------------------
-- Duplex.R-control
----------------------------------------------------------------------------]]--

-- default configuration of the R-control

--==============================================================================

duplex_configurations:insert {

  -- configuration properties
  name = "Mixer + Transport",
  pinned = true,

  -- device properties
  device = {
    display_name = "R-control",
    device_port_in = "USB R-control",
    device_port_out = "USB R-control",
    control_map = "Controllers/R-control/Controlmaps/R-control.xml",
    thumbnail = "Controllers/R-control/R-control.bmp",
    protocol = DEVICE_MIDI_PROTOCOL
  },


  applications = {
    Mixer = {
      mappings = {
        levels = {
          group_name = "Encoders"
        },
        page = {
          group_name = "Switches",
          index = 5,
        },
        mode = {
          group_name = "Switches",
          index = 8,
        },
        master = {
          group_name = "Master",
        },
      }
    },
    Transport = {
      mappings = {
        start_playback = {
          group_name = "Switches",
          index = 1,
        },
        stop_playback = {
          group_name = "Switches",
          index = 2,
        },
        edit_mode = {
          group_name = "Switches",
          index = 3,
        },
        block_loop = {
          group_name = "Switches",
          index = 4,
        },
      }
    },
  }
}

