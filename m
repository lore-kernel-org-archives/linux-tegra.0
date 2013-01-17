From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V5 1/3] clk: tegra: add Tegra specific clocks
Date: Thu, 17 Jan 2013 14:53:34 -0700
Message-ID: <50F872DE.9060109@wwwdotorg.org>
References: <1358369575-7325-1-git-send-email-swarren@wwwdotorg.org> <20130117155307.GF4118@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130117155307.GF4118-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/17/2013 08:53 AM, Peter De Schrijver wrote:
> On Wed, Jan 16, 2013 at 09:52:53PM +0100, Stephen Warren wrote:
>> From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add Tegra specific clocks, pll, pll_out, peripheral, frac_divider, super.
>>
>> Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [swarren: alloc sizeof(*foo) not sizeof(struct foo), add comments re:
>> storing pointers to stack variables, make a timeout loop more idiomatic,
>> use _clk_pll_disable() not clk_disable_pll() from _program_pll() to
>> avoid redundant lock operations, unified tegra_clk_periph() and
>> tegra_clk_periph_nodiv(), unified tegra_clk_pll{,e}, rename all clock
>> registration functions so they don't have the same name as the clock
>> structs.]
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ...
> 
>> +static int clk_plle_enable(struct clk_hw *hw)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
>> +       struct tegra_clk_pll_freq_table sel;
>> +       u32 val;
>> +       int err;
>> +
>> +       if (_get_table_rate(hw, &sel, pll->fixed_rate, input_rate))
>> +               return -EBUSY;
>> +
> 
> I think -EINVAL would be more appropriate here?

Yes. I fixed this and the PLL function parameters you mentioned in your
other email.
