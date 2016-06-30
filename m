From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pci: tegra: actually program REFCLK_CFG* on recent SoCs
Date: Thu, 30 Jun 2016 15:47:28 +0200
Message-ID: <20160630134728.GE26758@ulmo.ba.sec>
References: <20160624143703.13231-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2517884748197453346=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160624143703.13231-1-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2517884748197453346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 08:37:03AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> On recent SoCs, tegra_pcie_phy_enable() isn't called; but instead
> tegra_pcie_enable_controller() calls tegra_xusb_phy_enable(). However,
> part of tegra_pcie_phy_enable() needs to happen in all cases. Move that
> code to tegra_pcie_port_enable() instead.
>=20
> For reference, NVIDIA's downstream Linux kernel performs this operation
> in tegra_pcie_enable_rp_features(), which is called immediately after
> tegra_pcie_port_enable(). Since that function doesn't exist in the mainli=
ne
> driver, we'll just add it to the tail of tegra_pcie_port_enable() instead.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  drivers/pci/host/pci-tegra.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 74887fedc3d4..2ec64a9e7943 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -541,12 +541,13 @@ static void tegra_pcie_port_reset(struct tegra_pcie=
_port *port)
> =20
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>  {
> -	const struct tegra_pcie_soc_data *soc =3D port->pcie->soc_data;
> +	struct tegra_pcie *pcie =3D port->pcie;
> +	const struct tegra_pcie_soc_data *soc =3D pcie->soc_data;
>  	unsigned long ctrl =3D tegra_pcie_port_get_pex_ctrl(port);
>  	unsigned long value;
> =20
>  	/* enable reference clock */
> -	value =3D afi_readl(port->pcie, ctrl);
> +	value =3D afi_readl(pcie, ctrl);
>  	value |=3D AFI_PEX_CTRL_REFCLK_EN;
> =20
>  	if (soc->has_pex_clkreq_en)
> @@ -554,9 +555,14 @@ static void tegra_pcie_port_enable(struct tegra_pcie=
_port *port)
> =20
>  	value |=3D AFI_PEX_CTRL_OVERRIDE_EN;
> =20
> -	afi_writel(port->pcie, value, ctrl);
> +	afi_writel(pcie, value, ctrl);
> =20
>  	tegra_pcie_port_reset(port);
> +
> +	/* Configure the reference clock driver */
> +	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
> +	if (soc->num_ports > 2)
> +		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>  }

This will actually write these two registers for each enabled port,
which, while it shouldn't make a difference, is unnecessary. I've
applied a slightly modified version of this patch. Specifically I moved
this code to the tail of the tegra_pcie_phy_power_on() function, which
is closest to where it was before.

I've also applied the patch that changes the values that are written
into this register, though I reversed the order because that made more
sense to me. I've pushed both patches to the for-4.8/pci branch in the
Tegra tree, can you please take a look if that still looks okay to you?

Thierry

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdSLtAAoJEN0jrNd/PrOhhFgP/iX0kfma0ojotxz5BEhpadZO
J1yd7/0PXwHu3ozLEACoQXNZmRsam0ErI/zD4y+HbL6YZkprWqfEmTvKvxVw/zF0
az5istWHC3oxqb4itxtUYqqLpEi2jW/Y9nGjgkMFLAzy4K/A3RbTrLSuRqSQIJXA
XZ8abhWS0+YduSeeLP6hq6cJThkLz1F6RwfHc0UgLI4g6uWrcknIHUd/z+rrpqdG
glu4so9rux1DyZ+f7FZr7Y3PDoT37oPlFCe98qzmjw6grgfTYg93SWrt84vgbHE9
JlWgaFBNO7Zl2jYHqIQ+uEdrzsNKTFkQR74HsSyCbjSnKE/wEGsDC6E6Bb38X+//
SVUEWNo3UV6BKq5X8AM6VA5tPykTXw8Hs6AnSThckfZN0VDDN9GeenBQCzeYbA3b
MRjYqTBQMC9uvxrqecNUECA9mIdtrgX2ouW4yiT6ABzqkWYT2vmnfcCsapqDvDIq
mn9nWLHuCXLebkJKxgoMIXacJFDKUVWeakkAb/2oDM3YKneMhYMo4S/nNjWNaGpm
DyJhex4dTX/CE6vcawf/YIIOiduVI3l9H4fOVeD4VQ/zBOy8OvQqDp9D4ZHcyFoP
/NG9qxF+kg/syqSmRxkbr8w9zsDuiZEsBJ20eFrK9FhxD1+e3FD9QEvydLDHPNXp
MnHmwITASlcLXt0/lz6d
=kVWs
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--


--===============2517884748197453346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2517884748197453346==--
