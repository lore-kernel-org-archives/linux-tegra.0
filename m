From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: update default configuration
Date: Thu, 27 Aug 2015 15:54:51 +0100
Message-ID: <20150827145451.GB5313@sirena.org.uk>
References: <1440670255-19437-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440670255-19437-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2015 at 12:10:55PM +0200, Marcel Ziswiler wrote:

>   * WM9712 audio/touch controller as found on Colibri T20

> +CONFIG_BATTERY_WM97XX=y

Does the system really have the wm9712 wired up as a battery monitor?

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV3yS6AAoJECTWi3JdVIfQfTYH/RwFCHH8L5+aPB6JkdowLxL1
jReaeo7LCWDi9x81hpc2uk7ChZym2Qq5hToxzthg+e6Kt4uJPLbqvVGMQE3CHLGC
FIObkflKT7clyeCfWJASWf6QquFlUPoyWky6jnYkTRS7DvQtznL+5IFQHOR+ccEu
LRUCyWZwFo966wVNTxkEeq1SXkRxtDDZXrpF42aLOwOr1V5e1J4JRhynXW3VqrmZ
vAkDPVj3qqRncbGgArrJHNjvaCcyiBnkn+L+DyZu7EHxGvrp23XAAVDR1LjhQr/B
gVWbNTR4XVVs2Ck5Vizg2xCKt0CVaOlsR892ws+sj9EH+qk/furi5ckwVPScYwc=
=WYNg
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
