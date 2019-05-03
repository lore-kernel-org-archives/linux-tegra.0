From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 02/16] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Fri, 3 May 2019 13:01:59 +0200
Message-ID: <20190503110159.GB32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-3-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:49:50AM +0530, Vidya Sagar wrote:
> Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
> using this API be able to build as loadable modules.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes from [v4]:
> * None
>=20
> Changes from [v3]:
> * None
>=20
> Changes from [v2]:
> * Exported pcie_pme_no_msi() API after making pcie_pme_msi_disabled a sta=
tic
>=20
> Changes from [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/pcie/pme.c     | 14 +++++++++++++-
>  drivers/pci/pcie/portdrv.h | 16 +++-------------
>  2 files changed, 16 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
> index 54d593d10396..d5e0ea4a62fc 100644
> --- a/drivers/pci/pcie/pme.c
> +++ b/drivers/pci/pcie/pme.c
> @@ -25,7 +25,19 @@
>   * that using MSI for PCIe PME signaling doesn't play well with PCIe PME=
-based
>   * wake-up from system sleep states.
>   */
> -bool pcie_pme_msi_disabled;
> +static bool pcie_pme_msi_disabled;
> +
> +void pcie_pme_disable_msi(void)
> +{
> +	pcie_pme_msi_disabled =3D true;
> +}
> +EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
> +
> +bool pcie_pme_no_msi(void)
> +{
> +	return pcie_pme_msi_disabled;
> +}
> +EXPORT_SYMBOL_GPL(pcie_pme_no_msi);
> =20
>  static int __init pcie_pme_setup(char *str)
>  {
> diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
> index 1d50dc58ac40..7c8c3da4bd58 100644
> --- a/drivers/pci/pcie/portdrv.h
> +++ b/drivers/pci/pcie/portdrv.h
> @@ -125,22 +125,12 @@ void pcie_port_bus_unregister(void);
>  struct pci_dev;
> =20
>  #ifdef CONFIG_PCIE_PME
> -extern bool pcie_pme_msi_disabled;
> -
> -static inline void pcie_pme_disable_msi(void)
> -{
> -	pcie_pme_msi_disabled =3D true;
> -}
> -
> -static inline bool pcie_pme_no_msi(void)
> -{
> -	return pcie_pme_msi_disabled;
> -}
> -
> +void pcie_pme_disable_msi(void);
> +bool pcie_pme_no_msi(void);
>  void pcie_pme_interrupt_enable(struct pci_dev *dev, bool enable);
>  #else /* !CONFIG_PCIE_PME */
>  static inline void pcie_pme_disable_msi(void) {}
> -static inline bool pcie_pme_no_msi(void) { return false; }
> +static inline bool pcie_pme_no_msi(void) {}

This looks wrong.

Thierry

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMH6YACgkQ3SOs138+
s6E4xw//dFTo8a4I8XRjFuw8mmRxoi0ZrVcgaoQ/hqpIqu/cew7PXc9XaqiB0JIK
KJjArrSz8XHoez/vrmk4CBNk5ECEAeVV6Eyrm3R99fPoBuBihH+B3QYkeMALa6hh
l2WUQRuDIYbRF71GjZlcgslAqZ8Bde19bxdwPg1T9kyOZmQrAiFq/PsRUPGscz1T
b5EVJMR+GiKQ/dceyluUz1bqp0JFpdX6Ae6IgCKrw2Z1plVvGi39Pzix1Za1Q3pY
EAlwOo6cebEhx0D7j/W/PLQM8+nQhBBAZiUWlwCOq/lsaL8Gt3r0RoLZchbX11Fp
hOmz1535bjHaUx/NT6zz2QgKvJ8tErCCooq+RUlubv6QLdOTIegaLDVpCAa4CsTv
wByyM7+oWwCvmIkWmv+nfllINKUiRFZOWASJ7aXAQh/1GGpx6wU/eaI+fbGMI/XJ
c0n031xH/GPAL5fx9BnX5M0mYBUkxTEWWvMuAwrodEtJEqc++RIs9CHGXNICSqPs
39NNzOS3tlhFDdR/KMe86vNYl8vfhjbM7m5v+8hmLwi4tOFO2KYY4KUXHNSgfnIi
tMbUOjs3ojI3E3vvLqiYYPQ1F0xLCuY1KshgaZ/V7tdqn/pzPQtYaEedA3jh7XVd
FVqPM1w7coRP7ty0PfJtfkUjOiV16jmSZdeMbzIJUqd7+9u5h74=
=+xfr
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
