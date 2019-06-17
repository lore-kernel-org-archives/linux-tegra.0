From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/59] drm/prime: Align gem_prime_export with
 obj_funcs.export
Date: Mon, 17 Jun 2019 11:53:54 +0200
Message-ID: <20190617095354.GE508@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-10-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402900301=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190614203615.12639-10-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Feifei Xu <Feifei.Xu-5C7GfCeVMHo@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thomas Zimmermann <tdz-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Jilayne Lovejoy <opensource-y0T6pEZso2lBDgjK7y7TUQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Mika Kuoppala <mika.kuoppala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Matthew Auld <matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zhi Wang <zhi.a.wang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>lin
List-Id: linux-tegra@vger.kernel.org


--===============1402900301==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 10:35:25PM +0200, Daniel Vetter wrote:
> The idea is that gem_prime_export is deprecated in favor of
> obj_funcs.export. That's much easier to do if both have matching
> function signatures.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> Cc: Zhenyu Wang <zhenyuw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Zhi Wang <zhi.a.wang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig-5C7GfCeVMHo@public.gmane.org>
> Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: "Michel D=C3=A4nzer" <michel.daenzer-5C7GfCeVMHo@public.gmane.org>
> Cc: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
> Cc: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
> Cc: Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>
> Cc: Hawking Zhang <Hawking.Zhang-5C7GfCeVMHo@public.gmane.org>
> Cc: Feifei Xu <Feifei.Xu-5C7GfCeVMHo@public.gmane.org>
> Cc: Jim Qu <Jim.Qu-5C7GfCeVMHo@public.gmane.org>
> Cc: Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>
> Cc: Matthew Auld <matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Mika Kuoppala <mika.kuoppala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Thomas Zimmermann <tdz-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Cc: Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Jilayne Lovejoy <opensource-y0T6pEZso2lBDgjK7y7TUQ@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Mikulas Patocka <mpatocka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>
> Cc: intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c          | 7 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h          | 3 +--
>  drivers/gpu/drm/armada/armada_gem.c                  | 5 ++---
>  drivers/gpu/drm/armada/armada_gem.h                  | 3 +--
>  drivers/gpu/drm/drm_prime.c                          | 9 ++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 5 ++---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 8 ++++----
>  drivers/gpu/drm/i915/gvt/dmabuf.c                    | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h                      | 3 +--
>  drivers/gpu/drm/omapdrm/omap_gem.h                   | 3 +--
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c            | 5 ++---
>  drivers/gpu/drm/radeon/radeon_drv.c                  | 3 +--
>  drivers/gpu/drm/radeon/radeon_prime.c                | 5 ++---
>  drivers/gpu/drm/tegra/gem.c                          | 7 +++----
>  drivers/gpu/drm/tegra/gem.h                          | 3 +--
>  drivers/gpu/drm/udl/udl_dmabuf.c                     | 5 ++---
>  drivers/gpu/drm/udl/udl_drv.h                        | 3 +--
>  drivers/gpu/drm/vc4/vc4_bo.c                         | 5 ++---
>  drivers/gpu/drm/vc4/vc4_drv.h                        | 3 +--
>  drivers/gpu/drm/vgem/vgem_fence.c                    | 2 +-
>  include/drm/drm_drv.h                                | 4 ++--
>  include/drm/drm_prime.h                              | 3 +--
>  22 files changed, 39 insertions(+), 57 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HYzIACgkQ3SOs138+
s6HxLQ/+IJSDeTbnIzRqn4TaMdKNu1FVggK+ADeKsMTPzxC++oZbESUWovyZqtXH
d7Bo0CLqgkYPEVs2gY7wwfqgGb0/TdKgCFrh9qO4Bw3Yy+zz3dnypNYa/fXqacwe
5hacUyrJ33Q8uJoiCgmys4ePTIM5xnxLGkqdBxRpXeS9Jrnb4d5+2WWOCk2sRee5
oBODNqNNam6sL17u1UlFf+6AMVcs3vjn3RHC+cLDThv+ScNQHOMVzIXhX20DQ7fr
N7G0yOPDWSeLJoPZExyaBUeu/JTj/TL9I1QZn3+xqghw2cw5et4ESgotC19nz01z
Zy+TVn4/xCbhUDMid5W8EkqamqHfwHW09hmQAWgVVU7tSpx+l8T4ET/XZv/5pjlN
AUlKLNhwuGS9vV7EJMm36w6IuSlpZixK5fkeytOnqKHHxf37a5Zarp8YYBsdNsrm
2AUGAsFuN6yBn45aBXQJFGN0fB4FfX4uY5up2dtZp79mdCr/w82UJeHRy5fh2rmq
pXlAspYSybP59KN6H0dNcrRHipfVMIuXbvEB00OteWxmu7C5gdyNz5Kcklz3YOdo
jbEyhlTQN1yMoGhDjekGqQAANCmUtwWuUWCeJx8M3Wzu9RhShdLscJC8Uvp69Bm9
pnZLmgDIx0kl21NPmaP9fWIXSflV5D0C8bfDWY43pHN7q3dtNKQ=
=OSua
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--

--===============1402900301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1402900301==--
