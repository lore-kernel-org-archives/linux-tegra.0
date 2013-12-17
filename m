From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 22:28:47 +0000
Message-ID: <20131217222847.GK28455@sirena.org.uk>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
 <20131217140017.GI3185@sirena.org.uk>
 <1387291793.1783.3.camel@tellur>
 <20131217214352.GF28455@sirena.org.uk>
 <52B0CE33.7080605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="++alDQ2ROsODg1x+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B0CE33.7080605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--++alDQ2ROsODg1x+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 03:20:35PM -0700, Stephen Warren wrote:

> The Tegra clocking architecture has a shared audio PLL that provides
> clocks to the various IO controllers (I2S, AC'97, S/PDIF). In order to
> allow multiple IO controllers to be in use at once, a single SW entity
> has to manage the clocks, so that it can configure the audio PLL, rather
> than having each individual IO controller attempt to assert ownership on
> the shared resource. The centralized PLL management needs to switch the
> PLL rate between 2 different values for 48-/44.1KHz-based audio for
> example, and deny requests to switch if already-active audio is running
> at the other rate.

> So yes, I think doing this all in the machine driver is the best thing.

How does doing this in the machine driver help here?  The machine driver
isn't going to be any more coordinated with other machine drivers than
the controller is.

Note also that AC'97 will essentially force a constant always on clock
if you want to stay in spec which I imagine any system using AC'97 with
Tegra would want to do given that it's not exactly cutting edge...

--++alDQ2ROsODg1x+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIbBAEBAgAGBQJSsNAcAAoJELSic+t+oim9AgMP+PTUn1180agG47JW8YCwqSx7
RmwOVb+RH4AXggdyjAFJ8hnwvVPNGIayiJeGSshtH6suAxhRZMSewF3v7MsjuX5G
dGzDg0IGL8oFnPxaYGEpWzkbiuD1PP0DL+32IsXe4pNlvD8/di4zFoJAuaW9Wkq8
ienCWf8E6z6+8FItxlxtiXzO/Ex8q+zskZ/JvVjq/s6C5uKQ3wlem3eZsDUMGLKG
fkVSXADd3qjJzc0mxGIESmZnDMYw3D6LLDcgvtWIJlaMj/HABbm/oo7vcnvkjTbI
j6ZRR7gpusqsrfDW4PWPiAZKxPlMOCFGg6OEAJSmjDqU6bDbkP9YCWC0HQCdV90T
H1xE549pNxpvt2VLpLQBXSUoteJPCHI4Y8/oNX+ltc8mNQ8WEJ7N7ko+YRybe8PH
oOHD74DmLPj7nLrT+685fc9SuOOxnOyPnMn0sojGzXpUD4bYb07SJtVt0C5AzQ2n
o9+1cgGvbv7rlS29Ha44x31MlWSpf2yyhI34KFTyWRftZDljrAdIjiKoHdE9d5oi
EQAAV2lb0t9pnUEqNczgS0R9VnFfKdScU5IOWvAoxxpLVr8hFJ2l6R5MFtUA3a4X
bf48CvCOb/gJgHNpAwPKFto9KQYG5DX2nZAxgRWrbSbbxf0nEoF1Dttm4AdFyB+h
vocmWvP3QQuZKKTVtrY=
=e/EH
-----END PGP SIGNATURE-----

--++alDQ2ROsODg1x+--
