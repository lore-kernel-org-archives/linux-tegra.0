From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 57/62] watchdog: tegra_wdt: Convert to use device managed
 functions
Date: Thu, 19 Jan 2017 12:04:07 +0100
Message-ID: <20170119110407.GE30182@ulmo.ba.sec>
References: <1484091325-9199-1-git-send-email-linux@roeck-us.net>
 <1484100561-17638-1-git-send-email-linux@roeck-us.net>
 <1484100561-17638-6-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484100561-17638-6-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2017 at 06:09:11PM -0800, Guenter Roeck wrote:
> Use device managed functions to simplify error handling, reduce
> source code size, improve readability, and reduce the likelyhood of bugs.
>=20
> The conversion was done automatically with coccinelle using the
> following semantic patches. The semantic patches and the scripts used
> to generate this commit log are available at
> https://github.com/groeck/coccinelle-patches
>=20
> - Use devm_watchdog_register_driver() to register watchdog device
>=20
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  drivers/watchdog/tegra_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliAnSYACgkQ3SOs138+
s6Gxyg//Vl6DcjUBZyclJ177ITiPvPIvG/frmNm0C6T6c82rTlB8pScygjaOlWCK
YXA2+bS2qz8eseAbijwmwLYnlSZvAeGSBFaExOAlXIkyafTQyt+FE2vL00zV0cPa
n8V/zUuMnucEsCbw6Wke1xLcigdK0iKi/jxfeYFvC7v74CTMR48tmFcVry21h8/K
oFeIz0DsBvb0aM35S2coz9pU/WFPyHOxi7R3TZE11wzxplJoufUvXJh1CkBRqWWe
RI9s7ahIj0Dl+cIekE8Ge0owUBmN4bvu1C05lvsBqjht0OJhEkXM8mNIRSgfZwH/
50CCqffPgVJu+mY2WNgeNbcnM9wHDqIaiHBf/sYNr1nfGmAphD3umsYb1u4zlFD/
eWcQG88WYA+6idBBMaa44Z7UuFP0ItusNHmcC5efj8xxaNx4JkLGJg+wymU7In/F
bYcvJVvaEVmwMrAqDwlWghoG5AZiHpDiy4LfZULN7bVR1PdlocV9/HGNSjOuSzEO
JPZ+DuCk0Ldtpd+mUTDLbnitkmGlve9QmZSY4BGs0JWsPBeCfdBVjNkgSDkbO2J1
rZ1lekInNryXo9WuyO08g2jWhKrQva3XwlAiCfoCc58IhRGWEBbb641ILc6iWWJV
FqqDTUs99F2dRipwhO6MfmL5aAK/gtbYnVKanb9cNA7TZqj+kdc=
=s9zz
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
