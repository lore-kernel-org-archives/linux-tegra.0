From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Wed, 16 Jul 2014 20:57:16 +0200
Message-ID: <20140716185715.GA4843@mithrandir>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <17053542.QUGvfkeRmc@wuerfel>
 <20140716151427.GA22027@ulmo>
 <6322144.IB6iKDb6TK@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6322144.IB6iKDb6TK@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 05:22:03PM +0200, Arnd Bergmann wrote:
> On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> > >=20
> > > Ok, I'll have a look. I think when this becomes a separate driver, it
> > > should also have its own header file, so maybe you can in the meantime
> > > make it a local header file in mach-tegra until we have found a good
> > > place for it.
> >=20
> > Why do you think it should be a separate header? We already have a
> > couple in include/linux and I'm not sure it's useful to add even more.
> > If anything I would've thought it made sense to move the content of the
> > other headers into tegra-soc.h.
>=20
> I very much dislike the idea of having a per-vendor header file that
> everything gets crammed into. We should try to have proper subsystems
> and generic interfaces for these wherever possible.

I completely agree. However spreading the SoC-specific functions across
multiple header files isn't going to help. If we keep all the per-vendor
APIs in one file it makes it easier to see what could still be moved off
into a separate subsystem.

Now for PMC specifically, we've investigated converting the powergate
API to power domains. I don't think it will be possible to make that
work. The issue is that there's a defined sequence that needs to be
respected to make sure the device is powered up properly. That sequence
involves the primary clock and reset of the device. It's been proposed
to make these clocks available to the PMC driver so that it can control
them, but then we can't make sure that clocks are really off if they
need to be, since we have two drivers accessing them. The only way I see
to make that work reliably is by moving complete control of the
powergate into drivers so that they can make sure clocks and resets are
in the correct states.

The PMC driver also provides access to I/O rails and specifically a deep
power down state. Some modules are in deep power down state by default,
so they need to be brought out of that state. I suppose this would be
easier to turn into a generic framework because there aren't any cross-
dependencies like for powergates, but I'm not aware of any other SoC
having a similar feature (or implementation thereof in the kernel). And
adding a subsystem just for the sake of it if only one implementation is
available isn't a good idea in my opinion because it will be naturally
designed to work best (and therefore maybe only) for the one instance.

This issue is a fundamental one and there are bound to be other SoCs
that have similarly unique blocks for which it's impractical to add a
framework. I suspect the primary reason why we haven't run into it this
frequently is because a lot of it is still hidden in arch/arm/mach-*.

I'm open to suggestions of course, but the best option I currently see
is to collect these custom APIs in a central place so that we can easily
compare various SoCs for commonalities as time goes by and factor them
out into subsystems where appropriate.

For the same reason I think it's valid to put this type of code into
drivers/soc. That way we have one subdirectory to look through for
potential unification rather than various ones sprinkled across arch
directories. It makes little sense in my opinion to move this code to
drivers/power if there's no common framework anyway.

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTxssLAAoJEN0jrNd/PrOh1GwP/3HBlh7d1DeMcTTz1EbWP2Z7
usTgGCHY4zPoaXCgACtYVKm4MO2BemKDRDWnCiI8Ntg2vTfonZUYTV1S/VwacmBN
hg4MR8pa1lNnkR9+2Bn1nDmI692lXvWbqJ9E4C2Ecy3ZU+6FVi8+IObLK3xNo4XC
B1WjW/y/P0J3vOrwutNFbBnCal8piZAhbm1K7Jcu4gRAoR2fRChD8ywUX0q8ffni
pSI+i3JpPRGsOYIhlpKBq0wHhHlhGFL/5zpRuoHE6xOXrcX7ajee8VpUjbwFYzhO
acVGy+CzufWoqSkoaiYQ854yl1yxpyq/GpfMadCk5KH/BzW5bHFhicRp6VDyToZv
PVQuByl71zafYujhvIs544pwwhLpDoVrJ2ScdY8uU2T9Z2tLKUSqQ8FX0glNqvkK
k4ue0hRCGvMw/CpY6BB5ldRYg4yoOyhaeyYsWzpsRT4gLZop2oWYIKqxL1reMLaj
riLOV7XJYC0kfuhsJ5t0VQSPU5dKwQhEXnALMjCd5DYF9BKGUGhh/WC+VxElUd9D
kyDzlVSXM7OcGM+a64UfJez9rbVwPT47ZLQWz6dK4WGlSMlW9CsMonZRDneQSu+g
DKIQy+/iB1G+OK0F8vktG2Sy0NnNDucOcfa3sDxfXwlQLhaysQYQ6rI/tzyrxTj6
GZoalkHXO3UvNLjxiwbR
=dMDy
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
