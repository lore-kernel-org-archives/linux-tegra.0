From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 10/16] dt-bindings: PCI: tegra: Add device tree
 support for T194
Date: Mon, 15 Apr 2019 17:08:19 +0200
Message-ID: <20190415150819.GG29254@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-11-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2439551141684960230=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554407683-31580-11-git-send-email-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, kthota@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============2439551141684960230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M8g8Xvd1npd+rU3W"
Content-Disposition: inline


--M8g8Xvd1npd+rU3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 01:24:37AM +0530, Vidya Sagar wrote:
> Add support for Tegra194 PCIe controllers. These controllers are based
> on Synopsys DesignWare core IP.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
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
>  .../bindings/pci/nvidia,tegra194-pcie.txt          | 181 +++++++++++++++=
++++++
>  1 file changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194=
-pcie.txt
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.t=
xt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> new file mode 100644
> index 000000000000..71aa01b6ccf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> @@ -0,0 +1,181 @@
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
> +  - Controller-0 - TEGRA194_POWER_DOMAIN_PCIEX8B
> +  - Controller-1 - TEGRA194_POWER_DOMAIN_PCIEX1A
> +  - Controller-2 - TEGRA194_POWER_DOMAIN_PCIEX1A
> +  - Controller-3 - TEGRA194_POWER_DOMAIN_PCIEX1A
> +  - Controller-4 - TEGRA194_POWER_DOMAIN_PCIEX4A
> +  - Controller-5 - TEGRA194_POWER_DOMAIN_PCIEX8A

I'm not sure if I missed it, but is there an include file that contains
definitions for these symbolic names? Might be worth referring to such
an include from this document.

Also, why do we have two different ways of specifying the controllers?
Why are they called Controller-* in one place and PCIEX* in another? Can
we just pick one and stick with it?

> +- reg: A list of physical base address and length for each set of contro=
ller
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
> +  "dbi": The aperture where root port's own configuration registers are
> +         available
> +- interrupts: A list of interrupt outputs of the controller. Must contai=
n an
> +  entry for each entry in the interrupt-names property.
> +- interrupt-names: Must include the following entries:
> +  "intr": The Tegra interrupt that is asserted for controller interrupts
> +  "msi": The Tegra interrupt that is asserted when an MSI is received
> +- bus-range: Range of bus numbers associated with this controller
> +- #address-cells: Address representation for root ports (must be 3)
> +  - cell 0 specifies the bus and device numbers of the root port:
> +    [23:16]: bus number
> +    [15:11]: device number
> +  - cell 1 denotes the upper 32 address bits and should be 0
> +  - cell 2 contains the lower 32 address bits and is used to translate t=
o the
> +    CPU address space
> +- #size-cells: Size representation for root ports (must be 2)
> +- ranges: Describes the translation of addresses for root ports and stan=
dard
> +  PCI regions. The entries must be 7 cells each, where the first three c=
ells
> +  correspond to the address as described for the #address-cells property
> +  above, the fourth and fifth cells are for the physical CPU address to
> +  translate to and the sixth and seventh cells are as described for the
> +  #size-cells property above.
> +  - Entries setup the mapping for the standard I/O, memory and
> +    prefetchable PCI regions. The first cell determines the type of regi=
on
> +    that is setup:
> +    - 0x81000000: I/O memory region
> +    - 0x82000000: non-prefetchable memory region
> +    - 0xc2000000: prefetchable memory region
> +  Please refer to the standard PCI bus binding document for a more detai=
led
> +  explanation.
> +- #interrupt-cells: Size representation for interrupts (must be 1)
> +- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping propert=
ies
> +  Please refer to the standard PCI bus binding document for a more detai=
led
> +  explanation.
> +- clocks: Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +  - core
> +- resets: Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names: Must include the following entries:
> +  - core_apb
> +  - core
> +- phys: Must contain a phandle to P2U PHY for each entry in phy-names.
> +- phy-names: Must include an entry for each active lane.
> +  "p2u-N": where N ranges from 0 to one less than the total number of la=
nes
> +- nvidia,bpmp: Must contain a phandle to BPMP controller node.
> +- nvidia,controller-id : Controller specific ID
> +      0 - C0
> +      1 - C1
> +      2 - C2
> +      3 - C3
> +      4 - C4
> +      5 - C5

Again, here you use a different name to refer to the controllers than
before, although it's fairly obvious that these correspond to the
earlier Controller-*. But best to pick one and stick with it.

Also, the list for the power-domains property has description - value,
whereas you have value - description here. Since eventually the device
tree bindings will be converted to YAML, perhaps stick with:

    value: description

To help with a subsequent conversion.

> +- vddio-pex-ctl-supply: Regulator supply for PCIe side band signals
> +
> +Optional properties:
> +- max-link-speed: Limits controllers max speed to this value. For more i=
nfo,
> +    please refer to Documentation/devicetree/bindings/pci/pci.txt file.
> +- nvidia,init-speed: Limits controllers init speed to this value.
> +    1 - Gen-1 (2. 5 GT/s)
> +    2 - Gen-2 (5 GT/s)
> +    3 - Gen-3 (8 GT/s)
> +    4 - Gen-4 (16 GT/s)

Please provide a description for when to use this and what the effects
are. "Limits controller's init speed" doesn't say anything about whether
the speed can be increased later, or whether it will always stay at this
speed. Also, does it actually mean "set" the initial speed, or would the
controller also be able to start out at a lower speed than the one given
by "nvidia,init-speed"? "Limits" would suggest the latter, but best to
clarify.

> +- nvidia,disable-aspm-states : Controls advertisement of ASPM states
> +    bit-0 to '1' : Disables advertisement of ASPM-L0s
> +    bit-1 to '1' : Disables advertisement of ASPM-L1. This also disables
> +                   advertisement of ASPM-L1.1 and ASPM-L1.2
> +    bit-2 to '1' : Disables advertisement of ASPM-L1.1
> +    bit-3 to '1' : Disables advertisement of ASPM-L1.2
> +- supports-clkreq : Refer to Documentation/devicetree/bindings/pci/pci.t=
xt
> +- nvidia,update-fc-fixup : This is a boolean property and needs to be pr=
esent to
> +    improve perf when a platform is designed in such a way that it satis=
fies at
> +    least one of the following conditions thereby enabling root port to
> +    exchange optimum number of FC (Flow Control) credits with downstream=
 devices
> +    1. If C0/C4/C5 run at x1/x2 link widths (irrespective of speed and M=
PS)
> +    2. If C0/C1/C2/C3/C4/C5 operate at their respective max link widths =
and
> +       a) speed is Gen-2 and MPS is 256B
> +       b) speed is >=3D Gen-3 with any MPS
> +- nvidia,cdm-check : Enables CDM checking. For more information, refer S=
ynopsis
> +    DesignWare Cores  PCI Express Controller Databook r4.90a Chapter S.4
> +- "nvidia,pex-wake" : Add PEX_WAKE gpio number to provide wake support.

If it's a GPIO number it should have a -gpio or -gpios suffix. I think
-gpios is preferred. Since the parent of the property is already a PEX
controller, perhaps omit the pex- prefix and just call this:

    "nvidia,wake-gpios"

?

Thierry

> +- "nvidia,aspm-cmrt-us" : Common Mode Restore time for proper operation =
of ASPM
> +   to be specified in microseconds
> +- "nvidia,aspm-pwr-on-t-us" : Power On time for proper operation of ASPM=
 to be
> +   specified in microseconds
> +- "nvidia,aspm-l0s-entrance-latency-us" : ASPM L0s entrance latency to be
> +   specified in microseconds
> +
> +Examples:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Tegra194:
> +--------
> +
> +SoC DTSI:
> +
> +	pcie@14180000 {
> +		compatible =3D "nvidia,tegra194-pcie", "snps,dw-pcie";
> +		power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
> +		reg =3D <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)    =
  */
> +		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) =
*/
> +		       0x00 0x38040000 0x0 0x00040000>; /* iATU_DMA reg space (256K)  =
*/
> +		reg-names =3D "appl", "config", "atu_dma";
> +
> +		status =3D "disabled";
> +
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		device_type =3D "pci";
> +		num-lanes =3D <8>;
> +		linux,pci-domain =3D <0>;
> +
> +		clocks =3D <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
> +		clock-names =3D "core";
> +
> +		resets =3D <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
> +			 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
> +		reset-names =3D "core_apb", "core";
> +
> +		interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,	/* controller interru=
pt */
> +			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
> +		interrupt-names =3D "intr", "msi";
> +
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 0 0 0>;
> +		interrupt-map =3D <0 0 0 0 &gic 0 72 0x04>;
> +
> +		nvidia,bpmp =3D <&bpmp>;
> +
> +		supports-clkreq;
> +		nvidia,disable-aspm-states =3D <0xf>;
> +		nvidia,controller-id =3D <0>;
> +		nvidia,aspm-cmrt-us =3D <60>;
> +		nvidia,aspm-pwr-on-t-us =3D <20>;
> +		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> +
> +		bus-range =3D <0x0 0xff>;
> +		ranges =3D <0x81000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000   =
   /* downstream I/O (1MB) */
> +			  0x82000000 0x0 0x38200000 0x0 0x38200000 0x0 0x01E00000      /* non=
-prefetchable memory (30MB) */
> +			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x4 0x00000000>;  /* pre=
fetchable memory (16GB) */
> +	};
> +
> +Board DTS:
> +
> +	pcie@14180000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_2>,
> +		       <&p2u_3>,
> +		       <&p2u_4>,
> +		       <&p2u_5>;
> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3";
> +	};
> --=20
> 2.7.4
>=20

--M8g8Xvd1npd+rU3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0nmEACgkQ3SOs138+
s6EH7Q//eHUrIuvTFE+YHMhzuGzhgU7aS7tqUDKG/VU7F9RdjffHLfKyKDl2I+Ww
naGpo3x7pE/VPp6bGLUEpubXODM1hrkQP27CaC+lzhpxN67Dg+2yWyUtQQbCf4ZO
N5o8lyImPrUgs0Wl0LdJeGoQYSxaZPsm+IbbED4KvOcEwAauZd6M/6ni/8mYLwyJ
InSfB5XhvHs2jrxvoNCB5WRjepbsNZudrrfXDDwbVXaTCYEhiel+cHe0XXfskdrV
MdCNfueN3KDRhEjz9HCvcF/DFbciycPfGhvkWc1nkU8Slc6l9q8yDxWKeHf4NuEC
MSCR3sBvwMezU23ozTcoHKD9TdM76IQXQREc4R2rFUFPdd3Wm+acODtlYTwrmElZ
aAmXDY/tEfa5CQYH5U+ze76ETgPlxz7M+CvZ2+kHHyxcp3N4xPvHFglzjQnaPIzt
AkW6CmVxdkRSDRc3FkKZvpgpq/nPeg3lMv82SZ76BRh3iR5Ex4KeIcRFWOs/iRL/
t5XIgRelwE+6BbXdYzVd9vKzu3Unad1rSBGjIzTszTTzPErjJeOYsO9PC6QqEn9g
sn44ZUgq1fR+8NGwzPTIEaQe9BDS9Tyc9lVujAlsYqWUDy8cYr0r0B968sIYT8hk
jC5YLul57j1bwryersis791WeonEA2/ITPa0vH6ecESEwMhb12Y=
=SjBv
-----END PGP SIGNATURE-----

--M8g8Xvd1npd+rU3W--


--===============2439551141684960230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2439551141684960230==--
