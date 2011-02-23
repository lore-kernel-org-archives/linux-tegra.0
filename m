From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:15:51 -0800
Message-ID: <AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 1:08 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Stephen,
>
> Since this depends on i2c, and registers one of the adapters to do it=
,
> we should just get the adapters registered separately (all of them)
> before this. I was holding off that part of board code since the i2c
> driver went up that maintainer path instead, but if Colin pulls it
> into tegra for-next, then I'll go ahead with those peices as well.
>
> I'll pick up the board-side patches from this series (1, 4, 5), and
> Colin will take the core patches (2, 3).
>
>
> On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
>
>> +static struct wm8903_platform_data harmony_wm8903_pdata =3D {
>> + =A0 =A0 =A0 .irq_active_low =3D 0,
>> + =A0 =A0 =A0 .micdet_cfg =3D 0,
>> + =A0 =A0 =A0 .micdet_delay =3D 100,
>> + =A0 =A0 =A0 .gpio_base =3D GPIO_WM8903(0),
>> + =A0 =A0 =A0 .gpio_cfg =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
>> + =A0 =A0 =A0 },
>> +};
> [...]
>> diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-teg=
ra/board-harmony.h
>> index 4fe33b8..fbf2304 100644
>> --- a/arch/arm/mach-tegra/board-harmony.h
>> +++ b/arch/arm/mach-tegra/board-harmony.h
>> @@ -17,12 +17,19 @@
>> =A0#ifndef _MACH_TEGRA_BOARD_HARMONY_H
>> =A0#define _MACH_TEGRA_BOARD_HARMONY_H
>>
>> +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_GPIO=
S + (_x_))
>
>
> The above assumes that wm8903 is the GPIO controller that gets
> allocated the numbers right after native tegra gpio. That might not b=
e
> the case on all boards, since the TPS PMIC has some as well, I
> believe.
The GPIO numbers above TEGRA_NR_GPIOS are allocated by the board, and
this is in board-harmony.h, so I think its OK.

> Does it need a hardcoded GPIO base, or can it use the dynamic one
> (i.e. use -1 here)? I don't even see any reference to gpio_base in th=
e
> driver...
I assume that is in the ASoC tree.  The platform data in tegra
for-next does not include a gpio_base entry.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
