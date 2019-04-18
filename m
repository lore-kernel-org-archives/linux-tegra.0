From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: gem: Fix CPU-cache maintenance for BO's
 allocated using get_pages()
Date: Thu, 18 Apr 2019 12:00:48 +0200
Message-ID: <20190418100048.GE26909@ulmo>
References: <20190306225519.4538-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0944456498=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190306225519.4538-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0944456498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 01:55:19AM +0300, Dmitry Osipenko wrote:
> The allocated pages need to be invalidated in CPU caches. On ARM32 the
> DMA_BIDIRECTIONAL flag only ensures that data is written-back to DRAM and
> the data stays in CPU cache lines. While the DMA_FROM_DEVICE flag ensures
> that the corresponding CPU cache lines are getting invalidated and nothing
> more, that's exactly what is needed for a newly allocated pages.
>=20
> This fixes randomly failing rendercheck tests on Tegra30 using the
> Opentegra driver for tests that use small-sized pixmaps (10x10 and less,
> i.e. 1-2 memory pages) because apparently CPU reads out stale data from
> caches and/or that data is getting evicted to DRAM at the time of HW job
> execution.
>=20
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly4Ss8ACgkQ3SOs138+
s6H/pA/+PnAiqF8BhsLe/ca70FozOtJ2QQSCeaOEIHTZZh1O1igrR7pyLdRdOG3k
iHz9bjdIpXEwb5Bh0H6QvnS0RUs/LF/q2wnrYl/oy3CkqfmrAwAUc0KS9rhHxyy5
gm7EAiCwYr7WEwDEMkUwtgkibfBolvOfHe7wdmnPyPIXjsdkfea8/GynrFZ7FT0C
eAXi4aMqfSNHvq4Ns6ixR9huXWPuzZOsR1HFWG4TBMUnfE+R/jeNa65O2r/2JbGH
gDHxp6fXlvkY2294AQWcPFB+tWRkxxQmkWmHLFP7C1VGJ4BE/G0E2LQxxgzZxPky
96Lewz4/r5CItiUjDM/F9EjyhfqzLI35mFl2npbfESPmyc36NBsEVxLmi6lbvQES
WkuX54Of1LL/D6hHG7fIW524Q5QKBM2WxZZ7phNA4I2C5boJUARDYD9u/8u/AbeQ
dAGfyqkJ/BFgwFJ2JzBZj5WEZSh2W3JTCbCRYKMBRHijVYr9MiCw7UNJW7aEYaje
yP8rv/gZk0aQVKiLTiIpdA/m2XbGuGEvOY/mhNkY4ajKvMt+ESDHJN4HuPNCwees
Nx2dC0pkduqoiwLwFhxwRyFQp8ZolCLWnc83U4eDwjcn38U5RvIjGxek8UU0WTcB
rBW3ICwawPTQt9aj43bEDSzscO9/M9DbpGs8pH9aWrpALMWSQOU=
=fPhS
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--

--===============0944456498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0944456498==--
