From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/5] PCI: tegra: Add support for PCIe endpoint mode in
 Tegra194
Date: Mon, 6 Jan 2020 14:14:16 +0100
Message-ID: <20200106131416.GD1955714@ulmo>
References: <20200103124404.20662-1-vidyas@nvidia.com>
 <20200103124404.20662-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200103124404.20662-4-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2020 at 06:14:02PM +0530, Vidya Sagar wrote:
> Add support for the endpoint mode of Synopsys DesignWare core based
> dual mode PCIe controllers present in Tegra194 SoC.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V2:
> * Addressed Bjorn's review comments
> * Made changes as part of addressing review comments for other patches
>=20
>  drivers/pci/controller/dwc/Kconfig         |  30 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c | 782 ++++++++++++++++++++-
>  2 files changed, 796 insertions(+), 16 deletions(-)
>=20
[...]
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/con=
troller/dwc/pcie-tegra194.c
> index cbe95f0ea0ca..6621ac79efee 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
[...]
> @@ -1427,8 +1620,553 @@ static int tegra_pcie_config_rp(struct tegra_pcie=
_dw *pcie)
[...]
> +static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
> +				struct platform_device *pdev)
> +{
[...]
> +	ret =3D devm_request_irq(dev, pcie->pex_rst_irq,
> +			       tegra_pcie_ep_pex_rst_irq,
> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +			       name, (void *)pcie);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request IRQ for PERST: %d\n", ret);
> +		return ret;
> +	}
> +	disable_irq(pcie->pex_rst_irq);

I just came across this while reviewing another patch: it looks like a
better way to handle "disabled by default" interrupts is to do this:

	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);

before calling devm_request_irq(). See here for an example:

	http://patchwork.ozlabs.org/patch/1217944/

Thierry

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4TMqgACgkQ3SOs138+
s6GNwg//eoYbBqRW7zBR5KGrZcKbRD3VPCZru7iK4ARTdjfc4up0xfWPooDjX0ns
a/jL8FztSb++YHsLIWsH3B4/IguatB0jQrajT6Dduco7gPifJuJz6S2IyTufgba7
FzAgJQX4sFkqa7fIpZhJASjSpyMg9907eSXM/FEKqjcmE8w3/xHKrpFV/uGWDOC0
9r2fAX7432kmmKaiIPWlMLo/CjSvuaOb1GHHkxBZmh+pV7zvCfyw3o8h3+6sdyJB
MSGuG17DCT9/MgBfSEQCO4ZqKbB8LcnsIgOyDsEp9h6iKPjdLvOV5aiGbn5I7Ett
SdOsISrYFgcl6jVIhz+osfOmadoBWpJAYvRMVJH1BKQ0RqKRXtMk6lC95k96WdNm
iw1tUajyBQzSdPN02Uu+IamwacrYv1VP/35HHF5E0qWpE/HcUOAVp0ASPaG9WlI5
OlIBc6Ysh7G4de/bberj5eZ012GtEVdE+uetC+G4Mx3BDhhIjHNOYFGGbkQb5dRB
yQTA792ZrYow2jYkz9WbnB5MXtYrZDAwA0J1lSSsNqUfq16X1jq31mmCmS7jlOS2
HZr3LkEaKLcqqWQXMke1MA4xLB0RcOJd2jFFPUYztBZKRbZ+/sFnquP1qk5rtAnt
jUgJNeQ15mLQE2GwhmUQbUSLI3PCVr6FBfWY8XsndLkfAZU4jWw=
=JFHB
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
