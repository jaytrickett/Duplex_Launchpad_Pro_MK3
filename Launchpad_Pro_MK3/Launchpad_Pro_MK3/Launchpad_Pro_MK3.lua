--[[----------------------------------------------------------------------------
-- Duplex.Launchpad_Pro_MK3
----------------------------------------------------------------------------]]--

--[[

Inheritance: Launchpad_Pro_MK3 > MidiDevice > Device

A device-specific class

--]]


--==============================================================================

class "Launchpad_Pro_MK3" (MidiDevice)

function Launchpad_Pro_MK3:__init(display_name, message_stream, port_in, port_out)
  TRACE("Launchpad_Pro_MK3:__init", display_name, message_stream, port_in, port_out)

  MidiDevice.__init(self, display_name, message_stream, port_in, port_out)

  -- set device to "daw mode"
  self:send_sysex_message(0x00,0x20,0x29,0x02,0x0E,0x10,0x01)

  -- this device has a color-space with 4 degrees of red and green
  self.colorspace = {4, 4, 0}

end

--------------------------------------------------------------------------------

-- clear display before releasing device:
-- all LEDs are turned off, and the mapping mode, buffer settings,
-- and duty cycle are reset to defaults

function Launchpad_Pro_MK3:release()
  TRACE("Launchpad_Pro_MK3:release()")

--  self:send_cc_message(0,0)
  self:send_sysex_message(0x00,0x20,0x29,0x02,0x0E,0x10,0x00)

  MidiDevice.release(self)

end

--------------------------------------------------------------------------------

--- override default Device method
-- @see Device.output_value

function Launchpad_Pro_MK3:output_value(pt,xarg,ui_obj)
  TRACE("Launchpad_Pro_MK3:output_value(pt,xarg,ui_obj)",pt,xarg,ui_obj)

  --if xarg.skip_echo then
    --- parameter only exist in the virtual ui
  --  return Device.output_value(self,pt,xarg,ui_obj)
  --else

    --print("launcpad output value...",rprint(pt.color))

    -- default color is light/yellow
    local rslt = 127

    local red = pt.color[1]
    local green = pt.color[2]


    red = math.floor(red/64)
    green = math.floor(green/64)

    -- 12 for standard flags
    rslt = 16*green+red+12

    return rslt

  --end


end


--------------------------------------------------------------------------------
-- A couple of sample configurations
--------------------------------------------------------------------------------

-- setup "Mixer" as the only app for this configuration

--[[
duplex_configurations:insert {

  -- configuration properties
  name = "Mixer",
  pinned = false,

  -- device properties
  device = {
    class_name = "Launchpad_Pro_MK3",
    display_name = "Launchpad_Pro_MK3",
    device_port_in = "Launchpad_Pro_MK3",
    device_port_out = "Launchpad_Pro_MK3",
    control_map = "Controllers/Launchpad_Pro_MK3/Launchpad_Pro_MK3.xml",
    thumbnail = "Launchpad_Pro_MK3.bmp",
    protocol = DEVICE_PROTOCOL.MIDI,
  },

  applications = {
    Mixer = {
      mappings = {
        levels = {
          group_name = "Grid",
        },
        mute = {
          group_name = "Controls",
        },
        master = {
          group_name = "Triggers",
        }
      },
      options = {
        invert_mute = 1
      }
    }
  }
}
]]

--------------------------------------------------------------------------------

-- Here's how to make a second Launchpad_Pro_MK3 show up as a separate device
-- Notice that the "display name" is different

--[[
duplex_configurations:insert {

  -- configuration properties
  name = "Matrix + Transport",
  pinned = true,

  -- device properties
  device = {
    class_name = "Launchpad_Pro_MK3",
    display_name = "Launchpad_Pro_MK3 (2)",
    device_port_in = "Launchpad_Pro_MK3 (2)",
    device_port_out = "Launchpad_Pro_MK3 (2)",
    control_map = "Controllers/Launchpad_Pro_MK3/Launchpad_Pro_MK3.xml",
    thumbnail = "Launchpad_Pro_MK3.bmp",
    protocol = DEVICE_PROTOCOL.MIDI,
  },

  applications = {
    Matrix = {
      mappings = {
        matrix = {
          group_name = "Grid",
        },
        triggers = {
          group_name = "Triggers",
        },
        sequence = {
          group_name = "Controls",
          index = 1,
        },
        track = {
          group_name = "Controls",
          index = 3,
        }
      },
      options = {
        --switch_mode = 4,
      }
    },
    Transport = {
      mappings = {
        edit_mode = {
          group_name = "Controls",
          index = 5,
        },
        start_playback = {
          group_name = "Controls",
          index = 6,
        },
        loop_pattern = {
          group_name = "Controls",
          index = 7,
        },
        follow_player = {
          group_name= "Controls",
          index = 8,
        },
      },
      options = {
        pattern_play = 3,
      },
    },

  }
}

]]
