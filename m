From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Patches for 2.6.39 merge window
Date: Fri, 4 Mar 2011 16:11:47 -0800
Message-ID: <AANLkTinjRb=j_KaOW1RSL2xhsLgPvP_LjqKEC4FRO9ow@mail.gmail.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
	<20110222205210.GF31611@opensource.wolfsonmicro.com>
	<AANLkTi=Er0pL-KcSqw1WwKy+CZeM9SWjmOkp08YkhKmQ@mail.gmail.com>
	<20110222210925.GH31611@opensource.wolfsonmicro.com>
	<AANLkTi=HBjhdSY_7nfeqFZ6Cd_pJA6VBRTaOjmpA3jaw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B480@HQMAIL01.nvidia.com>
	<AANLkTikMmoBT3ZG2UPNretXDK+UqMyk6X2GEpwMt5SC8@mail.gmail.com>
	<AANLkTinSQuFk9-NeA+F-35QitHO8KU4H_tffTneG8gxH@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B50A@HQMAIL01.nvidia.com>
	<AANLkTi=ASu7++j+qu_JDtjha5_b3=2jZE8rAf=HLKBuS@mail.gmail.com>
	<AANLkTinr=ye2CtcG9FmFZZ1sK3ZYp8woUeZ_GzYNnQn2@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B727@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF045687B727-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Mar 4, 2011 at 1:32 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Olof Johansson wrote at Thursday, March 03, 2011 6:01 PM:
>> I can do them (sorry, been out today and was also waiting on the i2c
>> merge to land).
>>
>> I'll take them through my tree with the i2c changes. I'll post the
>> base i2c board changes either tonight or tomorrow morning, after that
>> Stephens can easily go on top.
>
> Olof,
>
> I didn't see any updates in git.
>
> Do my changes still need to be in today? I'm assuming you wanted me to
> rebase my changes on top of your I2C changes one they were published, and
> mail the patches again...

I've got the changes staged, but the i2c core is spewing errors about
lack of suitable probing methods that I'm investigating before
posting.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
