From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: tegra: WARN if flowctrl is not supported
Date: Mon, 20 Mar 2017 16:32:06 +0000
Message-ID: <b870683b-84f1-7cc9-ae9d-d094bef58196@nvidia.com>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-2-git-send-email-jonathanh@nvidia.com>
 <20170320141023.GB28203@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170320141023.GB28203-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 20/03/17 14:10, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 15, 2017 at 01:31:51PM +0000, Jon Hunter wrote:
>> If we fail to map the IO space for the Tegra flowctrl module in
>> tegra_flowctrl_init(), then if any of the public APIs for the Tegra
>> flowctrl driver are called we still still attempt to access the
>> hardware. Fix this by only accessing the hardware if the
>> 'tegra_flowctrl_base' address has not been setup correctly and warn
>> if we attempt to access the hardware when it has not.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/mach-tegra/flowctrl.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
>> index 475e783992fd..40b15e39f849 100644
>> --- a/arch/arm/mach-tegra/flowctrl.c
>> +++ b/arch/arm/mach-tegra/flowctrl.c
>> @@ -47,6 +47,9 @@ static void __iomem *tegra_flowctrl_base;
>>  
>>  static void flowctrl_update(u8 offset, u32 value)
>>  {
>> +	if (WARN_ONCE(!tegra_flowctrl_base, "Tegra flowctrl not supported!"))
> 
> Technically I think this string needs a terminating "\n" because it is
> eventually passed to printk(), even though the WARN_ONCE() will probably
> format the output correctly even without it.

Yes, will fix up.

> Also, "not supported" isn't a very accurate description. This has to do
> with the flow controller not having been initialized yet.

Will update to 'not initialised'.

Jon

-- 
nvpublic
