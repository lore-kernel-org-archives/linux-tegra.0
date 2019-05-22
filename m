From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 11/12] soc/tegra: pmc: configure tegra deep sleep
 control settings
Date: Wed, 22 May 2019 15:28:51 +0200
Message-ID: <20190522132851.GM30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hnsKUeImFCk/igEn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-12-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hnsKUeImFCk/igEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:22PM -0700, Sowjanya Komatineni wrote:
> Tegra210 and prior Tegra chips have power request signal polarity,
> deep sleep entry and wake related timings which are platform specific
> that should be configured before entering into deep sleep.
>=20
> Below are the timings specific configurations for deep sleep and wake.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
> in deep sleep state irrespective of any quick wake event.
>=20
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
>=20
> These values vary based on the platform design and are specified
> through the device tree.
>=20
> This patch has implementation to configure these configurations which
> are must to have for deep sleep state.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  7 +++++++
>  drivers/soc/tegra/pmc.c                        | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2180.dtsi
> index 4dcd0d36189a..7ac5e55a30aa 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -266,6 +266,13 @@
> =20
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode =3D <0>;
> +		nvidia,cpu-pwr-good-time =3D <0>;
> +		nvidia,cpu-pwr-off-time =3D <0>;
> +		nvidia,core-pwr-good-time =3D <4587 3876>;
> +		nvidia,core-pwr-off-time =3D <39065>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
>  	};
> =20
>  	/* eMMC */

This hunk looks like maybe it belongs in the last patch?

Thierry

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5e68e1de1780..8d225962d136 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -66,6 +66,7 @@
>  #define  PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
> +#define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
>  #define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> =20
> @@ -98,6 +99,8 @@
> =20
>  #define PMC_CPUPWRGOOD_TIMER		0xc8
>  #define PMC_CPUPWROFF_TIMER		0xcc
> +#define PMC_COREPWRGOOD_TIMER		0x3c
> +#define PMC_COREPWROFF_TIMER		0xe0
> =20
>  #define PMC_PWR_DET_VALUE		0xe4
> =20
> @@ -2293,6 +2296,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs=
 =3D {
>  static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  {
>  	u32 value;
> +	unsigned long osc, pmu, off;
> =20
>  	/* Always enable CPU power request */
>  	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
> @@ -2306,6 +2310,11 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  	else
>  		value |=3D PMC_CNTRL_SYSCLK_POLARITY;
> =20
> +	if (pmc->corereq_high)
> +		value &=3D ~PMC_CNTRL_PWRREQ_POLARITY;
> +	else
> +		value |=3D PMC_CNTRL_PWRREQ_POLARITY;
> +
>  	/* configure the output polarity while the request is tristated */
>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> =20
> @@ -2313,6 +2322,15 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>  	value |=3D PMC_CNTRL_SYSCLK_OE;
>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +
> +	osc =3D DIV_ROUND_UP_ULL(pmc->core_osc_time * 8192, 1000000);
> +	pmu =3D DIV_ROUND_UP_ULL(pmc->core_pmu_time * 32768, 1000000);
> +	off =3D DIV_ROUND_UP_ULL(pmc->core_off_time * 32768, 1000000);
> +	if (osc && pmu)
> +		tegra_pmc_writel(pmc, ((osc << 8) & 0xff00) | (pmu & 0xff),
> +				 PMC_COREPWRGOOD_TIMER);
> +	if (off)
> +		tegra_pmc_writel(pmc, off, PMC_COREPWROFF_TIMER);
>  }
> =20
>  static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
> --=20
> 2.7.4
>=20

--hnsKUeImFCk/igEn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlTpMACgkQ3SOs138+
s6Hceg//eJ9RnI4FqaavIppTxvP+6ycPplyXRYYRThqnNCkniyHlND9eTi13aWTZ
7KPyxOq1soDt75QXoah478RxkuCUkQ48w3/t6J622eN8r5n/VC+XHvprajKCPJeO
3O3i+Ma5gIqdpBCx2wgv+/OZExgE2oFfhRWUPFxpeM+PCKu6C8ild7288lXAxu6K
tL+GBFbbd1YbvO98X0vSrC8hP8f2/byKSwBmnwQUcFJsumylyQ9QS/ILgp8Gb20s
MJSqOCQmxKp8yuQfq41YHKuBYwdWSN5VVE/s/N+3CvM3mQCV1gWKMCfIryZc819J
k4aAAeqRp+hua9E2G/DJvMjJTNm299DNjHbqF9pmE49ggTam9yBxiwZXwHiI1snY
yH66DmApDxu5g5AxsjcWdees7km+Ug8ZaNCR2TewjBkOq/end8mZhVvRjN27jlq/
oIKUpxqT8hFm8voF55Y5bYWZ3H2eyP+GAH6f1b4HDytS8epsDx9Uj/yc/URmpvXA
lflvfcrHRFEsSYIyX6fNbw0s+oJCb04f6oLz0tB5T53AyClU6xW+cDHLF9Dvdt4p
G6Q8ZEEtrcyIzvxkBNS2hbiqjKnTAX9iKU+r3/1RJ49okvsEgAUIMrfqyIJ+xxeK
rjkPkgQSaCbE4TGzSwmk6gKDCFKk1/FCJmMvasMS9cUbQg0eIQU=
=vVPi
-----END PGP SIGNATURE-----

--hnsKUeImFCk/igEn--
