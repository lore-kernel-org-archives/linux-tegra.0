From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Date: Thu, 19 Oct 2017 17:19:01 -0700
Message-ID: <20171020001859.GA9196@Asurada-Nvidia>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
 <20171019092919.GA7252@Asurada>
 <20171019094422.GI9005@ulmo>
 <20171019184223.GA7415@Asurada-Nvidia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171019184223.GA7415@Asurada-Nvidia>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 19, 2017 at 11:42:24AM -0700, Nicolin Chen wrote:
> On Thu, Oct 19, 2017 at 11:44:22AM +0200, Thierry Reding wrote:
> > > > Below is the call trace of tegra210_init_pllu() function:
> > > >   start_kernel()
> > > >   -> time_init()
> > > >   --> of_clk_init()
> > > >   ---> tegra210_clock_init()
> > > >   ----> tegra210_pll_init()
> > > >   -----> tegra210_init_pllu()
> 
> > I'm wondering why we're not seeing a splat for this. Usually the kernel
> > will warn if you sleep during atomic context. Does this mean we're just
> > not hitting that case?
> 
> Yes.
> 
> > readx_poll_timeout() has a might_sleep_if(), and
> > therefore it should always cause the splat.
> 
> That's true as long as CONFIG_DEBUG_ATOMIC_SLEEP is enabled locally.
> 
> > Any ideas why this has gone unnoticed for all this time?
> 
> We can see in the tegra210_init_pllu() function that it'll not call
> tegra210_enable_pllu() if pllu is already enabled (by bootloader).
> 
> You can verify it by adding an irqs_disabled() in this routine. The
> function is called during system-boot and suspend-n-resume. And both

A correction: using mainline kernel, only system-boot as the commit log
describes.

> cases should be irqs_disabled().
> 
> Thanks
> Nicolin
