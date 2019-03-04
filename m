From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/6] soc/tegra: initial tegra-automotive detection
Date: Mon, 4 Mar 2019 14:19:56 +0100
Message-ID: <20190304131956.GJ9040@ulmo>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
 <20190301153540.14954-2-kejia.hu@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089446718941155943=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190301153540.14954-2-kejia.hu@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kejia Hu <kejia.hu@codethink.co.uk>
Cc: devicetree@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Preston <thomas.preston@codethink.co.uk>, linux-tegra@vger.kernel.org, digetx@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1089446718941155943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AwgMNpd3VkAVXjS"
Content-Disposition: inline


--7AwgMNpd3VkAVXjS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2019 at 03:35:35PM +0000, Kejia Hu wrote:
> From: Ben Dooks <ben.dooks@codethink.co.uk>
>=20
> Add an initial soc_is_tegra_auto() with detection
> via a change in the device-tree.
>=20
> Also print the path taken through soc_is_tegra_auto() to
> allow debugging. Only print when debug is enabled as this
> function may be be called from multiple places, resulting
> in duplicated messages in production.
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
> ---
>  drivers/soc/tegra/common.c             | 23 +++++++++++++++++++++++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c |  2 ++
>  include/soc/tegra/common.h             |  1 +
>  include/soc/tegra/fuse.h               |  1 +
>  4 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index 7bfb154d6fa5..a10bd26fb5df 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
> =20
>  #include <soc/tegra/common.h>
> +#include <soc/tegra/fuse.h>
> =20
>  static const struct of_device_id tegra_machine_match[] =3D {
>  	{ .compatible =3D "nvidia,tegra20", },
> @@ -34,3 +35,25 @@ bool soc_is_tegra(void)
> =20
>  	return match !=3D NULL;
>  }
> +
> +static const struct of_device_id tegra_machine_match_auto[] =3D {
> +	{ .compatible =3D "nvidia,tegra20auto", },
> +	{ .compatible =3D "nvidia,tegra30auto", },
> +	{ },
> +};
> +
> +bool soc_is_tegra_auto(void)
> +{
> +	struct device_node *root;
> +	bool id_match  =3D false;
> +
> +	root =3D of_find_node_by_path("/");
> +
> +	if (root && of_match_node(tegra_machine_match_auto, root))
> +		id_match =3D true;
> +
> +	pr_debug("%s of_device_id match %d, tegra_sku_info.is_automotive %d\n",
> +			__func__, id_match, tegra_sku_info.is_automotive);
> +
> +	return id_match || tegra_sku_info.is_automotive;
> +}

Why do we need two ways of specifying the same thing? If we can read
this information from fuses, I don't think we need the extra compatible
string matching.

Also, if you're going to use this exclusively for clock setup, then the
alternative is to do that as part of the board's device tree, as Dmitry
pointed out.

Thierry

--7AwgMNpd3VkAVXjS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx9JfoACgkQ3SOs138+
s6ERjQ/6Ay3gZcRVoP/6DVVhcgS4TqaXaB7C2xvQpSxVmfzlRxNiAONrM8q3akzx
Hth+ZyvTcroPMLAyzPX5vkHa4ai4XgOnjJrKFvI40NjtZ3+VLss03KLIX70LHwQk
tWHX+G1m98hX8oAMHNzufTofd7BGiaqStMXZYbb75wJh/Lx+utoreJo9QOmMOmZv
lo9yScTvlXrSsxwK9m4AToIpaY5ml41SptoXtBXvUcSUu8326koGqWFfm5PUUkqJ
pSiwwMA2duOKfpVSD4K8fBARQAigbatsTXUX5Oh8BqFu2jOywwiezegJq2b6XEgY
xzI5eXTQ3R4lOgThv5DQ8m6K9rcDdc8gFiFir0iNF1xd/sbZ9GrRfExRcAo+mB3E
Lh/L16KBvmn437ALkeFce6Y59trp4fy4Afn46D2IrJnfq5gc4OAP1sEUsvGNNgnH
pmrBHYJMzskpaMh5CI3UwoTHzCiwYEBu2RiQoM6TDVDkcfy2QEVsI4SS+qOoGE8U
pYE9uOQfv5x81qKwv2amSr8ttotaGf8Dcz23b31EcMDVmrb34v0av8CBiHSz1U5E
Y116gTthzhoqfvUjBL9iarcNYnEn2UQ+5CMTIjz55htOzAn9D4i9pM5j2hPjKX0z
KAw/iK02FLhWAzZIPl8yM7oUYtN098nGDXQNoswSMdSN4jQsDV8=
=KOLS
-----END PGP SIGNATURE-----

--7AwgMNpd3VkAVXjS--


--===============1089446718941155943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1089446718941155943==--
