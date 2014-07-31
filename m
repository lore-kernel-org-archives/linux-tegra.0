From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch 1/2] pinctrl: tegra-xusb: fix an off by one test
Date: Thu, 31 Jul 2014 17:36:19 +0200
Message-ID: <20140731153617.GA21098@ulmo.nvidia.com>
References: <20140731152217.GD31539@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140731152217.GD31539@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 06:22:17PM +0300, Dan Carpenter wrote:
> This shoudld be ">=3D ARRAY_SIZE()" instead of "> ARRAY_SIZE()".
>=20
> Fixes: dc0a39386687 ('pinctrl: Add NVIDIA Tegra XUSB pad controller suppo=
rt')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinct=
rl-tegra-xusb.c
> index a066204..419a047 100644
> --- a/drivers/pinctrl/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
> @@ -680,7 +680,7 @@ static struct phy *tegra_xusb_padctl_xlate(struct dev=
ice *dev,
>  	if (args->args_count <=3D 0)
>  		return ERR_PTR(-EINVAL);
> =20
> -	if (index > ARRAY_SIZE(padctl->phys))
> +	if (index >=3D ARRAY_SIZE(padctl->phys))
>  		return ERR_PTR(-EINVAL);
> =20
>  	return padctl->phys[index];

Good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2mJxAAoJEN0jrNd/PrOhVXoQAJGxgD2IgMyZ87Wb9AScmN97
Hl4TXEbVuu2cf0SzBulo9CvGEJKjQYWDfC3m8RMGdwa+vQzaUPgpV8d1ZBWhgXPr
2gXcaeQBCK70C5/JT863q9i1gFLfBR266IojcyswG8b+3qSaGhIPq050+M2TzcUm
efnI8G1uPxXChRxXD0XbRoyTAGiL/TDcJEG4++R7r1NaMMqFe4qwJraZ2pxhHxbA
wjpcDp8cHU2vTbtvRuKwq4eT02b5F9Dvk4qzm8AVgI0uh2W9BFcwbaqu/X4bwHvV
JdRb8RR69L1a7xgHAkd2Dg6JnZbv8LVMa6k4vlsJ01AsJziKcow5eDtfEZqZi3LQ
tVi5o06y7vZ861/QJeX/NmlREOxCkQlc4kMvSdNIqk/1qwjRbivoXA6VR9opz7HP
vFI1y4cWMwFWJNvbE/xqAnsNQfopaxINnXyZBPg2JUB/DRy2uN5q+z4GU4gTbHbr
lyItw1kHhfOr0l974N6wMqF47DF4a0bUT5TWzoelHdAVgsiQ3af8Mj640GXU6vM1
INy2mR4da3kQn73U07PR+Mze0g8pqzREMzBsSBjMeJpNrOZSkJipjCF/LorlJAqw
2RYsdRzq4Cn/sFTP1XrRrgyHS0JJclutSBP5CW7cTPNqpTIiMjS864PEUCsgdFGK
BL3mcLsHV54Mk7LOwVad
=gsoS
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
