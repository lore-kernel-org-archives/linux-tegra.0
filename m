From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: apply size limit quirk
Date: Sun, 21 Jun 2015 21:26:46 +0200
Message-ID: <20150621192646.GB6286@katana>
References: <1434477449-8340-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434477449-8340-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 07:57:29PM +0200, Wolfram Sang wrote:
> payload_size is a 12 bit field in the HW register, so add a limit for
> this size. That way we gracefully reject the message beforehand instead
> of generating an OOPS while transferring. Verified using some older
> Tegra2 documentation and a more recent Jetson TK1 board.
>=20
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

Applied to for-next, thanks!


--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVhw/2AAoJEBQN5MwUoCm2eJkP/R901FgFZ+UjGFR0hSuYgUwb
JDl0aWdJV+8wpw2oL7R+c/l06qOw+L+lk6h5wJwRuOdMqGr1osOb6/c6MdiQaqHq
OEZAxTyuJFTBsohYA0CLwKH2XQU3ti4slLBBUoZ1dQH0LqNBMntTmW13b5MlBmjW
9qD35fzRNbafpEXm/iepb2Gx35QW2QmYsNYye3ZjS7JIClXjRhi39kAan11hMWCT
LJKzwqGqIA4p+Yy7O6YUQQZ38iWNT2BgxAHTp5mJhJuKlZnGgxcobpSML7Z4W3/Z
Zge62VgWWbPdXpphn7oxbuZG1WK/6M+g7EwpKIeqd91NRsbQcBbEcjuMpgcZ5U+4
pgF1FCQDAnmodnFlxJvGpOvKLClCZ1BPW/45ufa3QEgtIrCZvctdC6T+Px6C5ThW
agtz24mrHYf9rvbleVGgkwPjhTqWDD+LE/Pjr/R8hlpROFlH1hXe7zcIK9CV/XGo
DmgJaWO5Su5uw8msQrvLAW+Wk5aYwb58sbQrLSZpZ1P7EbbbvPVAyclB/xh2Jnl6
r+pRj6SP1nk1xm38CSnyP5gsIZmx1/g0um6Zkgk0AnmYlc/C5m4/jKKM3LfUqI7Z
0WDr8mF6iAr82S7MlY8eIpBoWCHQWj0OrKrQswLhrUF+ePHfdgWxAT1UgfM+ANQ0
0s6wjXyvFulGkzoJiDW4
=1qyf
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
