From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Add NVIDIA Jetson Nano Developer Kit support
Date: Tue, 19 Mar 2019 13:07:55 +0100
Message-ID: <20190319120755.GA9309@ulmo>
References: <20190318232313.24270-1-thierry.reding@gmail.com>
 <2b4ec55b-d9f3-3c09-5590-f586609f0b3e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8497094874531086724=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2b4ec55b-d9f3-3c09-5590-f586609f0b3e@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8497094874531086724==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 10:16:49AM +0000, Jon Hunter wrote:
>=20
> On 18/03/2019 23:23, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Jetson Nano Developer Kit is a Tegra X1 based development board. It
> > is similar to Jetson TX1 but it is not pin compatible. It features 4 GB
> > of LPDDR4, an SPI NOR flash for early boot firmware and an SD card slot
> > used for storage.
> >=20
> > HDMI 2.0 or DP 1.2 are available for display, four USB ports (3 USB 2.0
> > and 1 USB 3.0) can be used to attach a variety of peripherals and a PCI
> > Ethernet controller provides onboard network connectivity.
> >=20
> > A 40-pin header on the board can be used to extend the capabilities and
> > exposed interfaces of the Jetson Nano.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > This patch, along with some related patches can be found in the p3450
> > branch in the following repository:
> >=20
> > 	https://github.com/thierryreding/linux
> >=20
> >  arch/arm64/boot/dts/nvidia/Makefile           |    1 +
> >  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 1911 +++++++++++++++++
> >  2 files changed, 1912 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/=
nvidia/Makefile
> > index 6b8ab5568481..bcd018c3162b 100644
> > --- a/arch/arm64/boot/dts/nvidia/Makefile
> > +++ b/arch/arm64/boot/dts/nvidia/Makefile
> > @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D tegra132-norrin.d=
tb
> >  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-0000.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-2180.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2571.dtb
> > +dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p3450-0000.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-smaug.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-0050-a08.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/=
arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > new file mode 100644
> > index 000000000000..b1d8a49ca8c4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > @@ -0,0 +1,1911 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/input/gpio-keys.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/mfd/max77620.h>
> > +
> > +#include "tegra210.dtsi"
> > +
> > +/ {
> > +	model =3D "NVIDIA Jetson Nano Developer Kit";
> > +	compatible =3D "nvidia,p3450-0000", "nvidia,tegra210";
>=20
> I am just curious but any reason why we do not have a dtsi file for the
> Nano module that we include for the developer kit? Or is there no point
> because the module and kit will never be separate in this case?
>=20
> The developer kit user guide lists both the module (p3448) and carrier
> board (p3449) and so was just curious.

We used to do that in the past but there never turned out to be a second
board that shared the module or carrier DTSI, and the added complexity
of spreading changes over multiple DTS files never came with any
advantage, so I want to try something different this time.

If there's ever a need to split the module specific bits so that they
can be shared by multiple assemblies, we can still make the split. I
just don't want to start out extra complicated if we don't have to.

> > +
> > +	aliases {
> > +		ethernet =3D "/pcie@1003000/pci@2,0/ethernet@0,0";
> > +		rtc0 =3D "/i2c@7000d000/pmic@3c";
> > +		rtc1 =3D "/rtc@7000e000";
> > +		serial0 =3D &uarta;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory {
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x80000000 0x1 0x0>;
> > +	};
> > +
> > +	pcie@1003000 {
> > +		status =3D "okay";
> > +
> > +		hvddio-pex-supply =3D <&vdd_1v8>;
> > +		dvddio-pex-supply =3D <&vdd_pex_1v05>;
> > +		vddio-pex-ctl-supply =3D <&vdd_1v8>;
> > +
> > +		pci@1,0 {
> > +			phys =3D <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
> > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>,
> > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>,
> > +			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
> > +			phy-names =3D "pcie-0", "pcie-1", "pcie-2", "pcie-3";
> > +			nvidia,num-lanes =3D <4>;
> > +			status =3D "okay";
> > +		};
> > +
> > +		pci@2,0 {
> > +			phys =3D <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
> > +			phy-names =3D "pcie-0";
> > +			status =3D "okay";
> > +
> > +			ethernet@0,0 {
> > +				reg =3D <0x000000 0 0 0 0>;
> > +				mac-address =3D [ 00 00 00 00 00 00 ];
> > +			};
> > +		};
> > +	};
> > +
> > +	host1x@50000000 {
> > +		dpaux@54040000 {
> > +			status =3D "okay";
> > +		};
> > +
> > +		sor@54580000 {
> > +			status =3D "okay";
> > +
> > +			avdd-io-supply =3D <&avdd_1v05>;
> > +			vdd-pll-supply =3D <&vdd_1v8>;
> > +			hdmi-supply =3D <&vdd_hdmi>;
> > +
> > +			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> > +			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(CC, 1)
> > +					   GPIO_ACTIVE_LOW>;
> > +			nvidia,xbar-cfg =3D <0 1 2 3 4>;
> > +		};
> > +	};
> > +
> > +	gpu@57000000 {
> > +		vdd-supply =3D <&vdd_gpu>;
> > +		status =3D "okay";
> > +	};
> > +
> > +	pinmux: pinmux@700008d4 {
> > +		pinctrl-names =3D "boot";
> > +		pinctrl-0 =3D <&state_boot>;
> > +
> > +		state_boot: pinmux {
> > +			pex_l0_rst_n_pa0 {
> > +				nvidia,pins =3D "pex_l0_rst_n_pa0";
> > +				nvidia,function =3D "pe0";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			pex_l0_clkreq_n_pa1 {
> > +				nvidia,pins =3D "pex_l0_clkreq_n_pa1";
> > +				nvidia,function =3D "pe0";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			pex_wake_n_pa2 {
> > +				nvidia,pins =3D "pex_wake_n_pa2";
> > +				nvidia,function =3D "pe";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			pex_l1_rst_n_pa3 {
> > +				nvidia,pins =3D "pex_l1_rst_n_pa3";
> > +				nvidia,function =3D "pe1";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			pex_l1_clkreq_n_pa4 {
> > +				nvidia,pins =3D "pex_l1_clkreq_n_pa4";
> > +				nvidia,function =3D "pe1";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,io-hv =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			sata_led_active_pa5 {
> > +				nvidia,pins =3D "sata_led_active_pa5";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			pa6 {
> > +				nvidia,pins =3D "pa6";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> > +			};
> > +			dap1_fs_pb0 {
> > +				nvidia,pins =3D "dap1_fs_pb0";
> > +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> > +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> > +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
>=20
> I am guessing this is generated by the pinmux spreadsheet, but any
> reason why there is no 'nvidia,function' for some pins? Some that are
> not used have the function defined as 'rsvd1', however, the above pin
> does not, but AFAIK it is not used.

Yes, this was generated from the pinmux spreadsheet. I'm not overly
familiar with pinmux, but I think the idea was that if a property is
missing, it means that the hardware default applies.

Adding Stephen in case he knows.

On that note, I guess we should publish the board file for the pinmux
scripts as well.

Thierry

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyQ25gACgkQ3SOs138+
s6FiwQ//bFFN2aoqr86lfbb9d2lfRcYJcyFZruW1FhI0REieW5UnAMgQ3ctfVhBh
h3GZEklWNr5BBS8NHE90UhJE5ZTVITL/Ofbd7NM2+sOUe6Upr+LXjoi2QDIKi+rM
fNw8o5k8M76ylyHrQVu1Xfi6SGa5sYZAZuMO1vR7MEzMne4/xWMkgf2Xvp4fAw3I
yOlhajRO1z4OODUxVlQsxvTLWZ6aBsC/CZKSnnfgUAxgTafCZ06OAbJPzEgLgWeg
adOxdEgclHwSv728ujXAxer8FLzKMyACWj4dT4Vykt8z9RdLy/238nPKZLKiPuEM
UT1uiibffEFiFI6sUYHs/ae++KYTD0bB704UqyzklJcpb/TGhkkEkI6WNTB1zWdO
dkfFlhc+RpAACHABCFoN2aWyg9tA7ds0+lKIz6KojQ63pr7fx61mO5M+FoeoFDw9
lKEYRHBZN5ZI5x/rBsKQj//DvwKgciptuzsOCv6RZ0sZlWviaQ+5QC/Ba+Yk337B
e1QKjnNvfjV+DshZ4lfUXFiiJ0Zp8P9bWU/DGX7DU7KThFEE8z5u7XZm7dCLMaxL
ADF9vemtHXykHxrh0oeZ1QormOuarOIHmMtWDKd74cItrA5lvWn0EMlAt0mMHI76
FI9HmzJmmOf/ADI70Q1zqSNVj2dQshgEmy302QswpKSt3nuqgAo=
=mza4
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--


--===============8497094874531086724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8497094874531086724==--
