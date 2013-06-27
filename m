From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] drm/tegra: Changes for v3.11-rc1
Date: Thu, 27 Jun 2013 22:20:51 +0200
Message-ID: <20130627202050.GA16540@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit c7788792a5e7b0d5d7f96d0766b4cb6112d47d75:

  Linux 3.10-rc2 (2013-05-20 14:37:38 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux.git drm/for-next

for you to fetch changes up to ebae30b1fbcc2cc991ce705cc82e16d1e5ddbf51:

  gpu: host1x: Rework CPU syncpoint increment (2013-06-22 12:43:55 +0200)

These changes are mostly minor fixes to things introduced in 3.10. The
biggest chunk is updates to the host1x firewall which checks job
submissions from userspace and wasn't working properly. All other
patches are mostly one-liners. Nothing new or too exciting this time
around.

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

 MAINTAINERS                       |   8 ++-
 drivers/gpu/host1x/dev.h          |   8 +--
 drivers/gpu/host1x/drm/dc.c       |   5 ++
 drivers/gpu/host1x/drm/drm.c      |  14 +++-
 drivers/gpu/host1x/drm/gr2d.c     |  12 ++--
 drivers/gpu/host1x/hw/cdma_hw.c   |   2 +-
 drivers/gpu/host1x/hw/syncpt_hw.c |  12 ++--
 drivers/gpu/host1x/job.c          | 135 +++++++++++++++++---------------------
 drivers/gpu/host1x/syncpt.c       |  26 +++-----
 drivers/gpu/host1x/syncpt.h       |  13 ++--
 include/uapi/drm/tegra_drm.h      |   2 +
 11 files changed, 114 insertions(+), 123 deletions(-)

--DocE+STaALJfprDB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzJ6iAAoJEN0jrNd/PrOhYMMP/RjqWKS7REjliYiSS88tCNkk
gbVCM+lx72LxqnWcrJD5o9/Fps1Orw/S37MUsiByHjThFLlxfsTDYuS4tqFuYZi9
dLG6EKBoKMKwgS44ZPmXkDIo0SY45TSO11ScDD0ntGNNpVfnlpyS0o2pJ6tT0Aer
rnW12/PXrtAp0zlQrhblwm3nEDxNp6nryRNdhPYuKhIq4NvkXvDZtUg5TDgPYw0I
7WmicUDeJqGdwXo7jz9+A+z6or6dyljKIxcMfmK3Lj9i5ZSeD9m60adHfTzxFvZW
t/Zvvr5Mq8oUX3twTs4TMSmWhkau0pJn7m04jUcMEmTKF0WLRSBisssRURa6qegb
6QZ9IuvV1Y0raBREnVMBJy0a5f6EcHsAu1RHuZZ/QIHzqyxS9OWD+afU2jUHWcst
ir2PPeW8tld1jPWO3FCaUfjnlLBVn5J+ga1bw7+Ars5rMHOA7OcjzpLKjGAuIM28
vX19RgLjZKLiL1nlWPcXQmAlwoCb16m+LZMHZ+AOV3zRY1IM1KRGjwOm4cEP6/1h
fg32xmgTUQqoRuX2ZE0Guvjzj8zs0XCr8toA9JGLa3QO7o/Ay+7oBrj20bqzxqNi
mxZXEU949PSyX31VrquwcC06dNyG+xpozJDt3G7wJBm2pURljyCAFNbz0um3IEJz
ZaDtBqHsQ0BjbIhpM14Q
=Zwl0
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
