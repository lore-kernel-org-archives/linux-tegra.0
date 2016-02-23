From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Set the DMA mask
Date: Tue, 23 Feb 2016 17:04:40 +0100
Message-ID: <20160223160440.GE27656@ulmo>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
 <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0497534444=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0497534444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Content-Disposition: inline


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 03:25:54PM +0900, Alexandre Courbot wrote:
> The default DMA mask covers a 32 bits address range, but tegradrm can
> address more than that. Set the DMA mask to the actual addressable range
> to avoid the use of unneeded bounce buffers.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Thierry, I am not absolutely sure whether the size is correct and applies
> to all Tegra generations - please let me know if this needs to be
> reworked.
>=20
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)

This kind of depends on whether or not the device is behind an IOMMU. If
it is, then the IOMMU DMA MASK would apply, which can be derived from
the number of address bits that the IOMMU can handle. The SMMU supports
32 address bits on Tegra30 and Tegra114, 34 address bits on more recent
generations.

I think for now it's safer to leave the DMA mask at the default (32 bit)
to avoid the need to distinguish between IOMMU and non-IOMMU devices.

Thierry

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzIMVAAoJEN0jrNd/PrOh5g4QAMGcE1SjSsrKg9rVPjneReq8
Wi529GoSsgADetbS4yzp9VP5f4mWR1+r+GAA9SPbIxmeDm3xxyLVZwY04iGzBehu
IRMhrwQMbt+M6Tn83+qMgFrS5iuhhAyobr+5UB2uQhyG/eC4RvJaQHB3okDIPiPr
Hgr2fua5rame+OE2J5NSqplqpa9NaLwhDVgb4r6sIQdyE7ERD1S6CrwpeY/G7Liu
e9jB66Z+xGkQzBbVEUhoXVtoOz4FHlhgJwg7nCMcy/YPhMc1aJZ0WXwssJkaF1z7
5pz3RT56/rqsiMR/IQL6EEKGRTH1tRU52Ys2O48+BjNAZlpEWoj33O7OAOT5CjUs
nu1Syn9bvoXv2SBHw0wlUUIirHw9zfKgZHHBuShylyIuZlk4G8XVl2S5XiB2i4UZ
OwSbfPl+KfqNx+6tf55qGzhXOyFTU1Ufs//LGySA65SXFrW2pmVzthw4NxQcUKqd
MNa4vP/O2b0BDAkUZukPDFqD7FNLLyZtvpqdUA8W6gJ4+2NstEmJGntD7XuZQ00d
jubXUjJDZDBC9dEUh4bDzeOq+I4uBsEv5pW55Vtoz2H2+yrplnYenCLjJETkbVFY
tuxr0i18qExp6JJygyCdWWepZ5EmXYln9lIDx4hzncRzhuYGq0FsorflEZ3eRYol
TnPIf9qJ/5HFTO1yRysy
=K/n3
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--

--===============0497534444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0497534444==--
