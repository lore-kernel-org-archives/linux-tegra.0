From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
Date: Fri, 4 Oct 2019 10:07:39 -0600
Message-ID: <0fa7829b-ec05-8b57-138e-694155385d26@wwwdotorg.org>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191002110454.GJ3716706@ulmo>
 <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
 <20191004121812.GB227112@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004121812.GB227112@ulmo>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 10/4/19 6:18 AM, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 02:59:03PM -0600, Stephen Warren wrote:
>> On 10/2/19 5:04 AM, Thierry Reding wrote:
>>> On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
>>>> From: Stephen Warren <swarren@nvidia.com>
>>>>
>>>> For a little over a year, U-Boot has configured the flow controller to
>>>> perform automatic RAM re-repair on off->on power transitions of the CPU
>>>> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
>>>> re-repair relies on certain clocks, which the kernel must enable and
>>>> leave running. The fuse clock is one of those clocks. Enable this clock
>>>> so that LP1 power mode (system suspend) operates correctly.
>>>>
>>>> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>>>>
>>>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>>>> ---
>>>>    drivers/clk/tegra/clk-tegra124.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
>>>> index 0224fdc4766f..f53f6315c646 100644
>>>> --- a/drivers/clk/tegra/clk-tegra124.c
>>>> +++ b/drivers/clk/tegra/clk-tegra124.c
>>>> @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
>>>>    };
>>>>    static struct tegra_clk_init_table tegra124_init_table[] __initdata = {
>>>> +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
>>>
>>> I think the correct way to do this these days is to mark the clock as
>>> CRITICAL. Not sure if there's an easy way to do that given that the
>>> clock init table doesn't allow storing flags.
>>>
>>> Do you have any good ideas on how to achieve this with the critical flag
>>> instead of forcing the refcount to 1?
>>>
>>> Perhaps something like the below would work?
>>> ...
>>
>> The following works for me; does this seem like a reasonable approach? It
>> does set the critical flag for all SoCs, including any that don't require
>> RAM re-repair. I'm not sure which do; I know it's more than just Tegra124,
>> but I'm not sure how far back/forward the requirement goes.
>>
>>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
>>> index 1ed85f120a1b..76dd91eebd13 100644
>>> --- a/drivers/clk/tegra/clk-tegra-periph.c
>>> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>>> @@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>>>          GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
>>>          GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
>>>          GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
>>> -       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
>>> +       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
>>>          GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
>>>          GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
>>>          GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
> 
> It's probably fine to do this. The patch I proposed would've restricted
> the change to just Tegra124. But if we need this on other generations, I
> don't think the extra complexity is justified, especially since I can't
> imagine that the FUSE clock remaining always on would consume a lot of
> extra power.

T114/T124/T132/T210 all require it. T20/T30 I'm not sure since the TRM 
doesn't mention RAM repair, but that could just be missing 
documentation. I think it was introduced in T114 though. The T186 and 
T194s TRM mention RAM repair, but so much changed in those SoCs I'm not 
certain if it works in the same way and hence relies on fuse clock; 
probably though.
