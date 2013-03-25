From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Allow PLLE training to succeed
Date: Mon, 25 Mar 2013 22:35:38 +0100
Message-ID: <20130325213537.GA6555@avionic-0098.mockup.avionic-design.de>
References: <1363274825-2439-1-git-send-email-thierry.reding@avionic-design.de>
 <51437655.1030008@wwwdotorg.org>
 <20130322204822.834.98314@quantum>
 <20130325185321.GA3542@avionic-0098.mockup.avionic-design.de>
 <20130325211304.4014.822@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130325211304.4014.822@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 02:13:04PM -0700, Mike Turquette wrote:
> Quoting Thierry Reding (2013-03-25 11:53:21)
> > On Fri, Mar 22, 2013 at 01:48:22PM -0700, Mike Turquette wrote:
> > > Quoting Stephen Warren (2013-03-15 12:28:21)
> > > > On 03/14/2013 09:27 AM, Thierry Reding wrote:
> > > > > Under some circumstances the PLLE needs to be retrained, in which=
 case
> > > > > access to the PMC registers is required. Fix this by passing a po=
inter
> > > > > to the PMC registers instead of NULL when registering the PLLE cl=
ock.
> > > >=20
> > > > Mike, I believe this patch is appropriate as a fix for v3.9. I assu=
me
> > > > you'll take it through the clock tree? Thanks.
> > >=20
> > > Does this patch fix a crash or a documented failure?  Linus is being
> > > more strict about taking fixes in the -rc cycles these days and knowi=
ng
> > > exactly what behavior this fixes would be beneficial.
> >=20
> > This fixes a failure where the clock can't be retrained. Under some
> > circumstances the timing is such that retraining isn't required, in
> > which case the code runs normally. However I've seen in happen that
> > the PLL isn't stable in other cases, so the code tries to retrain.
> >=20
> > But the current code doesn't allow retraining to happen because the
> > MC registers aren't accessible for the PLLE and therefore the
> > clk_plle_training() function immediately errors out with -ENOSYS.
> >=20
> > Comparing to Tegra30 this is obviously just a typo when registering
> > the PLLE clock and the virtual address to the PMC registers can be
> > passed in at PLLE registration time to resolve this issue.
> >=20
>=20
> Hi Thierry,
>=20
> Let me rephrase.  Does this really need to go into the current -rc's or
> can it go towards 3.10?  What user-visible failure does this fix?  For
> example, the board doesn't boot, or randomly crashes, or ethernet wasn't
> working but now it is.  That sort of thing.

Without the patch, PCIe doesn't work reliably. So on some hardware this
indeed causes hardware like ethernet to not be properly initialized.
With this patch applied, training for the PLL can succeed and PCIe comes
up reliably.

So yes, I think this belongs in 3.9.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRUMMpAAoJEN0jrNd/PrOhbVkP/ReW/7l0fOeJ4CsamUfyt6zU
WZaRHyYudMJ5Pk3IBZdxQkfmsv0+YKIJq2358rlW8wX8RgLHDZQe4EE6xACHmABr
OBx8ItYSKfuVx8soKn7vuS5iGK/jgqwWp1AR/rm2HZ8BISNv46Z6Ghm4+doQg6pd
j2LBEK/FcaC+/2UKZLR8xV5zDLFPxpUR0+iJgKOTdohpYtxeOttyN7OnYpPs9jLX
6P88lxpqFq23WQrbj+MHk7HlIC/65aeYlr4tm5mv+H1XWv75nxSbZC1vsVtDo5Tq
8tGI6uVOy1b4Fza173sVg7I3IUMfjnFyF+Birzc10vEPJ67EsEPvm0jUjYqOaRB3
oVKvh96Z71p72iyj+0kc89Ky+MSaXJ6amBhjskupUPSuBwxhfxW6KUhLeZi+QC/I
dDXyHFJnSNcJamygeALKSRvOX6jub2+aAqU8ZU0ldPF9H3S072TgBxTbbdQm5F+I
zOmZHF2aGVwPQkizxlOfrWV1MNy2vApwAcaLeN1CmDyqVB+yHTGMKs6+/6f9XR32
J5XfDx/FcKXMV0woRV92zlpl3HcC1PuFP5qZTjfDW53sy4MY12weJ3tR/MJ34s3z
KP9nYC6qONI6KEgNu3LvQNr1ra8C9EKG+LJzqhDj3Q0HiOdF61jmPBN+/7oLY0aU
1gVndE0K4LwAzTiRWNMI
=AISI
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
