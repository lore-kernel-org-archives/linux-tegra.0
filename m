From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/tegra: drop use of drmP.h
Date: Tue, 13 Aug 2019 11:30:17 +0200
Message-ID: <20190813093017.GA1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1700089999=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804094132.29463-3-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1700089999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:30AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
>=20
> For all touched files divide include files into blocks,
> and sort them within the blocks.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/dc.c    | 13 +++++++++----
>  drivers/gpu/drm/tegra/dpaux.c |  5 +++--
>  drivers/gpu/drm/tegra/drm.c   |  8 ++++++++
>  drivers/gpu/drm/tegra/drm.h   |  3 +--
>  drivers/gpu/drm/tegra/dsi.c   |  8 +++++---
>  drivers/gpu/drm/tegra/fb.c    |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c   |  3 +++
>  drivers/gpu/drm/tegra/gem.h   |  1 -
>  drivers/gpu/drm/tegra/gr2d.c  |  1 +
>  drivers/gpu/drm/tegra/hdmi.c  |  5 +++++
>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
>  drivers/gpu/drm/tegra/hub.h   |  1 -
>  drivers/gpu/drm/tegra/plane.c |  1 +
>  drivers/gpu/drm/tegra/sor.c   |  3 +++
>  drivers/gpu/drm/tegra/vic.c   |  1 +
>  15 files changed, 46 insertions(+), 16 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgyYACgkQ3SOs138+
s6ET1Q/9FATaE8e/ljpukBw2vJqgwCk0lAruZ55ljBkh0uH9YwvQUq4kMo2agPHD
Q+lcdErT2IqaqqRbotzUryatC26aT7l1QmxaEtgU/uWHLIC8k3elpOMz9CNIHSDh
1NVAiBKMxQtG5nqWWmebr8v/e3Ae9vvxXxbtuMW6YlbupGgp9NS35a5jEzdJhhYW
zqkvUcFZ0xigSmUYBgGIzukI/+q375A8x6JGBiV+/ymu6up9yRO/3OoRrHDCAalt
GCeXyR5drV9Co25GGwGcfIJOF7aIirBhBhVJS25ArXh5uEz8+vhZCcu7UrNC3o40
/QVuTJpyAn5kdW1d8n0MKE/1+dnqapM+W8LfRQAyg0ySftsLDaH8TLvHsRD5gstO
N1KwpqVaKp4a1LrFwVuA2aTG31nSf68rfF9fRUmTNgu2mV24o5Su7yuYYG+vt1pa
LkVTtV8gWHxePSrcFGEaT0fGMmM40fq3qMNi3o8anq20Kw5d9N6PJfx07bMZdlDr
c4IPLKomLE4yJVAkF46+p3hWeGPyhGvUVkt3SGWOO4LTIuC7n4on82NZ+UJv5Eao
bffeD8rCscHn9hVbXm1p4jE9CvIZHWqkfkBxpL7GUP4M2Wg+qp372A8LVraUjsXg
AucjRSo6WFs2DQZf9+jk8xsvJ1QMUNT3cKg+jPfLPZ3wwr0Bb4o=
=DQVr
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

--===============1700089999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1700089999==--
