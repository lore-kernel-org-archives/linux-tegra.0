From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] clocksource: tegra: Add nvidia,tegra30-timer compat
Date: Mon, 03 Feb 2014 17:39:46 +0100
Message-ID: <52EFC652.9000209@linaro.org>
References: <1391203779-5676-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391203779-5676-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/31/2014 10:29 PM, Andrew Chew wrote:
> There are some differences between tegra20's timer registers and tegr=
a30's
> (and later).  For one thing, the watchdogs don't seem to be present i=
n
> tegra20.

"don't seem", so it is an assumption ?

> Add this compatibility string in order to be able to distinguish
> whether the watchdogs are there or not.

Sorry but I don't get the connection between declaring the tegra30_time=
r=20
and the log. Can you elaborate please ?

> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/clocksource/tegra20_timer.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksourc=
e/tegra20_timer.c
> index d1869f0..73cfa56 100644
> --- a/drivers/clocksource/tegra20_timer.c
> +++ b/drivers/clocksource/tegra20_timer.c
> @@ -218,6 +218,7 @@ static void __init tegra20_init_timer(struct devi=
ce_node *np)
>   					0x1, 0x1fffffff);
>   }
>   CLOCKSOURCE_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra=
20_init_timer);
> +CLOCKSOURCE_OF_DECLARE(tegra30_timer, "nvidia,tegra30-timer", tegra2=
0_init_timer);
>
>   static void __init tegra20_init_rtc(struct device_node *np)
>   {
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
