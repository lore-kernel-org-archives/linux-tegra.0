From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 16/20] arm64: tegra: Enable wake from deep sleep on RTC
 alarm
Date: Wed, 31 Jul 2019 14:08:38 -0700
Message-ID: <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
 <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch updates device tree for RTC and PMC to allow system wake
>> from deep sleep on RTC alarm.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/=
dts/nvidia/tegra210.dtsi
>> index 659753118e96..30a7c48385a2 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -768,7 +768,8 @@
>>   	rtc@7000e000 {
>>   		compatible =3D "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>   		reg =3D <0x0 0x7000e000 0x0 0x100>;
>> -		interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-parent =3D <&pmc>;
>>   		clocks =3D <&tegra_car TEGRA210_CLK_RTC>;
>>   		clock-names =3D "rtc";
>>   	};
>> @@ -778,6 +779,8 @@
>>   		reg =3D <0x0 0x7000e400 0x0 0x400>;
>>   		clocks =3D <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>   		clock-names =3D "pclk", "clk32k_in";
>> +		#interrupt-cells =3D <2>;
>> +		interrupt-controller;
>>  =20
>>   		powergates {
>>   			pd_audio: aud {
>>
> Is this a backwards-compatible change? Or it's not really worth to care
> about the compatibility with older kernel versions, I'm not sure about
> overall state of T210 in the upstream kernel.
I don't think its required to be backwards-compatible as SC7 entry/exit=20
implementation for T210 is with this patch series onwards..
