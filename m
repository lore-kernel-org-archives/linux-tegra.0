From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] tegra-hsp: fix a missing-check bug in
 tegra_hsp_doorbell_create()
Date: Mon, 27 May 2019 16:05:49 +0200
Message-ID: <20190527140549.GA7202@ulmo>
References: <20190527130430.GA5367@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527130430.GA5367@zhanggen-UX430UQ>
Sender: linux-kernel-owner@vger.kernel.org
To: Gen Zhang <blackgod016574@gmail.com>
Cc: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 09:04:30PM +0800, Gen Zhang wrote:
> In tegra_hsp_doorbell_create(), 'db->name' is allocated by=20
> devm_kstrdup_const(). It returns NULL when fails. So 'db->name' should
> be checked.
>=20
> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> ---
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 11fc9fd..b613c46 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -292,6 +292,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, cons=
t char *name,
>  	db->channel.hsp =3D hsp;
> =20
>  	db->name =3D devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> +	if (!db->name)
> +		return ERR_PTR(-ENOMEM);

I don't think this could ever happen, since name is always from .rodata
and hence devm_kstrdup_const() never returns NULL. But formally this is
correct, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzr7rcACgkQ3SOs138+
s6Hd8A//fg5fcdNI/oAjJsmTdTg0zepmc4GvUXAhcMbvB9yGHL0jCumWWMS/UgyZ
8s8z5+3IBQUJl3WvIgJuzhuP5wS0EnmF3XHrNjMRMAACoemXlwPRQ/4BR6dQnxBx
0REskkPLrqdEs3t4RAtVZVJhBTAm3jlWCXpFXImfzLcHqRYvNuTayj6iuT/twxMx
ZZXMD5LUZkQJzauVU7MD4+CcvYwQNB6lOa97N1W32ueHiO4kjOdgEPHkzWxyTn7S
oCsCYmIPSFUgsq4rLRKsVzap6oQ0WglVRmvOqv7D8EgNYglw3frxwynVBP0TVGxp
U3wXBrOSzk8MktqYbSJkFuzooE1xY59fq5V8SLu/RIP0tePQRnsL/0GdoDgswd1W
FBmqSHqSEwVBmkCAJh3B8ZPGRK5rTfTNs+PPEXLfCIuaOQ2fK1KXKfr7QDASj7oo
Fyfk4APGqaxVIOhhL1kVWG94x5QQbWQnFB4SWw3aupHMn+N3Z2+4qBSYSOs2m+lo
vwAeA1ugvNvACRuQZ0rxZ41tylo8JooLM/DehkoDQk2vkG233GBQ4znJOPOTTF7d
ZKF6nByrDvhQ3dfEkPV5wUF8T3a+pvh5Ajh+Nv60jR7LHsvQkOlqGgOjDGW4ARsm
QaZqeSHavaxFs82nyD4d2JnHyUwbdRzmsHz0Yir93EKhnd/QGTQ=
=dYIV
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
