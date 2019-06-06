From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Date: Thu, 6 Jun 2019 13:57:06 +0200
Message-ID: <20190606115705.6j2oigsm2imvvqh7@ninjato>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elce2mn4beyzveti"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--elce2mn4beyzveti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 12:35:23AM -0700, Bitan Biswas wrote:
> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>=20
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>

I wonder why you didn't fix this checkpatch defect?

WARNING: A patch subject line should describe the change not the tool that =
found it


--elce2mn4beyzveti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz4/40ACgkQFA3kzBSg
KbapPQ//Wqml+UIJlWSm5inlWvFznTdF9x+06WbPj4JYk7x7ab4nHQYEdX+qLC2I
d5QejH2ouSSJ60gTNMbRu6QhwtULhhUnrtBf07qdq4o/TfVqvQsQ+HcjvQnn905w
03gYunTuwaLjup5CZYNAGRR1lWTnWlC8hJlG2NXXiYYkuW4luGYH0jdp+yQom4ip
4rZ85sOtRA/1IZWw+MKLQwyHQRy8rVMdGoAZ2/3+qsnfLmylsVdGfVvesXQvLsj3
vd4f9G5+GfgHbJPJ6XMfyGwho8sxr8XUz7Oxy59DSfSvcQsO8LvgxsDD3Byex7DC
dsH+PopNEgmDhbuh/oWkfHpChPPxsSDoI4zm6TVKNGwOEC/0fj1Dqs9QI9TL0Soy
GMVy03XNKE8Q3vc1+kZV3wNAwJSPvVde6pT+AB+GfsxOcmxZj9Wpoo7lgfxsnx+G
N5vWRkidksphWMOPcUHxcBYqm1VgcqBY0U+z4yxkbMV9PWBG4glE0usq7aSub44z
qOB8TsUc3b/CV1asWz6M3QBGZk8GnS2KVfN8nK+MlzL6kXG/KpEkNF4qs2diY8Ca
o1UA2Q0NWNSP15S/UFCkqzP5+CtsVel5Kw6O3LJ9jXvhDuTwOWrxn11BdbvAdDvC
UJMBbSwCF4Deo/O/kiG9Kcqj188lZKhoze4zv7e+Oxv2niPmgmE=
=8tXa
-----END PGP SIGNATURE-----

--elce2mn4beyzveti--
