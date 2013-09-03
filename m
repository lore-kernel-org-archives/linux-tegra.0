From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] drm/tegra: Changes for v3.12-rc1
Date: Tue, 3 Sep 2013 12:13:11 +0200
Message-ID: <20130903101310.GA19551@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit 3b2f64d00c46e1e4e9bd0bb9bb12619adac27a4b:

  Linux 3.11-rc2 (2013-07-21 12:05:29 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.12-rc1

for you to fetch changes up to 03da0e7ba9e3a1fc700f60913ff6bcb19f7eac2a:

  drm/tegra: Parse device tree earlier (2013-09-03 10:10:13 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.12-rc1

Only a couple of small patches this time around. These are mostly fixes
for minor bugs that showed up, but there is also some preparatory work
that will come in handy for future patches.

----------------------------------------------------------------
Dan Carpenter (2):
      gpu: host1x: fix an integer overflow check
      gpu: host1x: returning success instead of -ENOMEM

Mikko Perttunen (1):
      drm/tegra: hdmi: Make sure clock is enabled before dumping registers

Thierry Reding (3):
      gpu: host1x: Check for valid host1x pointer
      gpu: host1x: Sort drivers by probe order
      drm/tegra: Parse device tree earlier

 drivers/gpu/host1x/dev.c      |  2 +-
 drivers/gpu/host1x/dev.h      |  2 +-
 drivers/gpu/host1x/drm/hdmi.c |  7 +++++++
 drivers/gpu/host1x/drm/rgb.c  | 14 +++++++-------
 drivers/gpu/host1x/job.c      | 15 +++++++--------
 5 files changed, 23 insertions(+), 17 deletions(-)

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJbY2AAoJEN0jrNd/PrOhZMUP/2RI/leSCCLeg54yIhiuIa/i
fULghPJDLVpPiWysoI2b2VRCg7E2TcTe5JMyCrQI20OAQSz6lpIOtzNgZk+Q6tIe
5m/NloqHVfyQaR6H8laTwMUhO08uSjZvxLfvpspamc9ecEOEB9m0pSfhkkf5Yta4
oCHpDfqFQ6fF0hu7LCRDhllXu3pGtwIgcmp3ZQzvb4tONSokJepQH++7oUoaV6+G
5yWZriBvDxMw3Hapx6NK/4JYp8YLbSBiy/l18EfjCAXFzdhlJXVKgLv6uXIRCTkY
+qaXp7VHGu5/wsKulJyFUGpIH6Thx8U4FXqQAtQ+xo0eHPf8aA+ExtHzs1Eu980J
tfLQA/a6u+4K8PE8Bd3HJsUKR2Gp0ShEdidt0zXzxFPR153Gacmy7Adj536ZD7FU
5U5HeXp7cHiQZStDmUp/V+KIgd4iaZCr/1WtBOcvUKrJ0ut3Rt+MLX+sojLsO9Sw
lZLieS+fBNhxjDWanbf1/LhmydI3MbxDAc+UzDICT+VEU/kggseXACClWhCz7klT
auSL1g1pO+DVowhV/v9XgKWBkrRusy6b4d3j6IuME2IvZlqXVBuF1Bn0SUPvORzJ
8QfuD0wLL1waGLEkKfU7rS4kqdOusrpL1YMYPOnhPbRf0ZnmqFsP3iX8dphon442
3zdjEf2VwzWyrhITIbJJ
=Ao0y
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
