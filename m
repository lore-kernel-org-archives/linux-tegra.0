From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Wed, 21 Sep 2016 09:43:29 +0200
Message-ID: <1474443809.1239.4.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-3-contact@paulk.fr>
         <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
         <1474394004.1215.2.camel@paulk.fr>
         <d05b8e5a-adf7-9057-b42a-0da1fde84953@nvidia.com>
         <1474394544.1215.13.camel@paulk.fr>
         <6501341f-e14c-4876-dcb7-60a33b7621c4@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-CafVN1Fz75huHeyl6Qlv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6501341f-e14c-4876-dcb7-60a33b7621c4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-CafVN1Fz75huHeyl6Qlv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 21 septembre 2016 =C3=A0 08:34 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
> On 20/09/16 19:02, Paul Kocialkowski wrote:
> >=20
> > * PGP Signed by an unknown key
> >=20
> > Le mardi 20 septembre 2016 =C3=A0 18:56 +0100, Jon Hunter a =C3=A9crit =
:
> > >=20
> > > On 20/09/16 18:53, Paul Kocialkowski wrote:
> > > >=20
> > > >=20
> > > > >=20
> > > > > Old Signed by an unknown key
> > > >=20
> > > > Le mardi 20 septembre 2016 =C3=A0 18:41 +0100, Jon Hunter a =C3=A9c=
rit :
> > > > >=20
> > > > >=20
> > > > > On 28/08/16 18:32, Paul Kocialkowski wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Depthcharge (the payload used with cros devices) will attempt t=
o
> > > > > > detect
> > > > > > boards using their revision. This includes all the known revisi=
ons
> > > > > > for
> > > > > > the nyan-big board so that the dtb can be selected preferably.
> > > > >=20
> > > > > May be I am missing something here, but for the mainline there is=
 only
> > > > > one dtb available and so why is this needed for the mainline?
> > > >=20
> > > > There is indeed a single dts in mainline, but depthcharge will use =
the
> > > > revision
> > > > to match the compatible string (e.g. it will look for google,nyan-b=
ig-
> > > > rev5,
> > > > not
> > > > google,nyan-big), so we need to list them all in that single dts.
> > > > Otherwise,
> > > > depthcharge will fall back to the default config, which may or may =
not
> > > > be
> > > > suitable for nyan.
> > >=20
> > > Is tegra124-nyan-big.dtb not the default?
> >=20
> > You can't expect that to always be the case. The image format allows ma=
ny
> > different dts to be provided, so I could easily build with
> > multi_v7_defconfig
> > and have various dts for various devices in the same image, and just se=
lect
> > a
> > random one as default.
>=20
> Really? Sounds odd. I was hoping that tegra124-nyan-big.dtb would be a
> catch all.

Yes, the image format (FIT) allows specifying multiple dtb and zImage
combinations in the same image[0].

See depthcharge[|1] for how the "compatible" property is being matched agai=
nst.

> > Here, default is really a fallback, the right one is expected to be det=
ected
> > by
> > this mechanism. And it really doesn't hurt to provide that information =
for
> > proper detection.
> >=20
> > Note that this is done with many other cros devices in mainline (such a=
s
> > rk3288
> > veyrons).
>=20
> Yes, I guess the same is true for the tegra210-smaug and we do define
> all the revs for that one. May be extend the changelog comment to say
> what may happen without this change and the problem that this is fixing.

Allright, will do!

Thanks

[0]:=C2=A0http://www.denx.de/wiki/pub/U-Boot/Documentation/multi_image_boot=
ing_scenarios.pdf
[1]:=C2=A0https://chromium.googlesource.com/chromiumos/platform/depthcharge=
/+/master/src/boot/fit.c#39

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-CafVN1Fz75huHeyl6Qlv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4johAAoJEIT9weqP7pUMq/oP/0u6RyZNQEkqdbkOltARzzgh
zc4gGZ0rgTGn/lN/ca0DyHNMrAuV9Jo850U6n6T4Ov/16pjxlCFMlnhcU4aqjPDS
HyuOT7HftFjDA5cvOrfJYl1LWtb4iLyxzUMU9BiQy4TRSKWBr9rVm8nOC+cNVZ8y
/pdGCMvPhtUj5wybVyZyiI6gKkYSN+RO/2zHQ29UC4eJYuvcxZFkTR+h/BmGopt8
MW/Yh6yQRt7UFomovkKeXU79P7QtpveETDNI0tam7BZ86J3W7jnZEJiggsO3EYUo
iNY20aOSSVP/uw2OPdQ8VbDH8BEllyXpE7E/+miT7IShM3I3FL6ghNx189PWkRu1
cyADojLMDwaDvxwEN726sF8Jr7bIwLctuxAw7LYUVh/YJS4d/zuxDjAh+o08XQrN
kss27BHezvdGJkka6WV8ZLkRZk5wM81bT/hSr1WROlAxkPzXHNPb+fig/d51cCmL
qdQ49uBDC0jHGU/c/8ulMXJnYhx3GFPVifnqwdBDc7W5X5z9Hn5TPCWiTn2I+uoj
Iamp4gAbkd3AQ+z99/yGTRg+MH8Khi5CUUy7fo7Z00GdaGpXpY8+ujTfCezfFlD8
yLcQhXp3AHRk+yHQ0fR1V7Ha6cIRpXI1Up8ymdvG3Eg1MonZuMuxup0YRNmmxIib
ijYbpc29fU4pkmudpDtr
=SAek
-----END PGP SIGNATURE-----

--=-CafVN1Fz75huHeyl6Qlv--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
