From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 18/21] drm/tegra: Use drm_fb_helper_fill_info
Date: Tue, 26 Mar 2019 15:55:09 +0100
Message-ID: <20190326145509.GB21654@ulmo>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
 <20190326132008.11781-18-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1541298346=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-18-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1541298346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 02:20:05PM +0100, Daniel Vetter wrote:
> Another driver that didn't set fbinfo->fix.id before.
>=20
> v2: Fix subject and rebase
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyaPUoACgkQ3SOs138+
s6GGEA/+OBYglezl2hy2tTm4ZnAOp8R7S5CGf96bjbhy9G8wUj5ys1+ww3CN+neF
h6mFbYXMXguAzcHWxthLEYnhIAByeV09UOM51/NZZh5P47v6VndxWR1DhCJEeMa3
TKKzaTYAgP6dsQyLc7d3zo34BWBexppvZJYAGlzjw1ibDbqO8/tKggDjMQzpgkAa
Y5f7S/7lXA2UzZsKmcYkx11S2vWY4y58PI/DPSmadtIXtDR6gZRT1GUcznIplqSA
V0FW2bZhE64ScA7fpusSZlnTkhdkh82AhtOH1c8UDQJyTHJM/PEZVj60WonHMOYI
Ox6/6lZ8QXR1ieKOMbnf19fWNl0qWrFY12Ro5Vp3RM7pEVQjujAPzeGNTL21+Ypq
ZQlvZMOcYIpe1mSpNWMMVyZepz8Laxzz4x4SyLtmgWyZVyk1woi7xK1tiv6ZrBeZ
0aPEzeyKjYcnCl58ZsvvpKu+rtLRrOO7oLQRS45ghCuhFJ3CsEkBuTY+RH3/WCr6
Rjrfw/ttwwcA6ULLIcGuylD0IEbg/Wg54dTwolpASQcGOU4Wp/mYgPztPHzYyG5y
eM7777X+am1HGcaCrKOOW5vjqLNHtF3IKmZzkO+4EHOF4RbJBwM608UYkEW2rpSc
rGwUS9V3HEaPR7LyIwwJ8na40ur60NY2t26h2Zd3u04RT3mlsm0=
=mmy4
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--

--===============1541298346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1541298346==--
