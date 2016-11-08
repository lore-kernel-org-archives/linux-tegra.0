From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Tue, 8 Nov 2016 16:55:48 +0100
Message-ID: <20161108155548.GC2244@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com>
 <20161107132127.GE12559@ulmo.ba.sec>
 <CAOesGMgJUepmq2JTT7imKh74BsnGobcpBWFuNp94WnX1WtzEjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgJUepmq2JTT7imKh74BsnGobcpBWFuNp94WnX1WtzEjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 05:42:33PM -0800, Olof Johansson wrote:
> On Mon, Nov 7, 2016 at 5:21 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > On Mon, Nov 07, 2016 at 08:53:37AM +0100, Linus Walleij wrote:
> >> On Wed, Nov 2, 2016 at 11:48 AM, Suresh Mangipudi <smangipudi@nvidia.c=
om> wrote:
> >>
> >> > Add GPIO driver for T186 based platforms.
> >> > Adds support for MAIN and AON GPIO's from T186.
> >> >
> >> > Signed-off-by: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Stephen/Thierry/Alexandre:
> >> Can I get your review on this Tegra thing?
> >
> > Can we hold off on this for a bit? I've got my own implementation of
> > this in my Tegra186 tree because I thought nobody else was working on
> > it. From a brief look they seem mostly similar but there are a couple
> > of differences that I need to take a closer look at (and do some more
> > intensive testing on).
>=20
> Be careful about discouraging other developers internally from
> participating upstream, Thierry.

That was certainly not my intention. I do welcome any contributions,
internal or external.

> Please don't become a bottleneck for your company's contributions.
> Rewriting stuff on your own isn't a scalable model.

Like I said, I didn't rewrite this, I merely wrote the GPIO driver
because there wasn't one at the time and I wasn't aware of anyone else
working on one. Waiting for a GPIO driver to emerge would've prevented
me from making progress on other fronts.

Thierry

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIfWBAAoJEN0jrNd/PrOhP1AP/15NrKhH1HucpyBK5sC7o9bi
rq5T3qG0Kkh9J7Gnd6SjDVIv8Jv5JQxl/9L9b5DP+AQiK7+5FJeBOGvf4nFPSbVK
f02a8yUFkgZ9YiANucSS1Jqeedu5yRWiuDDsN8bvkwv1usP9U9FphCceZ3ISZlG+
iMe7AJH9AV2N35HXBn+Ryu1coODb1XYPzkUyZuV6y2WSrEJx0504/JgdMi6LOrtI
t6tol7e82S6twvScvBKZm1cBnpva2QsVkxSC5pDEWh7yqtBgw/g3hVQtUxfoOa57
qhrthJVi/PsRBu3QV1wOqCB+3zYbXyeuWCVj/JvTlV01NeKN83cDiRCBYvvXNDgB
u1v1BcZ792fpiJG+J02ccVm/5VOivOAwdCyPMMXMahHhEO+yuUKiA7BElzy+IVz6
aj9oHPmkyIO+iu1Bj8BjyfJpljC2MzMvnMi4c52O20ew/550597aLcVDnWplZD+n
l/P54mefQ2HgbDMCn3pyWK3zqU1Xjjlxby5ovpJxXi++qnK1fvHObgyxV2pJmh4K
kuSyRBJWTe7UGZaEDrpkVeJBjrg4GtKwVHdcRBv0YDNluP8g0mrE1jT2GgLTK3Jr
GeEui3Bgu9XKiSA0JIbLuplvMCRZ2xJbhEsRK6zED7yLRHeiSosLqrpcw0A61oup
B/F2TSyuNx3F2FN0b2Co
=Ua5U
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
