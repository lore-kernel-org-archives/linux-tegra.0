From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/4] clk: tegra: MBIST work around for Tegra210
Date: Mon, 22 Jan 2018 17:29:28 +0200
Message-ID: <20180122152928.GC7031@tbergstrom-lnx.Nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-4-git-send-email-pdeschrijver@nvidia.com>
 <3d7f4e84-af44-ba3d-7910-a51a0abce136@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3d7f4e84-af44-ba3d-7910-a51a0abce136-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 20, 2017 at 10:03:35AM +0000, Jon Hunter wrote:
> 
> On 16/11/17 14:29, Peter De Schrijver wrote:
> > Tegra210 has a hw bug which can cause IP blocks to lock up when ungating a
> > domain. The reason is that the logic responsible for resetting the memory
> > built-in self test mode can come up in an undefined state because it doesn't
> > get a clock or reset signal. Work around this by making sure the logic will
> > get some clock edges by ensuring the relevant clock is enabled and temporarily
> > override the relevant second level clock gates (SLCG).
> 
> Not sure I follow the 2nd half of the above sentence.
> 
> > Unfortunately for some IP blocks, the control bits for overriding the
> > SLCGs are not in CAR, but in the IP block itself. This means we need to
> > map a few extra register banks in the clock code.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c | 359 ++++++++++++++++++++++++++++++++++++++-
> >  include/linux/clk/tegra.h        |   1 +
> >  2 files changed, 358 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 55a5b7f..72de0e9 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -22,10 +22,12 @@
> >  #include <linux/of_address.h>
> >  #include <linux/delay.h>
> >  #include <linux/export.h>
> > +#include <linux/mutex.h>
> >  #include <linux/clk/tegra.h>
> >  #include <dt-bindings/clock/tegra210-car.h>
> >  #include <dt-bindings/reset/tegra210-car.h>
> >  #include <linux/iopoll.h>
> > +#include <soc/tegra/pmc.h>
> >  
> >  #include "clk.h"
> >  #include "clk-id.h"
> > @@ -231,6 +233,30 @@
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> >  
> > +#define LVL2_CLK_GATE_OVRA 0xf8
> > +#define LVL2_CLK_GATE_OVRC 0x3a0
> > +#define LVL2_CLK_GATE_OVRD 0x3a4
> > +#define LVL2_CLK_GATE_OVRE 0x554
> > +
> > +/* I2S registers to handle during APE MBIST WAR */
> > +#define TEGRA210_I2S_BASE  0x11000
> > +#define TEGRA210_I2S_SIZE  0x100
> > +#define TEGRA210_I2S_CTRLS 5
> > +#define TEGRA210_I2S_CG    0x88
> > +#define TEGRA210_I2S_CTRL  0xa0
> > +
> > +/* DISPA registers to handle during MBIST WAR */
> > +#define DC_CMD_DISPLAY_COMMAND 0xc8
> > +#define DC_COM_DSC_TOP_CTL 0xcf8
> > +
> > +/* VIC register to handle during MBIST WAR */
> > +#define NV_PVIC_THI_SLCG_OVERRIDE_LOW 0x8c
> > +
> > +/* APE, DISPA and VIC base addesses needed for MBIST WAR */
> > +#define TEGRA210_APE_BASE  0x702c0000
> > +#define TEGRA210_DISPA_BASE 0x54200000
> > +#define TEGRA210_VIC_BASE  0x54340000
> > +
> >  /*
> >   * SDM fractional divisor is 16-bit 2's complement signed number within
> >   * (-2^12 ... 2^12-1) range. Represented in PLL data structure as unsigned
> > @@ -255,8 +281,22 @@
> >  } tegra210_cpu_clk_sctx;
> >  #endif
> >  
> > +struct tegra210_domain_mbist_war {
> > +	int (*handle_lvl2_ovr)(struct tegra210_domain_mbist_war *mbist);
> > +	const u32 lvl2_offset;
> > +	const u32 lvl2_mask;
> > +	const unsigned int num_clks;
> > +	const unsigned int *clk_init_data;
> > +	struct clk_bulk_data *clks;
> > +};
> > +
> > +static struct clk **clks;
> > +
> >  static void __iomem *clk_base;
> >  static void __iomem *pmc_base;
> > +static void __iomem *ape_base;
> > +static void __iomem *dispa_base;
> > +static void __iomem *vic_base;
> >  
> >  static unsigned long osc_freq;
> >  static unsigned long pll_ref_freq;
> > @@ -266,6 +306,7 @@
> >  static DEFINE_SPINLOCK(pll_re_lock);
> >  static DEFINE_SPINLOCK(pll_u_lock);
> >  static DEFINE_SPINLOCK(emc_lock);
> > +static DEFINE_MUTEX(lvl2_ovr_lock);
> >  
> >  /* possible OSC frequencies in Hz */
> >  static unsigned long tegra210_input_freq[] = {
> > @@ -309,6 +350,8 @@
> >  #define PLLA_MISC2_WRITE_MASK		0x06ffffff
> >  
> >  /* PLLD */
> > +#define PLLD_BASE_CSI_CLKSOURCE		(1 << 23)
> > +
> >  #define PLLD_MISC0_EN_SDM		(1 << 16)
> >  #define PLLD_MISC0_LOCK_OVERRIDE	(1 << 17)
> >  #define PLLD_MISC0_LOCK_ENABLE		(1 << 18)
> > @@ -512,6 +555,176 @@ void tegra210_set_sata_pll_seq_sw(bool state)
> >  }
> >  EXPORT_SYMBOL_GPL(tegra210_set_sata_pll_seq_sw);
> >  
> > +static int tegra210_generic_mbist_war(struct tegra210_domain_mbist_war *mbist)
> > +{
> > +	u32 val;
> > +	int err;
> > +
> > +	err = clk_bulk_prepare_enable(mbist->num_clks, mbist->clks);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&lvl2_ovr_lock);
> > +
> > +	val = readl_relaxed(clk_base + mbist->lvl2_offset);
> > +	writel_relaxed(val | mbist->lvl2_mask, clk_base + mbist->lvl2_offset);
> > +	fence_udelay(1, clk_base);
> > +	writel_relaxed(val, clk_base + mbist->lvl2_offset);
> > +	fence_udelay(1, clk_base);
> > +
> > +	mutex_unlock(&lvl2_ovr_lock);
> > +
> > +	clk_bulk_disable_unprepare(mbist->num_clks, mbist->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra210_venc_mbist_war(struct tegra210_domain_mbist_war *mbist)
> > +{
> > +	u32 csi_src, ovra, ovre;
> > +	int err;
> > +	unsigned long flags = 0;
> > +
> > +	err = clk_bulk_prepare_enable(mbist->num_clks, mbist->clks);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&lvl2_ovr_lock);
> > +	spin_lock_irqsave(&pll_d_lock, flags);
> > +
> > +	csi_src = readl_relaxed(clk_base + PLLD_BASE);
> > +	writel_relaxed(csi_src | PLLD_BASE_CSI_CLKSOURCE, clk_base + PLLD_BASE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	ovra = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRA);
> > +	writel_relaxed(ovra | BIT(15), clk_base + LVL2_CLK_GATE_OVRA);
> > +	ovre = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRE);
> > +	writel_relaxed(ovre | BIT(3), clk_base + LVL2_CLK_GATE_OVRE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	writel_relaxed(ovra, clk_base + LVL2_CLK_GATE_OVRA);
> > +	writel_relaxed(ovre, clk_base + LVL2_CLK_GATE_OVRE);
> > +	writel_relaxed(csi_src, clk_base + PLLD_BASE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	spin_unlock_irqrestore(&pll_d_lock, flags);
> > +	mutex_unlock(&lvl2_ovr_lock);
> > +
> > +	clk_bulk_disable_unprepare(mbist->num_clks, mbist->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra210_disp_mbist_war(struct tegra210_domain_mbist_war *mbist)
> > +{
> > +	u32 ovra, dsc_top_ctrl;
> > +	int err;
> > +
> > +	err = clk_bulk_prepare_enable(mbist->num_clks, mbist->clks);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&lvl2_ovr_lock);
> > +
> > +	ovra = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRA);
> > +	writel_relaxed(ovra | BIT(1), clk_base + LVL2_CLK_GATE_OVRA);
> > +	fence_udelay(1, clk_base);
> > +
> > +	dsc_top_ctrl = readl_relaxed(dispa_base + DC_COM_DSC_TOP_CTL);
> > +	writel_relaxed(dsc_top_ctrl | BIT(2), dispa_base + DC_COM_DSC_TOP_CTL);
> > +	readl_relaxed(dispa_base + DC_CMD_DISPLAY_COMMAND);
> > +	writel_relaxed(dsc_top_ctrl, dispa_base + DC_COM_DSC_TOP_CTL);
> > +	readl_relaxed(dispa_base + DC_CMD_DISPLAY_COMMAND);
> > +
> > +	writel_relaxed(ovra, clk_base + LVL2_CLK_GATE_OVRA);
> > +	fence_udelay(1, clk_base);
> > +
> > +	mutex_unlock(&lvl2_ovr_lock);
> > +
> > +	clk_bulk_disable_unprepare(mbist->num_clks, mbist->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra210_vic_mbist_war(struct tegra210_domain_mbist_war *mbist)
> > +{
> > +	u32 ovre, val;
> > +	int err;
> > +
> > +	err = clk_prepare_enable(clks[TEGRA210_CLK_HOST1X]);
> 
> This looks a bit odd. Seems safer to use the bulk handlers like elsewhere.
> 

Will fix in the next version.

> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&lvl2_ovr_lock);
> > +
> > +	ovre = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRE);
> > +	writel_relaxed(ovre | BIT(5), clk_base + LVL2_CLK_GATE_OVRE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	val = readl_relaxed(vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +	writel_relaxed(val | BIT(0) | GENMASK(7,2) | BIT(24),
> > +			vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> 
> ERROR: space required after that ',' (ctx:VxV)
> #222: FILE: drivers/clk/tegra/clk-tegra210.c:667:
> +	writel_relaxed(val | BIT(0) | GENMASK(7,2) | BIT(24),
> 

Will fix in the next version.

> > +	readl(vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +	udelay(1);
> 
> Looks like a candidate for your fence_delay() macro.
> 

Indeed..

> > +	writel_relaxed(val, vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +	readl(vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +
> > +	writel_relaxed(ovre, clk_base + LVL2_CLK_GATE_OVRE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	mutex_unlock(&lvl2_ovr_lock);
> > +
> > +	clk_disable_unprepare(clks[TEGRA210_CLK_HOST1X]);
> > +
> > +	return 0;
> > +}
> 
> Most of the above WARs are writing bits to N registers, waiting and then
> restoring them. I was wondering if we could still have a single generic
> function that can operate on N registers? But maybe the structure with
> all the register info to do this becomes massive and ugly? Just a thought.
> 

I'm not convinced this will make the code all that much easier to read. Also
for the venc domain we need to force the parent temporarily and for the ape
domain we need to iterate over all i2s controllers. So this approach would
then only maybe help for the disp and the vic domains. All other domains
are already handled by tegra210_generic_mbist_war().

> > +
> > +static int tegra210_ape_mbist_war(struct tegra210_domain_mbist_war *mbist)
> > +{
> > +	int err, i;
> > +	u32 ovrc, ovre;
> > +	void __iomem *i2s_base;
> > +
> > +	err = clk_bulk_prepare_enable(mbist->num_clks, mbist->clks);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&lvl2_ovr_lock);
> > +
> > +	ovrc = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRC);
> > +	ovre = readl_relaxed(clk_base + LVL2_CLK_GATE_OVRE);
> > +	writel_relaxed(ovrc | BIT(1), clk_base + LVL2_CLK_GATE_OVRC);
> > +	writel_relaxed(ovre | BIT(10) | BIT(11),
> > +			clk_base + LVL2_CLK_GATE_OVRE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	i2s_base = ape_base + TEGRA210_I2S_BASE;
> > +	for (i = 0; i < TEGRA210_I2S_CTRLS; i++) {
> > +		u32 i2s_ctrl;
> > +
> > +		i2s_ctrl = readl_relaxed(i2s_base + TEGRA210_I2S_CTRL);
> > +		writel_relaxed(i2s_ctrl | BIT(10),
> > +				i2s_base + TEGRA210_I2S_CTRL);
> > +		writel_relaxed(0, i2s_base + TEGRA210_I2S_CG);
> > +		readl(i2s_base + TEGRA210_I2S_CG);
> > +		writel_relaxed(1, i2s_base + TEGRA210_I2S_CG);
> > +		writel_relaxed(i2s_ctrl, i2s_base + TEGRA210_I2S_CTRL);
> > +		readl(i2s_base + TEGRA210_I2S_CTRL);
> > +
> > +		i2s_base += TEGRA210_I2S_SIZE;
> > +        }
> 
> ERROR: code indent should use tabs where possible
> #272: FILE: drivers/clk/tegra/clk-tegra210.c:717:
> +        }$
> 
> For ARM builds I am seeing ...
> 
> drivers/soc/tegra/pmc.o: In function `tegra_powergate_power_up':
> pmc.c:(.text+0xb14): undefined reference to `tegra210_handle_mbist_war'
> Makefile:1026: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
> 

Will fix.

> > +
> > +	writel_relaxed(ovrc, clk_base + LVL2_CLK_GATE_OVRC);
> > +	writel_relaxed(ovre, clk_base + LVL2_CLK_GATE_OVRE);
> > +	fence_udelay(1, clk_base);
> > +
> > +	mutex_unlock(&lvl2_ovr_lock);
> > +
> > +	clk_bulk_disable_unprepare(mbist->num_clks, mbist->clks);
> > +
> > +	return 0;
> > +}
> > +
> >  static inline void _pll_misc_chk_default(void __iomem *base,
> >  					struct tegra_clk_pll_params *params,
> >  					u8 misc_num, u32 default_val, u32 mask)
> > @@ -2410,13 +2623,137 @@ struct utmi_clk_param {
> >  	{ "pll_a1", &pll_a1_params, tegra_clk_pll_a1, "pll_ref" },
> >  };
> >  
> > -static struct clk **clks;
> > -
> >  static const char * const aclk_parents[] = {
> >  	"pll_a1", "pll_c", "pll_p", "pll_a_out0", "pll_c2", "pll_c3",
> >  	"clk_m"
> >  };
> >  
> > +static const unsigned int nvjpg_slcg_clkids[] = { TEGRA210_CLK_NVDEC };
> > +static const unsigned int nvdec_slcg_clkids[] = { TEGRA210_CLK_NVJPG };
> > +static const unsigned int sor_slcg_clkids[] = { TEGRA210_CLK_HDA2CODEC_2X,
> > +	TEGRA210_CLK_HDA2HDMI, TEGRA210_CLK_DISP1, TEGRA210_CLK_DISP2 };
> > +static const unsigned int disp_slcg_clkids[] = { TEGRA210_CLK_LA,
> > +	TEGRA210_CLK_HOST1X};
> > +static const unsigned int xusba_slcg_clkids[] = { TEGRA210_CLK_XUSB_HOST,
> > +	TEGRA210_CLK_XUSB_DEV };
> > +static const unsigned int xusbb_slcg_clkids[] = { TEGRA210_CLK_XUSB_HOST,
> > +	TEGRA210_CLK_XUSB_SS };
> > +static const unsigned int xusbc_slcg_clkids[] = { TEGRA210_CLK_XUSB_DEV,
> > +	TEGRA210_CLK_XUSB_SS };
> > +static const unsigned int venc_slcg_clkids[] = { TEGRA210_CLK_HOST1X,
> > +	TEGRA210_CLK_PLL_D };
> > +static const unsigned int ape_slcg_clkids[] = { TEGRA210_CLK_ACLK,
> > +	TEGRA210_CLK_I2S0, TEGRA210_CLK_I2S1, TEGRA210_CLK_I2S2,
> > +	TEGRA210_CLK_I2S3, TEGRA210_CLK_I2S4, TEGRA210_CLK_SPDIF_OUT,
> > +	TEGRA210_CLK_D_AUDIO };
> > +
> > +static struct tegra210_domain_mbist_war tegra210_pg_mbist_war[] = {
> > +	[TEGRA_POWERGATE_VENC] = {
> > +		.handle_lvl2_ovr = tegra210_venc_mbist_war,
> > +		.num_clks = ARRAY_SIZE(venc_slcg_clkids),
> > +		.clk_init_data = venc_slcg_clkids,
> > +	},
> > +	[TEGRA_POWERGATE_SATA] = {
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(0) | BIT(17) | BIT(19),
> > +	},
> > +	[TEGRA_POWERGATE_MPE] = {
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRE,
> > +		.lvl2_mask = BIT(2),
> > +	},
> > +	[TEGRA_POWERGATE_SOR] = {
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.num_clks = ARRAY_SIZE(sor_slcg_clkids),
> > +		.clk_init_data = sor_slcg_clkids,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRA,
> > +		.lvl2_mask = BIT(1) | BIT(2),
> > +	},
> > +	[TEGRA_POWERGATE_DIS] = {
> > +		.handle_lvl2_ovr = tegra210_disp_mbist_war,
> > +		.num_clks = ARRAY_SIZE(disp_slcg_clkids),
> > +		.clk_init_data = disp_slcg_clkids,
> > +	},
> > +	[TEGRA_POWERGATE_DISB] = {
> > +		.num_clks = ARRAY_SIZE(disp_slcg_clkids),
> > +		.clk_init_data = disp_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRA,
> > +		.lvl2_mask = BIT(2),
> > +	},
> > +	[TEGRA_POWERGATE_XUSBA] = {
> > +		.num_clks = ARRAY_SIZE(xusba_slcg_clkids),
> > +		.clk_init_data = xusba_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(30) | BIT(31),
> > +	},
> > +	[TEGRA_POWERGATE_XUSBB] = {
> > +		.num_clks = ARRAY_SIZE(xusbb_slcg_clkids),
> > +		.clk_init_data = xusbb_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(30) | BIT(31),
> > +	},
> > +	[TEGRA_POWERGATE_XUSBC] = {
> > +		.num_clks = ARRAY_SIZE(xusbc_slcg_clkids),
> > +		.clk_init_data = xusbc_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(30) | BIT(31),
> > +	},
> > +	[TEGRA_POWERGATE_VIC] = {
> > +		.handle_lvl2_ovr = tegra210_vic_mbist_war,
> > +	},
> > +	[TEGRA_POWERGATE_NVDEC] = {
> > +		.num_clks = ARRAY_SIZE(nvdec_slcg_clkids),
> > +		.clk_init_data = nvdec_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(9) | BIT(31),
> > +	},
> > +	[TEGRA_POWERGATE_NVJPG] = {
> > +		.num_clks = ARRAY_SIZE(nvjpg_slcg_clkids),
> > +		.clk_init_data = nvjpg_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> > +		.lvl2_mask = BIT(9) | BIT(31),
> > +	},
> > +	[TEGRA_POWERGATE_AUD] = {
> > +		.num_clks = ARRAY_SIZE(ape_slcg_clkids),
> > +		.clk_init_data = ape_slcg_clkids,
> > +		.handle_lvl2_ovr = tegra210_ape_mbist_war,
> > +	},
> > +	[TEGRA_POWERGATE_VE2] = {
> > +		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> > +		.lvl2_offset = LVL2_CLK_GATE_OVRD,
> > +		.lvl2_mask = BIT(22),
> > +	},
> > +};
> > +
> > +void tegra210_handle_mbist_war(unsigned int id)
> 
> Maybe we should namespace as something like 'tegra210_clk_mbist_war'?
> 

Will do.

> > +{
> > +	int err;
> > +
> > +	if (id >= ARRAY_SIZE(tegra210_pg_mbist_war)) {
> > +		pr_err("unknown domain id in MBIST WAR handler\n");
> > +		WARN_ON(1);
> 
> WARN(1, ...);
> 

Ok.

> > +		return;
> > +	}
> > +
> > +	if (!tegra210_pg_mbist_war[id].handle_lvl2_ovr)
> > +		return;
> > +
> > +	err =
> > +	 tegra210_pg_mbist_war[id].handle_lvl2_ovr(&tegra210_pg_mbist_war[id]);
> 
> Nit-pick, we should we work this to fit on a single line by using a
> local variable somewhere.
> 

Ok.

> > +	if (err < 0) {
> > +		pr_err("error handling MBIST WAR for domain: %d\n", id);
> > +		WARN_ON(1);
> 
> WARN(1, ...);
> 

Ok.

> > +	}
> > +}
> > +
> > +
> >  void tegra210_put_utmipll_in_iddq(void)
> >  {
> >  	u32 reg;
> > @@ -3148,6 +3485,24 @@ static void __init tegra210_clock_init(struct device_node *np)
> >  		return;
> >  	}
> >  
> > +	ape_base = ioremap(TEGRA210_APE_BASE, 256*1024);
> > +	if (!ape_base) {
> > +		pr_err("ioremap tegra210 APE failed\n");
> > +		return;
> > +	}
> > +
> > +	dispa_base = ioremap(TEGRA210_DISPA_BASE, 256*1024);
> > +	if (!dispa_base) {
> > +		pr_err("ioremap tegra210 DISPA failed\n");
> > +		return;
> > +	}
> > +
> > +	vic_base = ioremap(TEGRA210_VIC_BASE, 256*1024);
> > +	if (!vic_base) {
> > +		pr_err("ioremap tegra210 VIC failed\n");
> > +		return;
> > +	}
> > +
> 
> Any reason not to add these to the DT node like we did for PMC?
> 

Given that this WAR really only applies to Tegra210 and the register apertures
to be touched are fixed by hardware, I don't think it makes a lot of sense
to add this to DT.

> Where is the clks member of the tegra210_domain_mbist_war initialised?
> 

That's a bug in this version indeed...

Peter.
