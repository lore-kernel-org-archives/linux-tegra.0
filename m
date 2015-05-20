From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 17/21] clk: tegra: pll: Add logic for SS
Date: Wed, 20 May 2015 13:19:10 -0400
Message-ID: <555CC20E.8030907@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>	<1431451444-23155-19-git-send-email-rklein@nvidia.com> <CANLzEks10KmCAx4tK0oSejJ6Z+oBRS2+pcsktvStQrogCarTJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLzEks10KmCAx4tK0oSejJ6Z+oBRS2+pcsktvStQrogCarTJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/13/2015 8:25 PM, Benson Leung wrote:
> On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
>> +{
>> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
> 
> Is there any reason you're checking for the existence of
> ssc_ctrl_en_mask rather than ssc_ctrl_reg?

Not particularly, just a way of seeing if ssc is supported by this pll,
I will change it to check the register to be more consistent with other
checks in the code.

-rhyland

-- 
nvpublic
