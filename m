From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 6/8] clk: tegra30: add 2d and 3d idle clocks
Date: Tue, 24 Jul 2018 13:32:28 +0100
Message-ID: <a4bd4ea0-ad7b-e942-c535-1ac5f9162beb@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <20180720134532.13148-7-ben.dooks@codethink.co.uk>
 <6750449.onR3KBHYkZ@dimapc> <16130866.kpFhQUNOMP@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16130866.kpFhQUNOMP@dimapc>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org

On 24/07/18 12:31, Dmitry Osipenko wrote:
> On Monday, 23 July 2018 16:05:21 MSK Dmitry Osipenko wrote:
>> On Friday, 20 July 2018 16:45:30 MSK Ben Dooks wrote:
>>> The 2D and 3D clocks have an IDLE field in bits 15:8 so add these
>>> clocks by making a 2D and 3D mux, and split the divider into the
>>> standard 2D/3D ones and 2D/3D idle clocks.
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>>   drivers/clk/tegra/clk-id.h              |  4 ++++
>>>   drivers/clk/tegra/clk-tegra-periph.c    | 23 +++++++++++++++++++++--
>>>   drivers/clk/tegra/clk-tegra30.c         |  8 ++++++++
>>>   include/dt-bindings/clock/tegra30-car.h |  7 ++++++-
>>>   4 files changed, 39 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
>>> index b616e33c5255..0d202a70ce66 100644
>>> --- a/drivers/clk/tegra/clk-id.h
>>> +++ b/drivers/clk/tegra/clk-id.h
>>> @@ -91,8 +91,12 @@ enum clk_id {
>>>   	tegra_clk_fuse_burn,
>>>   	tegra_clk_gpu,
>>>   	tegra_clk_gr2d,
>>> +	tegra_clk_gr2d_mux,
>>> +	tegra_clk_gr2d_idle,
>>>   	tegra_clk_gr2d_8,
>>>   	tegra_clk_gr3d,
>>> +	tegra_clk_gr3d_mux,
>>> +	tegra_clk_gr3d_idle,
>>>   	tegra_clk_gr3d_8,
>>>   	tegra_clk_hclk,
>>>   	tegra_clk_hda,
>>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c
>>> b/drivers/clk/tegra/clk-tegra-periph.c index 47e5b1ac1a69..83967dac93f2
>>> 100644
>>> --- a/drivers/clk/tegra/clk-tegra-periph.c
>>> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>>> @@ -263,6 +263,21 @@
>>>   		.flags = _flags,					\
>>>   	}
>>>
>>> +#define GATE_DIV(_name, _parent_name, _offset,				\
>>> +		 _div_shift, _div_width, _div_frac_width, _div_flags,	\
>>> +			     _clk_num, _gate_flags,  _clk_id, _flags)	\
>>> +	{								\
>>> +		.name = _name,						\
>>> +		.clk_id = _clk_id,					\
>>> +		.offset = _offset,					\
>>> +		.p.parent_name =  _parent_name,				\
>>> +		.periph = TEGRA_CLK_PERIPH(0, 0, 0,			\
>>> +					   _div_shift, _div_width,	\
>>> +					   _div_frac_width, _div_flags, \
>>> +				_clk_num, _gate_flags, NULL, NULL),	\
>>> +		.flags = _flags						\
>>> +	}
>>> +
>>>   #define PLLP_BASE 0xa0
>>>   #define PLLP_MISC 0xac
>>>   #define PLLP_MISC1 0x680
>>> @@ -646,8 +661,12 @@ static struct tegra_periph_init_data periph_clks[] = {
>>>   	MUX("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0,
>> tegra_clk_epp),
>>> MUX("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0,
>>> tegra_clk_host1x), MUX("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60,
>>> 0, tegra_clk_mpe), -	MUX("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D,
>> 21,
>>> 0, tegra_clk_gr2d), -	MUX("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D,
>> 24,
>>> 0, tegra_clk_gr3d), +	MUX("2d_mux", mux_pllm_pllc_pllp_plla,
>> CLK_SOURCE_2D,
>>> 0, TEGRA_PERIPH_NO_DIV | TEGRA_PERIPH_NO_RESET | TEGRA_PERIPH_NO_GATE,
>>> tegra_clk_gr2d_mux), +	GATE_DIV("2d", "2d_mux", CLK_SOURCE_2D, 0, 8, 1,
>>> TEGRA_DIVIDER_ROUND_UP,21, 0, tegra_clk_gr2d, 0), +	GATE_DIV("2d_idle",
>>> "2d_mux", CLK_SOURCE_2D, 8, 8, 1, TEGRA_DIVIDER_ROUND_UP, 0,
>>> TEGRA_PERIPH_NO_GATE | TEGRA_PERIPH_NO_RESET, tegra_clk_gr2d_idle, 0),
>>> +	MUX("3d_mux", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 0,
>>
>> Now that the actual parent clock is specified by the "mux" clock, you have to
>> adjust the tegra_clk_init_table accordingly.
>>
>>
>>
>>
> 
> The 3d/2d clocks do not have a parent on T20 with these patches being applied.

Thanks, I need to extract the setup from some of the other changes that
we did for the tegra30a/20a devices.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
