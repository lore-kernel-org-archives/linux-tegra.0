From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v1 03/17] dt-bindings: soc: tegra-pmc: Add Tegra PMC clock
 ids
Date: Tue, 3 Dec 2019 14:19:37 -0800
Message-ID: <50f7db27-a1bd-6e2a-0994-82740b4ef6cb@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-4-git-send-email-skomatineni@nvidia.com>
 <20191203220850.GB22716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191203220850.GB22716@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/3/19 2:08 PM, Rob Herring wrote:
> On Mon, Nov 18, 2019 at 10:50:20PM -0800, Sowjanya Komatineni wrote:
>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 clocks and each of
>> these clocks has mux and a gate as a part of PMC controller.
>>
>> This patch adds ids for each of these PMC clock mux and gates to
>> use with the devicetree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   include/dt-bindings/soc/tegra-pmc.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 include/dt-bindings/soc/tegra-pmc.h
> This should be part of the binding patch.
ok, will combine in v3
>> diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
>> new file mode 100644
>> index 000000000000..fa1ccfc2514b
>> --- /dev/null
>> +++ b/include/dt-bindings/soc/tegra-pmc.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2019-2020, NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_SOC_TEGRA_PMC_H
>> +#define _DT_BINDINGS_SOC_TEGRA_PMC_H
>> +
>> +#define TEGRA_PMC_CLK_OUT_1_MUX		0
>> +#define TEGRA_PMC_CLK_OUT_1		1
>> +#define TEGRA_PMC_CLK_OUT_2_MUX		2
>> +#define TEGRA_PMC_CLK_OUT_2		3
>> +#define TEGRA_PMC_CLK_OUT_3_MUX		4
>> +#define TEGRA_PMC_CLK_OUT_3		5
>> +
>> +#endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
>> -- 
>> 2.7.4
>>
