From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: fuse: Add custom SoC attributes
Date: Fri, 20 Mar 2020 16:10:35 +0100
Message-ID: <20200320151035.GB3706404@ulmo>
References: <20200320113716.6105-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200320113716.6105-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 11:37:16AM +0000, Jon Hunter wrote:
> Add a custom SoC attribute for Tegra to expose the HIDREV register
> contents to userspace via the sysfs. This register provides additional
> details about the fabrication and versioning of the device. Exposing
> this information is useful for identifying the exact device revision and
> device type.
>=20
> Please note that the fields in this register vary depending on the Tegra
> generation and so instead of exposing the individual fields, just expose
> the entire contents of the register. Details of the register fields can
> be found in the Technical Reference Manual for each Tegra device.

That seems a little suboptimal to me. It's pretty trivial for the kernel
to distinguish between different SoC generations in order to know what
the fields are. It's a lot more difficult for userspace to do so. Is the
register completely different between SoC generations or just slightly?

Having individual fields exposed as individual attributes seems like it
would make it a lot easier for userspace to get at the needed bits.

Thierry

>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse=
/fuse-tegra.c
> index 802717b9f6a3..217e326da232 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -300,6 +300,24 @@ static void tegra_enable_fuse_clk(void __iomem *base)
>  	writel(reg, base + 0x14);
>  }
> =20
> +static ssize_t tegra_soc_hidrev_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	return sprintf(buf, "%d\n", tegra_read_chipid());

Would it be better to print this as hexadecimal?

> +}
> +
> +static DEVICE_ATTR(hidrev, S_IRUGO, tegra_soc_hidrev_show,  NULL);
> +
> +static struct attribute *tegra_soc_attr[] =3D {
> +	&dev_attr_hidrev.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tegra_soc_attr_group =3D {
> +	.attrs =3D tegra_soc_attr,
> +};
> +
>  struct device * __init tegra_soc_device_register(void)
>  {
>  	struct soc_device_attribute *attr;
> @@ -312,6 +330,7 @@ struct device * __init tegra_soc_device_register(void)
>  	attr->family =3D kasprintf(GFP_KERNEL, "Tegra");
>  	attr->revision =3D kasprintf(GFP_KERNEL, "%d", tegra_sku_info.revision);
>  	attr->soc_id =3D kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id());

I guess we print all of these as decimal, so hidrev should probably be
the same, so never mind the previous comment.

Thierry

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl503OsACgkQ3SOs138+
s6HEwQ/+O9SCRbBqNXYN9nux8BzE8Ipn8+xWykZAptrwS9KAHbiT69ijOt10NCMp
cOisPIp+xylrpVBsItNmVr5LUdhY6tG74J8thr5ad/8YduzBPGIR9IxDqS7E4Btu
106OsngzZjFHEcN65/6mey7WnAn20h510IYTxInMBeSuY0ZuhZj7WJd8LkoPURYu
wfTQnRwKPCYORz+E492TVr/rFeAi9svq8Q7fB63c/CXvG3yQd+4h24b6hdC+/cC6
MepbgXOe2RwaVU5d+VBSMa+Xd2hbxqw07AAuxlaEvsbSHQfCnkCwn++Ew3wqox+g
pTOEzEziwSyjXUim9Fbhrd7Ihei2q/RKyWLx+PxjzdB9IGwKbN9MXaMX8skDVOTf
h55hTSIhdREE5fJdXb3kP+OYGidzW09etaKBxDwIZj/tiTHND/l2oUDqsC6r5753
MaWX8Kc4zWsEYW/3SQyWfWsWzO80zOOHSoV6nJIOLlr4OgiWBeDcl0gnerN2ZHBE
US06/1Apu7wb/toICZR+t/u+ml6BZ4fR/Ddp4u8sGIKKDzKkAdFuAMJZKFQj2KMw
KPi3RwQBIbwSyoFF3+i3Rinq84qKSbm1oe5NLUb0ld1nVHKBV+8o6M3AXqFYNX0Z
3j2qb3qI5Jgk1bJF8F1zOOM/BI71WfxCDnKYvAuR+x4vRMQNq6o=
=Nf1c
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
