From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Thu, 13 Oct 2011 16:38:46 -0700
Message-ID: <CAOesGMiuzF47kdmaaFny9Fg1ieox6a75tMFfLRAptvDxz_QPMg@mail.gmail.com>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173955580F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173955580F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Arnd Bergmann (arnd-r2nGTMty4D4@public.gmane.org)" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Sep 28, 2011 at 10:50 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Peter De Schrijver wrote at Tuesday, September 27, 2011 7:08 PM:
>> This patch causes the kernel uncompressor to determine the physical =
address
>> of the SDRAM at runtime. This allows the kernel to boot on both tegr=
a20 and
>> tegra30 even though SDRAM is at different physical addresses on both=
 SoCs.
>>
>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> An alternative would be to simply add that config option to the relev=
ant
> defconfig/.config file. I see both cases in use in the kernel. Still,=
 the
> code change this enables looks fine to just turn on all the time, and=
 will
> be needed for Tegra30 support, so I'm fine just selecting it as you h=
ave.
>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 472a7f8..474737b 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -596,6 +596,7 @@ config ARCH_TEGRA
>> =A0 =A0 =A0 select HAVE_CLK
>> =A0 =A0 =A0 select HAVE_SCHED_CLOCK
>> =A0 =A0 =A0 select ARCH_HAS_CPUFREQ
>> + =A0 =A0 select AUTO_ZRELADDR
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 This enables support for NVIDIA Tegra based systems =
(Tegra APX,
>> =A0 =A0 =A0 =A0 Tegra 6xx and Tegra 2 series).
>
> P.S. Since this patch relates to Tegra, you should CC the Tegra maint=
ainers
> and list; I've done so on this message. I also added Arnd; he might t=
ake
> this through the arm-soc tree.

While it does touch a file outside of arch/arm/mach-tegra, it's for
the tegra options and is not likely to cause conflicts upstream. I'll
apply it with the rest of tegra patches for 3.2 here.

So: Applied, thanks.


-Olof
