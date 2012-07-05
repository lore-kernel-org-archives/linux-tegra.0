From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Thu, 5 Jul 2012 14:15:07 +0200
Message-ID: <20120705121506.GA23732@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120626105513.GA9552-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Here's a new proposal that should address all issues collected during
the discussion of the previous one:

=46rom tegra20.dtsi:

	host1x {
		compatible =3D "nvidia,tegra20-host1x", "simple-bus";
		reg =3D <0x50000000 0x00024000>;
		interrupts =3D <0 65 0x04   /* mpcore syncpt */
			      0 67 0x04>; /* mpcore general */

		#address-cells =3D <1>;
		#size-cells =3D <1>;

		ranges =3D <0x54000000 0x54000000 0x04000000>;

		/* video-encoding/decoding */
		mpe {
			reg =3D <0x54040000 0x00040000>;
			interrupts =3D <0 68 0x04>;
		};

		/* video input */
		vi {
			reg =3D <0x54080000 0x00040000>;
			interrupts =3D <0 69 0x04>;
		};

		/* EPP */
		epp {
			reg =3D <0x540c0000 0x00040000>;
			interrupts =3D <0 70 0x04>;
		};

		/* ISP */
		isp {
			reg =3D <0x54100000 0x00040000>;
			interrupts =3D <0 71 0x04>;
		};

		/* 2D engine */
		gr2d {
			reg =3D <0x54140000 0x00040000>;
			interrupts =3D <0 72 0x04>;
		};

		/* 3D engine */
		gr3d {
			reg =3D <0x54180000 0x00040000>;
		};

		/* display controllers */
		dc@54200000 {
			compatible =3D "nvidia,tegra20-dc";
			reg =3D <0x54200000 0x00040000>;
			interrupts =3D <0 73 0x04>;

			rgb {
				status =3D "disabled";
			};
		};

		dc@54240000 {
			compatible =3D "nvidia,tegra20-dc";
			reg =3D <0x54240000 0x00040000>;
			interrupts =3D <0 74 0x04>;

			rgb {
				status =3D "disabled";
			};
		};

		/* outputs */
		hdmi {
			compatible =3D "nvidia,tegra20-hdmi";
			reg =3D <0x54280000 0x00040000>;
			interrupts =3D <0 75 0x04>;
			status =3D "disabled";
		};

		tvo {
			compatible =3D "nvidia,tegra20-tvo";
			reg =3D <0x542c0000 0x00040000>;
			interrupts =3D <0 76 0x04>;
			status =3D "disabled";
		};

		dsi {
			compatible =3D "nvidia,tegra20-dsi";
			reg =3D <0x54300000 0x00040000>;
			status =3D "disabled";
		};
	};

=46rom tegra20-medcom.dts:

	host1x {
		dc@54200000 {
			rgb {
				nvidia,edid =3D /incbin/("tegra20-medcom.edid");
				status =3D "okay";
			};
		};
	};

=46rom tegra20-plutux.dts:

	host1x {
		hdmi {
			vdd-supply =3D <&ldo7_reg>;
			pll-supply =3D <&ldo8_reg>;

			nvidia,hpd-gpio =3D <&gpio 111 0>; /* PN7 */
			nvidia,ddc-i2c-bus =3D <&ddc>;

			status =3D "okay";
		};
	};

One problem I've come across when trying to get some rudimentary code
working with this is that there's no longer a device which the DRM
driver can bind to, because the top-level device (host1x) now has a
separate driver.

I've briefly discussed this with Dave Airlie on IRC and there are
basically two solutions:

  a) Use a fake platform device, instantiated from the device tree or at
     module initialization time, so that the drm_platform_init()
     function can be used.

  b) Implement a custom drm_bus and reimplement most of the
     functionality provided by drm_platform_init().

Alternative a) is what Sascha has been doing for i.MX and is the most
straightforward. One variant of this would be to add another virtual
device node below host1x that groups gr2d, gr3d, both dcs and the three
output nodes. The down-side of this being that it doesn't describe the
hardware of course, and therefore really shouldn't go into the device
tree. Instantiating at module initalization time has the disadvantage
that the parent-child relationship is lost.

Using b) isn't optimal either because DRM requires at least a struct
device which can be associated with the drm_device. So the question is
which struct device that should be?

Thierry

--DocE+STaALJfprDB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP9YVKAAoJEN0jrNd/PrOhjEIP/jdrI7vayWFakp/87unU4Btz
oanwZedCvq3hI2d26VfZoDHAHQjRYkSW9PRt5IHmBAffhqxVvIv86I0U9k5RU9S4
6d9bLXEKH9AGtqrTSlcUjvIe9hTmxGpy/dQiQCi+fv3uY8zxDz7e7gpsux4JOT8f
8KjdTH3/2mQznM9t7V80ZlCzxWFZDYH+CPjwUnubrRe2i76gOrEtCt6UBxcLwa1M
Q6nzQbd6Clij3qqrH/lztH5fTn0L4bMq0xrM6HFikCSXp0zpjVwi0B1Ls3/ggWii
OVXiqHt2+kCb5Mt9FIRE5+Thl++xfJqxlo6zcKMtOF2OVeByUNoqvOoJw1rCroUI
j8SoVKvQGG8knoGCtV6ALoff0MC2tcrpAhTvBlYsciBzM25eqGQZtVBUyxMJOKmj
47w0SvWokniWVuT3ldDhjy0sPy3iJRmVJL6DuJqJOH7nFvursosNEkVkrHKcN/PH
EU26skc0uKL7/dZupjBPacVAoWqpjURr+xAzyWNoHQftd+j7Oq6ARinsKSzmYziu
9MoTx93ZEE9A4ZKAXdZbhf6Gt24DXPbzKRM0Z1xel0gh63mDoZX7DnBq8W+ZOWTA
qpy6BkBoh5Az1qoARO3efjb1rPlgPbiILUwB2L7Ohbh7unv27sT4LZNQkGDLTZYE
HpvsZpQn4K/sm5oPsYb6
=Nj3V
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
