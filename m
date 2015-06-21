From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: don't advertise SMBUS_QUICK
Date: Sun, 21 Jun 2015 21:26:36 +0200
Message-ID: <20150621192636.GA6286@katana>
References: <1434476841-6234-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434476841-6234-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 07:47:21PM +0200, Wolfram Sang wrote:
> This HW cannot send 0-byte-length messages and the driver discards them.
> So, we should not advertise SMBUS_QUICK.
>=20
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

Applied to for-next, thanks!


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVhw/sAAoJEBQN5MwUoCm2K70P/RxFARgAiNEb75mHV2AXdilv
chOPgcsO4DsshU1fwZ+zUvwfow8LYVc5JAZA4GH1C2dBZEHaGAIu/RWavkNkxRkN
4SQIYHyenKK3brFGBGaxOZJsbAc6dkrwDsAENTHziZSa4ZDJTU11Zma0qIyY3sxJ
ljVp9+MWYx1BsxzeI3/pRL6mlbFlhG1fnjF7RPZl3kMnIGuBhhf0GYe+DtEHgFH4
GIA8p7ZZmmCzD7hJL3ulrcd3VouZ3jJeqqF2L5Z5qXDHxrGlP0r3r7sHJMBg4/Q2
Rv2GdXn6AX1REkn7vaLI+TVLGKpa3H+njnjyxE8SAgsGJvjaHGWbtOUmHlmqGSPn
lVtIM8aMPuiz8Zwd61IVNAtC2baa76jRz/VEHS+jXLIqODxmTlsEQXPzdOu71FlA
QqEAQ+Azz2xnVbTxQ71Sb71UaxjSuZlJDb1CBgnJNrIxI99GQPQlKtCJdKNfQeEw
1IR21hlVP1HugJ5mNPeVSZO5apIoRtyevT6bdadEpkZhb4dIcsdcf0xHmT1DCoIb
7dMCykF4Q6QItS20YTbflr6fV0L/VagOy19gokiAKxc6RxZJL0cwt0nMP5ZVx83l
SrtjKMEXOQEdhbyePgd4qeqgWPUH7RkaDr1WryjNnGd++A9hy9u2RQ52N2OlA6WE
OJxffqclrwRyVRtq3azG
=xfkK
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
