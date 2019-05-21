From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/15] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Tue, 21 May 2019 12:29:03 +0200
Message-ID: <20190521102903.GC29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-4-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:34PM +0530, Vidya Sagar wrote:
> Remove multiple write enable and disable sequences of dbi registers as
> Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled by
> DBI write-lock enable bit thereby not allowing any further writes to BAR-0
> register in config space to take place. Hence enabling write permission at
> the start of function and disabling the same only towards the end.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * Moved write enable to the beginning of the API and write disable to the=
 end
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * None
>=20
>  drivers/pci/controller/dwc/pcie-designware-host.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Looks good to me:

Reviewed-by: Thierry Reding <treding@nvidia.com>

Thierry

>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/=
pci/controller/dwc/pcie-designware-host.c
> index f93252d0da5b..d3156446ff27 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -628,6 +628,12 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  	u32 val, ctrl, num_ctrls;
>  	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> =20
> +	/*
> +	 * Enable DBI read-only registers for writing/updating configuration.
> +	 * Write permission gets disabled towards the end of this function.
> +	 */
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
>  	dw_pcie_setup(pci);
> =20
>  	if (!pp->ops->msi_host_init) {
> @@ -650,12 +656,10 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_1, 0x00000000);
> =20
>  	/* Setup interrupt pins */
> -	dw_pcie_dbi_ro_wr_en(pci);
>  	val =3D dw_pcie_readl_dbi(pci, PCI_INTERRUPT_LINE);
>  	val &=3D 0xffff00ff;
>  	val |=3D 0x00000100;
>  	dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> =20
>  	/* Setup bus numbers */
>  	val =3D dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
> @@ -687,15 +691,13 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> =20
>  	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
> =20
> -	/* Enable write permission for the DBI read-only register */
> -	dw_pcie_dbi_ro_wr_en(pci);
>  	/* Program correct class for RC */
>  	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
> -	/* Better disable write permission right after the update */
> -	dw_pcie_dbi_ro_wr_dis(pci);
> =20
>  	dw_pcie_rd_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, &val);
>  	val |=3D PORT_LOGIC_SPEED_CHANGE;
>  	dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
> --=20
> 2.17.1
>=20

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj0u8ACgkQ3SOs138+
s6EJCxAAnfv9ugCWZBC133ybiQYMaRJDUdLgGhyHZVX1/ZdmY5GToImZM6vjRujM
WlozE5s76t1gP0g6h1EhQqKoayUTSpKsqYHN8/H6SqPOZNlJLxELi2ZeIj66fcAC
/CahfKX4LFBR1Nb8QESoVaKPz0luor5SfwJmZsxHJTbfI+kXgs/4CYfXuhI3mRRU
NHSNushq/sxYks4IXV9oaMq4G8VVcmzGilKTiU65mYaQLYmFUpvkYLnBZlsig7qT
wYx1X34PPcO1/hg+dy55Kb2+TPU+tiMbIWKhhD/7efmoTobK77eNe3kcvylMier5
h6rzvmY8Vg2yJUlz498PO/0Vt6KTDC09fbTIQCELwak64CEfdIaR1K+gUXAp2YaL
lgjJFZtMpwGd8/DiC3gaIaiJQaYEMYj0cVyE+zpvDYTrue7l4ohkQjoyE/VbFhv+
PkIvP49aEiu0cm6FOEn1o64d7rzuXHUAK14ePYB5zmaovQ+7dEnS8NTo7cxAB5TB
EqkeWiHLrC32T/q0S01MO07/+3uX4sRUByRUgCjxPcgI2pJQM28SzxoQDGiozdYC
DiQW/JxNkL8+VWvPaZxBW6ywShWqzfXk9j8XoNOs0GLoArxiokfBjpigxJpF//Fs
CxDzv0ERBk2rPlTXg3GitfuOjs7H1wdZzHjJmLwfaQx1oPPaHL4=
=ZY4e
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
