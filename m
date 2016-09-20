From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Tue, 20 Sep 2016 20:02:24 +0200
Message-ID: <1474394544.1215.13.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-3-contact@paulk.fr>
         <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
         <1474394004.1215.2.camel@paulk.fr>
         <d05b8e5a-adf7-9057-b42a-0da1fde84953@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-QE7gJqU4NGX+Qi1HsySD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d05b8e5a-adf7-9057-b42a-0da1fde84953-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-QE7gJqU4NGX+Qi1HsySD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 septembre 2016 =C3=A0 18:56 +0100, Jon Hunter a =C3=A9crit=C2=
=A0:
> On 20/09/16 18:53, Paul Kocialkowski wrote:
> >=20
> > * PGP Signed by an unknown key
> >=20
> > Le mardi 20 septembre 2016 =C3=A0 18:41 +0100, Jon Hunter a =C3=A9crit =
:
> > >=20
> > > On 28/08/16 18:32, Paul Kocialkowski wrote:
> > > >=20
> > > >=20
> > > > Depthcharge (the payload used with cros devices) will attempt to de=
tect
> > > > boards using their revision. This includes all the known revisions =
for
> > > > the nyan-big board so that the dtb can be selected preferably.
> > >=20
> > > May be I am missing something here, but for the mainline there is onl=
y
> > > one dtb available and so why is this needed for the mainline?
> >=20
> > There is indeed a single dts in mainline, but depthcharge will use the
> > revision
> > to match the compatible string (e.g. it will look for google,nyan-big-r=
ev5,
> > not
> > google,nyan-big), so we need to list them all in that single dts. Other=
wise,
> > depthcharge will fall back to the default config, which may or may not =
be
> > suitable for nyan.
>=20
> Is tegra124-nyan-big.dtb not the default?

You can't expect that to always be the case. The image format allows many
different dts to be provided, so I could easily build with multi_v7_defconf=
ig
and have various dts for various devices in the same image, and just select=
 a
random one as default.

Here, default is really a fallback, the right one is expected to be detecte=
d by
this mechanism. And it really doesn't hurt to provide that information for
proper detection.

Note that this is done with many other cros devices in mainline (such as rk=
3288
veyrons).

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-QE7gJqU4NGX+Qi1HsySD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4XmwAAoJEIT9weqP7pUMS40P/0Nh1fdFfQlRrisVXppl47HM
4FfULOURm0bgsj0VWK2w0W1ElvbSGHbU7h9q4a688l/veu/uH5up4m5Rqf8XVzZq
+7t/oUjwoLOOvVIhTYdIyAFvXH8bRxHZ5f+qFpTetaj/ogUnBkkX2cvoD7nebv04
J/namaK+7Eezfs7GZ3xqhUkHQa53meMJayPUybNohY2qK1jEZzg7vvoGPst4sjAr
YUHcmJJqKu3oR5CXDICW84BIc+lzAQ/RtZpL2XZdfd2rwGN4/6UZj7zI6RZ8uIFp
5jsLkhfV/zlUpAiiazgGh8VZURf7PVElv6P0Nc96FewpNQTRjxaaU0TCADw51Dez
IAVBJ0Kn2CPn9VsnEKGMYebvmkPrSivGuV2eIq8HrpJ103bzahkxvY8qz/FdPGYq
nHmGGEV20U55tCD7neg3DI3fS4ZAGgWKUPjleqhNzwqNgJYeZ17YfYdyBQ6wqX+V
0OcGxclpx+iiVUin1wjShxA5TJddudvF9FrPfh+bAj+n+QWiIkm36gVhi64DU0YB
kDaU5E2AwFUnuaxCcT1QsH5sbhbdo0r0KrclfrhTF0GZfDNf3qzodSS3qtMCtySu
6EB0fKPI+6nSt9CXTlyn10rKFURTyxtoBw3lSU9GppPRpRrT2MqKWux3VghVHxmT
/w/f5POKYqZpRYmy8G4c
=dxo3
-----END PGP SIGNATURE-----

--=-QE7gJqU4NGX+Qi1HsySD--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
