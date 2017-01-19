From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm: tegra: shut up harmless warning on NOMMU
Date: Thu, 19 Jan 2017 12:00:58 +0100
Message-ID: <20170119110058.GD30182@ulmo.ba.sec>
References: <20170112111425.3228358-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779265974=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170112111425.3228358-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1779265974==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2017 at 12:13:51PM +0100, Arnd Bergmann wrote:
> The tegra DRM driver is almost ok without an MMU, but there
> is one small warning that I get:
>=20
> drivers/gpu/drm/tegra/gem.c: In function 'tegra_drm_mmap':
> drivers/gpu/drm/tegra/gem.c:508:12: unused variable 'prot'
>=20
> This marks the variable as __maybe_unused instead.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 7d853e6b5ff0..63f14b7a59a0 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -505,7 +505,7 @@ int tegra_drm_mmap(struct file *file, struct vm_area_=
struct *vma)
> =20
>  		vma->vm_pgoff =3D vm_pgoff;
>  	} else {
> -		pgprot_t prot =3D vm_get_page_prot(vma->vm_flags);
> +		pgprot_t prot __maybe_unused =3D vm_get_page_prot(vma->vm_flags);

This seems to me like a suboptimal solution. The reason why this fails
is because pgprot_writecombine(prot) for NOMMU translates to __pgprot(0)
via a macro. This also means that we need to potentially add a
__maybe_unused annotation to every local variable that stores a value
that gets passed to pgprot_writecombine().

There fortunately aren't very many of those cases, but I still think
that a better solution would be to turn pgprot_writecombine() into a
static inline function, so that the parameter would get silently
ignored. Or perhaps if it must remain a macro, then doing the following
should still avoid the need to modify every call site:

	#define pgprot_writecombine(prot) ({ (void)prot; __pgprot(0); })

Thierry

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliAnGcACgkQ3SOs138+
s6Ez8A/+PEF1HeYHQziB+BNMghIdRWy56xkuFdI9/ShFVAt0u2stKjt5k8exDngo
NcHS4sXzTtIxw2kv/TV+5qhE/OUUv7BWm3R09MvIiRuwL3KiGlmwdIbV8GbFWpFY
jjKiXDgHhbRKlEnq28wFhTfvaty/3xmrDSLMN+1iBB970fNYLgTD8dLpYPxhnFp7
YewWxmjDg2NFpYdW6o1vbS31YvMnJxBGqHmUdNfvIt6kdwcBil0ldhLzVoZCb3vG
OUDfGXdZ4JgkVmCQiCszyWChLJd0JgFTvytHRgVpUQRLaRkmAQHrL16kI1zj8tUg
CHmLhQU2ACGUFz1V2qsfNCoCS0ZQjzNCn93rRBGkltEopIv+3dGc1PhG1kCDGEFw
Rm6GCXfGAjiwkNpVUg1mpsue3LYadMvOhmLDV0R3dqWU0BQ/vwRamgvlAeIHWiGp
fk1POIpK29B5sn2DFYAZc8Dq9CaIeSg9DAdQuzqimQZsZcqGsOPEgnwFarS6HpLh
lEpO/nOWDkMEgm7iTjxnKji6DKtQ8NyPtYo6TlQ+bylThclnNen0FvHiokDFcu8E
VFmu9f0kbPnBKEo8Iw71ZPH81NyCPy8NOlruQ3c1s+a650v+REFt0mOGSVp7a/j9
xpAbUAjMDOOGEwk4hzg3HtSxf3ME8R/l4hjG5+dmqxuqjXwYz/M=
=fPBe
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

--===============1779265974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1779265974==--
