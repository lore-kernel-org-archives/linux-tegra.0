From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Acquire a reference to the IOVA cache
Date: Mon, 14 May 2018 12:57:54 +0200
Message-ID: <20180514105754.GE18312@ulmo>
References: <20180514101301.32188-1-thierry.reding@gmail.com>
 <bf3e90f5-8111-6035-1313-e43fb5bd6baa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1778515087=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <bf3e90f5-8111-6035-1313-e43fb5bd6baa@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1778515087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 01:34:27PM +0300, Dmitry Osipenko wrote:
> On 14.05.2018 13:13, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The IOVA API uses a memory cache to allocate IOVA nodes from. To make
> > sure that this cache is available, obtain a reference to it and release
> > the reference when the cache is no longer needed.
> >=20
> > On 64-bit ARM this is hidden by the fact that the DMA mapping API gets
> > that reference and never releases it. On 32-bit ARM, this is papered
> > over by the Tegra DRM driver (the sole user of the host1x API requiring
> > the cache) acquiring a reference to the IOVA cache for its own purposes.
> > However, there may be additional users of this API in the future, so fix
> > this upfront to avoid surprises.
> >=20
> > Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/host1x/dev.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr5a7AACgkQ3SOs138+
s6EGfA//XCjxKtOzlQJOfQkg1aORJbHFnfwr9mWl1PDJH43HoHuaSBso556/lzR4
V1WwVTuoSRld0xoX41FvgTcU3XsDzAbBOuUy+GU7n/xPW9XXtULiT9ln/h5noTzv
g5wy0Fx81fe2pECLs6aiA/fcAikHqX/hKasgSyc1jVKqbsfg35A4i7mTcrOSKvPh
zik9UZ1tE8q9Wi3DQBk2mMAgzQO8cI5bnvrmK97Rnv4WNpTZcQ8KPxDTq3790Q7D
cvC9SXQo4aDBYAdVq7DsW93COWhvmUza6YvuhIuiLIBqpHp0/KzHeDTf5yoIJNA5
jdeI2RMkIa9ND/aVVW9r3w8m3weqQu1wbY8yc3i6kvLV6yoGtga/YmZgCQkBixrq
IXnZTKUJV1EoGSJ60o0j5ybcsP+rQ97X/yivaH1kMaJwZWIoeMZIZpEn3YlzszkO
LHM456vt5ogoZHFTRtsfWawkP19dP5Cp+/WsYeuHa7loXlnuAR9Dj8/94aYvrBEw
SUROzLgGx9dKNiILbV7mY1whQWIq6USRwXSCnW6+8cFEUHmxAZR5NnkUN085tBLN
iuE2aBLZw88lir/InMeDZujmP5iXcTL0ELGtizyPioKe6ddGk+c4tNytW7DAbdTN
nxm5Md4i/lvBi6MDajQyg5ILCxysX6tXtw5ITb5qCvMWuelMO6Y=
=pBuy
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--

--===============1778515087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1778515087==--
