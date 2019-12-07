From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Sat, 7 Dec 2019 11:59:19 -0800
Message-ID: <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


On 12/7/19 8:00 AM, Dmitry Osipenko wrote:
> 07.12.2019 18:53, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 07.12.2019 18:47, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 07.12.2019 17:28, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 06.12.2019 05:48, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> Tegra210 and prior Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with
>>>>> mux and gate for each of these clocks.
>>>>>
>>>>> Currently these PMC clocks are registered by Tegra clock driver using
>>>>> clk_register_mux and clk_register_gate by passing PMC base address
>>>>> and register offsets and PMC programming for these clocks happens
>>>>> through direct PMC access by the clock driver.
>>>>>
>>>>> With this, when PMC is in secure mode any direct PMC access from the
>>>>> non-secure world does not go through and these clocks will not be
>>>>> functional.
>>>>>
>>>>> This patch adds these clocks registration with PMC as a clock provide=
r
>>>>> for these clocks. clk_ops callback implementations for these clocks
>>>>> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programm=
ing
>>>>> in secure mode and non-secure mode.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>> [snip]
>>>
>>>>> +
>>>>> +static const struct clk_ops pmc_clk_gate_ops =3D {
>>>>> +	.is_enabled =3D pmc_clk_is_enabled,
>>>>> +	.enable =3D pmc_clk_enable,
>>>>> +	.disable =3D pmc_clk_disable,
>>>>> +};
>>>> What's the benefit of separating GATE from the MUX?
>>>>
>>>> I think it could be a single clock.
>>> According to TRM:
>>>
>>> 1. GATE and MUX are separate entities.
>>>
>>> 2. GATE is the parent of MUX (see PMC's CLK_OUT paths diagram in TRM).
>>>
>>> 3. PMC doesn't gate EXTPERIPH clock but could "force-enable" it, correc=
t?
>> 4. clk_m_div2/4 are internal PMC OSC dividers and thus these clocks
>> should belong to PMC.
> Also, it should be "osc" and not "clk_m".

I followed the same parents as it were in existing clk-tegra-pmc driver.

Yeah they are wrong and they should be from osc and not clk_m.

Will fix in next version.
