From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Add Avionic Design Plutux support
Date: Wed, 19 Sep 2012 18:42:42 +0200
Message-ID: <20120919164242.GB19464@avionic-0098.mockup.avionic-design.de>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de>
 <1347979144-24462-3-git-send-email-thierry.reding@avionic-design.de>
 <5059EB47.5010600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5059EB47.5010600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 09:56:55AM -0600, Stephen Warren wrote:
> On 09/18/2012 08:39 AM, Thierry Reding wrote:
> > The Plutux is a set-top box device based on the Tamonten SOM and can be
> > connected to a display via HDMI.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/t=
egra20-plutux.dts
>=20
> > +	sound {
> > +		compatible =3D "ad,tegra-audio-plutux",
> > +			     "nvidia,tegra-audio-wm8903";
> > +		nvidia,model =3D "Avionic Design Plutux";
> > +
> > +		nvidia,audio-routing =3D
> > +			"Headphone Jack", "HPOUTR",
> > +			"Headphone Jack", "HPOUTL",
> > +			"Int Spk", "ROP",
> > +			"Int Spk", "RON",
> > +			"Int Spk", "LOP",
> > +			"Int Spk", "LON",
> > +			"Mic Jack", "MICBIAS",
> > +			"IN1L", "Mic Jack";
> > +
> > +		nvidia,i2s-controller =3D <&tegra_i2s1>;
> > +		nvidia,audio-codec =3D <&wm8903>;
> > +
> > +		nvidia,spkr-en-gpios =3D <&wm8903 2 0>;
> > +		nvidia,hp-det-gpios =3D <&gpio 178 0>; /* gpio PW2 */
> > +		nvidia,int-mic-en-gpios =3D <&gpio 184 0>; /*gpio PX0 */
> > +		nvidia,ext-mic-en-gpios =3D <&gpio 185 0>; /* gpio PX1 */
>=20
> Does your board really have all of those GPIOs? Having both
> int-mic-en-gpios and ext-mic-en-gpios is something pretty unique to
> Harmony so far,

The hardware was kept as close to Harmony as possible on purpose in
order to reduce the time needed for customization. This is obviously no
longer true now because the hardware is already about 18 months old but
you can't change hardware retroactively...

Again I'll make sure to double check this against the schematics but I'm
pretty sure these are the connections.

> and also a pretty broken HW design, so I'd hope people
> haven't copied it.

Would you mind explaining why it is broken? I haven't really been
involved with the codec parts so I don't have very deep insights.

Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWfYCAAoJEN0jrNd/PrOhHQwP/3d3xp6j/6M5eb7P49wdB3TI
dQFXKXC9B8C40YWIV6eaKKOt3UYz3ifVxpU5UDF7WmMNiCgxPs2z8ERPNOav7jFE
8ytMTmIFb87zgezP/iDpkqC/0XY9gQYhwJbyoJT1BgGK8wHYG4VhZ/8j/8i6TUuH
/3cKUqBP4eFcLoL2ln2ryhl+zddPTbRe7TjtWJ4QYQdqPgjQ/HkERtuJldjwAjOH
NEgyjYKLiPcaDyRM0mgUdO31/hm7FpSiUP6V4IWKLd/lH79iMrV1tbWiMoycHh93
y00WNVy0pqJYxu268FK2apvyxqB9GNUjYHCEuPvgtGY3xfWVteSQintyFqei8fus
6ngjP7ajTI+WDoubpJkRDq3HR8d9msS32KPDUqeSmc6sTXra4qmkDm5ZtzQ1c9nU
F6tCallft7RojUNL1Qri4cj0LEIw7HOeUTaIHh6bZVHUcNYjKGiv3QXWpTCNe2dg
Kq+C6uw7WGz8u4KvIQ/g9wbL3xUcVQtzD894ATb5PY2ub+2rfIkJvxiwgjPmCp5q
EgzGNvOAhskKyx6WKIYtDvbb9+c/RqhZh6rHbKN/scFRVQYnXXtVO0+ybFaxomz8
NAkPLc38yphw++Ieke2Aexdm8eI+oIZlMbc+dWxvz2tnpfOLEJKkaDg5V3gt1WPW
wNxvN0B1PWbAavs6Z1zu
=hGlQ
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
