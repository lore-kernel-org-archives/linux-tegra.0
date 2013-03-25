From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Allow PLLE training to succeed
Date: Mon, 25 Mar 2013 19:53:21 +0100
Message-ID: <20130325185321.GA3542@avionic-0098.mockup.avionic-design.de>
References: <1363274825-2439-1-git-send-email-thierry.reding@avionic-design.de>
 <51437655.1030008@wwwdotorg.org>
 <20130322204822.834.98314@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130322204822.834.98314@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 01:48:22PM -0700, Mike Turquette wrote:
> Quoting Stephen Warren (2013-03-15 12:28:21)
> > On 03/14/2013 09:27 AM, Thierry Reding wrote:
> > > Under some circumstances the PLLE needs to be retrained, in which case
> > > access to the PMC registers is required. Fix this by passing a pointer
> > > to the PMC registers instead of NULL when registering the PLLE clock.
> >=20
> > Mike, I believe this patch is appropriate as a fix for v3.9. I assume
> > you'll take it through the clock tree? Thanks.
>=20
> Does this patch fix a crash or a documented failure?  Linus is being
> more strict about taking fixes in the -rc cycles these days and knowing
> exactly what behavior this fixes would be beneficial.

This fixes a failure where the clock can't be retrained. Under some
circumstances the timing is such that retraining isn't required, in
which case the code runs normally. However I've seen in happen that
the PLL isn't stable in other cases, so the code tries to retrain.

But the current code doesn't allow retraining to happen because the
MC registers aren't accessible for the PLLE and therefore the
clk_plle_training() function immediately errors out with -ENOSYS.

Comparing to Tegra30 this is obviously just a typo when registering
the PLLE clock and the virtual address to the PMC registers can be
passed in at PLLE registration time to resolve this issue.

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRUJ0hAAoJEN0jrNd/PrOhX3AP/2zM+rarsJjOARAK/AmOhjPR
/AkMaajItPCa217dMxxDz/0YbdvfIDysCw6tuC1KWcze3tNNkjfjQ6l25BlzSLIN
zkF9pTcKmM9vlrwDgpmj/XmRdKodaKnld8OTTs52PIOIyCFq9CYvsUFPr5JbI3k2
fmgYTEkm5c6NmvGGPZPEwlF2qxrqN/jN4s38KGBa6FrrSzbND3bgfBZ+xVYghuaa
QOrZXNaZbv48uLRtSNATDZnJPhofVL/KU4IxpeP8+1KJy6dIJMDOrKItFQu81nsO
oW4FTbpyC2WBkWZzTcuWHNvS8znHlxzufKW3eGANKIkenaLC3dSg1F95F0K4bQf4
07Z4fq6qvSZOd1SvsBArM6v0bLnavaF4cRSTFuaHhnxRvs9et4jk/QF+r8D2RD8Y
6kGMNIAvxEetjwsP6lU9L18X7Hl/M0UBx2RKY0gjvamQde8Kl4iMvt7SFoLmk+e8
IWuMsW5WJfxKFgJ2w7vzbm0dweakZqt9dDdVTEnfXEDP6rIZa7DNMea9TFArnCFK
pwW+xejaxov9PFOdWd63G9LZB7SImea0fqLoFeqjv3I2TDf8pHyn64xwfJut4BoB
iF0ybq9tCb1+oga2P4Q6lDimT+G1y/yLAvJlCDMsa2natTwZGQ2zsPHWmFi71Xau
3zms7iaQb8aEbESgofoP
=Z4gF
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
