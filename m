From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 18/21] clk: tegra: pll: Fix _pll_ramp_calc_pll logic
 and _calc_dynamic_ramp_rate
Date: Wed, 13 May 2015 17:29:28 -0700
Message-ID: <CANLzEktz7Dqd9nRkGMK-iv--wo_LQM0wen8Qsq+jrvG96oSsfA@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-20-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-20-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This removes the conversion from pdiv to hw, which is already taken
> care of by _get_table_rate before this code is run. This avoids
> incorrectly converting pdiv to hw twice and getting the wrong hw value.
>
> Also set the input_rate in the freq cfg in _calc_dynamic_ramp_rate while
> setting all the other fields.
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


Reviewed-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
