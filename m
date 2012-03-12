From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 11/11] ARM: tegra: pcie: Add device tree support
Date: Mon, 12 Mar 2012 14:23:40 +0000
Message-ID: <20120312142340.GI3110@opensource.wolfsonmicro.com>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-12-git-send-email-thierry.reding@avionic-design.de>
 <4F59253D.7070100@wwwdotorg.org>
 <20120312120610.GA14020@sirena.org.uk>
 <20120312141705.GA16395@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TA4f0niHM6tHt3xR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120312141705.GA16395-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TA4f0niHM6tHt3xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 12, 2012 at 03:17:05PM +0100, Thierry Reding wrote:

> My understanding of the fixed regulator was that it was meant to be used for
> fixed voltage supplies that can still be enabled or disabled (for example as
> supplied by a GPIO) but not regulators that are fix in the sense that they
> cannot be enabled or disabled at all but are always on.

No, not at all.  It's for any random supply that doesn't have much
meaningful control - as you'll see from the code the GPIO is totally
optional if you look at the git history you'll see that the GPIO was
added some time after the driver was originally merged.

> Is that how it is supposed to work?

Yes.

--TA4f0niHM6tHt3xR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPXgYPAAoJEBus8iNuMP3d8E0P/jleMyX8Gqwn6J+hGrS3tFuh
7C6sGsNl/EQSogDYK08yhx222WPkZAhYUMqHjhGOHQjvhbzPFSz8TmjE9hVDnO0T
oxqG6PPNXbr4DEuVoEYbZIhVC4vdBUVkv/Vb1aoFWf0LjT6hc5SUhat1MvVuzky0
auhDGBqlV+IVCFRLxww7t2CGwOdSsvkSS7e/rjoA3XelX4O2xJmVcGJbZ6LjsW4y
U0xu43SpBZgSz5fMB4UiOhWitUcmLstqyUh7yXdQ3NcNXdJyFLEi5uRB/N17TM11
jN88O+iDCN2TrMMf1lFekklymtKkubB85JCGNwbCaH8DzKBW1NM6a8hgKHuJy5dJ
exrd1O7w+fUwgJe70Zl8hTIQFbAJWUDhJeIc87f+gHRk0ANUnQFqbC6hjMv+KiAW
T91y9lKjIMURmLU6Qii6P4ZGsqpSp81Kz7axfFhxBl2QIS8YnW8AHVvVTGZYxduh
5imnXHrYwRrQo2hR4/3gZZ1hlX0pawAB6m4wpD85FAhDONkvW21vshbfQATuWysL
UFCv4Eex8mz4Hs1wbO37pgfYm5oJNReTy8c9pefjqF0wITz3f9gPEcXjzaY2kLGt
6Mk0TKeK+9Ep3iwPuU1Mt8jOh0xbacJlHqyNZaCOq1/SHqts9E6ncs4X5+EAtppd
qb8Ff8kmExx0ly+vwhaC
=CTpH
-----END PGP SIGNATURE-----

--TA4f0niHM6tHt3xR--
