From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: mark t186 display hub PM functions
 __maybe_unused
Date: Fri, 15 Dec 2017 14:33:40 +0100
Message-ID: <20171215133340.GA353@ulmo>
References: <20171215125205.2969211-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171215125205.2969211-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 01:51:52PM +0100, Arnd Bergmann wrote:
> The newly introduced driver has optional suspend/resume functions,
> causing a warning when CONFIG_PM is disabled:
>=20
> drivers/gpu/drm/tegra/hub.c:749:12: error: 'tegra_display_hub_resume' def=
ined but not used [-Werror=3Dunused-function]
> drivers/gpu/drm/tegra/hub.c:733:12: error: 'tegra_display_hub_suspend' de=
fined but not used [-Werror=3Dunused-function]
>=20
> This marks them __maybe_unused to shut up the warnings.
>=20
> Fixes: c4755fb9064f ("drm/tegra: Add Tegra186 display hub support")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/hub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

We had touched on this topic in a different thread. The Tegra DRM driver
currently relies on runtime PM to work properly. I don't see a reason to
not make that official by adding a select PM to menuconfig ARCH_TEGRA on
32-bit ARM just like we already do on 64-bit ARM.

I've gone and applied this patch as an interim solution. Once we've made
the switch to select PM on all generations of Tegra we can remove all
the #ifdef and __maybe_unused.

Thanks,
Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlozzzEACgkQ3SOs138+
s6EawA//QUTv/kJO4ybqdOwUsPVLzlG1m341/CZucD6JJNXen4nkeURAVSfEWz0I
ZwW1h+L7eSjGb2Fk+ZElHwJY5nfKhhDx3tV+94UbZhVUwNpWS8y321RxMR3e8uny
eclNETLM8BJBn5GutluH+ml9/zRjL9H+koL+p76ZoBfW0vb+Ow+ekMvodtnZMlV8
KwqXoFz/sFPcw3EJmysHyoOXdCXiHYDrxE2ePFX0T3BGSM7W+WRQwjBQAOZyaqX8
g+Il8+fLRiI7onmc4BMsszuoCfrguDRi6dKFIpq/m/KVRdFUAi7pl3qdi7/yoFgA
c3wQnJl9cETOv5rHm9GcbQ2li+ctrhVTj8oADx8pSuIG/3ubXnisAFGoyIJ/Lv0T
SKr7h7DC26llI1w+9wKxKij8cZT7Llt7hw8rFsMa0pKgXBvxIyDaPDhCWqC1jmJ7
SxQvFqI6MT+A7qOPbxAlouVnqNBhb4GIgUKXIAa2FXxLzBbXVamH3Tyu6cTtm+uS
FC5vbjLEyuCPBiUkJD0pGe3P0edkTah7tfl8EhrdztBqSwPqHtaO6/t9H6/FxwXa
9etKCuwbeU64tlP7kKOmL7YUedKt6CYNBnLNkFunsgabQ9NFhNkrL5OaX9yOYKAu
FW3gjB6lSborpDYf1qGHjZ5COq4YBhklXTQN7h8QzrnTWssJAaQ=
=6gsw
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
