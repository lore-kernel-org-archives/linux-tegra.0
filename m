From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] drm-tegra-fixes
Date: Thu, 20 Jun 2013 12:36:43 +0200
Message-ID: <20130620103642.GB28263@manwe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The following changes since commit c7788792a5e7b0d5d7f96d0766b4cb6112d47d75:

  Linux 3.10-rc2 (2013-05-20 14:37:38 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux.git drm/fixes

for you to fetch changes up to 2b15aa0fd466a4b2defdfd84c0b5168804b3eb33:

  gpu: host1x: Rework CPU syncpoint increment (2013-06-20 12:21:38 +0200)

I know this comes awfully late and is much bigger than I'd like. It's
all my fault, though, since I've been travelling a lot lately and just
didn't find the time to prepare this earlier. I did want to sort out
patches that didn't warrant to go in before the final 3.10 release, but
all met the criteria as far as I could tell.

The larger chunks are fixes for the firewall that checks job submissions
=66rom userspace, which was unfortunately not working properly. All other
patches are mostly one-liners to fix things that were introduced in
3.10.

Thierry

----------------------------------------------------------------
Arto Merilainen (5):
      gpu: host1x: Check reloc table before usage
      gpu: host1x: Copy gathers before verification
      gpu: host1x: Fix memory access in syncpt request
      gpu: host1x: Fix client_managed type
      gpu: host1x: Rework CPU syncpoint increment

Emil Goode (1):
      drm/tegra: Include header drm/drm.h

Laurent Pinchart (1):
      drm/tegra: Remove DRIVER_BUS_PLATFORM from driver_features

Terje Bergstrom (2):
      gpu: host1x: Check INCR opcode correctly
      gpu: host1x: Don't reset firewall between gathers

Thierry Reding (5):
      drm/tegra: Don't disable unused planes
      drm/tegra: Explicitly set irq_enabled
      drm/tegra: Honor pixel-format changes
      MAINTAINERS: Update Tegra DRM entry
      drm/tegra: Fix return value

Wei Yongjun (2):
      drm/tegra: fix missing unlock on error
      drm/tegra: fix error return code in gr2d_submit()

 MAINTAINERS                       |   7 +-
 drivers/gpu/host1x/dev.h          |   8 +--
 drivers/gpu/host1x/drm/dc.c       |   5 ++
 drivers/gpu/host1x/drm/drm.c      |  14 +++-
 drivers/gpu/host1x/drm/gr2d.c     |  12 ++--
 drivers/gpu/host1x/hw/cdma_hw.c   |   2 +-
 drivers/gpu/host1x/hw/syncpt_hw.c |  12 ++--
 drivers/gpu/host1x/job.c          | 135 +++++++++++++++++-----------------=
----
 drivers/gpu/host1x/syncpt.c       |  26 +++-----
 drivers/gpu/host1x/syncpt.h       |  13 ++--
 include/uapi/drm/tegra_drm.h      |   2 +
 11 files changed, 113 insertions(+), 123 deletions(-)

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRwts6AAoJEN0jrNd/PrOhZp0QAIXL0JlHj+gwZrnqmXrODtfo
IhNsxUH/HgXzaSE+x6PGyvrIFtIjmOKSCkWHqALZeYaYPPvhIOP/MqCxpHeLNOXk
Xmk3KW8x77wTGaonU1zs5+NzeslOmWbp3I1xI8iGqJE0LSBe6J3WwlEi19pxCBpf
8xamVIuzlIgKIBEheeeAD4Wrnl+iTMUJXBShSSxXVTJctBoiU4f2eHIfqTL7mSfK
P8MiNGM3hkIFsXE2vEW7gnhmxp0a8NtYpsrKcM35UjcD+0pBUGkkZR2UNAKz7M+A
AYCZF1KpjfDWmXSc8ckrqh7KaDENCQW+JDPPBHE2i0723+0I4K1Y2j9JTuwzz9G6
aICsPFuT3bZKzz9+Ej4PtBlCdN0j163fdeInQAMJjMGJy8wHeFGsxakQkttiV7o9
LrzJjen/ZG5FtIgnH3Yd7j4rtJLb1GPMQzEUq5ncKaJfnujXSV2aFzaDgTWggQ/3
KkvVl4aXhFo7cHVxhp+zddxIAhZBj35INJtb+cMG1yCecI3uhtNwesVYdd6mtC62
7DN/F78keOp9gTDg/iTUqlPsHn8ugJovgqweGErpFcgTWHBbhlbXHLScB2jblAdA
IbUhf3dJK8yHBw2KaemRwrS/xtC7fdPISA37o2V/liAtsrIrh739ZcQKOl++OVFv
P++wRjZEAY0ogNJ4KioY
=pRsL
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
