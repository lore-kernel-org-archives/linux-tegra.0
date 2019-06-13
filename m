From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] host1x: debugfs_create_dir() can never return NULL
Date: Thu, 13 Jun 2019 18:35:55 +0200
Message-ID: <20190613163555.GC3258@ulmo>
References: <20190613114522.GB13119@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2124598462=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190613114522.GB13119@kroah.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============2124598462==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 01:45:22PM +0200, Greg Kroah-Hartman wrote:
> So there is no need to check for a value that can never happen.  No need
> to check the return value all anyway, as any debugfs call can take the
> result of this function as an option just fine.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/host1x/debug.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ce2sACgkQ3SOs138+
s6HtohAAuBwOWfNSd5DrSgcbmINlg+ErR56mOn0jMcWxYmAXsshG6USiEF5D+w44
V4jkx+IGs7r8Yuqz8SyIjjjPXBpDY0oV/nMowpjyQpgKS6/FQINxZ4qPb6wJl1Ab
YgERmRpVFPIV/KCQN+2GHQc6DBgp+OL/WYBTLESQsJVMTIbzaHrjRJxplR/60g8n
um2pDZ5Cn6gDK5T5K//IdVcFHYdt8z0SDof6fOSa5iKLoSW5dDa9Pz69awcQfqI/
L3BklL7jts5HFfNDku0iYljHGmssoaHrv+z5zkYleJkQYgpR3Uv4k+IiL0U1Mdeu
9n8CwlbCPtdrujBHQfDuQ8kGxxhQ4knkbyO8Ovw1aoQRBAOtRYRz7jxMzWTIaoC+
KUUPGkxnGopPrHBGZ++V6I10fL0f2EjYwECN40VVBF2aZHY5fAcpOtp47d1rLalO
dnjaSCcLjkJTAAalVdyA36IPEjKKA7LEFCczJkky0E+bUzDNMe+GuOWjBjn27937
CGOqZkT++LOo0Dyi8aZX92RxjINfNPHRgQox5FoQ7Fl5twxu/fgxj1IyAhLnDAa8
ayIduhhakQsvDDGdhbzlWpN78syxyj8JE+vFZ0Deoo2lddbXypj7fzbr5Xq31LvK
OM72mQ9IwoWLNFfqYDG+rDYZroG7qtdZf2ThT/LDxDGah+fnklk=
=NLIL
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--

--===============2124598462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2124598462==--
