From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add stdout-path for various boards
Date: Tue, 5 Apr 2016 16:04:52 +0200
Message-ID: <20160405140452.GC28814@ulmo.ba.sec>
References: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455025920-21875-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2016 at 01:51:59PM +0000, Jon Hunter wrote:
> For Tegra boards, the device-tree alias serial0 is used for the console
> and so add the stdout-path information so that the console no longer
> needs to be passed via the kernel boot parameters.
>=20
> This has been tested on boards, tegra20-trimslice, tegra30-beaver,
> tegra114-dalmore and tegra124-jetson-tk1.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Thierry

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXA8YDAAoJEN0jrNd/PrOhep4P/137qgcetS9ra8Aq5VcJUnBh
wee2B+AOoZCLrT0KgPOyoHcsNe1eKPQPxCS+sXn78eogomGrOoDJjgpaUIAcJ4gC
9coVVK/5h4zf6gJep7ejQpXF0Ll8/tHppZqreix2BknfWqICuhhvoaqBCClDHH0+
9q7aTCPDVmwbzwU6KjzvYG8iVJ1zRF0UAxjHbFBszDsyEK3iKckiprkaPWcQn8iP
ECxeIoaPyY1/9Y9U+H/izserNhupLpVI84LQ/7EJQYKRvCOP0u/AqUgT4Aa7nLFr
j5YEUGKwexCYnkTc/TJ7mKzodKr0TMt2b37iwCVNqLnwXb7Jklcvz7OqGsuiivfj
/L8V2zIVpe8nbGmkIqigbn5QTj9sk2Ja3rFecsHZSLlfeIgdvgGD+55pAPnohOmH
M2iehEN1YIPOziAzYT11GGhNWUCXkLlfqHFS5KcX+YWiSLqSkLiSBnw6MAwQpzGL
8WbJu6Amp6igsWvpBRixg2kgC7wOZrqbcmTJWsEJBS0/7E4A0CR+jB+8Kzt1dVmK
IiYR+/dHRxrgAFPtrMekUqUBXa7z7dkcv4n0s8Dx8jT0vEdko1tcdzfy6DtIXjB3
cG56+KCsR3nEk6OjgNJ/gQ+SjSUjXJ3UWTCZdRiYxzYx0NYvzF62u5sJmDYD54A8
tZ1ck4Dgy6d38qzHhm7Y
=emgI
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
