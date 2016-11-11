From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] gpu: host1x: Store device address to all bufs
Date: Fri, 11 Nov 2016 15:31:11 +0100
Message-ID: <20161111143111.GA4967@ulmo.ba.sec>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2025701901=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161108175135.32004-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Andrew Chew <achew@nvidia.com>, Arto Merilainen <amerilainen@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============2025701901==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 07:51:32PM +0200, Mikko Perttunen wrote:
> From: Arto Merilainen <amerilainen@nvidia.com>
>=20
> Currently job pinning is optimized to handle only the first buffer
> using a certain host1x_bo object and all subsequent buffers using
> the same host1x_bo are considered done.
>=20
> In most cases this is correct, however, in case the same host1x_bo
> is used in multiple gathers inside the same job, we skip also
> storing the device address (physical or iova) to this buffer.
>=20
> This patch reworks the host1x_job_pin() to store the device address
> to all gathers.
>=20
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYJdYrAAoJEN0jrNd/PrOhMfoQAKq8uPC/oUOkKqliUVS+aEFM
zIHZMeNGfmtiS2U6Zsy9DBZX4lHb/fesehCENiIdDzeK3wXZWMEsYXDYGVp1J2wP
SJQnYdu9WBiwai73ig06NwK01d+AC9arWPE/s2vUxBlvDxM6Bh1DZjEto3yPXp8X
Dsj9S4sY+BHGiKQOsQLmzlbc+DWjB6BWWSXZ1zD7AOvtpPRPa6buILJaeed3BXqW
JNIQk9QjmY9lbAnrc8FsvFtbyeFfOSIWvbBHNSrPBesIiSK0bgRS2BhI6lKqdTgL
6/kjUZrrqs8cI+XAEyw8n/1ngQx0yJTFvvkTvN4IdD0sN+GulvwHdk/ZLX69rgkU
8mYUcBkvnsaGfymtORZ6fPYQVSLv6KVwT96BvCuPGE2OUGlgjtX0av/w+pVPxvKS
JcRqba2wseCiygbc/+3FTgGoaqOvBK9dWiH3O7xl1WhfAWrivgxXS7q8pkhGYfbS
4sar7zf2ieWHt2jr2gMqiCNrv3OyCqLsjuXrxwtK99hylX4HTYCtv0n8wK25YOn+
y398EAmobHr+w3HEvcPw6dKptYm8jj8Oy8LvWq50hk7/cCgfxtO64EbZyWLk+nAw
cQSK/1/urxjU+z0IyHDAYzjyjPHg7t+mMiGN29trfPWr/3lQy1yuaOpbRmBTdm3a
X96KM8suPpxHcILmkXrp
=J1PR
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

--===============2025701901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2025701901==--
