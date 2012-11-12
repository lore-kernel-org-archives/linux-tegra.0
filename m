From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 0/2] NVIDIA Tegra DRM driver
Date: Mon, 12 Nov 2012 22:55:56 +0100
Message-ID: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This second version of this patch series addresses all the comments
received so far. Most notably it takes advantage of the debugfs helpers
provided by the DRM core. Oddly enough this actually increases the line
count, but that's because the helpers don't fit with the subdevices
approach as implemented by this driver. However some quick discussions
with Rob Clark showed that Tegra DRM is not special in this respect but
other drivers may need the same functionality. Eventually the debugfs
code could be reworked on top of helpers that are better suited at the
design of embedded, multi-device DRM drivers.

Other than that there is some removal of code that was actually supposed
to go into a later patch because it has dependencies that haven't been
merged yet and some moving around of #defines and the device tree
bindings documentation. Finally the driver now uses the DRM core's
drm_compat_ioctl() instead of a custom and unimplemented (!) version.

Thierry

Thierry Reding (2):
  drm: Add NVIDIA Tegra20 support
  drm: tegra: Add HDMI support

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  191 +++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/tegra/Kconfig                      |   23 +
 drivers/gpu/drm/tegra/Makefile                     |    7 +
 drivers/gpu/drm/tegra/dc.c                         |  846 +++++++++++++
 drivers/gpu/drm/tegra/dc.h                         |  388 ++++++
 drivers/gpu/drm/tegra/drm.c                        |  115 ++
 drivers/gpu/drm/tegra/drm.h                        |  233 ++++
 drivers/gpu/drm/tegra/fb.c                         |   56 +
 drivers/gpu/drm/tegra/hdmi.c                       | 1324 ++++++++++++++++++++
 drivers/gpu/drm/tegra/hdmi.h                       |  575 +++++++++
 drivers/gpu/drm/tegra/host1x.c                     |  321 +++++
 drivers/gpu/drm/tegra/output.c                     |  262 ++++
 drivers/gpu/drm/tegra/rgb.c                        |  200 +++
 15 files changed, 4544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
 create mode 100644 drivers/gpu/drm/tegra/Kconfig
 create mode 100644 drivers/gpu/drm/tegra/Makefile
 create mode 100644 drivers/gpu/drm/tegra/dc.c
 create mode 100644 drivers/gpu/drm/tegra/dc.h
 create mode 100644 drivers/gpu/drm/tegra/drm.c
 create mode 100644 drivers/gpu/drm/tegra/drm.h
 create mode 100644 drivers/gpu/drm/tegra/fb.c
 create mode 100644 drivers/gpu/drm/tegra/hdmi.c
 create mode 100644 drivers/gpu/drm/tegra/hdmi.h
 create mode 100644 drivers/gpu/drm/tegra/host1x.c
 create mode 100644 drivers/gpu/drm/tegra/output.c
 create mode 100644 drivers/gpu/drm/tegra/rgb.c

-- 
1.8.0
