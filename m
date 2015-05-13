From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 10/21] clk: tegra: pll: Add logic for out-of-table
 rates for T210
Date: Tue, 12 May 2015 17:01:38 -0700
Message-ID: <CANLzEksWoyJ9o6EcaktfqU8X-z7Pdg_weYaovjyb_SsGRGRC9g@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-12-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-12-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> For Tegra210, the logic to calculate out-of-table rates is different
> from previous generations. Add callbacks that can be overridden to
> allow for different ways of calculating rates. Default to
> _cal_rate when not specified.
>
> This patch also includes a new flag which is used to set which method
> of fixed_mdiv calculation is used. The new method for calculating the
> fixed divider value for M can be more accurate especially when
> fractional dividers are in play. This allows for older chipsets to use
> the existing logic and new generations to use a newer version which
> may work better for them.
>
> Based on original work by Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
> v5:
>   - Updated description to include mentioning the NEW_MDIV flag
>   - Added kerneldoc info for new members




-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
