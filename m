From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: paz00: Add host1x support
Date: Sat, 17 Nov 2012 08:33:37 +0100
Message-ID: <20121117073337.GC26391@avionic-0098.mockup.avionic-design.de>
References: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24@gmx.de>
 <50A6BFD4.5060802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A6BFD4.5060802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 03:36:04PM -0700, Stephen Warren wrote:
> On 11/16/2012 03:20 PM, Marc Dietrich wrote:
> > This adds host1x support which includes HDMI and LVDS support.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/te=
gra20-paz00.dts
>=20
> > +	host1x {
>=20
> The position of this node in tegra20-paz00.dts doesn't match the order
> from tegra20.dtsi.
>=20
> > +		dc@54200000 {
> > +			rgb {
> > +				status =3D "okay";
> > +				nvidia,ddc-i2c-bus =3D <&lvds_ddc>;
> > +			};
> > +		};
> > +
> > +		hdmi {
> > +			status =3D "okay";
> > +			vdd-supply =3D <&hdmi_vdd_reg>;
> > +			pll-supply =3D <&hdmi_pll_reg>;
> > +			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> > +			nvidia,hpd-gpio =3D <&gpio 111 0>; /* PN7 */
> > +		};
>=20
> I think we shouldn't enable HDMI on Paz00 yet; tegradrm has an issue
> where if two outputs are active, with different display timings (which
> is almost guaranteed), both outputs send the wrong signal timing. The
> easiest WAR for now is to only enable one output per board.

I don't think the timings are the problem. At least in the cases where
I've seen this problem, LVDS was still working fine, only the contents
were "skewed". The most likely reason for that would be a wrong stride
programmed for the smaller display.

But yes, I agree that for now we should keep only a single output
enabled to work around that issue. Unless I get completely swamped with
other stuff I expect to fix that before the final 3.8, but better safe
than sorry.

Thierry

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpz3RAAoJEN0jrNd/PrOhfc0P/j2h/E28OcupJV+lABdwfkz/
WcZc1eDXQHv0V205cborSJSz1U680yVZvo6Ov9wlKXHjNHOsW6Xe+6eGhkD9H+ik
EOzKgVXNqH+Fl9p3Hkfse/kOUBG0E7gALXm69WWGeRANyIj38maqf3WcpHmPs+PE
SQZmnOlx1XrKn/OyUZ6XMCDazJ8CuQy2XjfmMKCDsEnxQtqHH28Uxb4j3/n0RlNj
zChkZIIK68iCy0XrQGFAB13v0WOzNFOipYutR3q/RTySV1To7j4OKYePqP6J4grJ
5sfHhkE3fcn7vfF6fJkAy4XWzFxDM+vIAFfMPoHYdaAfw/dQ/GJFYbTC1SUrh5jg
sBwTRkLgApNOGXKnMG7Qnd/6weA8TuBHYJsrocdfvQwPLqxB7F3+/ywxOVu/CUds
jJY94CAdJ7f+J6Tsf8ZWgqME3yNrDUlSO0NcR3oIqIDvV3gFM4/9vkmApJ9xzAFt
QfeK7XQWb0yACC+EpGJ6dFP6MhbcflVxKqP1/iATdhG+SE1f/qtx1UsgXWvfVbhA
/i0K7QGqO9RmH5l2eUfH0AOTjQgl5ERgQsuQKohhsr8qf4NnpdcSJpQp8FHL8qTf
5rBe6C+0T5ERuuYjSk9xj0aci7exUSOWeZvl194jBusow2XcsMKHzUxuLp3o4lA9
5hHvSzXrqhgGnaFIw8o1
=SnBC
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
