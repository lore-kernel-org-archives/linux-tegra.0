From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: update module reset list for Tegra124
Date: Tue, 10 Dec 2013 11:19:15 +0000
Message-ID: <20131210111915.GG29268@sirena.org.uk>
References: <1386195913-24213-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7tGYYWp2rWczQsSS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386195913-24213-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7tGYYWp2rWczQsSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:25:13PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra124 adds a number of extra modules into the configlink bus, which
> must be taken out of reset before the bus is used. Update the AHUB
> driver to know about these extra modules (the AHUB HW module hosts the
> configlink bus).

Acked-by: Mark Brown <broonie-QSEj5FYQhm64UlQgPVntAg@public.gmane.org

--7tGYYWp2rWczQsSS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpviwAAoJELSic+t+oim92xsP/04YlV5bIjUnaWjxrD6OqvLi
RhRdCzUddgqzUFng7gRG+8oNLa+EH0+ANsSUB9FFYoyEKATxPmFLNP7PfhoxGBt1
5ai2w5+l/wPm9ZxM/iF0L/taNzU4Mx+IbYyS8ZhXy8m6dx0ISJMKFfBhQUxB0pdw
cCAMPXMEZJPbHK5d5ADLuW0YfcRKO9Nzi4hnTwlujrvImiXHwaysN3nSzbKdRilk
18VTdvr2kE92XD4wu2b6iOU/a4y2Sbiq5onvRsD3fjRu2hSPrRfw3Hop1IqaYZ+J
aQImilRNZSmDfQA8DEDV8k544s+Y7n4IgWHBJeHAsXkVzSz4o6ay399D07SDMjfZ
LM5/+PpZI7LzoUZC70rfehv5NaFDbGq8WOfedNs0YzXfpJrnxzzJLQ305sqV7Lu0
QRiC+2LximM7qL4So+0wi3X+moArsR1dvyrN43z7KjjlynBN3cfHa7B7JIubDs/d
qUXfTnazp8hkpN+fr4vcc7uCIihesZ9828jpX9B6aXtUnEDH3zFyIZvSI32Uij6E
zZHnUhOyma8IWZHwywDesi5Tpq5In7zrORE0rQLfYmxCIsPghbuUlDgIIxxEt4qR
LrolcI6TzyTxudjYxCyA7iTilYJhB/hiv19L5NccgmtFGfuT6N6rGuCtzf7i0EAM
Jb7rfgLLjOvKjn25PwCt
=Tq5k
-----END PGP SIGNATURE-----

--7tGYYWp2rWczQsSS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
