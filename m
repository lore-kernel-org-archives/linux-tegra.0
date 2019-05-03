From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 10/16] dt-bindings: PCI: tegra: Add device tree
 support for T194
Date: Fri, 3 May 2019 13:19:23 +0200
Message-ID: <20190503111923.GE32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-11-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-11-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:49:58AM +0530, Vidya Sagar wrote:
> Add support for Tegra194 PCIe controllers. These controllers are based
> on Synopsys DesignWare core IP.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Using only 'Cx' (x-being controller number) format to represent a contr=
oller
> * Changed to 'value: description' format where applicable
> * Changed 'nvidia,init-speed' to 'nvidia,init-link-speed'
> * Provided more documentation for 'nvidia,init-link-speed' property
> * Changed 'nvidia,pex-wake' to 'nvidia,wake-gpios'
>=20
> Changes since [v1]:
> * Added documentation for 'power-domains' property
> * Removed 'window1' and 'window2' properties
> * Removed '_clk' and '_rst' from clock and reset names
> * Dropped 'pcie' from phy-names
> * Added entry for BPMP-FW handle
> * Removed offsets for some of the registers and added them in code and wo=
uld be pickedup based on
>   controller ID
> * Changed 'nvidia,max-speed' to 'max-link-speed' and is made as an option=
al
> * Changed 'nvidia,disable-clock-request' to 'supports-clkreq' with invert=
ed operation
> * Added more documentation for 'nvidia,update-fc-fixup' property
> * Removed 'nvidia,enable-power-down' and 'nvidia,plat-gpios' properties
> * Added '-us' to all properties that represent time in microseconds
> * Moved P2U documentation to a separate file
>=20
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194=
-pcie.txt
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.t=
xt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> new file mode 100644
> index 000000000000..208dff126108
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> @@ -0,0 +1,187 @@
> +NVIDIA Tegra PCIe controller (Synopsys DesignWare Core based)
> +
> +This PCIe host controller is based on the Synopsis Designware PCIe IP
> +and thus inherits all the common properties defined in designware-pcie.t=
xt.
> +
> +Required properties:
> +- compatible: For Tegra19x, must contain "nvidia,tegra194-pcie".
> +- device_type: Must be "pci"
> +- power-domains: A phandle to the node that controls power to the respec=
tive
> +  PCIe controller and a specifier name for the PCIe controller. Followin=
g are
> +  the specifiers for the different PCIe controllers
> +    TEGRA194_POWER_DOMAIN_PCIEX8B: C0
> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C1
> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C2
> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C3
> +    TEGRA194_POWER_DOMAIN_PCIEX4A: C4
> +    TEGRA194_POWER_DOMAIN_PCIEX8A: C5
> +  these specifiers are defined in
> +  "include/dt-bindings/power/tegra194-powergate.h" file.
> +- reg: A list of physical base address and length for each set of contro=
ller

Perhaps "list of physical base address and length pairs".

> +  registers. Must contain an entry for each entry in the reg-names prope=
rty.
> +- reg-names: Must include the following entries:
> +  "appl": Controller's application logic registers
> +  "config": As per the definition in designware-pcie.txt
> +  "atu_dma": iATU and DMA registers. This is where the iATU (internal Ad=
dress
> +             Translation Unit) registers of the PCIe core are made avail=
able
> +             fow SW access.

s/fow/for/

Thierry

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMI7sACgkQ3SOs138+
s6EIIQ/+JneyIE1QInUy25Ht9TxH6uK1NfNwHzcE3w7WQOHSFZ6cCm60usW9tX7y
5bVqKGD/Qk/van6DX4OJbVWqUXSU4kKpCvL6e9ImuJn50qtt+SZCvzn2ITB1RrMY
cx9g/qtQjrRgv9lnezcEBGFGFk0Mr828WkPfzZSIIT2xqJ7Hn+Irp5gvU+6LoDhv
7J3FiCWf08MsSP/GmoTROtgkEl72UkltbhPUNb+YtL/AZd858eXm7ao/zP3mUIO2
f67wTlzzqC1kYJYLERm4DOVlrpPehlz+fp+4QXbKsBovY4qkkRJCW4FM9F9d7Qe9
z5wGlqk7SRZQPNDAVGhZ4XWRjpyiMss72Mqv4FjHU+FQiuney9b/NVu60XtJ0JqA
LMo+JVI8w+5Pqq/n5+5mN9aM/dmmumTyaPZiQ/AASYX7iU8dXe6aKIcgZo+a10LW
X4fezVQ/BlzdHQ72ADFg66g1UkONCAYFaLemAf60OYJQQPKLTy4dAaemtleMoLsF
hbKQng3PJSkG8L33JiMlvGg4N0cIaWx+1ugkMLrjbgrx8z8qceHyc3nrGvBPUyTU
X9srLQMC7WsiahwlWUZPqMewXYPPXFKDg1+ExlLkQi/vSt88iJcu4X+ljt693WmR
GOIY4OkOtmYrcJZEdJLmxCjqTNMkxCRrKjSpv3OEHCigvugwYeo=
=pPtB
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
