From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] drm/tegra: Fixes for v3.13-rc3
Date: Tue, 3 Dec 2013 10:26:13 +0100
Message-ID: <20131203092612.GA21178@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.13-rc3

for you to fetch changes up to 9a991600e379641b9c16310b87ca848b6da01c24:

  drm/tegra: return -EFAULT if copy_from_user() fails (2013-12-03 10:14:03 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v3.13-rc3

This assortment of patches fix a few build and sparse warnings and make
sure to always return -EFAULT on copy_from_user() failures. Finally the
upcasting from struct drm_crtc to struct tegra_dc is made safer to
prevent potential segmentation faults.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/tegra: return -EFAULT if copy_from_user() fails

Olof Johansson (1):
      gpu: host1x: Silence a few warnings with LPAE=y

Thierry Reding (6):
      drm/tegra: Make CRTC upcasting safer
      drm/tegra: Tightly bind RGB output to DC
      drm/tegra: Fix address space mismatches
      drm/tegra: Make tegra_drm_driver static
      drm/tegra: Force cast to __iomem to make sparse happy
      gpu: host1x: Fix a few sparse warnings

 drivers/gpu/drm/tegra/drm.c      | 34 +++++++++++++++++++---------------
 drivers/gpu/drm/tegra/drm.h      |  2 +-
 drivers/gpu/drm/tegra/fb.c       |  2 +-
 drivers/gpu/drm/tegra/rgb.c      | 11 +++++++----
 drivers/gpu/host1x/bus.c         |  5 +++--
 drivers/gpu/host1x/hw/cdma_hw.c  |  4 ++--
 drivers/gpu/host1x/hw/debug_hw.c |  4 ++--
 7 files changed, 35 insertions(+), 27 deletions(-)

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnaO0AAoJEN0jrNd/PrOhqRoQAK3cJsdhGDZi+tHu3NZQJpB5
ucjF6+14EQ5vEGVkUD34KnBM/nxzET8UzcwK1ojgE1lrG5whBlvuEs5SjUf/h1kQ
YBpt4RaHY6fdoB4HvtjV19uwiHuWXT1TncolEBAaTwyB4Vpw6/h++qudLNkoL9J0
HIxBTVYp6c8PpGrQPheYhDMfMB/iemIGGwJd+85DrmCmL3jk15cxgybcKNe4weXo
jbK/+jKkxI/Cc7j34MbQ+uXY3ElVaqqsyYQ6a8Lcl+9z1qjbrkghUQ7suQ0xVq3f
XrxULBJk9A461O32DN6Chzbl1ikv2KkpYq3J2PAICI7mm0ObLofN+rnLOMfDAhnX
jmCdKoBjK7AKo6ZR01uMurAK06G8ECvRMjYZszVStUqVClicO02TXVqudwxX3ZkE
7y/GBqvUYC7/QkKFyBhrCF0sJ9oSvoqHSYUQN1oz9+LlJ/lXQi1hWHoh22w2BSCJ
G34ep4PvbrGRzF3LLZwQO30yi8TAvxN+lx+pV673kN7zo60+b2EFaHScCzBflHzu
T5wCsBEe/n1DbEaHYMosPQpe60eUgvO5mD8+G38SZolVl1scpxBu1SU5H3cwti+s
0P5bCZmlqyiPw149RMl3j8pGKcCsUGchrziEim5nbCcsUo8RdqVLdH6w6gsua3Ue
LwBNCNcVFAoXy42HglOt
=bbiU
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
