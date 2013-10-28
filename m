From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 0/4] gpu: host1x: Add syncpoint base support
Date: Mon, 28 Oct 2013 11:06:38 +0100
Message-ID: <20131028100637.GA12355@ulmo.nvidia.com>
References: <1381753315-21778-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381753315-21778-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 03:21:51PM +0300, Arto Merilainen wrote:
> The host1x driver uses currently syncpoints statically from host1x point =
of
> view. If we do a wait inside a job, it always has a constant value to wai=
t.
> host1x supports also doing relative syncpoint waits with respect to syncp=
oint
> bases. This allows doing multiple operations inside a single submit and
> waiting an operation to complete before moving to next one.
>=20
> This set of patches adds support for syncpoint bases to host1x driver and
> enables the support for gr2d client.
>=20
> I have tested the series using the host1x test application (available at =
[0],
> function test_wait_base() in tests/tegra/host1x/tegra_host1x_test.c) on c=
ardhu.
> I would appreciate help in reviewing the series and testing the patches
> on other boards.
>=20
> Changes in v2:
> - Reordered various code blocks to improve code consistency
> - Functions host1x_syncpt_alloc() and host1x_syncpt_request() take now a =
single
> bitfield argument instead of separate boolean arguments
> - Added a separate ioctl call for querying the base associated with some
> syncpoint
>=20
> [0] https://gitorious.org/linux-host1x/libdrm-host1x
>=20
> Arto Merilainen (4):
>   gpu: host1x: Add 'flags' field to syncpt request
>   gpu: host1x: Add syncpoint base support
>   drm/tegra: Deliver syncpoint base to user space
>   drm/tegra: Reserve base for gr2d
>=20
>  drivers/gpu/host1x/dev.h                   |  2 ++
>  drivers/gpu/host1x/drm/drm.c               | 25 +++++++++++++
>  drivers/gpu/host1x/drm/gr2d.c              |  2 +-
>  drivers/gpu/host1x/hw/channel_hw.c         | 19 ++++++++++
>  drivers/gpu/host1x/hw/hw_host1x01_uclass.h |  6 ++++
>  drivers/gpu/host1x/syncpt.c                | 58 ++++++++++++++++++++++++=
+-----
>  drivers/gpu/host1x/syncpt.h                | 10 +++++-
>  include/uapi/drm/tegra_drm.h               | 26 +++++++++-----
>  8 files changed, 128 insertions(+), 20 deletions(-)

I've applied the series, though I had to rework some of it because
host1x and DRM have significantly changed in the meantime.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbjctAAoJEN0jrNd/PrOhSxAQALctpcYYXbn8b1GUiewfxbdq
QeBPxqUxzk0x41oCdRSFtgf7BF+f3R0gX4UG5IjIcy/9QwgoELhIEJn8E9qKEPM/
Td5tJ3TgOREWcgVq07coavsWXYyZAOOg4ZdvR9O2kzzamOhnePCD0RnV2PvqrT0j
js2NiUawx7zdVkJpH46pJmbIWZxVZwddmSSiYJRiEzw9yzhpOvtMPNaFtLHr0Nm9
8sWnbfzwrB+hlZsxTfU9YkdIqXGC7E42zucqqazNz3xA6CLSlff7kir4wI375siP
a2EoUCGDcjhExonrBbiwDs5NVB5twoNnqmq9xoJk8RMJtAj/ZMLP/vGBfzoEl4bG
PeMwgOxLd6T3OGWIaHUdoJyYaCkkSAKavAsqH4WGFj0T4ZIl+ZzaEwYn8i8TbEMR
8V6WVW1VEXTaQVlxOzwPwDqfrYgYjFsFe9RKM+WHYuu5Ca4xgG0jmEWClFGrzTqy
cPJGn5UF7i2HEan/7YxbbVBFC8sCNRyXSE5qEVr4S1yrdeMPYfbGouvpkC3ORpgs
0GEhEhNXVxGybAY9dI58XhbT5Mhr2qj0SEG/gRApBgK5kiMflPsazy3BFKW14Vlm
bsAOip805grW36wpduL7SLaOINzMUV5UXlogZNB5cbZq6FJPIxuHVaA7/QeyzBU6
EnrkxcI6q9J8Oo2Jjrwg
=ny0z
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
