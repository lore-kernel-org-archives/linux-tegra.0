From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v3.16-rc1
Date: Mon, 9 Jun 2014 12:26:25 +0200
Message-ID: <20140609102624.GA2687@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The following changes since commit 5ea1f752ae04be403a3dc8ec876a60d7f5f6990a:

  drm: add drm_fb_helper_restore_fbdev_mode_unlocked() (2014-06-05 10:02:40=
 +1000)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.16-rc1

for you to fetch changes up to 1f64ae7c5af0d65b2491af30ce7a295569e452c9:

  drm/tegra: sor - Remove obsolete comment (2014-06-09 12:02:51 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.16-rc1

The majority of these changes are a slew of cleanups across the board.
A more noteworthy change is the addition of drm_dev_set_unique() and the
conversion of the Tegra DRM driver to use it. This allows us to get rid
of the host1x drm_bus implementation. Other USB and platform drivers can
be changed in a similar way. Unfortunately for most PCI devices there is
some userspace that relies on the old functionality and cannot be as
easily converted.

HDMI and hardware cursor support is added for Tegra124. The SOR output
gains support for exposing CRCs via debugfs, which can be used for
automated testing. Many values that were hardcoded in the SOR/eDP code
are now computed at runtime to increase compatibility with more devices.

----------------------------------------------------------------
St=C3=A9phane Marchesin (3):
      drm/tegra: sor - Remove pixel clock rounding
      drm/tegra: sor - Fix copy/paste error
      drm/tegra: sor - Change power down ordering

Thierry Reding (44):
      drm/tegra: Cleanup header file
      drm/tegra: dc - Add YUYV support
      drm/tegra: sor - Add CRC debugfs support
      drm/tegra: dc - Rename INVERT_V to V_DIRECTION
      drm/tegra: dc - Reshuffle code to get rid of prototypes
      drm/tegra: dc - Do not touch power control register
      drm/tegra: dc - Use proper H/V ref-to-sync values
      drm/tegra: hdmi - Add connector supply support
      drm/tegra: hdmi - Remove duplicate code
      drm/tegra: hdmi - Reverse regulator enable ordering
      drm/tegra: hdmi - Clean up clock usage
      drm/tegra: hdmi - Use proper power-up sequence
      drm/tegra: hdmi - Disable LVDS mode
      drm/tegra: hdmi - Fix disable sequence
      drm/tegra: dsi - Use internal pixel format
      drm/tegra: dsi - Remove unneeded code
      drm/tegra: dsi - Implement VDD supply support
      drm/tegra: dsi - Initialize proper packet sequences
      drm/tegra: dsi - Add enable guard
      drm/tegra: dsi - Fix typo when disabling controller
      drm/tegra: dsi - Reset controller on driver unload
      drm/tegra: dc - Move around shift clock programming
      drm/tegra: dc - Compute shift clock divider in output drivers
      drm/tegra: dsi - Do not needlessly recompute pclk
      drm/tegra: sor - Protect CRC debugfs against enable state
      drm/tegra: hdmi - Add Tegra124 support
      drm/tegra: gem - Make tegra_bo_import() static
      gpu: host1x: Rename internal functions for clarity
      drm: Introduce drm_dev_set_unique()
      drm: Add device registration documentation
      drm: Document how to register devices without struct drm_bus
      drm/tegra: Remove host1x drm_bus implementation
      drm/tegra: Add hardware cursor support
      drm/tegra: dp - Implement hotplug detection in work queue
      drm/tegra: dp - Mark the connector as hotplug capable
      drm/tegra: sor - Recursively remove debugfs tree
      drm/tegra: sor - Make debugfs setup consistent
      drm/tegra: sor - Don't hardcode link parameters
      drm/tegra: sor - Do not hardcode number of blank symbols
      drm/tegra: sor - Do not hardcode link speed
      drm/tegra: sor - Do not program interlaced mode registers
      drm/tegra: sor - Power on only the necessary lanes
      drm/tegra: sor - Enable only the necessary number of lanes
      drm/tegra: sor - Remove obsolete comment

 Documentation/DocBook/drm.tmpl                                  |  36 ++++=
++++++++++
 Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt |   2 +
 drivers/gpu/drm/drm_ioctl.c                                     |  24 ++++=
++---
 drivers/gpu/drm/drm_pci.c                                       |  80 ++++=
++++++++++----------------
 drivers/gpu/drm/drm_platform.c                                  |  15 +++-=
--
 drivers/gpu/drm/drm_stub.c                                      |  48 ++++=
+++++++++-----
 drivers/gpu/drm/drm_usb.c                                       |  20 ++++=
+++-
 drivers/gpu/drm/tegra/Makefile                                  |   1 -
 drivers/gpu/drm/tegra/bus.c                                     |  64 ----=
--------------------
 drivers/gpu/drm/tegra/dc.c                                      | 673 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------=
---------------------------------------------------------------------------=
-----------------
 drivers/gpu/drm/tegra/dc.h                                      |  33 ++++=
+++++++--
 drivers/gpu/drm/tegra/dpaux.c                                   |  31 ++++=
++++----
 drivers/gpu/drm/tegra/drm.c                                     |  36 ++++=
++++++++--
 drivers/gpu/drm/tegra/drm.h                                     |  58 ++++=
++++++------------
 drivers/gpu/drm/tegra/dsi.c                                     | 250 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++--------------------------=
-------------
 drivers/gpu/drm/tegra/dsi.h                                     |  10 ++++
 drivers/gpu/drm/tegra/gem.c                                     |   3 +-
 drivers/gpu/drm/tegra/gr2d.c                                    |   8 +--
 drivers/gpu/drm/tegra/gr3d.c                                    |   8 +--
 drivers/gpu/drm/tegra/hdmi.c                                    | 202 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/gpu/drm/tegra/hdmi.h                                    |   5 ++
 drivers/gpu/drm/tegra/rgb.c                                     |  31 ++++=
+++++++-
 drivers/gpu/drm/tegra/sor.c                                     | 478 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++-------------------
 drivers/gpu/drm/tegra/sor.h                                     |   4 ++
 drivers/gpu/host1x/bus.c                                        |  12 ++---
 include/drm/drmP.h                                              |   2 +
 26 files changed, 1446 insertions(+), 688 deletions(-)
 delete mode 100644 drivers/gpu/drm/tegra/bus.c

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlYvQAAoJEN0jrNd/PrOhiCsP/2p5ZGtTh7ntNlSmFNHwi1Uu
n35sqOYLiIStAYXMp6rIp6TSPAY8dCthebA+TWZp9tMeIcPhQhbTxTp7r27c02N/
Lojb8EAckBRdb2eHcThMogpUP8LbhO0+5g8wb0su/2eKc+enkuJXqEiOURW4nS4n
h+D8i/dtX3d3McHqnnnFv8zE/rDEkO4kEKDBIawGIcXoN34Nb1NGHrWuJ+c89mTN
E7n/skyHQO9rQhw7fQ70RD5lZs2aliQAKHUDtWwUI0Rot4w8jAxeMQReK2cBQCUV
dBfQaEIKo4JCb9ZPVQhi+TWcGuCL6o/IOieMHbOIKuI+JQOvxPevTwI7bRXWZA1O
gAZTU+HRI189zY6w84Dliw4jiykhbga7Djtupq7b2hMeJgnKkOJf+c8vtukYKnGt
55lTcCajW50c0fMRQYdNVMLAJOveK4vH3EVpLYc9+x93BRZUdnPr1QDw9OWAyeSO
UpOQoiVYe82i9pdIVIEYZ8plIjnqpqQ3HAf3Rdb7rweeWsXByX1e5AMOh2m5Mbzs
4QqoOe5gqOAr4F/+x2j+IpjE1wTGFWvCmvkd4BTHBDTSzk7EBydhbdRESLg3vTNp
kO1BUSny3JtyrNIBpUP4xuzCJEeP6GFhwVHUVUkIcF+1/Zk1RvNVXP1sIM1+i2yX
BkntQKp+oM56mQGYeU7Y
=Y4ZR
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
