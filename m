From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v5 07/19] dt-bindings: soc: tegra-pmc: Add id for Tegra
 PMC 32KHz blink clock
Date: Fri, 27 Dec 2019 13:30:43 -0800
Message-ID: <b46c21ca-855e-cd81-ab8d-aa96b61ebb56@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-8-git-send-email-skomatineni@nvidia.com>
 <c8a847fb-3d23-6e1e-59e2-a2d15b63ce02@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8a847fb-3d23-6e1e-59e2-a2d15b63ce02@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/22/19 1:55 PM, Dmitry Osipenko wrote:
> 21.12.2019 01:26, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra PMC has blink functionality that allows 32KHz clock out to
>> blink pin of the Tegra.
>>
>> This patch adds id for this blink clock to use for enabling or
>> disabling blink output through device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   include/dt-bindings/soc/tegra-pmc.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/s=
oc/tegra-pmc.h
>> index f7c866404456..a99a457471ee 100644
>> --- a/include/dt-bindings/soc/tegra-pmc.h
>> +++ b/include/dt-bindings/soc/tegra-pmc.h
>> @@ -9,7 +9,8 @@
>>   #define TEGRA_PMC_CLK_OUT_1		0
>>   #define TEGRA_PMC_CLK_OUT_2		1
>>   #define TEGRA_PMC_CLK_OUT_3		2
>> +#define TEGRA_PMC_CLK_BLINK		3
>>  =20
>> -#define TEGRA_PMC_CLK_MAX		3
>> +#define TEGRA_PMC_CLK_MAX		4
>>  =20
>>   #endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
>>
> Could you please explain the reason of separating CLK_OUT and BLINK PMC
> patches?
No specific reason just thought to have BLINK as separate patch as its=20
different register configuration to have fixed 32Khz clock out.
>
> Also, you only documented CLK_OUT clocks in the DT binding and no BLINK.
missed to add BLINK to dt-binding doc. Will add in v6.
