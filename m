From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: move soc_device_register call out of arch/arm
Date: Wed, 11 Mar 2015 09:34:28 +0100
Message-ID: <20150311083424.GA19391@ulmo.nvidia.com>
References: <1425868301-22767-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425868301-22767-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 10:31:41AM +0800, Joseph Lo wrote:
> Expending the usage for both Tegra & Tegra64 SoCs.
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/tegra.c | 31 +------------------------------
>  drivers/soc/tegra/common.c  | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> index 914341bcef25..95df6a97b956 100644
> --- a/arch/arm/mach-tegra/tegra.c
> +++ b/arch/arm/mach-tegra/tegra.c
> @@ -87,36 +87,7 @@ static void __init tegra_dt_init_irq(void)
> =20
>  static void __init tegra_dt_init(void)
>  {
> -	struct soc_device_attribute *soc_dev_attr;
> -	struct soc_device *soc_dev;
> -	struct device *parent =3D NULL;
> -
> -	soc_dev_attr =3D kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
> -	if (!soc_dev_attr)
> -		goto out;
> -
> -	soc_dev_attr->family =3D kasprintf(GFP_KERNEL, "Tegra");
> -	soc_dev_attr->revision =3D kasprintf(GFP_KERNEL, "%d",
> -					   tegra_sku_info.revision);
> -	soc_dev_attr->soc_id =3D kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id(=
));
> -
> -	soc_dev =3D soc_device_register(soc_dev_attr);
> -	if (IS_ERR(soc_dev)) {
> -		kfree(soc_dev_attr->family);
> -		kfree(soc_dev_attr->revision);
> -		kfree(soc_dev_attr->soc_id);
> -		kfree(soc_dev_attr);
> -		goto out;
> -	}
> -
> -	parent =3D soc_device_to_device(soc_dev);
> -
> -	/*
> -	 * Finished with the static registrations now; fill in the missing
> -	 * devices
> -	 */
> -out:
> -	of_platform_populate(NULL, of_default_bus_match_table, NULL, parent);
> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);

One of the reasons for adding the soc_device in the first place was so
that it would be possible to use it as the parent for all devices that
are instantiated from device tree. You remove that here, and break the
ABI in the process. Arguably no userspace should be relying on the exact
path in sysfs, but I'd still like to keep the top-level parent.

Which reminds me of a discussion a while back about introducing a top-
level driver for the SoC. I'm not sure if anything came of that.

Stephen, do you know if there was a conclusion on that discussion? As
far as I remember this sparked around the time when we moved drivers to
drivers/soc and started splitting things up into initcalls. I'm thinking
that if nothing like that was created yet, perhaps soc_device and
soc_bus_type would be good candidates to implement this on top of.

Thierry

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJU//4OAAoJEN0jrNd/PrOh/hYP/3Hl8AhahGIuUfjvAJy7svCO
ngvTGy6UCCV5ep5zccrgjQZQyhlg+azrZpoamOcCphMcoN9rRX9wIskx5eoK5v8E
QQMkTE8Jy2RbMR3gZqlRjjh7KhVD7vIkmppy0qVtfTmusrcsvOZUbu5pUCrFGcLc
97pLcr/hP2EdNiCEEbTxxnbpcn4os5Qln9yfB19hnzvA3yvp2L3UeqhSPjD5iPS3
giAfhc8GyXvCm70/QfE+We/iZN2eNKzXoPtLVSBSN3VIsBZ55iXotQeijlOK9lpc
tFhcDGQ8J//t7TVX1kJRlN0MctPZieCjonSE7iitviVSOtR6PScBuaCjZYRhnJ2q
WpY3ZTpXX0jzMnmxH8XTL99vOV9Xi8XZw2TrV5RQrAkocWnVN5nfSExXRbYOToWn
okiK8cROOLDQ+wyaw80g4JBeiqdwzmKs1dAvV710lH0RIwbxLcc06+GLOZ/chVRI
n7FNKFCaRbcwdbJ8ytUC96hysI0x5kIFCEfY0WO2S2XyVUtEHY+i7wiFscxl556v
VZ4buwN3RxNoonl8gfahrjjGS4ZTONvDR6VeSKxRFLk1ypOsyuCObbxiL3wavZVK
tV5jKoSj4vcN1pdRN76s7aXDxUC3O4GCTTKTBEu8EqO7t6B0N4sG8ti+GXTslR4n
/zxM0CexKHMz9x2+8o49
=GUnx
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
