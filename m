From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: Re: [PATCH 4/5] set: check seek success
Date: Fri, 03 Oct 2014 08:54:15 +0200
Message-ID: <542E4817.1000604@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de> <1412237788-20611-4-git-send-email-patrick@georgi-clan.de> <542DD8A7.7040705@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wHxLaSb0JNdxchxVjjCHD4XsibfT4HDmN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542DD8A7.7040705-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wHxLaSb0JNdxchxVjjCHD4XsibfT4HDmN
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 03.10.2014 um 00:58 schrieb Stephen Warren:
> fseek is supposed to return the current offset, or -1 on error. I=20
The man page on my system disagrees: "Upon successful completion, fgetpos=
(), fseek(), fsetpos() return 0, and ftell() returns the current offset. =
  Otherwise,  -1  is  returned and errno is set to indicate the error."


Patrick


--wHxLaSb0JNdxchxVjjCHD4XsibfT4HDmN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJULkgbAAoJEJ8j+sKG17wlE7MQAKzlOp2nF8qc7YUkXg4lXev5
oe/ubvE5X68XDrSkAg8GSZzp3XLBDVlBumD1TqrP28iqyCCWau+mGAPOpM5gWpCb
Zh2qqWckkhYztwVXfDl7lLyYvOsRSpf3/vssfo/kOVd4bV22Fwb5VgaIdtfwJoi9
1ZGHDQEhUnHjc8zHI6ilXjFuqIzr9Ii+dwcMaHAyMKTENBalQtsdlRouOKEHFjQn
9ubJBO2GTB3gJ/jzpem4Y+NrlWKkZ1u23Yn1VBYP8fkzDc5pumyKgTGrbFRrPoty
k1EY+EcEjKOmKfpGX+iKaq06iaVLxsmNJhfBwiXAlbkfsbV5P+spaKKgAuQeJyaU
I/KzItS0i+CV6uMuGyyF+8JNzn4csLyoO5U/+2ZX+MY/LkUi+62OwM0oCMdVFmZL
pr/94JTKWKr6RPpr/sO9q/PG91/U68O7M12WL1mg9fvJovK1FsoUpvaWgWDJHCnF
agRlpdGgi4ZFie2bXQcR67/WrmD7tvHRNu3o4ODYfwvDKRsRuJeRn8UL68wblgfw
MZSyG/rcKruxHK7mLKlnfCZ5EHngxF/EFTcuoAUiPucD/fPWoogATrs7zx10E99p
Le+31Qelf8018eslO7huF9DfPPhbtn5lgB/eVsaH8nhvKjshTOpPojAToxHZQPIs
hIr7MDW/E9kvWCJ9uxtg
=ObhR
-----END PGP SIGNATURE-----

--wHxLaSb0JNdxchxVjjCHD4XsibfT4HDmN--
