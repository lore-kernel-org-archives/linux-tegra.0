From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Tue, 10 Dec 2019 23:31:58 +0300
Message-ID: <c8208be6-6471-9963-26ee-67579846b1ff@gmail.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <db3bee1e-1bfa-2f9e-9ed1-91b98554556a@gmail.com>
 <22a2f8bd-561d-f4c6-4eef-bb61095c53b2@nvidia.com>
 <5a5cfa74-66be-5c7a-04eb-88c355851c59@gmail.com>
 <302d8483-513c-9c20-e4d4-1e24f2b317d6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <302d8483-513c-9c20-e4d4-1e24f2b317d6@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

10.12.2019 22:18, Sowjanya Komatineni пишет:
> 
> On 12/10/19 10:30 AM, Dmitry Osipenko wrote:
>> 10.12.2019 20:48, Sowjanya Komatineni пишет:
>>> On 12/10/19 9:41 AM, Dmitry Osipenko wrote:
>>>> 09.12.2019 23:46, Sowjanya Komatineni пишет:
>>>>> On 12/9/19 12:12 PM, Dmitry Osipenko wrote:
>>>>>> 08.12.2019 00:36, Sowjanya Komatineni пишет:
>>>>>>> On 12/7/19 11:59 AM, Sowjanya Komatineni wrote:
>>>>>>>> On 12/7/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>>>>> 07.12.2019 18:53, Dmitry Osipenko пишет:
>>>>>>>>>> 07.12.2019 18:47, Dmitry Osipenko пишет:
>>>>>>>>>>> 07.12.2019 17:28, Dmitry Osipenko пишет:
>>>>>>>>>>>> 06.12.2019 05:48, Sowjanya Komatineni пишет:
>>>>>>>>>>>>> Tegra210 and prior Tegra PMC has clk_out_1, clk_out_2,
>>>>>>>>>>>>> clk_out_3
>>>>>>>>>>>>> with
>>>>>>>>>>>>> mux and gate for each of these clocks.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Currently these PMC clocks are registered by Tegra clock
>>>>>>>>>>>>> driver
>>>>>>>>>>>>> using
>>>>>>>>>>>>> clk_register_mux and clk_register_gate by passing PMC base
>>>>>>>>>>>>> address
>>>>>>>>>>>>> and register offsets and PMC programming for these clocks
>>>>>>>>>>>>> happens
>>>>>>>>>>>>> through direct PMC access by the clock driver.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With this, when PMC is in secure mode any direct PMC access
>>>>>>>>>>>>> from the
>>>>>>>>>>>>> non-secure world does not go through and these clocks will
>>>>>>>>>>>>> not be
>>>>>>>>>>>>> functional.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch adds these clocks registration with PMC as a clock
>>>>>>>>>>>>> provider
>>>>>>>>>>>>> for these clocks. clk_ops callback implementations for these
>>>>>>>>>>>>> clocks
>>>>>>>>>>>>> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC
>>>>>>>>>>>>> programming
>>>>>>>>>>>>> in secure mode and non-secure mode.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>> [snip]
>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static const struct clk_ops pmc_clk_gate_ops = {
>>>>>>>>>>>>> +    .is_enabled = pmc_clk_is_enabled,
>>>>>>>>>>>>> +    .enable = pmc_clk_enable,
>>>>>>>>>>>>> +    .disable = pmc_clk_disable,
>>>>>>>>>>>>> +};
>>>>>>>>>>>> What's the benefit of separating GATE from the MUX?
>>>>>>>>>>>>
>>>>>>>>>>>> I think it could be a single clock.
>>>>>>>>>>> According to TRM:
>>>>>>>>>>>
>>>>>>>>>>> 1. GATE and MUX are separate entities.
>>>>>>>>>>>
>>>>>>>>>>> 2. GATE is the parent of MUX (see PMC's CLK_OUT paths diagram in
>>>>>>>>>>> TRM).
>>>>>>>>>>>
>>>>>>>>>>> 3. PMC doesn't gate EXTPERIPH clock but could "force-enable" it,
>>>>>>>>>>> correct?
>>>>>>> Was following existing clk-tegra-pmc as I am not sure of reason for
>>>>>>> having these clocks registered as separate mux and gate clocks.
>>>>>>>
>>>>>>> Yes, PMC clocks can be registered as single clock and can use
>>>>>>> clk_ops
>>>>>>> for set/get parent and enable/disable.
>>>>>>>
>>>>>>> enable/disable of PMC clocks is for force-enable to force the
>>>>>>> clock to
>>>>>>> run regardless of ACCEPT_REQ or INVERT_REQ.
>>>>>>>
>>>>>>>>>> 4. clk_m_div2/4 are internal PMC OSC dividers and thus these
>>>>>>>>>> clocks
>>>>>>>>>> should belong to PMC.
>>>>>>>>> Also, it should be "osc" and not "clk_m".
>>>>>>>> I followed the same parents as it were in existing clk-tegra-pmc
>>>>>>>> driver.
>>>>>>>>
>>>>>>>> Yeah they are wrong and they should be from osc and not clk_m.
>>>>>>>>
>>>>>>>> Will fix in next version.
>>>>>>>>
>>>>>> Could you please describe the full EXTPERIPH clock topology and
>>>>>> how the
>>>>>> pinmux configuration is related to it all?
>>>>>>
>>>>>> What is internal to the Tegra chip and what are the external outputs?
>>>>>>
>>>>>> Is it possible to bypass PMC on T30+ for the EXTPERIPH clocks?
>>>>> PMC CLK1/2/3 possible sources are OSC_DIV1, OSC_DIV2, OSC_DIV4,
>>>>> EXTPERIPH from CAR.
>>>>>
>>>>> OSC_DIV1/2/4 are with internal dividers at the OSC Pads
>>>>>
>>>>> EXTPERIPH is from CAR and it has reset and enable controls along with
>>>>> clock source selections to choose one of the PLLA_OUT0, CLK_S,
>>>>> PLLP_OUT0, CLK_M, PLLE_OUT0
>>>> Are you sure that EXTPERIPH has a reset? What will it reset? Why it's
>>>> not documented in TRM?
>>> Yes, Extperiph1/2/3 has RST part of CAR RST_DEVICES_V bits 24/25/26
>> Are these bits not documented in a public TRMs? I checked
>> T30/114/124/210 TRMs and CLK_RST_CONTROLLER_RST_DEVICES_V_0 doesn't have
>> those bits in the docs.
>>
> Yeah these bits are missing in all Tegra TRM docs. Will request for
> having EXTPERIPH reset bits to be updated in TRM...

Thanks
