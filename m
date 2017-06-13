From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] firmware: tegra: fix locking bugs in bpmp
Date: Tue, 13 Jun 2017 16:21:56 +0200
Message-ID: <20170613142156.GA20181@ulmo.fritz.box>
References: <20170505053723.53qi4ob3df4ri2v4@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170505053723.53qi4ob3df4ri2v4@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 08:37:23AM +0300, Dan Carpenter wrote:
> There are a bunch of error paths were we don't unlock the bpmp->threaded
> lock.  Also if __tegra_bpmp_channel_write() fails then we returned
> success instead of an error code.
>=20
> Fixes: 983de5f97169 ("firmware: tegra: Add BPMP support")
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Applied, though I did omit the err_ prefixes from the labels for
consistency.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/9QEACgkQ3SOs138+
s6GThxAAhjznPNt1rb83yH2UGJtMMR7Plf/AjdPK2ZeZlZ1k1VGfZQZrKRjH9Tp9
XkMpRzHxx9THDg9TO8JrwSXfN/Pj/8FMXdMJMFYQkhdSyLPTgM5UWp2iwuKr2yQz
QSQIJdil5p3Quo3W73Ennh7LePUPDk6RfqgaOUrkeJErVfw0ez7wGks9ZlzC1Tsy
H/kceV6pM+giicNxfobB080dwSA4RF3tfP7GaVRUwf9Dh6+l/Pb7f3GxVckl5nts
cjM+VJPxbVHjArV3hqrqV3rDUHzhzPCTvjpEwPsw3ODSp1Rtf5o+BCr4CsuEDoqg
TLd+4yXHpzNrR/UCDIPOzCEgVJDwIu2JKnsL4MsUiQRhze7ffdgjg4zGKcQAdUqI
N1PzAlGEQZa+uw4D9lyMms9P3ANu3yWk3x04WReqNqa425yAPunEZnEsn2Wjve2K
18CLAcU6yBrVVmIfCzLlHvvwe/ClvD+9S3Lx6NQK4ntlSCRfpORnJyT6MGbPc1MT
CjvUfFirKSGv2hqeLJQ12hFV2wJP2t/+E4XLrRxhW6qZAvjtQEN/DUTEj8/TuJcz
WAnmtKSsMVbxf+eiuLVbQKsIP6KbECc515CsXzHIg9yigkhRQJwS0UcELJ3zwdvP
QLrkBXs8DYga9LRVclBYkLz2pioYp5WHoNyjc3+F7cg5wKJVCNA=
=vqu7
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
