From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/6] soc/tegra: Move Tegra flowctrl driver
Date: Tue, 4 Apr 2017 16:01:03 +0200
Message-ID: <20170404140103.GE843@ulmo.ba.sec>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
 <1490704978-22906-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490704978-22906-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 01:42:54PM +0100, Jon Hunter wrote:
> The flowctrl driver is required for both ARM and ARM64 Tegra devices
> and in order to enable support for it for ARM64, move the Tegra flowctrl
> driver into drivers/soc/tegra.
>=20
> By moving the flowctrl driver, tegra_flowctrl_init() is now called by
> via an early initcall and to prevent this function from attempting to
> mapping IO space for a non-Tegra device, a test for 'soc_is_tegra()'
> is also added.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Makefile          |   1 -
>  arch/arm/mach-tegra/cpuidle-tegra20.c |   3 +-
>  arch/arm/mach-tegra/flowctrl.c        | 179 ----------------------------=
----
>  arch/arm/mach-tegra/flowctrl.h        |  66 ------------
>  arch/arm/mach-tegra/platsmp.c         |   2 +-
>  arch/arm/mach-tegra/pm.c              |   2 +-
>  arch/arm/mach-tegra/reset-handler.S   |   2 +-
>  arch/arm/mach-tegra/sleep-tegra20.S   |   3 +-
>  arch/arm/mach-tegra/sleep-tegra30.S   |   2 +-
>  arch/arm/mach-tegra/tegra.c           |   2 -
>  drivers/soc/tegra/Kconfig             |   7 ++
>  drivers/soc/tegra/Makefile            |   1 +
>  drivers/soc/tegra/flowctrl.c          | 187 ++++++++++++++++++++++++++++=
++++++
>  include/soc/tegra/flowctrl.h          |  82 +++++++++++++++
>  14 files changed, 285 insertions(+), 254 deletions(-)
>  delete mode 100644 arch/arm/mach-tegra/flowctrl.c
>  delete mode 100644 arch/arm/mach-tegra/flowctrl.h
>  create mode 100644 drivers/soc/tegra/flowctrl.c
>  create mode 100644 include/soc/tegra/flowctrl.h

Applied to for-4.12/soc, thanks.

Thierry

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjpx0ACgkQ3SOs138+
s6EW0xAAiLpq3+Hfu6QClJt+l7EVE2fYmJAGsL7hLrCEbj8iEyZrWWAQk41Pjr/t
gt3iPDurm+O/Gio/r+6wZ21D8v02LwZpyIlIuDFs8pv0OY5MiQLMvWZgxBsTAyCM
tyQDrUBBaMrcuMjAG/fFsTy5Sp2EA6BmtBg/l64MyaZD2XOpYtErfJygN1pmyUiF
DUF/4XWgI2K61NMaLeL/9ywtzl92Toh8F7uLIuwXN0x/6aYd2eA1UEBZAzLEVNk5
lAzphhiBLS7Llpqj95QJw9zJ8bVsAXv87IAW1JyrygtvAQYW0YzpUD8usXeKPUfw
ArwX8VSCakLLSXU+8tEdHMIUvsg/BLsx1a5yWuAcdAjcqVEDcwe3zi8fI+N/KyFM
VnHZuOUp0aOzZkzDNT2kSgV6lVk2Uz138d6LhWMlkyBgRpVo22fwOktC5+NLaNIZ
rDJIo0EbVZPJTrlnRyZ3J7lXQQy4age3MKQJdQaS7RDQsof2+RcAyDF0LJZoC7de
b0s4nK4E/jnkSpZhOna8RxItnjdfWjXUUaNw7rrAhRY//5P5WhgRJZCYYKBGXiEq
QRviy6wRsIsVjSGTs2gtnwkgp9ei0OlbMn7kgkSIKbVfh+Sy0NTXOPrKd7Xe0k9R
uMyFuyak2B9okAuQ5Cn3ePe1JlTSzt8XJM80SMuaG9VnwNwTSEs=
=wlw0
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
