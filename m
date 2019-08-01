From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 16/20] arm64: tegra: Enable wake from deep sleep on RTC
 alarm
Date: Thu, 1 Aug 2019 21:39:58 +0300
Message-ID: <47c3e2f3-b9e8-983d-3df9-b45552190850@gmail.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
 <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
 <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
 <4f8b9ee7-5402-6463-d6d2-7b00e274a185@gmail.com>
 <1e2e6282-9d94-e322-c4ba-8a1f3b902860@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e2e6282-9d94-e322-c4ba-8a1f3b902860@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.08.2019 20:56, Sowjanya Komatineni пишет:
> 
> On 8/1/19 3:43 AM, Dmitry Osipenko wrote:
>> 01.08.2019 0:08, Sowjanya Komatineni пишет:
>>> On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>> This patch updates device tree for RTC and PMC to allow system wake
>>>>> from deep sleep on RTC alarm.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> index 659753118e96..30a7c48385a2 100644
>>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> @@ -768,7 +768,8 @@
>>>>>        rtc@7000e000 {
>>>>>            compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>>>>            reg = <0x0 0x7000e000 0x0 0x100>;
>>>>> -        interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        interrupt-parent = <&pmc>;
>>>>>            clocks = <&tegra_car TEGRA210_CLK_RTC>;
>>>>>            clock-names = "rtc";
>>>>>        };
>>>>> @@ -778,6 +779,8 @@
>>>>>            reg = <0x0 0x7000e400 0x0 0x400>;
>>>>>            clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>>>>            clock-names = "pclk", "clk32k_in";
>>>>> +        #interrupt-cells = <2>;
>>>>> +        interrupt-controller;
>>>>>              powergates {
>>>>>                pd_audio: aud {
>>>>>
>>>> Is this a backwards-compatible change? Or it's not really worth to care
>>>> about the compatibility with older kernel versions, I'm not sure about
>>>> overall state of T210 in the upstream kernel.
>>> I don't think its required to be backwards-compatible as SC7 entry/exit
>>> implementation for T210 is with this patch series onwards..
>> The new device tree binary should work with older kernel versions, AFAIK
>> this is the upstream rule. But if kernel support isn't in a very good
>> shape and not much people are using it, then obviously it is not very
>> important.
> 
> Yes, my response to backwards-compatible was with respect to interrupt
> parent change as this will not be backward compatible and also there is
> no Tegra210 suspend/resume earlier. Other functionality wise, it is
> backward compatible.

Should be good then.
