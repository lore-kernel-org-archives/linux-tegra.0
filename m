From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/7] clk: tegra: Add support for PLLSS
Date: Wed, 16 Oct 2013 11:21:12 -0600
Message-ID: <525ECB08.4020201@wwwdotorg.org>
References: <1381850098-12357-1-git-send-email-pdeschrijver@nvidia.com> <1381850098-12357-2-git-send-email-pdeschrijver@nvidia.com> <525DA373.6040805@wwwdotorg.org> <20131016074829.GD5643@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016074829.GD5643-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 01:48 AM, Peter De Schrijver wrote:
> On Tue, Oct 15, 2013 at 10:20:03PM +0200, Stephen Warren wrote:
>> On 10/15/2013 09:14 AM, Peter De Schrijver wrote:
>>> Tegra124 introduces a new PLL type, PLLSS. Add support for it.
>>
>>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>>
>>
>>> +static int clk_pllss_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +				unsigned long parent_rate)
>>
>> This function seems pretty generic. Is it possible to share a bit more
>> code with any of the other pllXXX_set_rate() functions?
>>
>>> +struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
>>> +				void __iomem *clk_base, unsigned long flags,
>>> +				struct tegra_clk_pll_params *pll_params,
>>> +				spinlock_t *lock)
>>
>>> +	val = pll_readl_base(pll);
>>> +	if (val & PLLSS_REF_SRC_SEL_MASK) {
>>> +		WARN(1, "Unknown parent selected for %s: %d\n", name,
>>> +			(val & PLLSS_REF_SRC_SEL_MASK) >>
>>> +			PLLSS_REF_SRC_SEL_SHIFT);
>>> +		kfree(pll);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>
>> If there's a field in HW that muxes the clock input between n clocks,
>> why does this function assume there's a single parent for this PLL, by
>> taking a "const char *parent_name" parameter?
>>
>> What happens if the bootloader changed this field in HW; is the kernel
>> simply not able to boot?
>>
> 
> This logic comes from downstream. I guess it means we're running in an
> unvalidated configuration. Do you think we should expose all parents 
> anyway? Even if not all configurations have been validated?
> (which is quite likely)

If we only support one particular parent, why not force the register
field to the desired value, rather than failing?
