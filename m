From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V4 18/18] arm64: dts: tegra210-p2180: Jetson TX1 SC7
 timings
Date: Wed, 26 Jun 2019 09:28:28 -0700
Message-ID: <908eb03e-3b08-4e48-e64e-56cf6e66b5f2@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
 <20190626102824.GG6362@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626102824.GG6362@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/26/19 3:28 AM, Thierry Reding wrote:
> On Sun, Jun 23, 2019 at 08:02:59PM -0700, Sowjanya Komatineni wrote:
>> This patch has Jetson TX1 platform specific SC7 timing configuration
>> in device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
> Can you provide a similar patch for Jetson Nano (p3450-0000)? It'd be
> great if we can make new features like this available across all boards.
>
> Thierry
>
Will add patch for Nano in V5...
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> index 27723829d033..cb58f79deb48 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> @@ -279,6 +279,13 @@
>>   
>>   	pmc@7000e400 {
>>   		nvidia,invert-interrupt;
>> +		nvidia,suspend-mode = <0>;
>> +		nvidia,cpu-pwr-good-time = <0>;
>> +		nvidia,cpu-pwr-off-time = <0>;
>> +		nvidia,core-pwr-good-time = <4587 3876>;
>> +		nvidia,core-pwr-off-time = <39065>;
>> +		nvidia,core-power-req-active-high;
>> +		nvidia,sys-clock-req-active-high;
>>   	};
>>   
>>   	/* eMMC */
>> -- 
>> 2.7.4
>>
