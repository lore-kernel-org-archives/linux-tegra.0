From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:25:53 -0800
Message-ID: <AANLkTi=YyBAxhhK7_DJrj+iKZt19jZuwwBjexFUvmHCB@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
	<AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5D88@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF03112A5D88-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 1:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Wednesday, February 23, 2011 2:16 PM:
>>
>> On Wed, Feb 23, 2011 at 1:08 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:
>> > ...
>> > On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren@nvidia.c=
om> wrote:
>> > [...]
>> >> diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-=
tegra/board-harmony.h
>> >> index 4fe33b8..fbf2304 100644
>> >> --- a/arch/arm/mach-tegra/board-harmony.h
>> >> +++ b/arch/arm/mach-tegra/board-harmony.h
>> >> @@ -17,12 +17,19 @@
>> >> =A0#ifndef _MACH_TEGRA_BOARD_HARMONY_H
>> >> =A0#define _MACH_TEGRA_BOARD_HARMONY_H
>> >>
>> >> +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_G=
PIOS + (_x_))
>> >
>> >
>> > The above assumes that wm8903 is the GPIO controller that gets
>> > allocated the numbers right after native tegra gpio. That might no=
t be
>> > the case on all boards, since the TPS PMIC has some as well, I
>> > believe.
>> The GPIO numbers above TEGRA_NR_GPIOS are allocated by the board, an=
d
>> this is in board-harmony.h, so I think its OK.
>
> The Seaboard equivalent of this that I wrote for ChromeOS is:
>
> #define TPS_GPIO_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 TEGRA_NR_GP=
IOS
>
> #define TPS_GPIO_WWAN_PWR =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TPS_GPIO_BASE =
+ 2)
>
> #define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(TPS_GPIO_BAS=
E + 4 + (_x_))
>
> Which takes into account other devices.
>
>> > Does it need a hardcoded GPIO base, or can it use the dynamic one
>> > (i.e. use -1 here)? I don't even see any reference to gpio_base in=
 the
>> > driver...
>> I assume that is in the ASoC tree. =A0The platform data in tegra
>> for-next does not include a gpio_base entry.
>
> Yes, gpio_base is added to that tree.
>
> -1 would probably work. But then, I have no idea how to find out what=
 base
> was assigned to the WM8903, in order to initialize the ASoC machine d=
river's
> platform_data...

Yeah, like I said in a separate reply, keeping it the way it is will
work out for the best.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
