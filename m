From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 07/22] drm/tegra: Remove module ownership from the
 tegra_fb_ops
Date: Tue, 13 Jun 2017 15:43:40 +0200
Message-ID: <20170613134340.GG16758@ulmo.fritz.box>
References: <cover.1495498184.git.digetx@gmail.com>
 <b90497ec1e9ee182cdd4a19466c516e3b0553939.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1513790607=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <b90497ec1e9ee182cdd4a19466c516e3b0553939.1495498184.git.digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============1513790607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Content-Disposition: inline


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2017 at 03:14:22AM +0300, Dmitry Osipenko wrote:
> The framebuffers console fbcon_startup() increments the tegra_drm module
> 'use' refcount via try_module_get(), causing an interlock of the DRM subs=
ys
> and the tegra_drm modules. In result, the tegra_drm module can't be unloa=
ded
> using rmmod.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/fb.c | 1 -
>  1 file changed, 1 deletion(-)

That's done on purpose because otherwise you could just rip out the
driver from under the framebuffer emulation and things would crash.

My understanding is that the right way to unload a module is to unbind
the driver first (which will cause the framebuffer to be removed and
hence the reference to be dropped) before the rmmod.

Thierry

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/7AwACgkQ3SOs138+
s6HD1RAApovTajS6LpYQRc+P+INcp6UL/SSsHq1NYy7XosjYWOiU7QKDOatCR4F6
XG8XnGCkciYXzuOxZax5CXXvY0hkxYBOM3KEjyspqEhAdcq85duSs/+Nbbj2KZT9
q1FkKWQGPKTP5mFC/KrzC+xLhUp7ldEaFWkPg3NNf670kDW4g/hW9xO1INxrjPRA
BPR7xlnV1PTowAoZIztnWNi4xgMfrNBJCgthCRk3Wx/ro+ajUcGKYtvU/U2D9X6d
f5r9LfP8z7I2Kh/UCN1sPwIBnI02bYDLCfxInKiNza46Y4Al/i7qxh6BzO5t+CXJ
sUogQ3yaUr/TeDtPfSs6xm1KY0xWfqd3GKysPumlFbWKdCWnlVf/IMMLVdy9W+bk
fr2l05mZq0vIukUORVdVJvpmTHPaTW2j41ueanX/eHY8bNiCY24BetvXGNrp1orD
FaBGkpZtddwZ2Or70oZvqNaVqu083NQZFgHRDc77nBEFOkOkHObQCLdxiSt1F/CC
vwvieleWerDqTNaJgvbWq3q3iHFX5FESG6sRlFVQ10KB7/r5NOrsoI8ofAMyd0h5
OgC5A16TMKcCZ2rmclVYCXnpiXh57l68onAm7u0Fjf3oZ70KrbuIy//hGE5fkTgC
AjInOD3nlN8+oHqko4Ero11GuPxT2LrAs3qqr1/eX3YW9BYWD+k=
=Xhaf
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--

--===============1513790607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1513790607==--
