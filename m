From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/27] drm/tegra: Repatriation and DSI support
Date: Mon,  7 Oct 2013 10:34:17 +0200
Message-ID: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series of patches moves the Tegra DRM driver back to drivers/gpu/drm
where it belongs. While this is not entirely trivial, decoupling it from the
host1x driver will make things easier in the long run.

Patches 1 to 14 are mostly cleanup and decoupling from host1x. After those
patches, the DRM specific parts are back in drivers/gpu/drm/tegra in which
they originated and all host1x support code that they use is exported by the
host1x driver and exposed in the include/linux/host1x.h header file.

The larger part of patches 15 to 20 have been contributed by Mikko Perttunen
and add support for HDMI on Tegra114.

Patches 21 to 23 are the panel support patches, addressing comments that I
received on an earlier version.

Patch 24 fixes an issue with the DPMS mode tracking. Connectors default to
off on Tegra, so the initial DPMS mode needs to reflect that.

Patches 25 and 27 add support for DSI and gr2d on Tegra114.

Thierry

Mikko Perttunen (4):
  drm/tegra: Add Tegra114 display controller support
  drm/tegra: Add Tegra114 HDMI support
  drm/tegra: hdmi: Detect DVI-only displays
  host1x: hdmi: Enable VDD earlier for hotplug/DDC

Thierry Reding (23):
  drm/tegra: Remove unused fields
  drm/tegra: Cleanup tegra_dc structure
  drm/tegra: Rename host1x_drm structure to tegra_drm
  drm/tegra: Rename host1x_drm_file to tegra_drm_file
  drm/tegra: Rename host1x_drm_context to tegra_drm_context
  gpu: host1x: Cleanup includes
  gpu: host1x: Do not discard .remove()
  drm/tegra: gr2d: Miscellaneous cleanups
  drm/tegra: gem: Miscellaneous cleanups
  gpu: host1x: Make host1x header file public
  drm/tegra: Introduce tegra_drm_client structure
  gpu: host1x: Expose syncpt and channel functionality
  drm/tegra: Move subdevice infrastructure to host1x
  drm/tegra: Move driver to DRM tree
  gpu: host1x: Add support for Tegra114
  drm/tegra: hdmi: Rename tegra{2,3} to tegra{20,30}
  drm: Add panel support
  drm/panel: Add simple panel support
  drm/tegra: Implement panel support
  drm/tegra: Start connectors with correct DPMS mode
  gpu: host1x: Add MIPI pad calibration support
  drm/tegra: Add DSI support
  drm/tegra: Add Tegra114 gr2d support

 .../devicetree/bindings/panel/auo,b101aw03.txt     |    7 +
 .../bindings/panel/chunghwa,claa101wb03.txt        |    7 +
 .../bindings/panel/panasonic,vvx10f004b00.txt      |    7 +
 .../devicetree/bindings/panel/simple-panel.txt     |   21 +
 MAINTAINERS                                        |    2 +
 drivers/gpu/drm/Kconfig                            |    4 +
 drivers/gpu/drm/Makefile                           |    3 +
 drivers/gpu/drm/drm_panel.c                        |   96 ++
 drivers/gpu/drm/panel/Kconfig                      |   17 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-simple.c               |  339 +++++++
 drivers/gpu/{host1x/drm => drm/tegra}/Kconfig      |   11 +-
 drivers/gpu/drm/tegra/Makefile                     |   16 +
 drivers/gpu/drm/tegra/bus.c                        |  123 +++
 drivers/gpu/{host1x/drm => drm/tegra}/dc.c         |   34 +-
 drivers/gpu/{host1x/drm => drm/tegra}/dc.h         |    1 +
 drivers/gpu/{host1x/drm => drm/tegra}/drm.c        |  441 ++++-----
 drivers/gpu/{host1x/drm => drm/tegra}/drm.h        |   92 +-
 drivers/gpu/drm/tegra/dsi.c                        | 1026 ++++++++++++++++++++
 drivers/gpu/{host1x/drm => drm/tegra}/fb.c         |   16 +-
 drivers/gpu/{host1x/drm => drm/tegra}/gem.c        |   30 +-
 drivers/gpu/{host1x/drm => drm/tegra}/gem.h        |    4 +-
 drivers/gpu/{host1x/drm => drm/tegra}/gr2d.c       |  176 ++--
 drivers/gpu/{host1x/drm => drm/tegra}/hdmi.c       |  177 +++-
 drivers/gpu/{host1x/drm => drm/tegra}/hdmi.h       |  152 +++
 drivers/gpu/{host1x/drm => drm/tegra}/output.c     |   40 +-
 drivers/gpu/{host1x/drm => drm/tegra}/rgb.c        |    3 -
 drivers/gpu/host1x/Kconfig                         |    2 -
 drivers/gpu/host1x/Makefile                        |   14 +-
 drivers/gpu/host1x/bus.c                           |  309 ++++++
 drivers/gpu/host1x/{host1x_client.h => bus.h}      |   24 +-
 drivers/gpu/host1x/cdma.c                          |    2 +-
 drivers/gpu/host1x/channel.h                       |    6 -
 drivers/gpu/host1x/dev.c                           |   73 +-
 drivers/gpu/host1x/dev.h                           |    9 +-
 drivers/gpu/host1x/host1x.h                        |   30 -
 drivers/gpu/host1x/host1x_bo.h                     |   87 --
 drivers/gpu/host1x/hw/channel_hw.c                 |    4 +-
 drivers/gpu/host1x/hw/debug_hw.c                   |    8 -
 drivers/gpu/host1x/hw/host1x02.c                   |   42 +
 drivers/gpu/host1x/hw/host1x02.h                   |   26 +
 drivers/gpu/host1x/hw/hw_host1x02_channel.h        |  121 +++
 drivers/gpu/host1x/hw/hw_host1x02_sync.h           |  243 +++++
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h         |  175 ++++
 drivers/gpu/host1x/job.c                           |    2 +-
 drivers/gpu/host1x/job.h                           |  108 ---
 drivers/gpu/host1x/mipi.c                          |  230 +++++
 drivers/gpu/host1x/syncpt.c                        |   19 +
 drivers/gpu/host1x/syncpt.h                        |   40 +-
 drivers/video/Kconfig                              |    4 +-
 include/drm/drmP.h                                 |    1 +
 include/drm/drm_panel.h                            |   78 ++
 include/linux/host1x.h                             |  278 ++++++
 53 files changed, 3922 insertions(+), 859 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b101aw03.txt
 create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
 create mode 100644 Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
 create mode 100644 Documentation/devicetree/bindings/panel/simple-panel.txt
 create mode 100644 drivers/gpu/drm/drm_panel.c
 create mode 100644 drivers/gpu/drm/panel/Kconfig
 create mode 100644 drivers/gpu/drm/panel/Makefile
 create mode 100644 drivers/gpu/drm/panel/panel-simple.c
 rename drivers/gpu/{host1x/drm => drm/tegra}/Kconfig (97%)
 create mode 100644 drivers/gpu/drm/tegra/Makefile
 create mode 100644 drivers/gpu/drm/tegra/bus.c
 rename drivers/gpu/{host1x/drm => drm/tegra}/dc.c (97%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/dc.h (99%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/drm.c (56%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/drm.h (78%)
 create mode 100644 drivers/gpu/drm/tegra/dsi.c
 rename drivers/gpu/{host1x/drm => drm/tegra}/fb.c (96%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gem.c (89%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gem.h (98%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/gr2d.c (68%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/hdmi.c (86%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/hdmi.h (72%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/output.c (87%)
 rename drivers/gpu/{host1x/drm => drm/tegra}/rgb.c (98%)
 create mode 100644 drivers/gpu/host1x/bus.c
 rename drivers/gpu/host1x/{host1x_client.h => bus.h} (60%)
 delete mode 100644 drivers/gpu/host1x/host1x.h
 delete mode 100644 drivers/gpu/host1x/host1x_bo.h
 create mode 100644 drivers/gpu/host1x/hw/host1x02.c
 create mode 100644 drivers/gpu/host1x/hw/host1x02.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_uclass.h
 create mode 100644 drivers/gpu/host1x/mipi.c
 create mode 100644 include/drm/drm_panel.h
 create mode 100644 include/linux/host1x.h

-- 
1.8.4
