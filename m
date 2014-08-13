From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 13 Aug 2014 10:53:05 +0200
Message-ID: <20140813085304.GE7735@ulmo>
References: <1407894967-18300-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407894967-18300-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 06:56:07PM -0700, Dylan Reid wrote:
> The Acer Chromebook 13, codenamed "Big", contains an NVIDIA tegra124
> processor and is similar to the Venice2 reference platform.
>=20
> The keyboard, USB 2, audio, HDMI, sdcard and emmc have been tested
> and work on the 1366x768 models.  I haven't tried on the HD systems
> yet.

Presumably the HD systems will have a different compatible? Is it only
the panel that's different or are there other changes?

> There is also an issue on reboot because the TPM isn't reset.  It will
> cause the stock firmware to enter recovery mode.  This can be worked
> around by an EC-reset, press refresh and power at the same time.

It's not clear to me what exactly this implies. Does it mean the system
won't boot unless you manually press "refresh" and "power"? Are those
keyboard buttons or keys on some debug board?

> diff --git a/arch/arm/boot/dts/tegra124-big.dts b/arch/arm/boot/dts/tegra=
124-big.dts
> new file mode 100644
> index 0000000..aa0cd9f
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra124-big.dts
> @@ -0,0 +1,1137 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include "tegra124.dtsi"
> +
> +/ {
> +	model =3D "Google Big";

Perhaps this should at least mention that it's the Acer Chromebook 13.
Otherwise this could just as well be some random development board.

> +	compatible =3D "google,nyan-big", "nvidia,tegra124";

What's "nyan"? Are there other variants of "big" other than "nyan"?

> +	pinmux: pinmux@0,70000868 {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinmux_default>;
> +
> +		pinmux_default: common {
> +			dap_mclk1_pw4 {
> +				nvidia,pins =3D "dap_mclk1_pw4";
> +				nvidia,function =3D "extperiph1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};

Stephen proposed a patch not so long ago that removes the static pinmux
settings from DTS files[0]. I'd expect he'll have objections to this DTS
providing the static settings.

The assumption with that patch is that the bootloader will have to set
up the entire pinmux anyway (to prevent conflicting settings), therefore
there'd be no need to do it in the kernel. Is this something that your
bootloader already does (or could be modified to do)?

[0]: http://patchwork.ozlabs.org/patch/363222/

> +	serial@0,70006000 {
> +		status =3D "okay";
> +	};

We've started to annotate some of these nodes in other DTS files to make
it easier for people to match them to connectors on the board (or the
schematics). This isn't necessarily important for things like PWM, since
their use is fairly obvious and usually in-kernel only (with perhaps an
exception of a PWM routed to some expansion header on some development
board). For generic interfaces it's good to know what they map to on the
device.

Is this serial available as an accessible connector? Or is it some debug
serial that's only available on a (non-equipped) header on the board?

> +	i2c@0,7000c400 {
> +		status =3D "okay";
> +		clock-frequency =3D <100000>;
> +	};
> +
> +	i2c@0,7000c500 {
> +		status =3D "okay";
> +		clock-frequency =3D <400000>;
> +
> +		tpm@20 {
> +			compatible =3D "infineon,slb9645tt";
> +			reg =3D <0x20>;
> +		};

I presume this is the TPM that you said isn't reset on reboot? Do you
know the reason for why it isn't being reset? What's needed to reset
this module? I assume it's something that can (and will eventually) be
fixed?

> +		cros_ec: cros-ec@0 {
> +			compatible =3D "google,cros-ec-spi";
> +			spi-max-frequency =3D <3000000>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(C, 7) IRQ_TYPE_LEVEL_LOW>;
> +			reg =3D <0>;
> +
> +			google,cros-ec-spi-msg-delay =3D <2000>;
> +
> +			i2c-tunnel {
> +				compatible =3D "google,cros-ec-i2c-tunnel";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				google,remote-bus =3D <0>;
> +
> +				charger: bq24735@9 {
> +					compatible =3D "ti,bq24735";
> +					reg =3D <0x9>;
> +					interrupt-parent =3D <&gpio>;
> +					interrupts =3D <TEGRA_GPIO(J, 0)
> +							GPIO_ACTIVE_HIGH>;
> +					ti,ac-detect-gpios =3D <&gpio
> +							TEGRA_GPIO(J, 0)
> +							GPIO_ACTIVE_HIGH>;

Given this, I wonder how useful the 80-chars limit is for DTS files...

> +				battery: sbs-battery@b {
> +					compatible =3D "sbs,sbs-battery";
> +					reg =3D <0xb>;
> +					sbs,i2c-retry-count =3D <2>;
> +					sbs,poll-retry-count =3D <10>;
> +					power-supplies =3D <&charger>;

The sbs-battery binding doesn't define a power-supplies property.

> +	spi@0,7000da00 {
> +		status =3D "okay";
> +		spi-max-frequency =3D <25000000>;
> +		spi-flash@0 {

I think it's customary to separate the properties and child nodes using
a blank line.

Also, and I know other DTS files contain the same, I think spi-flash is
kind of redundant, since it's a child of an SPI node.

> +			compatible =3D "winbond,w25q32dw";
> +			reg =3D <0>;
> +			spi-max-frequency =3D <25000000>;

Isn't the maximum frequency inherited from the parent?

> +	sdhci@0,700b0000 {
> +		status =3D "okay";
> +		power-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
> +		bus-width =3D <4>;
> +		no-1-8-v;
> +		non-removable;
> +	};
> +
> +	sdhci@0,700b0400 {
> +		status =3D "okay";
> +		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +		power-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +		wp-gpios =3D <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
> +		bus-width =3D <4>;
> +		no-1-8-v;
> +		vqmmc-supply =3D <&vddio_sdmmc3>;
> +	};
> +
> +	sdhci@0,700b0600 {
> +		status =3D "okay";
> +		bus-width =3D <8>;
> +		no-1-8-v;
> +		non-removable;
> +	};

For these it might be good to know which is the external one (I assume
there is one). I'm guessing sdhc@0,700b0000 is eMMC because it is marked
non-removable, but a comment would be good to make it explicit.

> +	usb@0,7d000000 {
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d000000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_usb1_vbus>;
> +	};
> +
> +	usb@0,7d004000 {
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d004000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_run_cam>;
> +	};
> +
> +	usb@0,7d008000 {
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d008000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_usb3_vbus>;
> +	};

Similarly for these.

> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +
> +		enable-gpios =3D <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +		power-supply =3D <&vdd_led>;
> +		pwms =3D <&pwm 1 1000000>;
> +
> +		default-brightness-level =3D <224>;
> +		brightness-levels =3D
> +			<  0   1   2   3   4   5   6   7
> +			   8   9  10  11  12  13  14  15
> +			  16  17  18  19  20  21  22  23
> +			  24  25  26  27  28  29  30  31
> +			  32  33  34  35  36  37  38  39
> +			  40  41  42  43  44  45  46  47
> +			  48  49  50  51  52  53  54  55
> +			  56  57  58  59  60  61  62  63
> +			  64  65  66  67  68  69  70  71
> +			  72  73  74  75  76  77  78  79
> +			  80  81  82  83  84  85  86  87
> +			  88  89  90  91  92  93  94  95
> +			  96  97  98  99 100 101 102 103
> +			 104 105 106 107 108 109 110 111
> +			 112 113 114 115 116 117 118 119
> +			 120 121 122 123 124 125 126 127
> +			 128 129 130 131 132 133 134 135
> +			 136 137 138 139 140 141 142 143
> +			 144 145 146 147 148 149 150 151
> +			 152 153 154 155 156 157 158 159
> +			 160 161 162 163 164 165 166 167
> +			 168 169 170 171 172 173 174 175
> +			 176 177 178 179 180 181 182 183
> +			 184 185 186 187 188 189 190 191
> +			 192 193 194 195 196 197 198 199
> +			 200 201 202 203 204 205 206 207
> +			 208 209 210 211 212 213 214 215
> +			 216 217 218 219 220 221 222 223
> +			 224 225 226 227 228 229 230 231
> +			 232 233 234 235 236 237 238 239
> +			 240 241 242 243 244 245 246 247
> +			 248 249 250 251 252 253 254 255
> +			 256>;

I'm curious, does ChromeOS really need 257 levels of brightness? I don't
think I've seen a consumer product that supports more than a dozen
levels.

> +	panel: panel {
> +		compatible =3D "auo,b133xtn01", "simple-panel";

There was a discussion a few days ago about this, and "simple-panel"
really isn't useful in the list of compatible strings. I already have a
patch queued up that removes that entry from all existing device trees
and also gets rid of the OF match table entry in the panel-simple
driver.

Thierry

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT6ydwAAoJEN0jrNd/PrOh3n0QAKBADiJWL4wpkL5QAEnaelif
9JEHOU6nN7atErlgoEgkQwQz2mxI2vPCwU30yfKFRcrramUcn9uMJx3qBAtDjmeM
J1MMaHVNvgjeKAIdbxV9KLgMTe9u3gKMIBaXkZ3kVVgJdhFy24/0JaBo8gdSFAdN
k/41HFW9I0ACHnyTVmzcyXTQY770UEvFzsllzCISJxCR5vA+jmht5maOyxgKbImc
lSFJi8QNT2BCCEcKMm413PpmQG4Z1GYiqkyU2dbKH9WeY04AM2Bo8JY7H74uucJG
E3UMjyx7FRBKmBpyCBPHzPjEO/fHIL620D8VjOAPN1YGpHAp7b1p7ocLzuHFgDM0
SQRE2ZBUdNPU0YsAPCE0o0faqzQ4gR5negZXaPLj0qAZftkM2Mw6gmuYU7ZkWRJj
zoZFcEOojLT1CQ0Os048Ce8td91NIzcB/J7+cNVGh5l9uDmleu7yEqvjHbFCe0ZH
imWCnEjVFZLKpNuBsysy5qOYzTcoCqA7fpIteZEA8zPrbOMFsbBJF578Ukggco96
ahdNihPMk1qT5nzIzvXs8T9Sfu0WCBt58ctZ5DWYrtePIwpgv9K9LVhkpHk2sbdE
Mw/Bh5f1oHFeHDtjHiivGWvuEuArynF4nmDmBWNEfcQ/fGL9mCRc/ST+PNjs9bXE
dzb+SVICuLs1TOQ5O54S
=dsau
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
