From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch 2/2] drm/tegra: silence some sparse complaints
Date: Fri, 8 Nov 2013 13:34:56 +0100
Message-ID: <20131108123455.GA31551@ulmo.nvidia.com>
References: <20131108100803.GY27977@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131108100803.GY27977@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2013 at 01:08:03PM +0300, Dan Carpenter wrote:
> I've shifted the __user markup to make Sparse happy.
>=20
> drivers/gpu/drm/tegra/drm.c:138:18: warning: incorrect type in initialize=
r (different address spaces)
> drivers/gpu/drm/tegra/drm.c:138:18:    expected struct drm_tegra_cmdbuf [=
noderef] <asn:1>*cmdbufs
> drivers/gpu/drm/tegra/drm.c:138:18:    got void *[noderef] <asn:1><noiden=
t>
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

I fixed exactly the same sparse warnings (along with many others this
morning). We really ought to have a tag to put into a commit to credit
people who've come up with the same patch at the same time.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSfNpvAAoJEN0jrNd/PrOhxYIQAIuIh/y003wWGxYI9Ym3FqeQ
EZq96XNRd/NM5n31fyKippy7b6LUk/tdAkZfJ/i3XNWntU9yKZ3mUK7UzjuXOFND
W4WVeQiM/uCr2TIzwzPCnH16tGRnZHXwjAsi5nlSoKS0EFAghxDAHsI2S39Ia+Ij
2GaoGml/tVuu5ZcXaLmSmAskAaXT25WREl2RiUjXVP19PegmaR4VZgsCO0vm/OlS
Z4sml5twyMDBKKSZIlxjikvITMvzzV4ZFgy0/XRD7ogCBwMtoYaJe3KzCU411I7X
SNnig8GUgdMpiJ3pMStb0Il2k0FrPy50Gwl8H0PwjfhzpUvg+iPp8j1wsNUwg5Mc
jzRCd0rtPAXVkjnW+c45MjSUjaAynkrq5PGV42ZnVxvqZHgqFd2tt3JzBW1uXGCu
g+bw2hdG6wLFNw5Ibe/byuN4d/KXPnip6BCPnmD5piyMwrOE7DfsVtzqtpmB9F1+
KSbEtdUSmcxw6Q1HUnxdfO40rKTic+pY41BvhXXOTRLuEhOcIB2Fz4oEvwIbJJcf
oLjN3+SuwicBzl2EUsnYh36jwGuILxrW9MW9aO8noaLVN6KZnuM5gxZquWPRMn+Q
dN2NilWjQCrOhqage9hlqA4hO9/fvzJyfruCSAciuoZCiZhXnLDFXC4ql/XhUtau
1LpzC+RRBpir70WZ4J+4
=DO5t
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
