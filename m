From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/4] ARM: tegra: Add legacy interrupt controller nodes
Date: Sat, 28 Jun 2014 01:44:21 +0200
Message-ID: <20140627234420.GC26184@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <1403888329-24755-2-git-send-email-thierry.reding@gmail.com>
 <53ADDAEF.2070805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADDAEF.2070805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 02:58:23PM -0600, Stephen Warren wrote:
> On 06/27/2014 10:58 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Add device tree nodes for the legacy interrupt controller so that the
> > driver can get the register ranges from device tree rather than hard-
> > coding them.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
>=20
> > +	interrupt-controller@60004000 {
> > +		compatible =3D "nvidia,tegra20-ictlr";
> > +		reg =3D <0x60004000 0x40   /* primary controller */
> > +		       0x60004100 0x40   /* secondary controller */
> > +		       0x60004200 0x40   /* tertiary controller */
> > +		       0x60004300 0x40   /* quaternary controller */
> > +		       0x60004400 0x40>; /* quinary controller */
> > +	};
>=20
> The quinary controller doesn't exist on Tegra20.

Right, I've dropped it.

> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
>=20
> > +	interrupt-controller@60004000 {
> > +		compatible =3D "nvidia,tegra20-ictlr";
>=20
> At the least, each SoC should have an SoC-specific compatible value in
> addition to the base Tegra20 value in case we need to differentiate them
> in the future.
>=20
> I'd be tempted to only include the SoC-specific value and omit the
> Tegra20-specific value so we don't have to care whether they're really
> 100% backwards-compatible, but it's probably safe to say they're all
> Tegra20 compatible (or all Tegra30 compatible given the 4-vs-5
> controllers difference).

I've looked at the register specification files and I can't see any
differences between Tegra20, Tegra30, Tegra114 and Tegra124. Except
for the absence of a quinary controller on Tegra20.

I think I'll go with this:

	tegra114.dtsi: compatible =3D "nvidia,tegra114-ictlr", "nvidia,tegra30-ict=
lr";
	tegra124.dtsi: compatible =3D "nvidia,tegra124-ictlr", "nvidia,tegra30-ict=
lr";
	tegra20.dtsi: compatible =3D "nvidia,tegra20-ictlr";
	tegra30.dtsi: compatible =3D "nvidia,tegra30-ictlr";

Thierry

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTrgHUAAoJEN0jrNd/PrOhoGkQAI6/+W4CvWQ9awB1tR8Ew6F4
NvA/pw+EVJTm7Gzp8EE4NupE5DYl0jfm8LaAsXORabXmp9+WgwWg5nw1rwnQhiEh
KV/2aCLRR/AiImYgrNlUvzHccnpRGRpNpJuZeGMWenEhyZLoBjeBsZXDelg7g9zy
+sx5N21EEhfctzAZygBEYfD8tEo7mMEscJ702Z6k2AUR0QosSFrlKAb7af2HT0JF
Doe3X7fj9l06VQygoANJjXCECoUz/UIlOnIJfCQ9CNmmreRGswZ6NFuIU7aTbRxm
P9OtttJsk2i+cChsZS+4BNkMqD2FWVyXLWMSWet9w63AnfgIiUTsvQQi3+d9U+C0
HdgE+LXHonOewelcoFCy4QpmxkpDjEoAYl1YX25BIuaIHiCEMTTlPk75m7s/cwXr
mynyZi4mq7UO4w8MtjVfe9+nspTUfRYFKPwdPrY1pHddg23+IG/JDQ8Ky7Asez6V
EEGajlCHpgV5fi6SxXec49Zq/dgg0sBeyb0CzsALZcBgYrqWpi/5G2vcGXUQ9Xi3
gYm2evkCAWdlseUl/mE/QjlPkhS/0IFPH67sunuwAippS/qI4fygLoeqdWUsKZWz
LapvNngqYIRzrk1Cn6VvuS1QEjOtE3nV5EKxb7x3zPDXevuMkmCWlgFuWneJqKij
7KeT9v1LnCOfTzUFwWO/
=XnfH
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
