From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 14:00:17 +0000
Message-ID: <20131217140017.GI3185@sirena.org.uk>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vbt/VEkUvOjXIgmy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387277564-4774-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Vbt/VEkUvOjXIgmy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 11:52:44AM +0100, Lucas Stach wrote:
> This corrects the Tegra AC97 clock handling to be in line with
> the devicetree. Audio PLL is controlled by the machine driver, only
> AC97 host controller clock remains to be independent.

I don't understand this commit message at all I'm afraid.  What does it
mean to "be in line with the devicetree" and what is the purpose of this
change?

I should also have mentioned on the previous patch: please use subject
lines matching the subsystem.  You've got "ASOC" not "ASoC".

--Vbt/VEkUvOjXIgmy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsFjuAAoJELSic+t+oim9UhYP/0Ar2c1GSRl4TwrjBz5QTLMC
usIE2kFq1vhtkxZcp1BoTBzCQuEmHopcIEXMlBF2AXf6Xq2fPKskAalKLlrw8PdY
pe7RI8uKTLFh9h0qM8afDC3gjNDyuaCl+m0ttTfrq0vLTWkGaZOGK/E0OpPRohHn
2DX2IFlU5UMuu6MrL4EpPOQbb3imQ2+q+1twwYfTLFRMgTgy9b5vje0ExO2GPyDl
PNJ+zGDizW1/kH/zzlkackj8mlM0LT0rQDHE41DqlaJZgMG69dMAg7TDIeXeh9N1
/ArsmnGmCnBUiEzJJ37f7Xdv+0eREhhCqBFCuho132ormQ47tex57RCp+Oy2lf3Z
oIH778C2cGTJjWLDdpCvslW/eYsbeu0kXpdJ1wvTzvz7ZORaupEzGbXMCCTxq9tw
iwp8Jdf0XBtNKRdjHiEN0xzs6XUj2M+ZeWOk7r6TnK5oceWGFKWEUGaSmIbyWjLn
SoMT9/CWBcMUwoOIgOcdd9ToZyQb+6C8hm2z2GHCTv0PmecNeBhmnaMJDdl12poM
kWoLp+Lxpm2nPxmKGcxu3aEgC9Gbul4vC4JyO0bITcFSjdFeSgOyrZaXfHC+6t1L
s4xztLRhHfU4Crtt8o+zdvOMOqLl2rqZ3c65jHAl8HxxLlbhUO95uVTtRRtVQSy1
fTQs/atPgwqtcNFz6sHn
=VoqT
-----END PGP SIGNATURE-----

--Vbt/VEkUvOjXIgmy--
