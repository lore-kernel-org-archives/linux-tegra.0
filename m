From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 8/8] arm: dts: tegra: update isl29028 compatible string
 to use isil vendor prefix
Date: Fri, 9 Jan 2015 12:06:36 +0100
Message-ID: <20150109110635.GA16465@ulmo>
References: <cover.1418763328.git.arno@natisbad.org>
 <8cfd0ac11713262036dca415e59e56508fb07c3c.1418763328.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8cfd0ac11713262036dca415e59e56508fb07c3c.1418763328.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 10:21:16PM +0100, Arnaud Ebalard wrote:
>=20
> "isil" and "isl" prefixes are used at various locations inside the kernel
> to reference Intersil corporation. This patch is part of a series fixing
> those locations were "isl" is used in compatible strings to use the now
> expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
> version).
>=20
> Note: isl29028 is an I2C device so the patch does not in fact currently
> depend on the introduction of "isil"-based compatible string in isl29028
> driver because I2C core does not check the prefix yet.
>=20
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to the for-3.20/dt branch, thanks.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr7Y7AAoJEN0jrNd/PrOhnW0P/R2pYDuyjTnDWbxozxWaDi1E
XG/usI9KHue49Hza0EhXvmyf6OjhaP620nO/JzFe6LKaNF+TJ9Yy4wG+5oL+6w6w
23QiDkwXLQ3sHFsFrsE7AIYs8/uqh8HZ4VBHAisnD3MW1yCLSOJ/UzBVAHBaCeLs
Jv68f1PpevXgUilB8jlpGjaT4FOaJIFqmyKTV2JuKGOfLhYby6X/F8LA2GWc1BD/
lZluW0WeJ18LUhYPkJ9bKJfmSX0TZ0nB3tnOuSplqzzrMgy8g4A82hTGjEUPdpY7
kNN0KzQSQIzNQ3YKPUwxg8oQqeZH2iaG/Y1lbXpwVPWdW2UD5fFjmIOhS8I3G/ao
eVSjVgxyRgbwfXjsNhOSXZHE4JRMYzMvuvX3CbO/dMhif7q9Y6YOD2RN6TMrr4AY
8SHP9AYs4cO/FoOcFoC92aXVngdZttmKrZytesy/HjwR5uh+Q70LMKUehzi+G3YJ
Rluhc0hzx1vjPrQ88b/l7PLiGx9AOy9ADydSIJlT71lUHFTIlIdpxK/Rtb1oVJtA
HXYnhqRos+iLevUI/9b47X5GVszhMTqlmGrrrHeYJAqRqvqaNIqpvvHyB+4qqWH8
gOifM2sjw+vfA9611Ox9nkgK+O/PSutfnlfQDon7PfAXTvSs0qLKxmVWlg+Ak6gE
JvWqtl2F94048lGmtnv3
=xthr
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
