From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Fri, 15 Apr 2016 09:00:27 +0100
Message-ID: <20160415080027.GB3217@sirena.org.uk>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
 <CACRpkdbueJ=0+WtNefQ7GHoqU5HY7WFYjL2geFq4vkpTbZesZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbueJ=0+WtNefQ7GHoqU5HY7WFYjL2geFq4vkpTbZesZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 15, 2016 at 09:54:34AM +0200, Linus Walleij wrote:
> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> > NVIDIA Tegra210 supports some of the IO interface which can operate
> > at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
> > Tegra PMC register to set different voltage level of IO interface based
> > on IO rail voltage from power supply i.e. power regulators.

> Nobody seems to mention the elephant in the room: why is this
> not using the regulator subsystem and instead using custom
> code under drivers/soc? We have worried before about drivers/soc
> becoming a dumping ground akin to drivers/misc

The above changelog sounds like a regulator consumer not a regulator -
based on what I'm reading there it's a driver that looks at the voltage
being supplied to the device and sets some configuration in the device
based on that voltage.  This isn't that unusual for analogue circuits
but it's definitely not something that's actually doing voltage
regulation.

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXEJ+WAAoJECTWi3JdVIfQtwkIAIFCkWijD3mQ5M6Oyoz6iGX3
DMNt+ifpeQQ1ksBwfgmzvZuisUys21A4cdN1ROSvsJYu52TIYYPVjX+QydKeX5Ys
Go0AmrvYwdV3SC+trfYVg1Kf+VSPwnTKSit5QrvFTZZ/dJUM0Eu6HYouLFq5gjpE
6NG5RHiTd34n5uWcGKEjEm1MZmHEdauegoZD6W6EWKQ0ycx3NampDMOr0UW4IFyL
hTKjoVIns6uZhPTDdB875Wr0FwIyoB3xEtWUR8KxyC98SmhyeookPDV+kQuyl84n
bzsMxiXC0Zu45rPwgj/+TiiyaPUWCxX7p4aiIZ/aEItAp1hFVXZuIpZGQGcafc8=
=3lKE
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
