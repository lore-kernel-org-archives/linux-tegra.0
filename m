From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
Date: Mon, 22 Jun 2020 18:29:04 +0300
Message-ID: <d11a1b87-6f00-3477-9402-310a402dc8d5@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-10-thierry.reding@gmail.com>
 <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
 <20200622152209.GA4008275@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200622152209.GA4008275@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

22.06.2020 18:22, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 07:21:30PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 16:51, Thierry Reding пишет:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The instantiation of gr2d in Tegra114 is not backwards-compatible with
>>> the version found on earlier chips. Remove the misleading compatible
>>> string.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>> index a0ac9ea9ec9d..d583dfba688f 100644
>>> --- a/arch/arm/boot/dts/tegra114.dtsi
>>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>>> @@ -35,7 +35,7 @@ host1x@50000000 {
>>>  		ranges = <0x54000000 0x54000000 0x01000000>;
>>>  
>>>  		gr2d@54140000 {
>>> -			compatible = "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
>>> +			compatible = "nvidia,tegra114-gr2d";
>>>  			reg = <0x54140000 0x00040000>;
>>>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>>>  			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
>>>
>>
>> Could you please explain what's the difference? AFAIK, the 2D HW is
>> identical on T20/30/114.
> 
> My understanding is that the IP core itself is identical. However, the
> compatible string really describes the integration of the IP, which in
> case of Tegra114 is slightly different in that it's part of the HEG
> power partition, whereas it wasn't previously.
> 
> That means that without knowledge of the power partition we won't be
> able to access the gr2d IP on Tegra114 at all and hence it isn't
> backwards compatible with Tegra20.

Thank you very much for the clarification! Will nice if this could be
added into the commit's description.
