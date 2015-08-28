From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: update default configuration
Date: Fri, 28 Aug 2015 17:51:32 +0100
Message-ID: <20150828165132.GQ12027@sirena.org.uk>
References: <986a8cee-f090-4888-91f2-7b564c4b3d1d@email.android.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sd7l8P2TFUHagl4l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <986a8cee-f090-4888-91f2-7b564c4b3d1d-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sd7l8P2TFUHagl4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2015 at 05:41:43AM +0000, Marcel Ziswiler wrote:

Please fix your mailer to word wrap within paragraphs so that your mails
are legible.

> On 27 Aug 2015 16:55, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Does the system really have the wm9712 wired up as a battery monitor?

> Well, remember we are talking about a system on module. Those WM9712
> pins all go to the 200 pin SODIMM edge connector and I know that
> certain customers indeed have carrier boards that use it that way. If
> there is any opposition and considering this being rather optional I
> may also drop this one but audio/touch is definitely a standard
> feature available on all or carrier boards.

Does that actually work with mainline?  The driver requires platform
data to do anything useful (there's no DT bindings for it) and I can't
see anything providing that on Tegra systems.

--sd7l8P2TFUHagl4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4JGUAAoJECTWi3JdVIfQKQQH+wRH8d0GEZgkufoRk3G+BBrF
pH17of3W9nAGYybE5Vk07chSjUAL/+5aq0THGn9pJDeWZHhq+R5BkPkomGJ0VXYT
iwFccI9VOLbuz3Pvm2iTTfOPkDsl4yvKOHvRthe6yUtQP8fPUuaOt7WqihCUMWQI
oL9brigvMnGE3GY4RmjXmk2tHqR+qi/OAX7Y/cFgzOp58oR+vnNyAilfi1Ucr9N2
6uiYdyFICA9ALfwVKB56aEHdXzgSb80b0z7lqsGrxuN8NZR1VY9a67qw+jsNg4dD
UamaPHRmHXWnpJZ9z+F1BwriuDT3zbjZXoYeDr89TgIeYYd0Rykle4VGPf0C0qo=
=pPYY
-----END PGP SIGNATURE-----

--sd7l8P2TFUHagl4l--
