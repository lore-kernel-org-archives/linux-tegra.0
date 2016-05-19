From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Thu, 19 May 2016 10:12:35 -0600
Message-ID: <573DE5F3.2060406@wwwdotorg.org>
References: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
 <573DCE43.70906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573DCE43.70906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/19/2016 08:31 AM, Jon Hunter wrote:
>
> On 29/02/16 21:01, Lucas Stach wrote:
>> This allows to switch the card signal voltage level to 1.8V,
>> which is needed for any ultra high speed modes to work.
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> ---
>> This needs the SDMMC memcomp pad calibration patches I just
>> sent out to be applied, otherwise the card voltage change will
>> fail with a message in the kernel log and a fall back to
>> high speed operation.
>> ---
>>   arch/arm/boot/dts/tegra30-beaver.dts | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
>> index 1daed40..6b237f2 100644
>> --- a/arch/arm/boot/dts/tegra30-beaver.dts
>> +++ b/arch/arm/boot/dts/tegra30-beaver.dts
>> @@ -1848,7 +1848,7 @@
>>
>>   				ldo5_reg: ldo5 {
>>   					regulator-name = "vddio_sdmmc,avdd_vdac";
>
> Stephen, looking at the schematics, I don't see that this is connected
> to the avdd_vdac (which appears to be unconnected) and so I am wondering
> if this name should be just "vddio_sdmmc"?

Yes, I don't know where avdd_vdac came from; it doesn't appear connected 
on any Beaver (or even Cardhu, from which it was probably derived) 
schematic that I have.

CC += Bryan in case he has any recollection since he wrote this DT.
