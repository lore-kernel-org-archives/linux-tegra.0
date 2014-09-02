From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: configs: Remove REGULATOR_VIRTUAL_CONSUMER from
 defconfigs
Date: Tue, 2 Sep 2014 16:22:28 +0100
Message-ID: <20140902152228.GW29327@sirena.org.uk>
References: <1409486590-23645-1-git-send-email-broonie@kernel.org>
 <5405DD72.30603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+FNB8hLr74QeaOK6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5405DD72.30603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+FNB8hLr74QeaOK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2014 at 09:08:34AM -0600, Stephen Warren wrote:
> On 08/31/2014 06:03 AM, Mark Brown wrote:

> >The virtual consumer is a test device intended to be used while developing
> >regulator drivers, it should never be used in production. Remove it from
> >all defconfigs to avoid confusion among users.

> tegra_defconfig isn't a distro configuration, and has plenty of other
> debug/test options turned on. I'm not sure that removing this option really
> has much benefit. Still, this likely isn't going to cause any issue, so I
> guess it's fine. People can always add the option locally if they want.

In order to instantiate it you're going to have to generate a custom DT
anyway so I don't think the burden is excessive.

--+FNB8hLr74QeaOK6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUBeCxAAoJELSic+t+oim9bDkP/3D+sm040tsRcL0ljNk/Uhdw
oxZ7xpkszPPNFAosha1TgDuidS5JlHS9sdEkVAf0HVsFmHzZWeiV0oK1Mj7siiDp
EdByocloRuZukZgH3KTEUTnBfrXuO0vLAsun6DEwE7Uxslcqa5dTGmVNkcdLF9r9
pN4VaEpOBqS4wlR9fXmioNOfyOufrfmebiR4Cms8LNlycILGroTQBABG+2UjhdBk
JE8ABtP3snnTg0MCd8NaJTZeLKIEWfwWhVlcVTHf7sSxOYmnHwytl123dbk6kHg1
jcY0C0rC7jC3s/bpfL7uWEXk1TDy83JxT/vjKu39RKF1NaAwyme6n/itpckIFmqE
jnnkwJtAuuCZViUUf7hw7+6EhRf9PwbeAk7y2BCVJN3cI1zDbtpb/p2RCk9VQFh4
2ebB2jU1wET1TmpXsy2I/VQspBXgmvSoZYI6Xr5QfJVUYQSN+ZEikBdXBqBkwqos
2ScMd9LZ+t4ZdZMxNol2X0l006MJVWzdRHAXF86y5wgwY3bAQ+18QWFsYAeOfSWe
mm93BRpHEpW9mUcZJ3DLYz+bOS3ilS9W9lVJF5NGFbp2nB8/sjybdOlvqnQAx0Wh
r8i2wtKYnmLmWKvtBaubbo8IrFmxxHcIuTZKf2Z/hNc55IViv8RQ+PreApCLq0pP
SZByd/vAs0ConqjIRHOd
=tvkK
-----END PGP SIGNATURE-----

--+FNB8hLr74QeaOK6--
