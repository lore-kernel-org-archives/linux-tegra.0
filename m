From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v3.15-rc2
Date: Thu, 17 Apr 2014 15:58:05 +0200
Message-ID: <20140417135804.GA6856@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:

  Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.15-rc2

for you to fetch changes up to cbfbbabb89b37f6bad05f478d906a385149f288d:

  drm/tegra: Remove gratuitous pad field (2014-04-16 17:11:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v3.15-rc2

This contains a fix for the host1x driver writing to non-existent syncpt
registers.

A second commit removes an excess pad field in the parameter structure
for the DRM_TEGRA_SUBMIT IOCTL. Archeaology on earlier versions of this
file indicates that this was once there to pad an uneven number of u32
u32 fields, of which one was subsequently removed. Unfortunately nobody
remembered to get rid of the padding when that happened.

Both of these commits are Cc: stable because they fix issues that were
introduced back in v3.10.

----------------------------------------------------------------
Stephen Warren (1):
      gpu: host1x: handle the correct # of syncpt regs

Thierry Reding (1):
      drm/tegra: Remove gratuitous pad field

 drivers/gpu/host1x/hw/intr_hw.c | 4 ++--
 include/uapi/drm/tegra_drm.h    | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTT93sAAoJEN0jrNd/PrOhekIQAIYl0sdmyyfimvLZfo4vow52
XIH2raZzI+BFojdl+MmHvYU74i9rqsszfDlpPJNVgsQ87DepxDeQ7aoMS4UXKZ24
7ZFc0P51eM9VtrbHsXldGAW752eqnhvbndvtFjWVO+JBtbF5VlgDKufwaSDh1Isu
pX4AMvRXnJhZuvphvL68YrJVCUboDRbXq9LL7/qkW9+J7slJE+GTmMaHkWFzvIVw
z8Jvy2bSUb7EisJpoBq7IZuFZMm32+LTzuflyZekmFlKHOQNsmB0RywRGGA1Yrxj
I+gWoyMKlTKMNMOg0mfEZ8PzpSc0bmqp1aMPlJ731MfVs5866oLYEcvT53vaWsoC
Xz12PH73xhfLk7/56rlVJVFBHI1TmpbpS7Fvz8NyI8JLqhL10CYkHSCvtVakHJQZ
6Kc5WWTH6WoGA5l5b0OTNBsdtuKEWkP+7oF8HmpecUPEY0I0T+GzYlf9sgo6J29m
GDRmE/2KKU2RDWstVZXl0u73RY59PRWeXgRlEzmBS9ypNXX3u2GMfIsveHDgN5oK
9PAQIHXI+j03JFQHvnQdO4ewXyHq9xAuU6bw2tkmulW7m80/vlloFSxIpUWzYvNI
gefzJuwZysTCKaAuP7ynFLLHA/ej6TeB/Z8piEinfRD/mFnNtA0NqRXDnC5H3N6M
sLyaksd1O2/1urhDTjzc
=6q7T
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
