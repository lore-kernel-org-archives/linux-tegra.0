From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v3.10-rc1
Date: Thu, 18 Apr 2013 16:51:13 +0200
Message-ID: <20130418145113.GA23511@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit e1adc78caf440d3f6be81a947c2b913e73514a68:

  drm/qxl: fix build with debugfs turned off. (2013-04-18 11:47:40 +1000)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux.git tags/drm/tegra/for-3.10

for you to fetch changes up to 2bae088dbb2c3bbd44b58fc0cc4bb3b5d1c00dc7:

  drm/tegra: don't depend on OF (2013-04-18 08:59:44 +0200)

Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.10-rc1

The bulk of this pull-request is the host1x series that has been in the
works for a few months. The current implementation looks good and has
been tested by several independent parties. So far no issues have been
found. To be on the safe side, the new Tegra-specific DRM IOCTLs depend
on staging in order to give some amount of flexibility to change them
just in case. The plan is to remove that dependency once more userspace
exists to verify the adequacy of the IOCTLs.

Currently only the 2D engine is supported, but patches are in the works
to enable 3D support on top of this framework as well. Various bits of
open-source userspace exist to test the 2D and 3D support[0]. This is
still a bit immature but it allows to verify that the kernel interfaces
work properly.

To round things off there are two smaller cleanup patches, one of them
adding a new pixel format and the other removing a redundent Kconfig
dependency.

[0]: https://github.com/grate-driver

----------------------------------------------------------------
Arto Merilainen (2):
      gpu: host1x: drm: Rename host1x to host1x_drm
      gpu: host1x: drm: Add memory manager and fb

Stephen Warren (1):
      drm/tegra: don't depend on OF

Terje Bergstrom (7):
      gpu: host1x: Add host1x driver
      gpu: host1x: Add syncpoint wait and interrupts
      gpu: host1x: Add channel support
      gpu: host1x: Add debug support
      drm/tegra: Move drm to live under host1x
      gpu: host1x: Remove second host1x driver
      drm/tegra: Add gr2d device

Thierry Reding (1):
      drm/tegra: Support the XBGR8888 pixelformat

 drivers/gpu/Makefile                           |   1 +
 drivers/gpu/drm/Kconfig                        |   2 -
 drivers/gpu/drm/Makefile                       |   1 -
 drivers/gpu/drm/tegra/Makefile                 |   7 -
 drivers/gpu/drm/tegra/drm.c                    | 217 ---------
 drivers/gpu/drm/tegra/fb.c                     |  52 --
 drivers/gpu/drm/tegra/host1x.c                 | 327 -------------
 drivers/gpu/host1x/Kconfig                     |  23 +
 drivers/gpu/host1x/Makefile                    |  20 +
 drivers/gpu/host1x/cdma.c                      | 491 +++++++++++++++++++
 drivers/gpu/host1x/cdma.h                      | 100 ++++
 drivers/gpu/host1x/channel.c                   | 126 +++++
 drivers/gpu/host1x/channel.h                   |  52 ++
 drivers/gpu/host1x/debug.c                     | 210 ++++++++
 drivers/gpu/host1x/debug.h                     |  51 ++
 drivers/gpu/host1x/dev.c                       | 246 ++++++++++
 drivers/gpu/host1x/dev.h                       | 308 ++++++++++++
 drivers/gpu/{drm/tegra => host1x/drm}/Kconfig  |  20 +-
 drivers/gpu/{drm/tegra => host1x/drm}/dc.c     |  31 +-
 drivers/gpu/{drm/tegra => host1x/drm}/dc.h     |   0
 drivers/gpu/host1x/drm/drm.c                   | 640 +++++++++++++++++++++++++
 drivers/gpu/{drm/tegra => host1x/drm}/drm.h    |  68 ++-
 drivers/gpu/host1x/drm/fb.c                    | 374 +++++++++++++++
 drivers/gpu/host1x/drm/gem.c                   | 270 +++++++++++
 drivers/gpu/host1x/drm/gem.h                   |  59 +++
 drivers/gpu/host1x/drm/gr2d.c                  | 339 +++++++++++++
 drivers/gpu/{drm/tegra => host1x/drm}/hdmi.c   |   5 +-
 drivers/gpu/{drm/tegra => host1x/drm}/hdmi.h   |   0
 drivers/gpu/{drm/tegra => host1x/drm}/output.c |   0
 drivers/gpu/{drm/tegra => host1x/drm}/rgb.c    |   0
 drivers/gpu/host1x/host1x.h                    |  30 ++
 drivers/gpu/host1x/host1x_bo.h                 |  87 ++++
 drivers/gpu/host1x/host1x_client.h             |  35 ++
 drivers/gpu/host1x/hw/Makefile                 |   6 +
 drivers/gpu/host1x/hw/cdma_hw.c                | 326 +++++++++++++
 drivers/gpu/host1x/hw/channel_hw.c             | 168 +++++++
 drivers/gpu/host1x/hw/debug_hw.c               | 322 +++++++++++++
 drivers/gpu/host1x/hw/host1x01.c               |  42 ++
 drivers/gpu/host1x/hw/host1x01.h               |  25 +
 drivers/gpu/host1x/hw/host1x01_hardware.h      | 143 ++++++
 drivers/gpu/host1x/hw/hw_host1x01_channel.h    | 120 +++++
 drivers/gpu/host1x/hw/hw_host1x01_sync.h       | 243 ++++++++++
 drivers/gpu/host1x/hw/hw_host1x01_uclass.h     | 174 +++++++
 drivers/gpu/host1x/hw/intr_hw.c                | 143 ++++++
 drivers/gpu/host1x/hw/syncpt_hw.c              | 114 +++++
 drivers/gpu/host1x/intr.c                      | 354 ++++++++++++++
 drivers/gpu/host1x/intr.h                      | 102 ++++
 drivers/gpu/host1x/job.c                       | 603 +++++++++++++++++++++++
 drivers/gpu/host1x/job.h                       | 162 +++++++
 drivers/gpu/host1x/syncpt.c                    | 387 +++++++++++++++
 drivers/gpu/host1x/syncpt.h                    | 165 +++++++
 drivers/video/Kconfig                          |   2 +
 include/trace/events/host1x.h                  | 272 +++++++++++
 include/uapi/drm/Kbuild                        |   1 +
 include/uapi/drm/tegra_drm.h                   | 136 ++++++
 55 files changed, 7558 insertions(+), 644 deletions(-)
 delete mode 100644 drivers/gpu/drm/tegra/Makefile
 delete mode 100644 drivers/gpu/drm/tegra/drm.c
 delete mode 100644 drivers/gpu/drm/tegra/fb.c
 delete mode 100644 drivers/gpu/drm/tegra/host1x.c
 create mode 100644 drivers/gpu/host1x/Kconfig
 create mode 100644 drivers/gpu/host1x/Makefile
 create mode 100644 drivers/gpu/host1x/cdma.c
 create mode 100644 drivers/gpu/host1x/cdma.h
 create mode 100644 drivers/gpu/host1x/channel.c
 create mode 100644 drivers/gpu/host1x/channel.h
 create mode 100644 drivers/gpu/host1x/debug.c
 create mode 100644 drivers/gpu/host1x/debug.h
 create mode 100644 drivers/gpu/host1x/dev.c
 create mode 100644 drivers/gpu/host1x/dev.h
 rename drivers/gpu/{drm/tegra => host1x/drm}/Kconfig (52%)
 rename drivers/gpu/{drm/tegra => host1x/drm}/dc.c (97%)
 rename drivers/gpu/{drm/tegra => host1x/drm}/dc.h (100%)
 create mode 100644 drivers/gpu/host1x/drm/drm.c
 rename drivers/gpu/{drm/tegra => host1x/drm}/drm.h (77%)
 create mode 100644 drivers/gpu/host1x/drm/fb.c
 create mode 100644 drivers/gpu/host1x/drm/gem.c
 create mode 100644 drivers/gpu/host1x/drm/gem.h
 create mode 100644 drivers/gpu/host1x/drm/gr2d.c
 rename drivers/gpu/{drm/tegra => host1x/drm}/hdmi.c (99%)
 rename drivers/gpu/{drm/tegra => host1x/drm}/hdmi.h (100%)
 rename drivers/gpu/{drm/tegra => host1x/drm}/output.c (100%)
 rename drivers/gpu/{drm/tegra => host1x/drm}/rgb.c (100%)
 create mode 100644 drivers/gpu/host1x/host1x.h
 create mode 100644 drivers/gpu/host1x/host1x_bo.h
 create mode 100644 drivers/gpu/host1x/host1x_client.h
 create mode 100644 drivers/gpu/host1x/hw/Makefile
 create mode 100644 drivers/gpu/host1x/hw/cdma_hw.c
 create mode 100644 drivers/gpu/host1x/hw/channel_hw.c
 create mode 100644 drivers/gpu/host1x/hw/debug_hw.c
 create mode 100644 drivers/gpu/host1x/hw/host1x01.c
 create mode 100644 drivers/gpu/host1x/hw/host1x01.h
 create mode 100644 drivers/gpu/host1x/hw/host1x01_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x01_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x01_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x01_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/intr_hw.c
 create mode 100644 drivers/gpu/host1x/hw/syncpt_hw.c
 create mode 100644 drivers/gpu/host1x/intr.c
 create mode 100644 drivers/gpu/host1x/intr.h
 create mode 100644 drivers/gpu/host1x/job.c
 create mode 100644 drivers/gpu/host1x/job.h
 create mode 100644 drivers/gpu/host1x/syncpt.c
 create mode 100644 drivers/gpu/host1x/syncpt.h
 create mode 100644 include/trace/events/host1x.h
 create mode 100644 include/uapi/drm/tegra_drm.h

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRcAhhAAoJEN0jrNd/PrOhvjQP/j0r1xbuto73IzZoz7U6Ley4
64RTV8zvmKxvXmGXzJ5f04HUgDH+NmIyxUYDdhuhckUNa90azmZTKQjK+0ERcUMz
qEd7HyEqUG6uz0nAAAAzGXQu12izh46HgJBmtg8hA9tAJAiy1Nt+9TI95wj0FvIX
CZoCX0UbBKPPiOtqU0uSVW1w4Sl5I5lLlFStwEWr4GxwL9G5Pur7FEwVLTNoQJFi
nTvpgRbh0a73AlBcKVkg2ejEEnMd7RWMRAq/pfdORU0dRAAcWDqBTX4oOY3DTr5f
kZ3dy9VFYKEA+ICgusi+WCfXqkJHHmiRgdGmp4OGuAvdWLmkqD6JQnC+zl3eHASY
yh22XH9Qd6L9JweaIJnhk+l4L68N5bU69teH18V7PnHKz375fxxSe4qkoV3Yphdg
UCB+R5F3tPyBgyuHEmJeVTBYzV8yYBHE1CNZLeZHPa8WxSr+f+oCphFV6IXYkw4a
P3sG59Gj4TmqZVvZhuqDJH5Gc/m6DRAb3f6szVlS/lhwGnU0c4uvqw9KSssvp++M
fw9pBuY6lbgXjiPioIH8n+uzeTd9SXIDPzZpiiHS0rCcWtbw9QUZWsrnWe5SwQJH
f0ljb7lAf7K0HkceAxIDowBwv1KE2SMVfG6ozNuUzrTc3m2pb4g5TXItK52TSvAP
M5QEoBo/mSiRkFjNfzeG
=MYOV
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
