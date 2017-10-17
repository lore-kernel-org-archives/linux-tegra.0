From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/4] soc/tegra: bpmp: check BPMP response return code
Date: Tue, 17 Oct 2017 12:41:08 +0200
Message-ID: <20171017104108.GC30589@ulmo>
References: <cover.1504776489.git.talho@nvidia.com>
 <8be4357544ffb9a60e116bc0a666189b93951c91.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8be4357544ffb9a60e116bc0a666189b93951c91.1504776489.git.talho@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Timo Alho <talho@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2017 at 12:31:04PM +0300, Timo Alho wrote:
> Add checks for return code in BPMP response message.
>=20
> Signed-off-by: Timo Alho <talho@nvidia.com>
> ---
>  drivers/soc/tegra/powergate-bpmp.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl3kQACgkQ3SOs138+
s6Edzg/9GMDzWMJeM1VWzwn3w4snls0ux4fMpDZMzB3SB+Lace6H7KU5EOuSgLBD
gsO1MVtfr/VEj1Xczbn/J2MjE97kwpzriDxsdqVaeDzffBwqslA24rWdZxAnjpPz
Nj5GNaCtNV8d4r2yYPVsjeCq10fwCRsq8e0NClD7//BctOrVogJ9E4S1egxKiQx1
Hu+j3u35SXfihQJhRRoSR+ONyeKSFddtQuI4TDvKDUJbCo/SwzmXae+I6P0GZzrW
M7k/+Mklz8k0X4AQrsQ5j7483not6rJ4vaz0aWduCj08HxLa3uBY9lBgooc9cMw9
xr/g5RCDyPEFakeVPqdn9iKKwlPwT4RRG109HQDkDCcT1jwlZ4Noj1Siz4p5/Ywh
GHAikwg1l6lL2kWcPYlA+2142lDOffZjpDKYTWywUKJ3pQsWsfsDGZa3q2+cKM6N
+mixRUj7km4IHkgEJ4dzY7EANcpSmTHwMJyWl/bIQGJiTdpeeqnJDWPnUCD3E9fA
Ts7lOyFnuXrwoC8HIrNTNamyCyNh9AB/CTu9KE6ECH7BOrq8TtZJa3TcIQACTI98
cT7pTqkRtM8BV37PjJvH2p54roQHoAvAtuoYJ3BmaWI9WaVnSMKeJpj+3XzOS5LH
z9FlCacrcbllX/wdnmVmPHGpFO7r4lL+kapiHqkH7A4mvWKO2Xs=
=ck2u
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--
