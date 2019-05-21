From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 02/15] PCI: Disable MSI for Tegra194 root port
Date: Tue, 21 May 2019 12:27:29 +0200
Message-ID: <20190521102729.GB29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-3-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:33PM +0530, Vidya Sagar wrote:
> Tegra194 rootports don't generate MSI interrupts for PME events and hence
> MSI needs to be disabled for them to avoid root ports service drivers
> registering their respective ISRs with MSI interrupt.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v6]:
> * This is a new patch
>=20
>  drivers/pci/quirks.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 0f16acc323c6..28f9a0380df5 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2592,6 +2592,20 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA,
>  			PCI_DEVICE_ID_NVIDIA_NVENET_15,
>  			nvenet_msi_disable);
> =20
> +/*
> + * Tegra194's PCIe root ports don't generate MSI interrupts for PME even=
ts
> + * instead legacy interrupts are generated. Hence, to avoid service driv=
ers
> + * registering their respective ISRs for MSIs, need to disable MSI inter=
rupts
> + * for root ports.
> + */
> +static void disable_tegra194_rp_msi(struct pci_dev *dev)
> +{
> +	dev->no_msi =3D 1;
> +}
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad0, disable_tegra194_r=
p_msi);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad1, disable_tegra194_r=
p_msi);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad2, disable_tegra194_r=
p_msi);
> +

Later functions in this file seem to use a more consistent naming
pattern, according to which the name for this would become:

	pci_quirk_nvidia_tegra194_disable_rp_msi

Might be worth considering making this consistent.

This could also be moved to the DWC driver to restrict this to where it
is needed. In either case, this seems like a good solution, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj0pEACgkQ3SOs138+
s6GqcxAAjaEUM9FTNPbKl4kQsquEnKIrVyDWV9lxJqFh1YaQGK005Nk/f1oJcuOn
CEP8HrtYIpZk1wn1cUsT+ec9j7qxlu9ihEhKBXxsFOf6njXoBnc+QjscO28UJ4tu
HYHDpvEK98bDBRMJhaZuBEClqBuFAH5Zrp8909NaUgaka7ut6PZqQC6XymRa6aX8
5z8GSfR/FSNdUnhJ0gboYdliYQc+/co73YJUPVWKimKkRKnfD6OYNjR9+YfncIPU
cFkBWnqCFzLVg6NIIOXpcEftFstLcTSJeC4XZ4bVa442Wbnz2dsgqHJMBy2wuR1z
vwtnw+94Coa8E7Zsa5NCwTOiqyqhjsJGsS5IcI3OEbjh2aue7ScypriufK4Dyept
hITWFgp0ZX1UxT2/QCLHfue3qNgSdOTYtomYFATqyHPD3BrgDAG8XZKKSDUVty8h
PE7MLQfsgWWdqFn0SaHeiCGMlc/1n5JvBRzfO04dPNH62G80YoJ5/WqkZ15pTQFW
FCbfApM2DekXpRsJaQvkPuXOAJOsUhR//WSLEMJQWfTl2pfRq2HPwWbSAgriL++k
VnsA4LBL4dKx8eqQJO/6SGJHmeHEjEnugbm9vsxQmiajUFl3LdVt6PfGeaSMq9oy
ggLSXlC+pTaWmPnBKEKh5aLNtSCCz+lT2cKkLq24YbX3YnLaC4g=
=PTXE
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
