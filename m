From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 2/9] clk: tegra: Add tegra specific clocks
Date: Wed, 16 Jan 2013 11:44:35 -0700
Message-ID: <50F6F513.1030806@wwwdotorg.org>
References: <1357890387-23245-1-git-send-email-pgaikwad@nvidia.com><1357890387-23245-3-git-send-email-pgaikwad@nvidia.com> <20130116.143151.1531468192773974887.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116.143151.1531468192773974887.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 05:31 AM, Hiroshi Doyu wrote:
> Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Fri, 11 Jan 2013 08:46:20 +0100:
> ...
>> +struct clk *tegra_clk_periph(const char *name, const char **parent_names,
>> +                            int num_parents, struct tegra_clk_periph *periph,
>> +                            void __iomem *clk_base, u32 offset)
...
>> +struct clk *tegra_clk_periph_nodiv(const char *name, const char **parent_names,
>> +                             int num_parents, struct tegra_clk_periph *periph,
>> +                             void __iomem *clk_base, u32 offset)
...
>
> The above two functions are almost duplicate, can we take the common part from them?

Sure, that looks reasonable.

> struct clk *__tegra_clk_periph(const char *name, const char **parent_names,
> 			    int num_parents, struct tegra_clk_periph *periph,
> 			    void __iomem *clk_base, u32 offset, int div)

>        periph->divider.reg = clk_base + offset;

That will also need to be conditional.

>        periph->divider.hw.clk = div ? NULL : clk;

And that test is inverted.

> static inline struct clk *tegra_clk_periph(const char *name, const char **parent_names,
> 			    int num_parents, struct tegra_clk_periph *periph,
> 			    void __iomem *clk_base, u32 offset)

I'd rather just make these regular functions in the .c file; otherwise
they have to go into the header file, which means prototyping
__tegra_clk_periph() there and it just gets messy.
