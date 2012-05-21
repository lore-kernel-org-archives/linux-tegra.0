From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] iommu/tegra: gart: Reserve iomem resource
Date: Mon, 21 May 2012 16:11:52 +0200
Message-ID: <20120521141152.GA21513@avionic-0098.mockup.avionic-design.de>
References: <1337019127-6863-1-git-send-email-hdoyu@nvidia.com>
 <1337019127-6863-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337019127-6863-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bharat Nihalani <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vandana Salve <vsalve-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Hiroshi DOYU wrote:
> GART Register/Aperture range should be reserved.
>=20
> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iommu/tegra-gart.c |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 33a23b6..a431006 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -366,12 +366,18 @@ static int tegra_gart_probe(struct platform_device =
*pdev)
>  		return -ENOMEM;
>  	}
> =20
> -	gart_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	gart_regs =3D devm_request_and_ioremap(dev, res);
>  	if (!gart_regs) {
>  		dev_err(dev, "failed to remap GART registers\n");
>  		return -ENXIO;
>  	}
> =20
> +	if (!devm_request_mem_region(dev, res_remap->start,
> +				     resource_size(res_remap), dev_name(dev))) {
> +		dev_err(dev, "failed to reserve GART aperture\n");
> +		return -EBUSY;
> +	}
> +

I'm not so sure that this is a good idea. If the GART driver requests the
GART aperture, then users of the GART aperture (e.g. the DRM driver) will no
longer be able to use it.

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+6TSgACgkQZ+BJyKLjJp/lMwCeLOvSINVDwHcBuMG9kV5ks+1h
A0kAn28Ku9VgsUB2BqsvXHNzujaooXj+
=+IKF
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
