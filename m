From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Date: Fri, 20 Oct 2017 11:24:07 -0700
Message-ID: <20171020182406.GA12980@Asurada-Nvidia>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
 <20171019092919.GA7252@Asurada>
 <20171019094422.GI9005@ulmo>
 <20171019184223.GA7415@Asurada-Nvidia>
 <731a934a-4e78-b96d-239f-14cf83079605@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <731a934a-4e78-b96d-239f-14cf83079605@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, sboyd@codeaurora.org, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, pgaikwad@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 20, 2017 at 11:20:24AM +0100, Jon Hunter wrote:
> 
> On 19/10/17 19:42, Nicolin Chen wrote:
> > On Thu, Oct 19, 2017 at 11:44:22AM +0200, Thierry Reding wrote:
> >>>> Below is the call trace of tegra210_init_pllu() function:
> >>>>   start_kernel()
> >>>>   -> time_init()
> >>>>   --> of_clk_init()
> >>>>   ---> tegra210_clock_init()
> >>>>   ----> tegra210_pll_init()
> >>>>   -----> tegra210_init_pllu()
> > 
> >> I'm wondering why we're not seeing a splat for this. Usually the kernel
> >> will warn if you sleep during atomic context. Does this mean we're just
> >> not hitting that case?
> > 
> > Yes.
> > 
> >> readx_poll_timeout() has a might_sleep_if(), and
> >> therefore it should always cause the splat.
> > 
> > That's true as long as CONFIG_DEBUG_ATOMIC_SLEEP is enabled locally.
> > 
> >> Any ideas why this has gone unnoticed for all this time?
> > 
> > We can see in the tegra210_init_pllu() function that it'll not call
> > tegra210_enable_pllu() if pllu is already enabled (by bootloader).
> 
> I was thinking that same and so I clobbered the PLLU enable bit with
> u-boot, however, then the kernel appears to hang on boot when enabling
> the PLL. So although this is probably a separate issue, I am curious if
> you have booted the mainline with the PLLU disabled?

I am not sure if clearing the enable bit only would work. But the test
below should be able to verify the situation -- setting the PLLU_BASE
register to its reset value.

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ea695c4..2279373 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2602,6 +2602,7 @@ static int tegra210_init_pllu(void)
 	u32 reg;
 	int err;
 
+	writel_relaxed(0x1011902, clk_base + PLLU_BASE);
	tegra210_pllu_set_defaults(&pll_u_vco_params);
	/* skip initialization when pllu is in hw controlled mode */
	reg = readl_relaxed(clk_base + PLLU_BASE);
