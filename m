From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 6/6] drm/tegra: Add Tegra186 support for VIC
Date: Thu, 19 Oct 2017 13:40:02 +0200
Message-ID: <20171019114002.GQ9005@ulmo>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905084306.19318-7-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0661584385=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170905084306.19318-7-mperttunen@nvidia.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, sgurrappadi@nvidia.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, digetx@gmail.com, amerilainen@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0661584385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAv5+T9jbwMPl6Kw"
Content-Disposition: inline


--HAv5+T9jbwMPl6Kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2017 at 11:43:06AM +0300, Mikko Perttunen wrote:
> Add Tegra186 support for VIC - no changes are required except for new
> firmware and compatibility string.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  1 +
>  drivers/gpu/drm/tegra/vic.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)

Applied, thanks.

Thierry

--HAv5+T9jbwMPl6Kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnojxIACgkQ3SOs138+
s6HGjA/+L3geVT/VuhXgsC860FnBccZC6n0H18RyFWrT4TECsBbjxLG70Ihi+YKj
5ASnGuustekN81LYdTFdM8K7xJKbhvbCrvPjobuzr4zMtWwP02kDGU0+5+EiOPZ0
3Fz4USMfzOF9lL6vuH9eON96spQ5p/+Ntubvfa/89UJjpL3HXkKNI7kjXmSXNSyY
NcrQEF4x0fz07/9vQQBt8Geo9mdR+rAbrY9vTJrXDlUFheZMu2XaehcpAztWDsSB
cHKXYrmPurMGawf57cZVR8jCGPpUmRGKBEw9GanAol7pUAkPlxN36BVF7WxR4Yjm
tRwckS99tetcSMB8B9zhAh4D+1gkVuBSwmti7vgLCX7K1hcefPnCOViZ7CQ+0+vq
P9vEHOxuJDuSSZza5u3UaBEUIqngJ9GLfGv5eUmKYDpMlC8CD3BQ+ybW5Ekw3Cxc
x3vwTb/5UrIZGnreooZUkVDZpO7gXtVB3IB2GDCfxWUVndSyZ/sfmZ5dkYjO1BF/
6waETWHQNMmrrl9VgO/FA6dkl3BPf3h3ZBv65o9lNBq47GkTBRuAXF9/aC3eHO7U
v8ImV9dhuO/CLCkrBXyItgFVmXigfIRJelHXwJn8l/pc05zMA9Ik8zZP/vBMtt14
Wi9CpkvWPESqblzcf0BkdPpcFONQsb7+MNbQAdS2XvdH7PDhFq0=
=8hFn
-----END PGP SIGNATURE-----

--HAv5+T9jbwMPl6Kw--

--===============0661584385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0661584385==--
