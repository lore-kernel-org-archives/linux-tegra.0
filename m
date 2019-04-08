From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on
 Tegra210
Date: Mon, 8 Apr 2019 12:15:21 +0300
Message-ID: <20190408091521.GC12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-3-josephl@nvidia.com>
 <20190403092250.GG5238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190403092250.GG5238@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 03, 2019 at 11:22:50AM +0200, Thierry Reding wrote:
> On Mon, Mar 25, 2019 at 03:45:17PM +0800, Joseph Lo wrote:
> > 1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
> > 2) Remove the old emc_mux clock and don't use the common EMC clock
> >    definition. This will be replaced by a new clock defined in the EMC
> >    driver.
> > 3) Export functions to allow accessing the CAR register required for EMC
> >    clock scaling. These functions will be used to access the CAR register
> >    as part of the scaling sequence.
> 
> The fact that you can enumerate 3 logical changes made by this commit
> indicates that it should be split up into smaller patches.
> 
> > Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> > 
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
> >  include/dt-bindings/clock/tegra210-car.h |   4 +-
> >  include/linux/clk/tegra.h                |   5 +
> >  3 files changed, 103 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 7545af763d7a..e17b5279ea69 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -47,6 +47,7 @@
> >  #define CLK_SOURCE_LA 0x1f8
> >  #define CLK_SOURCE_SDMMC2 0x154
> >  #define CLK_SOURCE_SDMMC4 0x164
> > +#define CLK_SOURCE_EMC_DLL 0x664
> >  
> >  #define PLLC_BASE 0x80
> >  #define PLLC_OUT 0x84
> > @@ -234,6 +235,10 @@
> >  #define RST_DFLL_DVCO 0x2f4
> >  #define DVFS_DFLL_RESET_SHIFT 0
> >  
> > +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
> > +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
> > +#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
> > +
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> >  
> > @@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] = {
> >  	[8] = 12000000,
> >  };
> >  
> > -static const char *mux_pllmcp_clkm[] = {
> > -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
> > -	"pll_p",
> > -};
> > -#define mux_pllmcp_clkm_idx NULL
> > -
> >  #define PLL_ENABLE			(1 << 30)
> >  
> >  #define PLLCX_MISC1_IDDQ		(1 << 27)
> > @@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
> >  	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
> >  	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
> >  	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
> > -	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
> > +	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = false },
> >  	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
> >  	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
> >  	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
> > @@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
> >  	return 0;
> >  }
> >  
> > +void tegra210_clk_emc_dll_enable(bool flag)
> > +{
> > +	unsigned long flags = 0;
> > +	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
> > +		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
> > +
> > +	spin_lock_irqsave(&emc_lock, flags);
> > +
> > +	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
> > +	readl(clk_base + offset);
> > +
> > +	spin_unlock_irqrestore(&emc_lock, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
> > +
> > +void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
> 
> Do we really want to pass the whole register value through this
> function? The register has three fields, so perhaps it's safer to pass
> the fields individually? Or perhaps we only need to modify a subset of
> the fields and can reduce the number of parameters we pass? Letting a
> different driver pass any arbitrary value here takes away any means of
> checking for validity.
> 

The EMC scaling driver needs to modify all 3 fields. If the DDLL_CLK_SEL
field would be fixed, this function could be left out and CCF be used
instead.

Peter.
