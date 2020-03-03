From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 5/5] PCI: tegra: Add support for PCIe endpoint mode in
 Tegra194
Date: Tue, 3 Mar 2020 14:38:54 +0100
Message-ID: <20200303133854.GA2854899@ulmo>
References: <20200303105418.2840-1-vidyas@nvidia.com>
 <20200303105418.2840-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200303105418.2840-6-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 04:24:18PM +0530, Vidya Sagar wrote:
> Add support for the endpoint mode of Synopsys DesignWare core based
> dual mode PCIe controllers present in Tegra194 SoC.
>=20
> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V4:
> * Addressed Lorenzo's review comments
> * Started using threaded irqs instead of kthreads
>=20
> V3:
> * Addressed Thierry's review comments
>=20
> V2:
> * Addressed Bjorn's review comments
> * Made changes as part of addressing review comments for other patches
>=20
>  drivers/pci/controller/dwc/Kconfig         |  30 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c | 681 ++++++++++++++++++++-
>  2 files changed, 693 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/=
dwc/Kconfig
> index 0830dfcfa43a..169cde58dd92 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -248,14 +248,38 @@ config PCI_MESON
>  	  implement the driver.
> =20
>  config PCIE_TEGRA194
> -	tristate "NVIDIA Tegra194 (and later) PCIe controller"
> +	tristate
> +
> +config PCIE_TEGRA194_HOST
> +	tristate "NVIDIA Tegra194 (and later) PCIe controller - Host Mode"
>  	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	select PCIE_DW_HOST
>  	select PHY_TEGRA194_P2U
> +	select PCIE_TEGRA194
> +	default y
> +	help
> +	  Enables support for the PCIe controller in the NVIDIA Tegra194 SoC to
> +	  work in host mode. There are two instances of PCIe controllers in
> +	  Tegra194. This controller can work either as EP or RC. In order to
> +	  enable host-specific features PCIE_TEGRA194_HOST must be selected and
> +	  in order to enable device-specific features PCIE_TEGRA194_EP must be
> +	  selected. This uses the DesignWare core.
> +
> +config PCIE_TEGRA194_EP
> +	tristate "NVIDIA Tegra194 (and later) PCIe controller - Endpoint Mode"
> +	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
> +	depends on PCI_ENDPOINT
> +	select PCIE_DW_EP
> +	select PHY_TEGRA194_P2U
> +	select PCIE_TEGRA194
>  	help
> -	  Say Y here if you want support for DesignWare core based PCIe host
> -	  controller found in NVIDIA Tegra194 SoC.
> +	  Enables support for the PCIe controller in the NVIDIA Tegra194 SoC to
> +	  work in host mode. There are two instances of PCIe controllers in
> +	  Tegra194. This controller can work either as EP or RC. In order to
> +	  enable host-specific features PCIE_TEGRA194_HOST must be selected and
> +	  in order to enable device-specific features PCIE_TEGRA194_EP must be
> +	  selected. This uses the DesignWare core.
> =20
>  config PCIE_UNIPHIER
>  	bool "Socionext UniPhier PCIe controllers"
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/con=
troller/dwc/pcie-tegra194.c
> index cbe95f0ea0ca..81810e644b23 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -14,6 +14,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/kfifo.h>
> +#include <linux/kthread.h>

After moving to threaded IRQs, do you still need these includes?

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5eXd4ACgkQ3SOs138+
s6EVjA/+MiWicLPXeikoOsrDyo2yGmbfVl1gjhiqLmFIk0cXDwDfBegX6JWoT9CB
p7Ffs0byZ8Bi8xza+wfpO4LVjANLOxW3DMtt4tFaOu2W+OsvaNbJasvo6X07Sr7k
I+dmrxkWuPz3mN6LFbR458HY0B7YxLDKwPzyEdYss5ETaZ3asVul3cnbDPViQY8v
tjcKk2ccScCYqAdjD4AW3ijxHECa5dEaLp13qQF76VVdHd3wyQox+SHvV9NNJo1o
d5RRTlj3z6hWsqE1Bp7hDqqYWSOg1brcpuzdy+y2sV6mWaRTXL4JQzI+B8fTPUhO
JvLZbx9JqyVtmqxq+PIekzdCGGRcqpEWL6+VIL4tWKL9OhUBJzHs/BKYW46Lx7Tv
cAdBMJkkif27Y2iUR3T00cYmKLpaCPtUXZicHglrrWDVwNVbYiiGy8WiVLsQohSj
SkRsnd7w09t/ZJ7JyzSnDfk2dR8qMBNDf64iiYhpmpXZSleF7ifla4fZrikXXnHG
HjNaSxR+Euwnnlf1rDhyfDSzJWjFvWM18wnxKydS5TwGt9wA0acTQrWrv1RePl1Y
ArDnpj1xfbhJhHEFO69Fjg9kr605SSmeXLmX+r6XR/5gkfF6FfRRyN2x3nRU9Fqb
i/AtQye/0U9iTr6Rc/NVIGD86+/Fq9gik3hhR8a5o81wRdyxpr8=
=q+we
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
