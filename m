From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: add I2C controllers to Tegra124 DT
Date: Fri, 06 Dec 2013 10:36:57 -0700
Message-ID: <52A20B39.7010703@wwwdotorg.org>
References: <1386196016-25128-1-git-send-email-swarren@wwwdotorg.org> <20131206140333.GE30960@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206140333.GE30960-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2013 07:03 AM, Thierry Reding wrote:
> On Wed, Dec 04, 2013 at 03:26:53PM -0700, Stephen Warren wrote:
> [...]
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> [...]
>> @@ -176,6 +176,96 @@
>>  		status = "disabled";
>>  	};
>>  
>> +	i2c@7000c000 {
>> +		compatible = "nvidia,tegra114-i2c";
> 
> Aren't we supposed to always list the most specific compatible as well,
> just in case we ever need to implement a specific quirk in the future?
> 
> So this would become:
> 
> 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";

Oops yes, I'll fix that up.
