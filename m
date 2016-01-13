From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Wed, 13 Jan 2016 16:26:05 +0000
Message-ID: <56967A9D.8000009@nvidia.com>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
 <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
 <20160113160833.GK2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113160833.GK2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/01/16 16:08, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Dec 21, 2015 at 12:56:32PM +0000, Jon Hunter wrote:
>> The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defined
>> but not used and when the OVERRIDE bit is cleared in tegra210_pll_init()
>> the code directly uses the bit number. Therefore, use the definition,
>> PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>> index 791215747863..6f043c5e2394 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -2520,7 +2520,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>>  
>>  	/* PLLU_VCO */
>>  	val = readl(clk_base + pll_u_vco_params.base_reg);
>> -	val &= ~BIT(24); /* disable PLLU_OVERRIDE */
>> +	val &= ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
>>  	writel(val, clk_base + pll_u_vco_params.base_reg);
>>  
>>  	clk = tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, pmc,
> 
> I think the comment is now redundant, given that the code says pretty
> much the same thing. No need to respin for that, I can remove the
> comment when I apply the patch. That is, unless anyone feels strongly
> about keeping the comment.

Fine with me. Thanks.

Jon
