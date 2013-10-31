From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PULL] drm/tegra: Changes for v3.13-rc1
Date: Thu, 31 Oct 2013 10:17:28 +0100
Message-ID: <20131031091727.GA16198@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0007875846=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0007875846==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The following changes since commit 14c8d110e083d3a09ccf8cfe18ad22fe1450c2e9:

  drm/i915: abstract the conversion of device->minor out to a macro (2013-1=
0-15 18:06:06 +1000)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.13-rc1

for you to fetch changes up to 977386a04bae2a5a5092c965c92c7c4d36eed23f:

  drm/tegra: Reserve syncpoint base for gr3d (2013-10-31 09:55:49 +0100)

I decided to leave out the more controversial parts, such as DSI and
panel support because of all the recent discussions and new rules for
device tree bindings. My hope would be that we can get those issues
worked out during the 3.13 release cycle so that we can finally have
panel support for 3.14.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.13-rc1

The biggest part of the changes is the decoupling of the host1x and DRM
drivers followed by the move of Tegra DRM back to drivers/gpu/drm/tegra
=66rom whence it came. There is a lot of cleanup as well, and the drivers
can now be properly unloaded and reloaded.

HDMI support for the Tegra114 SoC was contributed by Mikko Perttunen.

gr2d support was extended to Tegra114 and the gr3d driver that has been
in the works for quite some time finally made it in. All pieces to run
an OpenGL driver on top of an upstream kernel are now available.

Support for syncpoint bases was added by Arto Merilainen. This is useful
for synchronizing between command streams from different engines such as
gr2d and gr3d.

Erik Faye-Lund and Wei Yongjun contributed various small fixes. Thanks!

----------------------------------------------------------------
Arto Merilainen (4):
      gpu: host1x: Add 'flags' field to syncpt request
      gpu: host1x: Add syncpoint base support
      drm/tegra: Deliver syncpoint base to user space
      drm/tegra: Reserve base for gr2d

Erik Faye-Lund (1):
      gpu: host1x: check relocs after all gathers are consumed

Mikko Perttunen (3):
      drm/tegra: Add Tegra114 HDMI support
      drm/tegra: hdmi: Detect DVI-only displays
      drm/tegra: hdmi: Enable VDD earlier for hotplug/DDC

Thierry Reding (35):
      drm: Track the proper DPMS mode of connectors
      drm: Fix typo in debug message
      gpu: host1x: Remove unused Makefile
      drm/tegra: Remove unused fields
      drm/tegra: Cleanup tegra_dc structure
      drm/tegra: Rename host1x_drm structure to tegra_drm
      drm/tegra: Rename host1x_drm_file to tegra_drm_file
      drm/tegra: Rename host1x_drm_context to tegra_drm_context
      gpu: host1x: Cleanup includes
      gpu: host1x: Do not discard .remove()
      gpu: host1x: Fix alignment of function arguments
      gpu: host1x: firewall: Rename cmdbuf_id -> cmdbuf
      gpu: host1x: firewall: Refactor register check
      drm/tegra: gr2d: Miscellaneous cleanups
      drm/tegra: Rename gr2d to tegra-gr2d
      drm/tegra: gem: Miscellaneous cleanups
      gpu: host1x: Make host1x header file public
      drm/tegra: Introduce tegra_drm_client structure
      gpu: host1x: Expose syncpt and channel functionality
      drm/tegra: Move subdevice infrastructure to host1x
      gpu: host1x: Use relative include paths
      drm/tegra: Move driver to DRM tree
      drm/tegra: Properly cleanup and zero out resources
      drm/tegra: Allocate resources at probe time
      gpu: host1x: Add support for Tegra114
      drm/tegra: hdmi: Rename tegra{2,3} to tegra{20,30}
      drm/tegra: hdmi: Parameterize based on compatible property
      drm/tegra: hdmi: Fix build warnings
      drm/tegra: Start connectors with correct DPMS mode
      drm/tegra: Use symbolic names for gr2d registers
      drm/tegra: Introduce tegra_drm_submit()
      drm/tegra: Add 3D support
      drm/tegra: Add support for tiled buffer objects
      drm/tegra: Support bottom-up buffer objects
      drm/tegra: Reserve syncpoint base for gr3d

Wei Yongjun (2):
      gpu: host1x: Disable clock on probe failure
      drm/tegra: Disable clock on probe failure

 MAINTAINERS                                    |   2 +
 drivers/gpu/drm/Kconfig                        |   2 +
 drivers/gpu/drm/Makefile                       |   1 +
 drivers/gpu/drm/drm_crtc_helper.c              |   8 ++++
 drivers/gpu/drm/drm_drv.c                      |   2 +-
 drivers/gpu/{host1x/drm =3D> drm/tegra}/Kconfig  |  12 +++---
 drivers/gpu/drm/tegra/Makefile                 |  15 +++++++
 drivers/gpu/drm/tegra/bus.c                    |  76 +++++++++++++++++++++=
+++++++++++++
 drivers/gpu/{host1x/drm =3D> drm/tegra}/dc.c     | 108 +++++++++++++++++++=
+++++++++++++++++++----------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/dc.h     |   5 +++
 drivers/gpu/{host1x/drm =3D> drm/tegra}/drm.c    | 593 +++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------=
---------------------------------------------------------------------------=
--------------------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/drm.h    | 101 +++++++++++++++++++=
++++----------------------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/fb.c     |  38 ++++++++++++-----
 drivers/gpu/{host1x/drm =3D> drm/tegra}/gem.c    |  44 ++++++++++----------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/gem.h    |  16 +++++---
 drivers/gpu/drm/tegra/gr2d.c                   | 227 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
 drivers/gpu/drm/tegra/gr2d.h                   |  28 +++++++++++++
 drivers/gpu/drm/tegra/gr3d.c                   | 338 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/gr3d.h                   |  27 ++++++++++++
 drivers/gpu/{host1x/drm =3D> drm/tegra}/hdmi.c   | 257 +++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------=
--------------------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/hdmi.h   | 152 +++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/{host1x/drm =3D> drm/tegra}/output.c |  64 +++++++++++++++++--=
----------
 drivers/gpu/{host1x/drm =3D> drm/tegra}/rgb.c    |  19 +++++++--
 drivers/gpu/host1x/Kconfig                     |   2 -
 drivers/gpu/host1x/Makefile                    |  13 ++----
 drivers/gpu/host1x/bus.c                       | 550 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/{host1x_client.h =3D> bus.h}  |  24 ++++-------
 drivers/gpu/host1x/cdma.c                      |   2 +-
 drivers/gpu/host1x/channel.h                   |   6 ---
 drivers/gpu/host1x/dev.c                       |  82 ++++++++++++++++-----=
----------------
 drivers/gpu/host1x/dev.h                       |  11 ++---
 drivers/gpu/host1x/drm/gr2d.c                  | 343 ---------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------
 drivers/gpu/host1x/host1x.h                    |  30 --------------
 drivers/gpu/host1x/host1x_bo.h                 |  87 ---------------------=
------------------
 drivers/gpu/host1x/hw/Makefile                 |   6 ---
 drivers/gpu/host1x/hw/cdma_hw.c                |   8 ++--
 drivers/gpu/host1x/hw/channel_hw.c             |  32 ++++++++++++---
 drivers/gpu/host1x/hw/debug_hw.c               |  16 ++------
 drivers/gpu/host1x/hw/host1x01.c               |  16 ++++----
 drivers/gpu/host1x/hw/host1x02.c               |  42 +++++++++++++++++++
 drivers/gpu/host1x/hw/host1x02.h               |  26 ++++++++++++
 drivers/gpu/host1x/hw/hw_host1x01_uclass.h     |   6 +++
 drivers/gpu/host1x/hw/hw_host1x02_channel.h    | 121 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x02_sync.h       | 243 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h     | 175 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/hw/intr_hw.c                |   4 +-
 drivers/gpu/host1x/hw/syncpt_hw.c              |   4 +-
 drivers/gpu/host1x/job.c                       |  73 +++++++++++++++++----=
------------
 drivers/gpu/host1x/job.h                       | 108 ---------------------=
---------------------------
 drivers/gpu/host1x/syncpt.c                    |  92 +++++++++++++++++++++=
++++++++++++++++----
 drivers/gpu/host1x/syncpt.h                    |  46 ++++-----------------
 drivers/video/Kconfig                          |   4 +-
 include/drm/drmP.h                             |   1 +
 include/linux/host1x.h                         | 284 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++
 include/uapi/drm/tegra_drm.h                   |  29 +++++++++----
 55 files changed, 3362 insertions(+), 1259 deletions(-)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/Kconfig (90%)
 create mode 100644 drivers/gpu/drm/tegra/Makefile
 create mode 100644 drivers/gpu/drm/tegra/bus.c
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/dc.c (93%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/dc.h (98%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/drm.c (50%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/drm.h (72%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/fb.c (92%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/gem.c (86%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/gem.h (84%)
 create mode 100644 drivers/gpu/drm/tegra/gr2d.c
 create mode 100644 drivers/gpu/drm/tegra/gr2d.h
 create mode 100644 drivers/gpu/drm/tegra/gr3d.c
 create mode 100644 drivers/gpu/drm/tegra/gr3d.h
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/hdmi.c (83%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/hdmi.h (72%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/output.c (91%)
 rename drivers/gpu/{host1x/drm =3D> drm/tegra}/rgb.c (96%)
 create mode 100644 drivers/gpu/host1x/bus.c
 rename drivers/gpu/host1x/{host1x_client.h =3D> bus.h} (60%)
 delete mode 100644 drivers/gpu/host1x/drm/gr2d.c
 delete mode 100644 drivers/gpu/host1x/host1x.h
 delete mode 100644 drivers/gpu/host1x/host1x_bo.h
 delete mode 100644 drivers/gpu/host1x/hw/Makefile
 create mode 100644 drivers/gpu/host1x/hw/host1x02.c
 create mode 100644 drivers/gpu/host1x/hw/host1x02.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_uclass.h
 create mode 100644 include/linux/host1x.h

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSciAnAAoJEN0jrNd/PrOh7JwP/3RDq30v46LT9fozHoLCD4oL
ETukHElahhnINiNllPwvyoreSqGeWVV4VLNo4eipacnaG2uhWVASYOOAua7xO2lK
oVfn1w5tBqtiglORed0o3J3XEL6ovhWBx0r8/T2/FefWK86/wH6CV/pjQm04kbMF
IGzxZs8lj4ruDsGMWdMB6NYrjB2azbefM7UvHqDSkX0WIrFC0NNW6NbQ9FFWjbsu
sRLao9CyNzj/zgV83M/rxNDfrEIYsuxyGObKVbt3hnC5IbbFrLnSxTdfZ3lFMh7J
jFD8OKwuPLK1c9A6ZX9+SjWm6D57i4+5k21GwznR4bI3RM/DtRQK8a9S89yejkiS
DaXH3iAR3ke9koqnkRGoqIQsww08MRNPIkQ5iI6dp9vokDa6VMFNV5TyKkeGIyT1
b9K4iaNfRZY2khErEe6sV3CROxsXqH0rksHzzww0Wuv+XfWJhYKl9cAILcYggmQD
qorGsvcb14RilXyBaADmUajbFOkyXF1/s4eChye3m5Udv3OXQiI4jYmeTBcAMYLE
hhF49uD8+b0K+M3pFX+tTyvxPE9+99GLehJ/jD5XVZNV0ERALZV6gNru8CS3CATD
ck4DxapUTuXMFrtKLYONlZfn2cjQFZoj1/qO1qLjpoEBpdFkdJzJAkmO+Uev6JWW
itOtMCLrWpusQlEQ1NRW
=Z9l4
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============0007875846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0007875846==--
