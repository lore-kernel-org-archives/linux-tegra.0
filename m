From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Date: Thu, 19 Oct 2017 02:29:20 -0700
Message-ID: <20171019092919.GA7252@Asurada>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505502613-11801-1-git-send-email-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 15, 2017 at 12:10:13PM -0700, Nicolin Chen wrote:
> Below is the call trace of tegra210_init_pllu() function:
>   start_kernel()
>   -> time_init()
>   --> of_clk_init()
>   ---> tegra210_clock_init()
>   ----> tegra210_pll_init()
>   -----> tegra210_init_pllu()
> 
> Because the preemption is disabled in the start_kernel before calling
> time_init, tegra210_init_pllu is actually in an atomic context while
> it includes a readl_relaxed_poll_timeout that might sleep.
> 
> So this patch just changes this readl_relaxed_poll_timeout() to its
> atomic version.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thierry, can you also take a look at this one? I sent a month ago. Thanks.
