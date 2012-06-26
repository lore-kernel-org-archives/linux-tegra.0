From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 21:51:09 +0200
Message-ID: <20120626195108.GB5308@avionic-0098.adnet.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9FB22.1090902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE9FB22.1090902-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 12:10:42PM -0600, Stephen Warren wrote:
> On 06/26/2012 04:55 AM, Thierry Reding wrote:
> > Hi,
> >=20
> > while I haven't got much time to work on the actual code right now, I
> > think it might still be useful if we could get the device tree binding
> > to a point where everybody is happy with it. That'll also save me some
> > time once I get to writing the code because I won't have to redo it over
> > again. =3D)
> >=20
> > So here's the current proposal:
> >=20
> > 	host1x {
> > 		compatible =3D "nvidia,tegra20-host1x", "simple-bus";
> > 		reg =3D <0x50000000 0x00024000>;
> > 		interrupts =3D <0 64 0x04   /* cop syncpt */
> > 			      0 65 0x04   /* mpcore syncpt */
> > 			      0 66 0x04   /* cop general */
> > 			      0 67 0x04>; /* mpcore general */
> >=20
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> >=20
> > 		ranges =3D <0x54000000 0x54000000 0x04000000>;
> >=20
> > 		status =3D "disabled";
>=20
> The idea behind status=3D"disabled" is that some HW only makes sense to
> use on particular boards. This concept really only applies to HW modules
> that drive external interfaces on the SoC, which in turn the board can
> choose whether to connect anything to (or whether to even connect to any
> external pins using the pinmux, or not).
>=20
> As such, I don't think it makes sense to set status=3D"disabled" on
> host1x, nor many other internal-only engines such as say mpe, epp, i2sp,
> gr2d, gr3d, dc1, dc2.

What about power management and resource usage? If a board for instance
doesn't need gr3d at all it could just leave it at status =3D "disabled"
to not have the corresponding driver loaded and not waste the power and
resources.

>=20
> However it does make sense for the output resources rgb, hdmi, tvo, dsi.
>=20
> > 		/* outputs */
> > 		rgb {
> > 			compatible =3D "nvidia,tegra20-rgb";
> > 			status =3D "disabled";
> > 		};
> ...
> > The rgb node is something that I don't quite know how to handle yet.
> > Since it is really part of the display controller and uses its register
> > space, it isn't quite correct to represent it as a separate device. But
> > we will need a separate node to make it available as a connector, which
> > will become more obvious below.
>=20
> Are you referring to the DC_COM_PIN_OUTPUT* registers? Sorry, I'm not at
> all familiar with our display HW yet.
>=20
> Some possible solutions spring to mind:
>=20
> a) The output nodes don't have to be direct children of host1x. Instead,
> each DC could have an rgb child node that represents its own individual
> output capability.

Yes, that idea had sprung to my mind as well. I rather like it, too.

> b) If the RGB-related registers in DC are completely independent of any
> other DC registers and grouped together well enough, we can just carve a
> chunk out of the DC register space and give that to the RGB node instead:
>=20
> i.e. not:
>=20
> > 		dc1: dc@54200000 {
> > 			compatible =3D "nvidia,tegra20-dc";
> > 			reg =3D <0x54200000 0x00040000>;
> > 			interrupts =3D <0 73 0x04>;
> > 			status =3D "disabled";
> > 		};
>=20
>=20
> but something more like (the completely made up example):
>=20
>     dc1: dc@54200000 {
>         compatible =3D "nvidia,tegra20-dc";
>         reg =3D <0x54200000 0x00020000 0x54203000 0x10000>;
>         interrupts =3D <0 73 0x04>;
>         status =3D "disabled";
>     };
>=20
>     rgb {
>         compatible =3D "nvidia,tegra20-rgb";
>         reg =3D <0x54220000 0x00010000>;
>         status =3D "disabled";
>     };
>=20
> c) The rgb node could simply reference the dc nodes using a phandle, and
> call into the dc driver to obtain RGB configuration services from it:
>=20
>     rgb {
>         compatible =3D "nvidia,tegra20-rgb";
>         status =3D "disabled";
>         nvidia,dcs =3D <&dc1 &dc2>;
>     };
>=20
> By the way, if the RGB registers are in the DC, aren't there two
> separate RGB outputs. Certainly the TRM implies that both DCs can be
> driving LCDs, by reducing the width of the LCD signals that each DC uses
> (lower bits-per-pixel, or perhaps DDR encoding on the data lines).

Yes, there are two RGB outputs. Using alternative a) above should be
able to represent this quite well.

> > Board DTS files could then extend this with board-specific requirements
> > and connectors. The following describes the Medcom Wide:
>=20
> > 	connectors {
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <0>;
> >=20
> > 	};
>=20
> The connector seems to be a property of the individual output resources.
> I'd expect to see the connector configuration be a child of the outputs
> that a particular board had enabled; something more like:
>=20
>     host1x {
>         rgb {
>             status =3D "okay";
>=20
>             connector@0 {
>                 nvidia,edid =3D /incbin/("tegra-medcom.edid");
>             };
>         };
>         hdmi {
>             status =3D "okay";
>=20
>             connector@0 {
>                 nvidia,ddc-i2c-bus =3D <&tegra_i2c1>;
>             };
>         };
>     };
>=20
> Perhaps even completely omit the connector node, and put the properties
> directly within the rgb/hdmi node itself. After all the HDMI output
> really is the connector as far as Tegra goes.

Heh. I seem to remember you objecting to this in a previous series[0]
which is actually the reason that I moved them to the top-level in the
first place. =3D)

Thierry

[0]: http://www.spinics.net/lists/linux-tegra/msg05298.html

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6hKsAAoJEN0jrNd/PrOhLHUP/2XzuBYN9Dp8Ooxapvvbwy86
8hQoAg56iyx8HpMJIlsJga/V5Eh3rmTm9r/SVhwMGxn0Q9wszJMPPv1AgkjnFewr
tGisBR58EHYlyOOV8GY526FrRsD0olcljBLOw73EeJ2ciMbwZ0/H8OlCWCzSzJvx
NinNnungv3iuAzlAiT8+qOYv37BsWBmwhr2d699Gcnecwucwrzb58zvLt9/zfPHo
5tT7VOC1t9btDmv+SzO2i+WfOsZMKLZWi4VctvnkIJcQAtEsfBshaS0sRio+SGdl
Ko1AyRF1TZM9VTc7t4/wt81YaWUYxp39jDuQwxKbDtI2yUiQBQgVyyr1zmSfFV6u
E5U9fwd9AEBnydfwYGHFFRu60Wg1FGHzqN7IiTIAjlSnucvK/sPT7ACXHKrKU8Hn
7uOt8x2c4wBjaTOvYWmjpz28MWUHVu35TILixlO9ggM7hkmlG9HU7J3k143l8XIM
Dwh00B4HD4qNw2aPAETESfba5cSdQPNOBYMQvecH0Jj7quT6sdR+o73ItLKSzIFB
oiaU5iQB7hFstDihLl7CFdeilf1/70R/UUX99kbLPB0lzjCSlKGgIC+n0EUPkryR
CyODiLO6haMF71SPT+emXtvSk8oq7TX3iSqcrhQCIgqP5ALJOHFzy4ICQ9gK7FLY
5sBahHqjoNhplxQhbafI
=vNxh
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
