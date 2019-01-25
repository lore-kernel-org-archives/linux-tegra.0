From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 3/6] arm64: dts: tegra210: fix timer node
Date: Fri, 25 Jan 2019 11:56:52 +0800
Message-ID: <60b7e6b5-225b-b873-3aea-f81a2a658c9c@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-4-josephl@nvidia.com>
 <867b5168-e3cb-6423-b3d2-c075d1701c88@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <867b5168-e3cb-6423-b3d2-c075d1701c88@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 1/24/19 7:16 PM, Jon Hunter wrote:
> 
> On 07/01/2019 03:28, Joseph Lo wrote:
>> Fix timer node to make it work with Tegra210 timer driver. And backward
>> compatible with the Tegra watchdog driver.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> index b5858b5ea052..143bd103c923 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -384,14 +384,12 @@
>>   	};
>>   
>>   	timer@60005000 {
>> -		compatible = "nvidia,tegra210-timer", "nvidia,tegra20-timer";
>> +		compatible = "nvidia,tegra210-timer", "nvidia,tegra30-timer";
>>   		reg = <0x0 0x60005000 0x0 0x400>;
>> -		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>> -			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>> -			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
>> -			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
>> -			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
>> -			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks = <&tegra_car TEGRA210_CLK_TIMER>;
>>   		clock-names = "timer";
>>   	};
> 
> Hmmm ... I can't say I understand this. So now the timer devices are
> compatible with two different drivers?

The tegra210-timer is for clock event device and the tegra30-timer is 
for watchdog timer, that is the usage for Tegra platform before 
Tegra210. But... (see below)

> 
> Begs the question why did we not just extend the existing tegra20-timer
> rather than adding a new one?

The tegra20-timer was designed for very early stage that the arm-twd 
driver not ready yet. So it was the clock event device and sched timer 
for tegra20/30 at that stage. And I believe this driver was replaced and 
deprecated by arm-twd and armv7 timer for tegra20/30/114/124. So 
basically, I think we can remove this driver now.

So back to the question above, as we see the similar timer node binding 
in tegra20/30/114/124/132 dts file. It actually didn't use tegra20 timer 
driver at all but instead of arm-twd and armv7 timer. The binding only 
makes it work with the tegra-wdt driver, which is the compatible string 
of "nvidia,tegra30-timer". Maybe we should fix them all together.

> 
> Also you did not explain why we make them compatible with the watchdog
> driver? We have other watchdogs timer and so why do we need to make them
> compatible?
> 

The detail explanation is above. In here, I just follow the legacy 
binding convention that we used in other tegra dts files. This binding 
makes it work with TMR5, which is the watchdog timer that we used to use 
for Tegra.

If we don't prefer this way, I can remove that for now. And we need to 
find a different way to merge watchdog timer driver and timer driver 
into one driver.

Let me know which one is acceptable for now.

Thanks,
Joseph
