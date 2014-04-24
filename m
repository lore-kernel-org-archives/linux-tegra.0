From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v3.15-rc3
Date: Thu, 24 Apr 2014 23:07:44 +0200
Message-ID: <20140424210739.GA32116@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit cbfbbabb89b37f6bad05f478d906a385149f288d:

  drm/tegra: Remove gratuitous pad field (2014-04-16 17:11:04 +0200)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.15-rc3

for you to fetch changes up to 2b4c36612efac173397756398000921a7771fdda:

  drm/tegra: restrict plane loops to legacy planes (2014-04-24 15:04:30 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v3.15-rc3

A single fix for some framebuffer reference counting fallout caused by
the primary plane helpers introduced in 3.15-rc1.

----------------------------------------------------------------
Daniel Vetter (1):
      drm/tegra: restrict plane loops to legacy planes

 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTWX0dAAoJEN0jrNd/PrOhHXcQAJs2RKqX1E/3oaGX4OCrZ3j4
OqRU9Hw7b5mvhTZIEPKcDWeHj7B+QbxEhlx0bN/IntttVhbqnuPBOhEXfvMIsrKW
tvqDaw8rYNq9EQgorE1Aa6nh5V4u5BMRP/W2S3zrf4keuD0O588bfWsxarBERWIP
eOk9a2wvkqPJAJgLKLQBj2Z3hpj2WWvSMoQneFGQmvW5bNPbEmy/xH+YcsidgXeB
qCdlTxDSdi017Ek06oqC1CX3DFr4cLNu51n7+4nEXbxeSKqlOifMsEwDKWV2oW4n
TBVQJ+BNIrLICDLbZZPw+qyn3FFeHqjbhhNKaTcX87EP5F9W5GkGxL+EQ7Ml91M1
LOF4ad8ZKQHPj11dvyJtlFVF7L0OvcX+H5dD9wQW2cG761+MtSBIs+5Jhdl/Cx06
QZDRWZvoraRU50aursetTepxnU3e+WxF7AxZnd1D4DIy9b2UnGh6TF2289kRwbSp
RUPgnp++a9+bT9h3UqFpLrXpJZCW1rje1iEC+Kxchm1oGh8KrUltkCdJ2NZg0LCy
5xZKI6ycFppdpuzJbSHJnLZjYw5qsOiS+L/ZnLPhoHI44i0lJ1BICajqaevBge/7
cKGwZSgiufN0ILvUFgITsPUpzNmWzrMYv1hL2LXGK/J9m3WiXXwiA38HUZh6QNzj
xf9AVmpRMb+CpXcBzIS6
=w/lp
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
