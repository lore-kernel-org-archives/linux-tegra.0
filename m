From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on
 Tegra210
Date: Wed, 3 Apr 2019 11:22:50 +0200
Message-ID: <20190403092250.GG5238@ulmo>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-3-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8324729882221497485=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325074523.26456-3-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8324729882221497485==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 03:45:17PM +0800, Joseph Lo wrote:
> 1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
> 2) Remove the old emc_mux clock and don't use the common EMC clock
>    definition. This will be replaced by a new clock defined in the EMC
>    driver.
> 3) Export functions to allow accessing the CAR register required for EMC
>    clock scaling. These functions will be used to access the CAR register
>    as part of the scaling sequence.

The fact that you can enumerate 3 logical changes made by this commit
indicates that it should be split up into smaller patches.

> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
>  include/dt-bindings/clock/tegra210-car.h |   4 +-
>  include/linux/clk/tegra.h                |   5 +
>  3 files changed, 103 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-teg=
ra210.c
> index 7545af763d7a..e17b5279ea69 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -47,6 +47,7 @@
>  #define CLK_SOURCE_LA 0x1f8
>  #define CLK_SOURCE_SDMMC2 0x154
>  #define CLK_SOURCE_SDMMC4 0x164
> +#define CLK_SOURCE_EMC_DLL 0x664
> =20
>  #define PLLC_BASE 0x80
>  #define PLLC_OUT 0x84
> @@ -234,6 +235,10 @@
>  #define RST_DFLL_DVCO 0x2f4
>  #define DVFS_DFLL_RESET_SHIFT 0
> =20
> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
> +#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
> +
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> =20
> @@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] =3D {
>  	[8] =3D 12000000,
>  };
> =20
> -static const char *mux_pllmcp_clkm[] =3D {
> -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
> -	"pll_p",
> -};
> -#define mux_pllmcp_clkm_idx NULL
> -
>  #define PLL_ENABLE			(1 << 30)
> =20
>  #define PLLCX_MISC1_IDDQ		(1 << 27)
> @@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max=
] __initdata =3D {
>  	[tegra_clk_i2c2] =3D { .dt_id =3D TEGRA210_CLK_I2C2, .present =3D true =
},
>  	[tegra_clk_uartc_8] =3D { .dt_id =3D TEGRA210_CLK_UARTC, .present =3D t=
rue },
>  	[tegra_clk_mipi_cal] =3D { .dt_id =3D TEGRA210_CLK_MIPI_CAL, .present =
=3D true },
> -	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D true },
> +	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D false },
>  	[tegra_clk_usb2] =3D { .dt_id =3D TEGRA210_CLK_USB2, .present =3D true =
},
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA210_CLK_BSEV, .present =3D true =
},
>  	[tegra_clk_uartd_8] =3D { .dt_id =3D TEGRA210_CLK_UARTD, .present =3D t=
rue },
> @@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
>  	return 0;
>  }
> =20
> +void tegra210_clk_emc_dll_enable(bool flag)
> +{
> +	unsigned long flags =3D 0;
> +	u32 offset =3D flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
> +		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
> +
> +	spin_lock_irqsave(&emc_lock, flags);
> +
> +	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
> +	readl(clk_base + offset);
> +
> +	spin_unlock_irqrestore(&emc_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
> +
> +void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)

Do we really want to pass the whole register value through this
function? The register has three fields, so perhaps it's safer to pass
the fields individually? Or perhaps we only need to modify a subset of
the fields and can reduce the number of parameters we pass? Letting a
different driver pass any arbitrary value here takes away any means of
checking for validity.

> +{
> +	unsigned long flags =3D 0;
> +
> +	spin_lock_irqsave(&emc_lock, flags);
> +
> +	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
> +	readl(clk_base + CLK_SOURCE_EMC_DLL);

Could we not just use a writel() here and do away with the flushing
readl()?

Also, it doesn't look like that spinlock actually protects anything.
You're just writing a value. If anyone else is holding that lock they
will either overwrite our value after we release the lock, or we
overwrite their value when they release the lock.

> +
> +	spin_unlock_irqrestore(&emc_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
> +
> +void tegra210_clk_emc_update_setting(u32 emc_src_value)
> +{
> +	unsigned long flags =3D 0;
> +
> +	spin_lock_irqsave(&emc_lock, flags);
> +
> +	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
> +	readl(clk_base + CLK_SOURCE_EMC);
> +
> +	spin_unlock_irqrestore(&emc_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);

Same comments as above.

> +
> +u32 tegra210_clk_emc_get_setting(void)
> +{
> +	unsigned long flags =3D 0;
> +	u32 val;
> +
> +	spin_lock_irqsave(&emc_lock, flags);
> +
> +	val =3D readl_relaxed(clk_base + CLK_SOURCE_EMC);
> +
> +	spin_unlock_irqrestore(&emc_lock, flags);

Similar to the above, the spinlock doesn't protect anything here.

Thierry

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyke2cACgkQ3SOs138+
s6HcexAAjdntzTF9Lg+OwqPGMuiDMaSTErqBKWtmU3dAnAgx29Ktd2qWaKsqe26d
/zOaivSzsvblsSw2oIi1qnTqjLVlF8sm4i3lAQL53fBLnSl0aKpGiIEXKMTQ9wJh
4I35H2t9dtgRpNkwo3zR+rZihel6QtUXltXeDCR58IzcfNmBfs5xvFDai3sYgp5v
xU3HDOHkkTa1oP8UQbg9eTYEC+5updYs9VhU8nqcOT/vkQ6DhNHmeLZvs/vNzl/t
xAsaT0M1pLgk3L/WGDYaX5NI/SYwAiX+FiBBB9RJajS/e9Nzvu657Tn29UNXJZjq
33sVvWnLrOOmJWibq39Lq/y3iNHN6TSz3YtTcXVjLNfymPSxBZ2qrpc45naPTUld
JYO/np6gofh57bPRUOhDkFbaEcWNizldMTybYk87FWTwuO8Z6MfNQkwpLdmnfrka
S7hs+MN5V+Tsx1EujYYn5JngB5kMSfKtdWbRwjevXSImNx4HhoU+CFx6ZTw9paTM
PiH0gabA5qDa9GZLGf35rJI9gpQ6tVWNvEEeK/zB/daLYD6oyU5bXpepeIun+/PK
ickY0m1Y0r9iM1Ju7+U/UwTL+Rwf97at/UoxL9Fhf/YuLLcmYwi1Csyf6U+UBTvy
3F7Md5dgiPisgs9ELy+YTMg5wIahhDW8jtnaGMFbFbPR4W7+uNI=
=RMCa
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--


--===============8324729882221497485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8324729882221497485==--
