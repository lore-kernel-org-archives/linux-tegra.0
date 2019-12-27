From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v5 18/19] arm64: tegra: smaug: Change clk_out_2 provider
 to pmc
Date: Fri, 27 Dec 2019 13:32:47 -0800
Message-ID: <68d648e0-522e-ec8a-5ec5-c6c7881a87f1@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-19-git-send-email-skomatineni@nvidia.com>
 <2f85578e-8552-9e2e-9f67-355b24d6b99f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f85578e-8552-9e2e-9f67-355b24d6b99f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/22/19 2:00 PM, Dmitry Osipenko wrote:
> 21.12.2019 01:27, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> clk_out_2 is one of the clocks from Tegra PMC block and Tegra PMC
>> clocks are moved from clock driver to pmc driver with pmc as clock
>> provider and using pmc clock ids.
>>
>> This patch changes clk_out_2 provider to pmc and uses corresponding
>> pmc clock id for clk_out_2.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/=
boot/dts/nvidia/tegra210-smaug.dts
>> index 72c7a04ac1df..2faab6390552 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> @@ -1592,7 +1592,7 @@
>>   			reg =3D <0x1a>;
>>   			interrupt-parent =3D <&gpio>;
>>   			interrupts =3D <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
>> -			clocks =3D <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
>> +			clocks =3D <&tegra_pmc TEGRA_PMC_CLK_OUT_2>;
>>   			clock-names =3D "mclk";
>>  =20
>>   			nuvoton,jkdet-enable;
>>
> Isn't "assigned-clocks" needed here?

from existing device tree and clock driver init table clk_out_2 is from=20
clk_m and not using extperiph2.

So to have same clock configuration, didnt added assigned-clocks as=20
default clk_out_2 parent is clk_m
