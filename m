From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Sat, 28 Jun 2014 03:24:07 +0200
Message-ID: <20140628012406.GC13290@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53ADDDC1.2080603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADDDC1.2080603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 03:10:25PM -0600, Stephen Warren wrote:
> On 06/27/2014 10:58 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > These drivers are closely coupled and need to be moved as a whole. One
> > reason for moving them out of arch/arm/mach-tegra is to allow them to be
> > shared with 64-bit ARM.
>=20
> Aside from any discussions re: splitting out cpuidle, power domains, ...
> into separate subsystem directories, this patch looks conceptually fine
> to me.
>=20
> That said, given that I think arch/arm64 isn't going to have mach-*
> directories or machine descriptors, I wonder how all this code is going
> to be invoked at boot. arch/arm/mach-tegra/tegra.c calls a bunch of
> these functions at boot right now. So, it seems like moving the code so
> that it can compile in both places is only part of the solution?

Yes, that's correct. My primary motivation for moving this outside of
arch/arm/mach-tegra was because we need the powergate APIs for 64-bit
builds. I can look at moving out only that driver in a first step and
then look at moving cpuidle where it belongs. As for the other pieces
maybe a better solution would be to keep them in arch/arm/mach-tegra
for now until we've determined which of them are really needed for
64-bit and move them out on an as-needed basis. Untangling these on
by one will take some effort, though.

> Are we going to have an arm64-specific SoC driver that binds to the SoC
> compatible in order to initialize everything? If so, I wonder if the
> same can work for arch/arm so everything works the same way?

I think we'll have to do something along those lines. But I'm not sure
how well it will work out because some of these drivers need to be set
up very early, before any of the driver core is up.

Thierry

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTrhk2AAoJEN0jrNd/PrOhW+sQAJTKinoMGTDB4dBXymyRLgfd
kWLY3rkTpjhbCKFQIaOzBCy3iKI57xWWBX/3Fi/0GEOtvguHnjf7FhSZjmZZaYvD
WrUR5qqOvXj0qGYtk/6i7Xy5dqEGq7aHSadxT1G5HL8p85fda12yyXeitJiM1Bwf
axc3rDOShR55mzEIgVvGa7p0s2VY6xTIR8fuHJVNZAY8jk7FZN7o77a0BTvE8Pv1
u3HqQd5TYwnVtriweikNds6vyFo46poMOIOOc3n+q9rGe5Q3awyxETdUmkq756Uy
lAH7xGGNSQo7/Tc4hIYook5Ax7ljEAhQH4o256whWryxx+cGUfYbiu9FrX8nI+SG
y2ZTC446lE2jfWXUxE7cgUIoFwcLiAN0d8dD+bLX+IIZTZWoNezIBsLudgi2LMZl
ykhPRjToTB3lBsyA+UNtOkt4oH4xlfas4WIw7gS7hCeyjatgC7sAq2Rq+vAMkQOl
2ZyEWYQoIjDunBYYeRvoYzcU29ObvWJnpcv1szewAihQNQMa91T0v5O+8Al2S0FZ
xTL9CVJ8zTtE9jA2MO4zjODVHFf7IRsmVgXcQcqo411cHt/OErs3vry8xbgQUY7u
KnO2SGNN5KwD2FMWhhBBhx1N3bfLs7zbsz1Exxti3YcT1tR26TLA9XdVW4+klfum
CtTIA3r2O8aLqVy+PRcq
=VaDS
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
