From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 12/20] clk: tegra: pll: Add specialized logic for T210
Date: Mon, 4 May 2015 11:40:43 -0400
Message-ID: <554792FB.6080804@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com> <1430506447-29074-13-git-send-email-rklein@nvidia.com> <3e078ce64eff4ac992900523b1b67f19@HKMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3e078ce64eff4ac992900523b1b67f19-Mplb3Xlf2OrYuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/1/2015 11:12 PM, Jim Lin wrote:
> 
>> +static void clk_plle_tegra210_is_enabled(struct struct clk_hw *hw) {
> Returned type is "int" instead of "void".
> Also one "struct" only for "clk_hw *hw"?
> 
>> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +	u32 val;
>> +
>> +	val = pll_readl_base(pll);
>> +
>> +	return val & PLLE_BASE_ENABLE ? 1 : 0; }
>> +
> --nvpublic
> 
thanks! will fix.

-rhyland

-- 
nvpublic
