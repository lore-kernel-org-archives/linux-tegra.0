From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 22/26] drm/qxl: Use drm_fb_helper_fill_info
Date: Fri, 25 Jan 2019 16:14:41 +0100
Message-ID: <20190125151441.GG22565@ulmo>
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
 <20190124165831.16427-23-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0240717908=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190124165831.16427-23-daniel.vetter@ffwll.ch>
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0240717908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2019 at 05:58:27PM +0100, Daniel Vetter wrote:
> Another driver that didn't set fbinfo->fix.id before.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

In the subject: drm/qxl -> drm/tegra, with that:

Acked-by: Thierry Reding <treding@nvidia.com>

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLJ94ACgkQ3SOs138+
s6E0ng//ZijxlvGxnreGg36yW1q0+6Lbsa1XX6GOoHvUMKCNp62dCbCWgwkUkd/N
KmfcE2XD3XqbzbgWIJNiZhyVrz+S7vh4Pm9MtZ5nIUMGZ1od7dYNhH/w7yZ5HhJa
+8yg+eBZsHyIXIUmkbhlnQj9iD0VkBSK0v6eNyDkfSXGkfm6a2mnmlgPFPvi/Myf
FQsomPLHa5vEprH8/OGAb7xRCs0kQIoStQz6mC7uJiFBnuaM5VKVAJdLzQsFAVMK
Nw/y3ykUjrDsKmCUy9eKmTJgRWh4vf4C5hjEEKWgOgsPnzi7S9CfV3/odX3yJJ/g
r5OBzF4c5rhErR9j2F9qcpiF/rAMojPX8iFhjXYDQbQomku2HgfwBl7rPGo49syQ
y4n3cNqwwKpGXwRdKEUNCkaLa56gY1cFzJJcpj3fN5rOKY5EdW2oyy2nf0avlPox
9H0RDke0UWd2lyBDnFuoL+EaS3Q0kp64JIMp9SRTJWHaTaSPZQRuCEdrjgr6LbKh
+n0CzQAEFyORxhiIpzlGfadFXKsdiekGVyQcUWHACgcz0NLeZQeTfWu3ZAydIPlj
0TiWV+ffC6Pn7tTePED5mL4IJcNt13Lj6NSkdI/Ubl1ZP8dZSCulgis6znVQRxJs
+1gmKH377JE1o2h7Ce2U72fyI7mnQMq70lz6SY9T54e3cBvUq3c=
=N9Zo
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--

--===============0240717908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0240717908==--
