From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 02/16] PCI/PME: Export pcie_pme_disable_msi() API
Date: Thu, 11 Apr 2019 12:16:57 +0200
Message-ID: <20190411101657.GF4633@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-3-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554407683-31580-3-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 01:24:29AM +0530, Vidya Sagar wrote:
> Export pcie_pme_disable_msi() API to enable drivers using this API be abl=
e to
> build as loadable modules
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes from [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/pcie/pme.c     | 6 ++++++
>  drivers/pci/pcie/portdrv.h | 5 +----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
> index 54d593d10396..18e815c1e3c9 100644
> --- a/drivers/pci/pcie/pme.c
> +++ b/drivers/pci/pcie/pme.c
> @@ -27,6 +27,12 @@
>   */
>  bool pcie_pme_msi_disabled;
> =20
> +void pcie_pme_disable_msi(void)
> +{
> +	pcie_pme_msi_disabled =3D true;
> +}
> +EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
> +
>  static int __init pcie_pme_setup(char *str)
>  {
>  	if (!strncmp(str, "nomsi", 5))
> diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
> index 1d50dc58ac40..2be7b7e9a784 100644
> --- a/drivers/pci/pcie/portdrv.h
> +++ b/drivers/pci/pcie/portdrv.h
> @@ -127,10 +127,7 @@ struct pci_dev;
>  #ifdef CONFIG_PCIE_PME
>  extern bool pcie_pme_msi_disabled;
> =20
> -static inline void pcie_pme_disable_msi(void)
> -{
> -	pcie_pme_msi_disabled =3D true;
> -}
> +void pcie_pme_disable_msi(void);
> =20
>  static inline bool pcie_pme_no_msi(void)
>  {

Perhaps also export pcie_pme_no_msi()? That way you could get rid of the
extern declaration of the pcie_pme_msi_disabled variable and make it
static to drivers/pci/pcie/pme.c?

Thierry

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyvFBkACgkQ3SOs138+
s6ELhQ//Vv9MKAZnJoNuinAuHN0VZpoVinl2xO7luTsHwQwXZxojinHPNU6svT8e
JG9n142d4+64x9LrpwAo2uK9Eur5502ru55knuDPX4f6R1s4zXjVKOSzuk5mgT/C
/tj/aBTsz5j1nONMk1JMDVdAmecEIMdxdqBu8ReXdDKWREn2e4X/1xMKC8lHkdTL
ykZid+SgzYB2S7h3edM7yUdvNbejZj6FEPfSmYHoFz4FU5TFV44KQdyCWWnLag45
eIfmeiiS5HUjC70a7hA+cEl5VzBaaVOnyb7upwk0+td4a27G5C1DjG9fimTa11ZE
JER7uYR5uspou0eAIYjUWMk2+ZVb83IOb/C5rx3G63c7ZZe5RFIZ6JMMZ5Xk8/B/
klY/NEDSZiTTFBbNKkaectjMYLbhZ958S3ysXBU8qTkJkApo7fzrWZMijyMliaXx
S87vCklXMTKXtXoxBjsEgwBCQsirwrHHlkgRCbwTpkr2P37AdMMSTB/J2jsj7pBH
ncmGzf4K61rsLlKvIu2OozM9u5zIGfI3t3NY3ZNG3vK9Do0R4HGCxhZWN/JxdXhm
QLCow0erxVPGJNNUSssiiIUyikMbmcB/ap7aI78yYZgj4jTOUhDMDBcCaj8IdluB
YRDVKLaRuwDb6vQ4i2u3y3z7Xg9/1zq0hSwpMeNry3AmsCA/EpY=
=IySS
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
