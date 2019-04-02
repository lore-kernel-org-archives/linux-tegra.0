From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clocksource/drivers/tegra: rework for compensation of
 suspend time
Date: Tue, 2 Apr 2019 16:46:03 +0200
Message-ID: <20190402144603.GE8017@ulmo>
References: <20190402030234.13488-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402030234.13488-1-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 11:02:34AM +0800, Joseph Lo wrote:
> Since the clocksource framework has the support for suspend time
> compensation. Re-work the driver to use that, so we can reduce the
> duplicate code.
>=20
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra20.c | 63 +++++++++--------------------
>  1 file changed, 20 insertions(+), 43 deletions(-)

Nice!

>=20
> diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/ti=
mer-tegra20.c
> index fdb3d795a409..919b3568c495 100644
> --- a/drivers/clocksource/timer-tegra20.c
> +++ b/drivers/clocksource/timer-tegra20.c
> @@ -60,9 +60,6 @@
>  static u32 usec_config;
>  static void __iomem *timer_reg_base;
>  #ifdef CONFIG_ARM
> -static void __iomem *rtc_base;
> -static struct timespec64 persistent_ts;
> -static u64 persistent_ms, last_persistent_ms;
>  static struct delay_timer tegra_delay_timer;
>  #endif
> =20
> @@ -199,40 +196,30 @@ static unsigned long tegra_delay_timer_read_counter=
_long(void)
>  	return readl(timer_reg_base + TIMERUS_CNTR_1US);
>  }
> =20
> +static struct timer_of suspend_rtc_to =3D {
> +	.flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK,
> +};
> +
>  /*
>   * tegra_rtc_read - Reads the Tegra RTC registers
>   * Care must be taken that this funciton is not called while the
>   * tegra_rtc driver could be executing to avoid race conditions
>   * on the RTC shadow register
>   */
> -static u64 tegra_rtc_read_ms(void)
> +static u64 tegra_rtc_read_ms(struct clocksource *cs)
>  {
> -	u32 ms =3D readl(rtc_base + RTC_MILLISECONDS);
> -	u32 s =3D readl(rtc_base + RTC_SHADOW_SECONDS);
> +	u32 ms =3D readl(timer_of_base(&suspend_rtc_to) + RTC_MILLISECONDS);
> +	u32 s =3D readl(timer_of_base(&suspend_rtc_to) + RTC_SHADOW_SECONDS);
>  	return (u64)s * MSEC_PER_SEC + ms;
>  }
> =20
> -/*
> - * tegra_read_persistent_clock64 -  Return time from a persistent clock.
> - *
> - * Reads the time from a source which isn't disabled during PM, the
> - * 32k sync timer.  Convert the cycles elapsed since last read into
> - * nsecs and adds to a monotonically increasing timespec64.
> - * Care must be taken that this funciton is not called while the
> - * tegra_rtc driver could be executing to avoid race conditions
> - * on the RTC shadow register
> - */
> -static void tegra_read_persistent_clock64(struct timespec64 *ts)
> -{
> -	u64 delta;
> -
> -	last_persistent_ms =3D persistent_ms;
> -	persistent_ms =3D tegra_rtc_read_ms();
> -	delta =3D persistent_ms - last_persistent_ms;
> -
> -	timespec64_add_ns(&persistent_ts, delta * NSEC_PER_MSEC);
> -	*ts =3D persistent_ts;
> -}
> +static struct clocksource suspend_rtc_clocksource =3D {
> +	.name	=3D "tegra_suspend_timer",
> +	.rating	=3D 200,
> +	.read	=3D tegra_rtc_read_ms,
> +	.mask	=3D CLOCKSOURCE_MASK(32),
> +	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
> +};
>  #endif
> =20
>  static int tegra_timer_common_init(struct device_node *np, struct timer_=
of *to)
> @@ -385,25 +372,15 @@ static int __init tegra_init_timer(struct device_no=
de *np)
> =20
>  static int __init tegra20_init_rtc(struct device_node *np)
>  {
> -	struct clk *clk;
> +	int ret;
> =20
> -	rtc_base =3D of_iomap(np, 0);
> -	if (!rtc_base) {
> -		pr_err("Can't map RTC registers\n");
> -		return -ENXIO;
> -	}
> +	ret =3D timer_of_init(np, &suspend_rtc_to);
> +	if (ret)
> +		return ret;
> =20
> -	/*
> -	 * rtc registers are used by read_persistent_clock, keep the rtc clock
> -	 * enabled
> -	 */
> -	clk =3D of_clk_get(np, 0);
> -	if (IS_ERR(clk))
> -		pr_warn("Unable to get rtc-tegra clock\n");
> -	else
> -		clk_prepare_enable(clk);
> +	clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> =20
> -	return register_persistent_clock(tegra_read_persistent_clock64);
> +	return 0;
>  }
>  TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
>  #endif

I wonder if there's any reason left for the #ifdefs now. My recollection
is that these were only needed because register_persistent_clock() was
not available on 64-bit ARM. The new APIs seem to be available
regardless of architecture, so do we still need to differentiate?

Thierry

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyjdakACgkQ3SOs138+
s6HcVw/+LuMdZgQke1X++Jfjr7/7JpGMznffzO518GTbknew4gEUJMzmBXKkcO2u
KKs84gfd3Qz7TBqjIfFaqcW8BzgntKUxXE7+aFD3rZPn9cCqIDUjWB0YhyOFPWUu
SGDdRlBByUHIYDI1uhTE7CYmbYSgBJ4ZOSTeZcmARuqgBs0SlzpKKzD9NiIAMZu+
RjPlVxUegnmzJ4hMbFmScH/PdSLDdvuKNe+IErEF164quMvSZiU4NQIuVHj4Jo0N
gULaJamKMxZPZGboYM92t5E5bv9P/S+/D5rGI3Z+rIvrr97qaoWKeuwTt4/fola/
Hpe42iEuwUIvogSHQFdrJUcHl24wxRKgkwNjoXSI/dMCkXIV+RL5BAgB9ULocFCS
H8v6Kd+vgpKmfSqejLPcdV6Dw45aUrhuUpqMzmMUOAyyxbzLTMxT57XagT5m35hK
iZqGM0UzEo+RX7i3Yzk5LR9/1fngFFeA3g/IRiIzTb4p9997SA5Rh3QZVB6cpJll
BJ3geuFBaiJl5binR4mScTwTXehlco1HorAdGv6WmMOrkPH6vEJq1Q56PyjnGp9n
7DA3owb897JsZ0kJTP5VH/NCOrFZch0NSqnJAtr6Xj6obIJKdmjnti0fV8QD7STl
l0suLGIzjGAKNXkbrE10BQqrIUJ9fvNh5k+ois2LmE3cKVNR4wI=
=JGMg
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--
