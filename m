From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 12:55:13 +0200
Message-ID: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

while I haven't got much time to work on the actual code right now, I
think it might still be useful if we could get the device tree binding
to a point where everybody is happy with it. That'll also save me some
time once I get to writing the code because I won't have to redo it over
again. =)

So here's the current proposal:

	host1x {
		compatible = "nvidia,tegra20-host1x", "simple-bus";
		reg = <0x50000000 0x00024000>;
		interrupts = <0 64 0x04   /* cop syncpt */
			      0 65 0x04   /* mpcore syncpt */
			      0 66 0x04   /* cop general */
			      0 67 0x04>; /* mpcore general */

		#address-cells = <1>;
		#size-cells = <1>;

		ranges = <0x54000000 0x54000000 0x04000000>;

		status = "disabled";

		gart = <&gart>;

		/* video-encoding/decoding */
		mpe {
			reg = <0x54040000 0x00040000>;
			interrupts = <0 68 0x04>;
			status = "disabled";
		};

		/* video input */
		vi {
			reg = <0x54080000 0x00040000>;
			interrupts = <0 69 0x04>;
			status = "disabled";
		};

		/* EPP */
		epp {
			reg = <0x540c0000 0x00040000>;
			interrupts = <0 70 0x04>;
			status = "disabled";
		};

		/* ISP */
		isp {
			reg = <0x54100000 0x00040000>;
			interrupts = <0 71 0x04>;
			status = "disabled";
		};

		/* 2D engine */
		gr2d {
			reg = <0x54140000 0x00040000>;
			interrupts = <0 72 0x04>;
			status = "disabled";
		};

		/* 3D engine */
		gr3d {
			reg = <0x54180000 0x00040000>;
			status = "disabled";
		};

		/* display controllers */
		dc1: dc@54200000 {
			compatible = "nvidia,tegra20-dc";
			reg = <0x54200000 0x00040000>;
			interrupts = <0 73 0x04>;
			status = "disabled";
		};

		dc2: dc@54240000 {
			compatible = "nvidia,tegra20-dc";
			reg = <0x54240000 0x00040000>;
			interrupts = <0 74 0x04>;
			status = "disabled";
		};

		/* outputs */
		rgb {
			compatible = "nvidia,tegra20-rgb";
			status = "disabled";
		};

		hdmi {
			compatible = "nvidia,tegra20-hdmi";
			reg = <0x54280000 0x00040000>;
			interrupts = <0 75 0x04>;
			status = "disabled";
		};

		tvo {
			compatible = "nvidia,tegra20-tvo";
			reg = <0x542c0000 0x00040000>;
			interrupts = <0 76 0x04>;
			status = "disabled";
		};

		dsi {
			compatible = "nvidia,tegra20-dsi";
			reg = <0x54300000 0x00040000>;
			status = "disabled";
		};
	};

This really isn't anything new but merely brings the Tegra DRM binding
in sync with other devices in tegra20.dtsi (disable devices by default,
leave out unit addresses for unique nodes). The only actual change is
that host1x clients are now children of the host1x node. The children
are instantiated by the initial call to of_platform_populate() since the
host1x node is also marked compatible with "simple-bus".

An alternative would be to call of_platform_populate() from the host1x
driver. This has the advantage that it could integrate better with the
host1x bus implementation that Terje is working on, but it also needs
additional code to tear down the devices when the host1x driver is
unloaded because a module reload would try to create duplicate devices
otherwise.

The rgb node is something that I don't quite know how to handle yet.
Since it is really part of the display controller and uses its register
space, it isn't quite correct to represent it as a separate device. But
we will need a separate node to make it available as a connector, which
will become more obvious below.

Perhaps the ranges property can also be used to remap the reg properties
of the child nodes so that they can be specified as an offset into the
host1x aperture instead of an address in the CPU address space. But
that's just a minor issue because the OF code should be able to handle
it transparently.

Board DTS files could then extend this with board-specific requirements
and connectors. The following describes the Medcom Wide:

	host1x {
		carveout = <0x0e000000 0x02000000>;
		display-controllers = <&dc1>;
		status = "okay";

		dc@54200000 {
			status = "okay";
		};

		lvds: rgb {
			status = "okay";
		};
	};

	connectors {
		#address-cells = <1>;
		#size-cells = <0>;

		connector@0 {
			reg = <0>;
			edid = /incbin/("tegra-medcom.edid");
			output = <&lvds>;
		};
	};

Basically this turns on the first display controller and the RGB/LVDS
output and hooks up a static EDID block with the LVDS output. There is
also a carveout property which might be a better replacement for the
"crippled" GART on Tegra20. Alternatively the CMA might work just as
well instead.

The Plutux can be described like this:

	host1x {
		carveout = <0x0e000000 0x02000000>;
		display-controllers = <&dc1 &dc2>;
		status = "okay";

		dc@54200000 {
			status = "okay";
		};

		hdmi: hdmi {
			vdd-supply = <&ldo7_reg>;
			pll-supply = <&ldo8_reg>;
			status = "okay";

		};
	};

	connectors {
		#address-cells = <1>;
		#size-cells = <0>;

		connector@0 {
			reg = <0>;
			output = <&hdmi>;
			ddc = <&ddc>;

			hpd-gpio = <&gpio 111 0>; /* PN7 */
		};
	};

Which is similar to the Medcom Wide, only it uses the HDMI output and
hooks it up with one of the Tegra's I2C controllers to do EDID probing
via DDC. Additionally it can detect whether an HDMI cable is connected
using the GPIO specified by the hpd-gpio property.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6ZURAAoJEN0jrNd/PrOhcHgQALvENJ7CGBntx6Ng8NI/c5n/
V62TvbOjmN3Eohi7tPmLlVmp7gyLHpc/pjRV0RLgZ0E/cRGYeqgE5SylhJPtJiwQ
C5DkEl5b01tGBkON7y3UPmyMByuC9NyEbiUkBl9whEAOmhMebkXL9dW0vRH0sIul
vygLWSZGVRoURlgpvE/92JvfCwAG0r3Z4JRnXw8c2uWsxgHN38CleT1f/MogHbwL
ef9ts38C91mSTOekRKqagMorl6Rgc3cmvaapVM29F73/8ikhoF76bQp7Gpd7pMlj
HTZI3HzhTkr+jwzgkFk2iRNXZI3U9Z2T/RZBX6EPyyyzlq5Jv7Kckc/s+bLbHU18
Oy0NZmDMCNLmF8/NndMitSdnvQlcJeLvfkhQpPL3TvEEpyC2/zNoyrBbxxAgnmiQ
xUOtcZMqs0xcDxDL7L+ESqq4LWvVACOXzPJBPw3On1fQQwCchwJeIGO2qFO72tNo
gdaTNDsh3Z64SPnRihpmQVPQ2UAnVbFzfldbx/iLZiEtV7dtSOATnspxZjYaIhB2
7FNmdMTPqtfz9z+UNK5tYZY9npBkEx9qtFqiJup8z8y6aXQ7MPBfD0yjamDWHJiu
QUHUbg8kvZBrGsoI/xWX751upUbw+9ch4Q4BaqBuZ29WlR/7U4DojbYvNXNo0rqR
dBZZSyZpNjuOTaqYHhAS
=IL9m
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
