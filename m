From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/5] clk: tegra: Add AHB DMA clock entry
Date: Wed, 27 Sep 2017 12:41:55 +0300
Message-ID: <168d1f44-21ae-86c5-7d9b-981c370d012b@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <b5fd087892544cd17042a4aa9dc0289fb761352c.1506380746.git.digetx@gmail.com>
 <20170926095611.GW6290@tbergstrom-lnx.Nvidia.com>
 <b575c935-e928-4d51-9905-40731c1aa9c4@gmail.com>
 <20170927083605.GA6290@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170927083605.GA6290@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 27.09.2017 11:36, Peter De Schrijver wrote:
> On Tue, Sep 26, 2017 at 05:46:01PM +0300, Dmitry Osipenko wrote:
>> On 26.09.2017 12:56, Peter De Schrijver wrote:
>>> On Tue, Sep 26, 2017 at 02:22:02AM +0300, Dmitry Osipenko wrote:
>>>> AHB DMA presents on Tegra20/30. Add missing entries, so that driver
>>>> for AHB DMA could be implemented.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/clk/tegra/clk-id.h           | 1 +
>>>>  drivers/clk/tegra/clk-tegra-periph.c | 1 +
>>>>  drivers/clk/tegra/clk-tegra20.c      | 6 ++++++
>>>>  drivers/clk/tegra/clk-tegra30.c      | 2 ++
>>>>  4 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
>>>> index 689f344377a7..c1661b47bbda 100644
>>>> --- a/drivers/clk/tegra/clk-id.h
>>>> +++ b/drivers/clk/tegra/clk-id.h
>>>> @@ -12,6 +12,7 @@ enum clk_id {
>>>>  	tegra_clk_amx,
>>>>  	tegra_clk_amx1,
>>>>  	tegra_clk_apb2ape,
>>>> +	tegra_clk_ahbdma,
>>>>  	tegra_clk_apbdma,
>>>>  	tegra_clk_apbif,
>>>>  	tegra_clk_ape,
>>>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
>>>> index 848255cc0209..95a3d8c95f06 100644
>>>> --- a/drivers/clk/tegra/clk-tegra-periph.c
>>>> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>>>> @@ -823,6 +823,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>>>>  	GATE("timer", "clk_m", 5, 0, tegra_clk_timer, CLK_IS_CRITICAL),
>>>>  	GATE("isp", "clk_m", 23, 0, tegra_clk_isp, 0),
>>>>  	GATE("vcp", "clk_m", 29, 0, tegra_clk_vcp, 0),
>>>> +	GATE("ahbdma", "clk_m", 33, 0, tegra_clk_ahbdma, 0),
>>>
>>> Parent for this should be hclk on Tegra30 and later chips as well..
>>>
>>
>> It looks like other clocks have a wrong parent too here, aren't they? Like for
>> example "apbdma" should have "pclk" as a parent, isn't it?
>>
> 
> Yes. That is correct.
> 

Okay, I'll fix it in V2.

>>>>  	GATE("apbdma", "clk_m", 34, 0, tegra_clk_apbdma, 0),
>>>>  	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
>>>>  	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
>>>> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
>>>> index 837e5cbd60e9..e76c0d292ca7 100644
>>>> --- a/drivers/clk/tegra/clk-tegra20.c
>>>> +++ b/drivers/clk/tegra/clk-tegra20.c
>>>> @@ -449,6 +449,7 @@ static struct tegra_devclk devclks[] __initdata = {
>>>>  	{ .con_id = "audio", .dt_id = TEGRA20_CLK_AUDIO },
>>>>  	{ .con_id = "audio_2x", .dt_id = TEGRA20_CLK_AUDIO_2X },
>>>>  	{ .dev_id = "tegra20-ac97", .dt_id = TEGRA20_CLK_AC97 },
>>>> +	{ .dev_id = "tegra-ahbdma", .dt_id = TEGRA20_CLK_AHBDMA },
>>>
>>> This isn't needed if you use DT bindings to get the clock handle.
>>>
>>
>> Yes, I added it for consistency. Shouldn't we get rid of that all legacy stuff
>> already?
>>
> 
> We probably should, but we can start by not adding more :)
> 

Sure ;)

>>>>  	{ .dev_id = "tegra-apbdma", .dt_id = TEGRA20_CLK_APBDMA },
>>>>  	{ .dev_id = "rtc-tegra", .dt_id = TEGRA20_CLK_RTC },
>>>>  	{ .dev_id = "timer", .dt_id = TEGRA20_CLK_TIMER },
>>>> @@ -806,6 +807,11 @@ static void __init tegra20_periph_clk_init(void)
>>>>  				    clk_base, 0, 3, periph_clk_enb_refcnt);
>>>>  	clks[TEGRA20_CLK_AC97] = clk;
>>>>  
>>>> +	/* ahbdma */
>>>> +	clk = tegra_clk_register_periph_gate("ahbdma", "hclk", 0, clk_base,
>>>> +				    0, 33, periph_clk_enb_refcnt);
>>>> +	clks[TEGRA20_CLK_AHBDMA] = clk;
>>>> +
>>>
>>> You can use the generic definition here if you correct the entry above.
>>>
>>
>> Good point, same applies to "apbdma". Thank you for the suggestion.
>>
> 
> Indeed.

-- 
Dmitry
