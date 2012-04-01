From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 15/17] ASoC: tegra: add tegra30-i2s driver
Date: Sun, 1 Apr 2012 11:25:39 +0100
Message-ID: <20120401102538.GB3153@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-16-git-send-email-swarren@wwwdotorg.org>
 <20120331213401.GP5012@opensource.wolfsonmicro.com>
 <4F77BAA6.7060304@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F77BAA6.7060304-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 31, 2012 at 08:17:10PM -0600, Stephen Warren wrote:
> On 03/31/2012 03:34 PM, Mark Brown wrote:

> >> +#ifdef CONFIG_DEBUG_FS
> >> +static int tegra30_i2s_show(struct seq_file *s, void *unused)
> >> +{

> > Abstraction please - this is open coded in several of your drivers.

> There's very little code here; unifying it would require passing the
> clock enable/disable and register read functions to any common code,
> which would end up making everything rather more complex. Sometimes

If you move the clock management into runtime PM that'd provide a
convenient abstraction for keeping the clocks and whatever else is
needed on without much complexity.  There's some other (non-ASoC)
drivers that do this, it works pretty well.

> there are multiple register read functions for different chunks of the
> address space. I guess if we did have regmap for MMIO, these debugfs
> files would pretty much come for free. Is that what you're looking for here?

That's one of the ideas, yes.  It'd need some work to make it happen
(mainly due to the use of mutexes), or you could mark things that need
to be attacked from register context

> > Looking at this it seems like all that's required is to propagate stream
> > events back up the chain and do the routing, there doesn't seem to be
> > much other interaction between the AHUB and the interfaces?

> I suspect that's pretty much what representing AHUB as a CODEC would
> turn into, or very similar anyway. Is it OK to get the basic

Yes, the above question was aimed at trying to figure out which way of
representing the device would work best - looking at this code it seems
like a CODEC.

> functionality in first and then refactor this, or would you prefer going
> straight to the complete solution?

It seems best to at least hook things in so machine drivers know about
the audio hub (in their DT bindings if nothing else) even if the actual
implementation is something like you've got now.  That way any churn is
limited to the CPU drivers as much as possible.

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeC0KAAoJEBus8iNuMP3dAAEP/iZQ72aO/jKSE9lFFd4rub+y
5qobS81vYnPJyVXxnnmfPegOgmlaJMYM3unCD7bqaY9/yqPJwJ5qAAaAsIYUIfD1
hlj7NQkds+fzXb5yw1TyxX1IGdz7NIBlv0neic4H80b5/EnjmeZcnwRt9kvZFJT7
w+OZxOr8kTRFrFvkRhX4tF6y/JBLCxpQrEZ5zQk397InY7UIBV0UfVVIrcQynGT3
vVQ9zYiHEAKz9g21pTG4jUOqvVCsby6JpQuji9a5ZuF/PIAiC5y73K0UrZ3SO2mF
hsYoPLrnBoH8nHTyahs+sxwvot6/SnTfJTVnoxufA5QOHW79Gl2praYsXrTmY78V
tGqVTBGQJF+me8KMagEgj3h62KDBClhDdx97g22nUwT0S4fHqleFEUJtr2Q22VaH
ax6J0eigrj8nidht+QszPIZq8uUOtGu1y7iCMIjSOsRlwi24eg3w6i5yXVOw7/h8
x4nwBNyK5ZS16tCndAlRDGUyS2NN5zvhR4XcYTj9nNApQiARK6LZOnFw0g7e2iwE
LZklERdF70Q8PL1hK+akaPpzFKUQYr+KnQKtvWmQhH5Lv1wR1EuXQ7g27VnLXtTF
2K0lz2YOdepYkS5ktA8ww5h4IV8vj6v7v8VVLmAwVGZNsuUWod/RjSx2Ac0Oy8y0
jFdrI66dOJ9c7E3CIvU1
=LapN
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
