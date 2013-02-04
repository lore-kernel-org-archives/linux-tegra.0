From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 04/10] clk: tegra: Add new fields and PLL types for
 Tegra114
Date: Mon, 4 Feb 2013 12:05:29 +0530
Message-ID: <510F56B1.5060409@nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com> <1359713962-16822-5-git-send-email-pdeschrijver@nvidia.com> <510C1A2E.5010408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <510C1A2E.5010408-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 02 February 2013 01:10 AM, Rhyland Klein wrote:
> On 2/1/2013 5:18 AM, Peter De Schrijver wrote:
>> Tegra114 introduces new PLL types. This requires new clocktypes as well
>> as some new fields in the pll structure.
>>
>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>    drivers/clk/tegra/clk-pll.c |  719 +++++++++++++++++++++++++++++++++++++++++++
>>    drivers/clk/tegra/clk.h     |   47 +++
>>    2 files changed, 766 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 87d2f34..50114b7 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> [snip]
>> +struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>> +                         void __iomem *clk_base, void __iomem *pmc,
>> +                         unsigned long flags, unsigned long fixed_rate,
>> +                         struct tegra_clk_pll_params *pll_params,
>> +                         u32 pll_flags,
>> +                         struct tegra_clk_pll_freq_table *freq_table,
>> +                         spinlock_t *lock)
>> +{
>> +       if (!pll_params->pdiv_tohw)
>> +               return -EINVAL;
>> +
> This will cause the following warning:
> warning: return makes pointer from integer without a cast
>
> Same with occurrences in tegra_clk_register_pllm and
> tegra_clk_register_pllc.
>
> Should this instead be returning NULL?

return ERR_PTR(-EINVAL)

>
> -rhyland
>
