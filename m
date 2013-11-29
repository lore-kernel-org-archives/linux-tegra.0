From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 09/31] drm/tegra: use reset framework
Date: Fri, 29 Nov 2013 14:42:53 +0100
Message-ID: <20131129134252.GW22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
	<1384548866-13141-10-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100078422=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1384548866-13141-10-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, pdeschrijver@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2100078422==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RMorpr61ug7CvG36"
Content-Disposition: inline


--RMorpr61ug7CvG36
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:04PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>=20
> Cc: treding@nvidia.com
> Cc: pdeschrijver@nvidia.com
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/gpu/drm/tegra/Kconfig |  1 +
>  drivers/gpu/drm/tegra/dc.c    |  9 ++++++++-
>  drivers/gpu/drm/tegra/drm.h   |  3 +++
>  drivers/gpu/drm/tegra/gr3d.c  | 16 ++++++++++++++++
>  drivers/gpu/drm/tegra/hdmi.c  | 14 +++++++++++---
>  5 files changed, 39 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 8961ba6a34b8..8db9b3bce001 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -2,6 +2,7 @@ config DRM_TEGRA
>  	bool "NVIDIA Tegra DRM"
>  	depends on ARCH_TEGRA || ARCH_MULTIPLATFORM
>  	depends on DRM
> +	depends on RESET_CONTROLLER

Is this really needed? ARCH_TEGRA already selects RESET_CONTROLLER and
we depend on ARCH_TEGRA. Or perhaps you need this because it might also
be that ARCH_MULTIPLATFORM is selected without ARCH_TEGRA support? In
either case I guess a good thing would be to add dummies for the reset
API so that we don't have this additional compile-time dependency.

>  	select TEGRA_HOST1X
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_FB_HELPER
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index ae1cb31ead7e..c3be92879bea 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
> +#include <linux/reset.h>

You should be able to drop linux/clk/tegra.h now.

> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 4cec8f526af7..f629e38b00e4 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -11,6 +11,7 @@
>  #include <linux/host1x.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>

I was going to say "Same here", but interestingly this driver doesn't
use the old Tegra-specific reset API. It's actually handled internally
by the tegra_powergate_sequence_power_up() function and I think that'll
be handled by a separate patch in your series if I recall correctly.

> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 0cd9bc2056e8..f3aad49633d6 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -12,6 +12,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/hdmi.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>

But here the linux/clk/tegra.h include can again be dropped.

Thierry

--RMorpr61ug7CvG36
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJncAAoJEN0jrNd/PrOhiL8QAJjfngsNYloQQX065M2r6w80
ASvYoYMslQRIJ2V61SN/AL0Zo3aHhK249AX5OH7uXqgWBtlObFOTAbdSaWE+REMo
H8MAYU1FF6sxCwqcKShegn6EZ3l7tSk/3+IKPxNKw1LIbHyItRY+HPHtvaZJvYaG
4/+lmwmez1mOCKg6UoZIZ/5L35TVPCNoxMwjN7ezddurw2VwUkwcz462OLrqbwoq
/jgOdvkLBs0WmqU6J1IEpCUTwxAgVTazmp65M95GDDJDB4bWoOGHyf2YCCrZWY+u
EGW6n2rd7U/TVYzGYKAWr9gMyVuguU7XGaLTWA6xyQ6Eedi36xFK6qbtD9i2xxfb
M7FkgBU6UFgHJG9xqmBCsB657j/RWFX1qMsttqWALo5wQlWwmSZef5cUmh5UTu4n
XouAYhNNxHPP39g2diIKQdmTgBtqdSci5DOfhenQ8AoxoKIK5evHTizALntgke7t
Uh+GFNZahknZdrrJHr0p+4F/DQSuDDyu43xVheRSgDX6zfhwcf7kPMHkQsBpkszz
Lpbz/VQNR9mJOLnPGOuoK19zaet5hheEQ4sNLxC4LOMzKT8gPK/dYUkFbh+pH1dq
y58n06sqvTEYBKMAOqZc8ewWZqzvd1K/nEjFrMlc0rMQll2FAidTlpjrsMJVcZA4
+GwUUIxEYJ5YdbMWvsw6
=mGal
-----END PGP SIGNATURE-----

--RMorpr61ug7CvG36--

--===============2100078422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2100078422==--
