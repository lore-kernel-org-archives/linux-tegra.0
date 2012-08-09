From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dt: tegra: cardhu: add entry for regulators
Date: Thu, 9 Aug 2012 16:24:56 +0530
Message-ID: <50239700.5020401@nvidia.com>
References: <1344408527-32051-1-git-send-email-ldewangan@nvidia.com> <50229F6C.10802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50229F6C.10802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 08 August 2012 10:48 PM, Stephen Warren wrote:
> On 08/08/2012 12:48 AM, Laxman Dewangan wrote:
>> This patch series add the PMIC and fixed regulators for
>> cardhu board. There is multiple versions of cardhu baord named
>> as A01, A02, A03..and so on. Cardhu A01 and A03 are not supported.
>> Cardhu A02 and A04 have different sets of GPIO for regualtors.
>> The cardhu A04 is compatible for A05, A06 and A07 in GPIOs.
>> This patch series split the cardhu dts file to cardhu-a02 and
>> carchu-a04 and then add entry for different fixed regualtors.
> With this series, I see the following warnings:
>
> tps65910 4-002d: VMBCH-Threshold not specified
> tps65910 4-002d: VMBCH2-Threshold not specified
>
This is noise from driver. The vmbch entries are optional as per 
document and so should not throw warning. Either fix will go to driver 
or with documentation file and then on DT. Will work on  this as 
independent patch, atleast not with this series.


> I also see the following error:
>
> vdd_sdmmc1: Failed to request enable GPIO31: -16
> reg-fixed-voltage c.regulator: Failed to register regulator: -16
> reg-fixed-voltage: probe of c.regulator failed with error -16
>

The sdhci node take the gpio as power-gpio and conflict with this 
regulator gpio. I dropped the vdd_sdmmc1 as sdhci driver need to change 
accordingly to handle deferred probe.
Will add registration of that file later.

> ... because both the existing SDHCI node and the new "vdd_sdmmc1_reg:
> regulator@12" node both use the same GPIO.
>
> I also don't see "pex_hvdd_3v3_reg: regulator@5" being created, for
> reasons I haven't tracked down.

The issue is comment was not closed. Fixed it in next patch.

> Note that I have a Cardhu A02, although all the issues are with
> regulators in the common file.
>
> Can you please fix these, roll in the fixes for the board ID comment
> issues I mentioned before, retest to ensure there are no errors and that
> all regulators get created as expected, and resubmit.

I fixed as per above details and did not observe any failure on my testing.
