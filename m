From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] drm/tegra: Changes for v3.14-rc1
Date: Fri, 20 Dec 2013 23:12:11 +0100
Message-ID: <20131220221209.GA4641@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit a4d86e5e42f5ceea2a076735c887cc49a885a043:

  Merge tag 'tegra-for-3.14-powergate' into drm/for-next (2013-12-17 18:09:23 +0100)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.14-rc1

for you to fetch changes up to 81239c6f7972d4909a6862d08ed1d2943983ffd4:

  drm/tegra: fix compile w/ CONFIG_DYNAMIC_DEBUG (2013-12-20 15:56:33 +0100)

As previously discussed on IRC, this is based on two dependency branches
that Stephen published. I've furthermore pulled in v3.13-rc4 to avoid
conflicts with some fixes that went into 3.13-rc4. The diffstat below is
just the DRM changes, though. I hope that's fine, but if you'd rather
see the whole list of changes that this pulls in I can regenerate the
pull request.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.14-rc1

This series of changes brings DRM panel support as well as initial code
to register DSI hosts and peripherals and bind them to DSI drivers. The
panel and DSI code are both used by the simple panel driver.

The Tegra-specific changes build on top of this work to add support for
various panels found on Tegra boards. New drivers enable the DSI host
found on Tegra114 and a special hardware block that calibrates the pads
used for DSI and CSI. The host1x and the display controller drivers gain
basic Tegra124 support. To round of the new features, the DRM driver now
sports a very simple PRIME implementation.

In addition there are various improvements such as the host1x API being
exported so that client drivers (like the Tegra DRM driver) can be built
as modules. HDMI now does better power management and legacy FBDEV can
now be disabled via Kconfig (though it's still enabled by default). A
few sparse warnings have been squashed and various parts of the code
have become more robust.

----------------------------------------------------------------
Andrzej Hajda (1):
      drm: Add MIPI DSI bus support

Dan Carpenter (1):
      drm/tegra: Fix small leak on error in tegra_fb_alloc()

Paul Walmsley (1):
      gpu: host1x: clk_round_rate() can return a zero upon error

Stephen Warren (1):
      drm/tegra: fix compile w/ CONFIG_DYNAMIC_DEBUG

Thierry Reding (28):
      of: Add MIPI DSI bus device tree bindings
      of: Add simple panel device tree binding
      drm: Add panel support
      drm/panel: Add simple panel support
      drm/panel: Add support for Panasonic VVX10F004B0
      drm/tegra: Implement panel support
      gpu: host1x: Update host1x device tree example
      gpu: host1x: Add MIPI pad calibration DT bindings
      gpu: host1x: Add MIPI pad calibration support
      gpu: host1x: Export public API
      gpu: host1x: Use the correct HW headers for host1x02
      gpu: host1x: Fix more sparse warnings
      gpu: host1x: Increase compile test coverage
      gpu: host1x: Fix build warnings
      gpu: host1x: Add Tegra124 support
      drm/tegra: Allow the driver to be built as a module
      drm/tegra: Increase compile test coverage
      drm/tegra: Remove spurious blank line
      drm/tegra: Do not export tegra_bo_ops
      drm/tegra: Fix HDMI audio frequency typo
      drm/tegra: Track HDMI enable state
      drm/tegra: Disable outputs for power-saving
      drm/tegra: Add DSI support
      drm/tegra: Sort reverse-dependencies alphabetically
      drm/tegra: Make legacy fbdev support optional
      drm/tegra: Add Tegra124 DC support
      drm/tegra: Relocate some output-specific code
      drm/tegra: Add PRIME support

Wei Yongjun (1):
      drm/tegra: Fix return value check

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  16 +-
 .../devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt  |  98 +++
 .../bindings/mipi/nvidia,tegra114-mipi.txt         |  41 +
 .../devicetree/bindings/panel/auo,b101aw03.txt     |   7 +
 .../bindings/panel/chunghwa,claa101wb03.txt        |   7 +
 .../bindings/panel/panasonic,vvx10f004b00.txt      |   7 +
 .../devicetree/bindings/panel/simple-panel.txt     |  21 +
 drivers/gpu/drm/Kconfig                            |   6 +
 drivers/gpu/drm/Makefile                           |   3 +
 drivers/gpu/drm/drm_mipi_dsi.c                     | 315 +++++++
 drivers/gpu/drm/drm_panel.c                        | 100 +++
 drivers/gpu/drm/panel/Kconfig                      |  19 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-simple.c               | 497 +++++++++++
 drivers/gpu/drm/tegra/Kconfig                      |  24 +-
 drivers/gpu/drm/tegra/Makefile                     |   2 +
 drivers/gpu/drm/tegra/dc.c                         |  66 +-
 drivers/gpu/drm/tegra/dc.h                         |   9 +
 drivers/gpu/drm/tegra/drm.c                        |  21 +-
 drivers/gpu/drm/tegra/drm.h                        |  12 +
 drivers/gpu/drm/tegra/dsi.c                        | 971 +++++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.h                        | 134 +++
 drivers/gpu/drm/tegra/fb.c                         |  45 +-
 drivers/gpu/drm/tegra/gem.c                        | 183 +++-
 drivers/gpu/drm/tegra/gem.h                        |   9 +-
 drivers/gpu/drm/tegra/hdmi.c                       |  60 +-
 drivers/gpu/drm/tegra/mipi-phy.c                   | 138 +++
 drivers/gpu/drm/tegra/mipi-phy.h                   |  65 ++
 drivers/gpu/drm/tegra/output.c                     |  44 +-
 drivers/gpu/drm/tegra/rgb.c                        |  45 +
 drivers/gpu/host1x/Kconfig                         |   2 +-
 drivers/gpu/host1x/Makefile                        |   4 +-
 drivers/gpu/host1x/bus.c                           |   2 +
 drivers/gpu/host1x/channel.c                       |   5 +
 drivers/gpu/host1x/debug.c                         |  13 +-
 drivers/gpu/host1x/dev.c                           |  28 +-
 drivers/gpu/host1x/dev.h                           |   2 +
 drivers/gpu/host1x/hw/host1x02.c                   |   4 +-
 drivers/gpu/host1x/hw/host1x02_hardware.h          | 142 +++
 drivers/gpu/host1x/hw/host1x04.c                   |  42 +
 drivers/gpu/host1x/hw/host1x04.h                   |  26 +
 drivers/gpu/host1x/hw/host1x04_hardware.h          | 142 +++
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h         |   6 +
 drivers/gpu/host1x/hw/hw_host1x04_channel.h        | 121 +++
 drivers/gpu/host1x/hw/hw_host1x04_sync.h           | 243 ++++++
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h         | 181 ++++
 drivers/gpu/host1x/job.c                           |   6 +
 drivers/gpu/host1x/mipi.c                          | 275 ++++++
 drivers/gpu/host1x/syncpt.c                        |   9 +
 include/drm/drm_mipi_dsi.h                         | 158 ++++
 include/drm/drm_panel.h                            |  82 ++
 include/linux/host1x.h                             |   6 +
 52 files changed, 4380 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
 create mode 100644 Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b101aw03.txt
 create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
 create mode 100644 Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
 create mode 100644 Documentation/devicetree/bindings/panel/simple-panel.txt
 create mode 100644 drivers/gpu/drm/drm_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/drm_panel.c
 create mode 100644 drivers/gpu/drm/panel/Kconfig
 create mode 100644 drivers/gpu/drm/panel/Makefile
 create mode 100644 drivers/gpu/drm/panel/panel-simple.c
 create mode 100644 drivers/gpu/drm/tegra/dsi.c
 create mode 100644 drivers/gpu/drm/tegra/dsi.h
 create mode 100644 drivers/gpu/drm/tegra/mipi-phy.c
 create mode 100644 drivers/gpu/drm/tegra/mipi-phy.h
 create mode 100644 drivers/gpu/host1x/hw/host1x02_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/host1x04.c
 create mode 100644 drivers/gpu/host1x/hw/host1x04.h
 create mode 100644 drivers/gpu/host1x/hw/host1x04_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x04_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x04_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x04_uclass.h
 create mode 100644 drivers/gpu/host1x/mipi.c
 create mode 100644 include/drm/drm_mipi_dsi.h
 create mode 100644 include/drm/drm_panel.h

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStMC5AAoJEN0jrNd/PrOhsYgQAIo/1W2nP3XJ7wQYYRLdsJAP
qzeM8kJnVCt38RF7i/Zio6JXfOql/sSa2PzVFs7ErfluvgiQeut6p1jXU0fSWuRk
W1XoCIf/uFWhXpLvJ3tYDEL79uJgRqwLu4CwBPtv+32Cnn2K1pX2aaC5Nmww9HzP
fVhFhrbLA44A6ebqT2G0REQfGvd+jpFyT6PSe4LwCM8iOo+uyrdwh7oSSgh8HRG/
3t3Jy+UoJRymp0o1I5GR9as0QuByIYFDBJhx5IfZaCbYzedCMjtG8q6cELC0GWpV
wUknaj147FnUEzr2UfDcGqjKirP1yV5jou5m66nFNNuZ1FHw33kdm1Li2UZrCE96
Br3KJ2NGeeTSakPiI7PaiXEotGuTMRdUYfpwZ1nk3Bze4L4TKDD62fj7RblcMPQL
X+4lLmP5Gtd1mGXAXkZ0J5cUdW4DOsFuwbp+wvWsvGPX3T8p+ATirKPXB7r17Ncm
4zmXseIoH5sDZIwG5TFa3gTvnKoVAgX+s4aFjvcUgMzRaPS+x6C0p0iP7t/vzWZt
Cic5e2IHSqQi1nakWJgfiJjMHnFK0eRGt/o9J54kfq/oNUwBcAPCo6fw28gvTHhM
O1wFTzIwBhF2/2wF4ZLJTocm+Yb4613axBlqxW7iNp/cXJw2/U0sIFCCjAeN2gzR
Ywn7QLpuZAXh5mRb4qyK
=USHe
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
