From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: tegra: Fixed typo
Date: Wed, 27 Jan 2016 15:10:26 +0100
Message-ID: <20160127141026.GA21779@ulmo>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453827558-10954-2-git-send-email-ralf@ramses-pyramidenbau.de>
 <CAAVeFuKiaSZH5RF=zEnYVoRU_rtVvONRYdtGbK=fgV_icO8tDw@mail.gmail.com>
 <56A883C7.9000007@ramses-pyramidenbau.de>
 <56A88AC6.4090105@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56A88AC6.4090105-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2016 at 06:15:50PM +0900, Alexandre Courbot wrote:
> On 01/27/16 17:45, Ralf Ramsauer wrote:
> >On 01/27/2016 08:59 AM, Alexandre Courbot wrote:
> >>Hey Ralf, thanks for following up with patches as we discussed in priva=
te!
> >>
> >>Small nit: you will want to use the active form ("Fix typo" instead of
> >>"Fixed typo") in your commit messages.
> >So even my language skills got improved ;-)
>=20
> This is grammatically correct, but using imperative form is the convention
> in the kernel. As per Documentation/SubmittingPatches:
>=20
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
>=20
> >>It would also be nice if the commit title was a little more precise
> >>about where the typo has been corrected.
> >Uhm - as this is be pretty small non-diff-related change... Is it
> >necessary to send a v3 or would it also be okay to let the maintainer
> >amend the subject?
> >(to sth.: like "ARM: tegra: Fix the same C&P typo in several dts include=
s")
>=20
> Let's see what Thierry says about this.

I've changed this when applying and also added a full commit message.
Doing so might arguably be a little overkill, but in doing so I realized
that the same typo was there in the Tegra132 and Tegra210 DTS includes,
so I fixed those up in a separate patch while at it. I made it a
separate patch because the arm-soc maintainers want arch/arm and
arch/arm64 changes to come in via separate branches. I did add a
Suggested-by for Ralf since he spotted the original typo, I hope that's
okay with everyone.

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWqM/NAAoJEN0jrNd/PrOhtzIP/22xsLbFuOK1zjqRYAkwL7OB
Gk8NtRVrPLtLn7/5bfRS3ADz4QIWmFuwj2sKG/2NxEOxfKhZghmsnGtPAGzO4O6y
2EYvAbYY0yw+p6h6pT0OGqLSTAd8qRxNNiEVkZk7eRCDxWP4rpySs86bwkRKg7R4
mVhHL8JR6YingNw/dv7SMKDKyodh4499CcMICHDuSbc8bQqkS8ofNiIUR7C1guH4
k798RfOaLqNRaBTUJEWmVNrJPY1hyeqRrTXfWyRxNZYVcDyvqZHQpjAOBtTZNzXW
24zzGNGD5fVAkUYoQbReRBwoWwTtxFRGeHrGw5I53YdkzG59jXu2lTV2UC5JEyQH
B2UhXB7NjXy+gJyX+RqLrdotpoO44fYqQPjc1jwe0KqLchdAm+DKDkRJ18bSS/9z
SBG59l//wGLWtC8yyO8NWRb3za2pNxYrM4FJUi4INQ9kErAqz3nNYVq28gNgKAvG
p8i8xMP4LWZZrdzmvP7a4ANWD6DiMAfEuHzUnHHN8Yp73pvbI3fE2Ig5eQfbLL0P
csOPkEKd2obE1fTxGWjO5en0vi1Q/qEDBY9NwwIwi8r9a7ApwrnJ1kLAhAbAVxIy
wJKm4lDfkFjCYjYXNi3RIQHoCZXCAkmhpJOLIXvqC9I0shKBAdxEHnYPvdZthj+I
6asmv/15DWDONJ3y2F29
=6fu1
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
