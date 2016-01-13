From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Wed, 13 Jan 2016 11:28:08 -0500
Message-ID: <56967B18.9070209@nvidia.com>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
 <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
 <20160113160833.GK2588@ulmo> <5696770D.2050007@nvidia.com>
 <20160113161931.GN2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160113161931.GN2588@ulmo>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 1/13/2016 11:19 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Jan 13, 2016 at 11:10:53AM -0500, Rhyland Klein wrote:
>> On 1/13/2016 11:08 AM, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Mon, Dec 21, 2015 at 12:56:32PM +0000, Jon Hunter wrote:
>>>> The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defined
>>>> but not used and when the OVERRIDE bit is cleared in tegra210_pll_init()
>>>> the code directly uses the bit number. Therefore, use the definition,
>>>> PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>>> index 791215747863..6f043c5e2394 100644
>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>> @@ -2520,7 +2520,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>>>>  
>>>>  	/* PLLU_VCO */
>>>>  	val = readl(clk_base + pll_u_vco_params.base_reg);
>>>> -	val &= ~BIT(24); /* disable PLLU_OVERRIDE */
>>>> +	val &= ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
>>>>  	writel(val, clk_base + pll_u_vco_params.base_reg);
>>>>  
>>>>  	clk = tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, pmc,
>>>
>>> I think the comment is now redundant, given that the code says pretty
>>> much the same thing. No need to respin for that, I can remove the
>>> comment when I apply the patch. That is, unless anyone feels strongly
>>> about keeping the comment.
>>
>> I agree its redundant. If I am going to post a new version to address
>> other concerns, I can just roll this in while doing so.
> 
> This looks like a good fix, or cleanup, on its own. So no need for
> anyone to carry this forward, I can pick it up into a fixes branch
> for v4.5.
> 

Sure thing.

Thanks,
Rhyland


-- 
nvpublic
