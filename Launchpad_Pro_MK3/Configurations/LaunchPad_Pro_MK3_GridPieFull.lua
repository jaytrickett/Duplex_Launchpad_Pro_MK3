--[[----------------------------------------------------------------------------
-- Duplex.Launchpad_Pro_MK3
----------------------------------------------------------------------------]]--

duplex_configurations:insert {

  -- configuration properties
  name = "GridPieFull",
  pinned = true,

  -- device properties
  device = {
    class_name = "Launchpad_Pro_MK3",
    display_name = "Launchpad_Pro_MK3",
    device_port_in = "MIDIIN3 (LPProMK3 MIDI)",
    device_port_out = "MIDIOUT3 (LPProMK3 MIDI)",
    control_map = "Controllers/Launchpad_Pro_MK3/Controlmaps/Launchpad_Pro_MK3.xml",
    thumbnail = "Controllers/Launchpad_Pro_MK3/Launchpad_Pro_MK3.bmp",
    protocol = DEVICE_PROTOCOL.MIDI,
  },

  applications = {
    GridPie = {
	    mappings = {
	      grid = {
          group_name = "Grid",
        },
	      v_prev = {
          group_name = "Controls2",
          index = 1,
        },
	      v_next = {
          group_name = "Controls2",
          index = 2,
        },
	      h_prev = {
          group_name = "Controls1",
          index = 1,
        },
	      h_next = {
          group_name = "Controls1",
          index = 2,
        },
    	},
      options = {
        follow_pos = 2
      },
    },
    Navigator = {
        mappings = {
        blockpos = {
          group_name = "Triggers",
        },
      },
    },
    Transport = {
      mappings = {
        edit_mode = {
          group_name = "Controls2",
          index = 8,
        },
        start_playback = {
          group_name = "Controls2",
          index = 7,
        },
        loop_pattern = {
          group_name = "Controls2",
          index = 5,
        },
        follow_player = {
          group_name= "Controls2",
          index = 6,
        },
      },
      options = {
        pattern_play = 3,
      },
    },



  }
}
