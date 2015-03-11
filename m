From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: gpio: tegra: Maintain endianness
Date: Wed, 11 Mar 2015 10:55:45 +0100
Message-ID: <20150311095543.GJ19577@ulmo.nvidia.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
 <1420817231-8346-3-git-send-email-bob.mottram@codethink.co.uk>
 <20150311094324.GH19577@ulmo.nvidia.com>
 <CAAVeFuLBz0UJsVEi=EYPbGd2x3Q6_JOELb4SHspR+w=tBS8mZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ed/6oDxOLijJh8b0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuLBz0UJsVEi=EYPbGd2x3Q6_JOELb4SHspR+w=tBS8mZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ed/6oDxOLijJh8b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 06:46:10PM +0900, Alexandre Courbot wrote:
> On Wed, Mar 11, 2015 at 6:43 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Fri, Jan 09, 2015 at 03:27:09PM +0000, Bob Mottram wrote:
> >> Replace the _raw-writel with writel_relaxed to fix issue with
> >> running tegra in big-endian. Tested on Jetson TK1.
> >>
> >> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> >> ---
> >>  drivers/gpio/gpio-tegra.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Linus, Alex,
> >
> > would you prefer to take this through the GPIO tree or shall I take it
> > into the Tegra tree along with the rest of this series. In case of the
> > former:
> >
> > Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > I see that the patch wasn't Cc'ed to linux-gpio or Linus so, for
> > reference, here's a link to it in patchwork:
> >
> >         http://patchwork.ozlabs.org/patch/427142/
>=20
> Please take it in the Tegra tree, that way the patches of this series
> will appear sequentially in the git log instead of being spread across
> various trees without any hint about their relation.

Does that imply an Acked-by from you as GPIO maintainer?

Thierry

--ed/6oDxOLijJh8b0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVABEfAAoJEN0jrNd/PrOhzBcP/iNtNSZDMetE9EJxTnPQk+uJ
IkgETQe6weEjq7xA+SlvuOX93E0+PzK8h9x4WLKkBUxNB8/JKLBJDC/+nHAARNw2
adJdA6G3WnWZKIe1YTZ0YU/AHUWSMP9p2TYdOBe5Sw4KlCYSb9FEKxlyFxEdgCs6
mGXlKVurtvtOZrIF5VpxdDd//P5pSBxq6tg8kdF6BEi7KWpaRe8uTDTRKVWLv6D3
PabBcIsZSKL7t2V8mYz85p55L7i97HYEI6xeoqaDgvO8tRwnKtVI4keXHfuCCyjr
t3AUyh2jI2+9W0Q9p8691xLew8D8wzhNlJ6HRPQbyzRpyOJzDIwM+oOKAiOlKoge
ynlDUusSLInk7zjxllkFYi8+WuRaw3+1ngdqR7E2atp8DK5NB8TKswMVyATTdkF8
aebb5lmZKdzsl8HiY/PPYXI29qPHKsfGw8GqYSYVrpvBcns1QeLe3qoNYmcW5equ
W5eVhL1sVQ0Q4DCa9Qv8u9p29QTNjVCKm0W9yBAu3VlHgNffO1DO/ofh9qlSYrsV
INawGmaP/B4DdldZ4a8nz4vghHQqKpnieakkUZtP7fRwsRlXgK3JHwKlqAIFba9w
3ShdzIrvVe2C6lXo5xEKdAD2QSrypL0WURzXkVPxsPP2PXrrQr6NGYizYGwBc98K
xCkzeE3SXlInGjscedvF
=UOtk
-----END PGP SIGNATURE-----

--ed/6oDxOLijJh8b0--
