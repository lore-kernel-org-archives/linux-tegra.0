From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Add NVIDIA Jetson Nano Developer Kit support
Date: Wed, 20 Mar 2019 11:14:15 +0100
Message-ID: <20190320101415.GD6043@ulmo>
References: <20190318232313.24270-1-thierry.reding@gmail.com>
 <2b4ec55b-d9f3-3c09-5590-f586609f0b3e@nvidia.com>
 <20190319120755.GA9309@ulmo>
 <1c75f95b-6184-3e93-7e3f-68d73be72c91@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7085644620542127979=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1c75f95b-6184-3e93-7e3f-68d73be72c91@wwwdotorg.org>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============7085644620542127979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 11:01:14AM -0600, Stephen Warren wrote:
> On 3/19/19 6:07 AM, Thierry Reding wrote:
> > On Tue, Mar 19, 2019 at 10:16:49AM +0000, Jon Hunter wrote:
> > >=20
> > > On 18/03/2019 23:23, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > The Jetson Nano Developer Kit is a Tegra X1 based development board=
=2E It
> > > > is similar to Jetson TX1 but it is not pin compatible. It features =
4 GB
> > > > of LPDDR4, an SPI NOR flash for early boot firmware and an SD card =
slot
> > > > used for storage.
> > > >=20
> > > > HDMI 2.0 or DP 1.2 are available for display, four USB ports (3 USB=
 2.0
> > > > and 1 USB 3.0) can be used to attach a variety of peripherals and a=
 PCI
> > > > Ethernet controller provides onboard network connectivity.
> > > >=20
> > > > A 40-pin header on the board can be used to extend the capabilities=
 and
> > > > exposed interfaces of the Jetson Nano.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > This patch, along with some related patches can be found in the p34=
50
> > > > branch in the following repository:
> > > >=20
> > > > 	https://github.com/thierryreding/linux
> > > >=20
> > > >   arch/arm64/boot/dts/nvidia/Makefile           |    1 +
> > > >   .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 1911 ++++++++++++=
+++++
> > > >   2 files changed, 1912 insertions(+)
> > > >   create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000=
=2Edts
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/=
dts/nvidia/Makefile
> > > > index 6b8ab5568481..bcd018c3162b 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/Makefile
> > > > +++ b/arch/arm64/boot/dts/nvidia/Makefile
> > > > @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D tegra132-norr=
in.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-0000.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-2180.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2571.dtb
> > > > +dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p3450-0000.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-smaug.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-0050-a08.dtb
> > > >   dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/a=
rch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > > new file mode 100644
> > > > index 000000000000..b1d8a49ca8c4
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > > @@ -0,0 +1,1911 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > +#include <dt-bindings/mfd/max77620.h>
> > > > +
> > > > +#include "tegra210.dtsi"
> > > > +
> > > > +/ {
> > > > +	model =3D "NVIDIA Jetson Nano Developer Kit";
> > > > +	compatible =3D "nvidia,p3450-0000", "nvidia,tegra210";
> > >=20
> > > I am just curious but any reason why we do not have a dtsi file for t=
he
> > > Nano module that we include for the developer kit? Or is there no poi=
nt
> > > because the module and kit will never be separate in this case?
> > >=20
> > > The developer kit user guide lists both the module (p3448) and carrier
> > > board (p3449) and so was just curious.
> >=20
> > We used to do that in the past but there never turned out to be a second
> > board that shared the module or carrier DTSI, and the added complexity
> > of spreading changes over multiple DTS files never came with any
> > advantage, so I want to try something different this time.
> >=20
> > If there's ever a need to split the module specific bits so that they
> > can be shared by multiple assemblies, we can still make the split. I
> > just don't want to start out extra complicated if we don't have to.
> >=20
> > > > +
> > > > +	aliases {
> > > > +		ethernet =3D "/pcie@1003000/pci@2,0/ethernet@0,0";
> > > > +		rtc0 =3D "/i2c@7000d000/pmic@3c";
> > > > +		rtc1 =3D "/rtc@7000e000";
> > > > +		serial0 =3D &uarta;
> > > > +	};
> > > > +
> > > > +	chosen {
> > > > +		stdout-path =3D "serial0:115200n8";
> > > > +	};
> > > > +
> > > > +	memory {
> > > > +		device_type =3D "memory";
> > > > +		reg =3D <0x0 0x80000000 0x1 0x0>;
> > > > +	};
> > > > +
> > > > +	pcie@1003000 {
> > > > +		status =3D "okay";
> > > > +
> > > > +		hvddio-pex-supply =3D <&vdd_1v8>;
> > > > +		dvddio-pex-supply =3D <&vdd_pex_1v05>;
> > > > +		vddio-pex-ctl-supply =3D <&vdd_1v8>;
> > > > +
> > > > +		pci@1,0 {
> > > > +			phys =3D <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
> > > > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>,
> > > > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>,
> > > > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
> > > > +			phy-names =3D "pcie-0", "pcie-1", "pcie-2", "pcie-3";
> > > > +			nvidia,num-lanes =3D <4>;
> > > > +			status =3D "okay";
> > > > +		};
> > > > +
> > > > +		pci@2,0 {
> > > > +			phys =3D <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
> > > > +			phy-names =3D "pcie-0";
> > > > +			status =3D "okay";
> > > > +
> > > > +			ethernet@0,0 {
> > > > +				reg =3D <0x000000 0 0 0 0>;
> > > > +				mac-address =3D [ 00 00 00 00 00 00 ];
> > > > +			};
> > > > +		};
> > > > +	};
> > > > +
> > > > +	host1x@50000000 {
> > > > +		dpaux@54040000 {
> > > > +			status =3D "okay";
> > > > +		};
> > > > +
> > > > +		sor@54580000 {
> > > > +			status =3D "okay";
> > > > +
> > > > +			avdd-io-supply =3D <&avdd_1v05>;
> > > > +			vdd-pll-supply =3D <&vdd_1v8>;
> > > > +			hdmi-supply =3D <&vdd_hdmi>;
> > > > +
> > > > +			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> > > > +			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(CC, 1)
> > > > +					   GPIO_ACTIVE_LOW>;
> > > > +			nvidia,xbar-cfg =3D <0 1 2 3 4>;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	gpu@57000000 {
> > > > +		vdd-supply =3D <&vdd_gpu>;
> > > > +		status =3D "okay";
> > > > +	};
> > > > +
> > > > +	pinmux: pinmux@700008d4 {
> > > > +		pinctrl-names =3D "boot";
> > > > +		pinctrl-0 =3D <&state_boot>;
> > > > +
> > > > +		state_boot: pinmux {
> > > > +			pex_l0_rst_n_pa0 {
> > > > +				nvidia,pins =3D "pex_l0_rst_n_pa0";
> > > > +				nvidia,function =3D "pe0";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			pex_l0_clkreq_n_pa1 {
> > > > +				nvidia,pins =3D "pex_l0_clkreq_n_pa1";
> > > > +				nvidia,function =3D "pe0";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			pex_wake_n_pa2 {
> > > > +				nvidia,pins =3D "pex_wake_n_pa2";
> > > > +				nvidia,function =3D "pe";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			pex_l1_rst_n_pa3 {
> > > > +				nvidia,pins =3D "pex_l1_rst_n_pa3";
> > > > +				nvidia,function =3D "pe1";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			pex_l1_clkreq_n_pa4 {
> > > > +				nvidia,pins =3D "pex_l1_clkreq_n_pa4";
> > > > +				nvidia,function =3D "pe1";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			sata_led_active_pa5 {
> > > > +				nvidia,pins =3D "sata_led_active_pa5";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			pa6 {
> > > > +				nvidia,pins =3D "pa6";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > > > +			};
> > > > +			dap1_fs_pb0 {
> > > > +				nvidia,pins =3D "dap1_fs_pb0";
> > > > +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> > > > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > > > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > > > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > >=20
> > > I am guessing this is generated by the pinmux spreadsheet, but any
> > > reason why there is no 'nvidia,function' for some pins? Some that are
> > > not used have the function defined as 'rsvd1', however, the above pin
> > > does not, but AFAIK it is not used.
> >=20
> > Yes, this was generated from the pinmux spreadsheet. I'm not overly
> > familiar with pinmux, but I think the idea was that if a property is
> > missing, it means that the hardware default applies.
>=20
> I believe if a property isn't present, the kernel simply doesn't program
> that field in the register, so yes the HW default (or whatever earlier bo=
ot
> SW programmed) applies.
>=20
> > Adding Stephen in case he knows.
> >=20
> > On that note, I guess we should publish the board file for the pinmux
> > scripts as well.
>=20
> Yes, please.
>=20
> Talking of pinmux: I believe we should remove this "default" pinmux
> configuration from the kernel. We are supposed to fully program the entire
> default/static pinmux one time as early as possible in the boot process.
> cboot does most of this (and hopefully will be fixed to do all of it...) =
and
> U-Boot finishes the job. Because of that, U-Boot deletes (at least
> downstream/L4T U-Boot, and upstream should do it to) the following proper=
ty
> from the pinctrl not in DT:
>=20
> >>> +		pinctrl-0 =3D <&state_boot>;
>=20
> ... which means that the state_boot node is ignored. This is true for all
> 64-bit Tegra boards. I'd like to see us remove the state_boot node from a=
ll
> 64-bit Tegra DTs and rely on the bootloader to avoid data duplication and
> redundant HW programming.

Sounds reasonable. I'm not exactly sure where that leaves boards like
Smaug where cboot doesn't run. Perhaps coreboot already sets up the
pinmux in the same way that cboot does?

Let's start by omitting the pinmux node from Jetson Nano, and we can
follow up by removing from other board DTS files.

Thierry

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlySEnQACgkQ3SOs138+
s6HOBhAAlsflLLe/QLvEp3AWhXWGQRtRgCFppZUE3p5pt6y5IFwyejCbAerfB2IC
Rf+4pmS2HOF0puzN8lrEdIq3qbfd+DXHUB2p5LhAvxUzvM7tHZ/km6vlpPpOezSm
x8tQZgvhVex/CielHwCU979saoNQQyAN9isbpmYLXNSjZ28ZPGqsxh2N0yOhlXtD
sA58pf8K8Oz/64m/gDva35M79sPbyNIy41rhh7KenC8Dq4h2QKJb4ftIA5hpGzUM
yY915rRzFKbNpMfXwaeqzHM4PtA0VlxmmIg94hadNm8hdSITb2SYtSi1r5dns4nk
ZniNfRQJPDZXP2316Js/vMuqXn5hNycJgxqfa7kElcqsGkEcl13BMztT3mEZK00A
HUWFdao7YKKz+g98JIH90i8H0/lYF8oAqOlGk5GOvXHGrP6+1SOghZOyWh/+Zm7k
1tqP+DzfGtMLpgdrLVKgNo/9ZM2FoFZ+bVJYTGTmQvv4NwW8GO0xBVNbF9pz9OqD
HJnrnivvXfhWKJjbB4HjO8gAVtmqDxtW56jXRPc6n0C7LF/niacDccI2Uk22VhjT
6GfHkSNwajcQuvzy/2yJ6Y5Bc9ybwFFPG6rjmHscXgywHd44Q4slhjNglEuxCZdb
oU2M/zGEEtAHF7TSDAqpuUfut84deky8jBnngodupcbmpluQp70=
=RjoR
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--


--===============7085644620542127979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7085644620542127979==--
