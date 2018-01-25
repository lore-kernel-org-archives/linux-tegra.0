From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] clk: tegra: MBIST work around for Tegra210
Date: Thu, 25 Jan 2018 11:02:55 +0200
Message-ID: <20180125090255.GK7031@tbergstrom-lnx.Nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-4-git-send-email-pdeschrijver@nvidia.com>
 <637b3bb4-1ac0-5612-ec2e-5740e611b11a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <637b3bb4-1ac0-5612-ec2e-5740e611b11a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 24, 2018 at 09:59:56PM +0000, Jon Hunter wrote:
> 
> On 23/01/18 09:22, Peter De Schrijver wrote:
> > Tegra210 has a hw bug which can cause IP blocks to lock up when ungating a
> > domain. The reason is that the logic responsible for resetting the memory
> > built-in self test mode can come up in an undefined state because its
> > clock is gated by a second level clock gate (SLCG). Work around this by
> > making sure the logic will get some clock edges by ensuring the relevant
> > clock is enabled and temporarily override the relevant SLCGs.
> > Unfortunately for some IP blocks, the control bits for overriding the
> > SLCGs are not in CAR, but in the IP block itself. This means we need to
> > map a few extra register banks in the clock code.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c | 395 ++++++++++++++++++++++++++++++++++++++-
> >  include/linux/clk/tegra.h        |   5 +
> >  2 files changed, 398 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index f790c2d..f61ec1f 100644
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
> > @@ -232,6 +234,30 @@
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
> 
> Nit-pick, I think that it is only necessary to map the AHUB here as the
> I2S are a sub-device of this. So we only need to map 0x702d0000-0x702dffff.
> 
> > +#define TEGRA210_DISPA_BASE 0x54200000
> > +#define TEGRA210_VIC_BASE  0x54340000
> > +
> >  /*
> >   * SDM fractional divisor is 16-bit 2's complement signed number within
> >   * (-2^12 ... 2^12-1) range. Represented in PLL data structure as unsigned
> > @@ -256,8 +282,22 @@
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
> > @@ -268,6 +308,7 @@
> >  static DEFINE_SPINLOCK(pll_u_lock);
> >  static DEFINE_SPINLOCK(sor1_lock);
> >  static DEFINE_SPINLOCK(emc_lock);
> > +static DEFINE_MUTEX(lvl2_ovr_lock);
> >  
> >  /* possible OSC frequencies in Hz */
> >  static unsigned long tegra210_input_freq[] = {
> > @@ -311,6 +352,8 @@
> >  #define PLLA_MISC2_WRITE_MASK		0x06ffffff
> >  
> >  /* PLLD */
> > +#define PLLD_BASE_CSI_CLKSOURCE		(1 << 23)
> > +
> >  #define PLLD_MISC0_EN_SDM		(1 << 16)
> >  #define PLLD_MISC0_LOCK_OVERRIDE	(1 << 17)
> >  #define PLLD_MISC0_LOCK_ENABLE		(1 << 18)
> > @@ -514,6 +557,176 @@ void tegra210_set_sata_pll_seq_sw(bool state)
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
> 
> Downstream does not appear to implement a spinlock around this code
> AFAICT. With the delays it seems we are disabling interrupts for quite a
> bit of time. If there is no other way to get around this then fine, but
> I am curious if we need this? Are you worrying about the PLLD being
> updated at the same time this is happening? Is that likely see that

Yes. We have to be sure the CSI source is not reset to 'brick'. That would
be the clock recovered from the CSI input signal, which is likely to be
missing. So effectively there would be no clock pulses then.

> devices using the PLLD will be waiting for the powerdomain to be enabled
> first?
> 

Hopefully not, but if they would, the resulting random hangs of the IP block
wouldn't be easy to trace back to accidental changes of the CSI source during
this WAR procedure.

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
> > +	err = clk_bulk_prepare_enable(mbist->num_clks, mbist->clks);
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
> > +	writel_relaxed(val | BIT(0) | GENMASK(7, 2) | BIT(24),
> > +			vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +	fence_udelay(1, vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +
> > +	writel_relaxed(val, vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +	readl(vic_base + NV_PVIC_THI_SLCG_OVERRIDE_LOW);
> > +
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
> > +	}
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
> > @@ -2412,13 +2625,137 @@ struct utmi_clk_param {
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
> > +static const unsigned int vic_slcg_clkids[] = { TEGRA210_CLK_HOST1X };
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
> > +		.num_clks = ARRAY_SIZE(vic_slcg_clkids),
> > +		.clk_init_data = vic_slcg_clkids,
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
> > +void tegra210_clk_handle_mbist_war(unsigned int id)
> > +{
> > +	int err;
> > +	struct tegra210_domain_mbist_war *mbist_war;
> > +
> > +	if (id >= ARRAY_SIZE(tegra210_pg_mbist_war)) {
> > +		WARN(1, "unknown domain id in MBIST WAR handler\n");
> > +		return;
> > +	}
> > +
> > +	mbist_war = &tegra210_pg_mbist_war[id];
> > +	if (!mbist_war->handle_lvl2_ovr)
> > +		return;
> > +
> > +	err = mbist_war->handle_lvl2_ovr(mbist_war);
> 
> Why not move the clk_bulk_prepare_enable/disable_unprepare and
> mutex_lock/unlock functions into this function around the call to
> ->handle_lvl2_ovr to save the duplication of that code in each of the
> war functions?
> 

This could be done yes.

> > +	WARN(err < 0, "error handling MBIST WAR for domain: %d\n", id);
> > +}
> 
> I think that the above function should return an error and we should let
> the power-domain power-on fail.
> 

This would only be useful if the user (tegra_powergate_power_up) would do
rollback. I don't think that's done correctly today.

> > +
> > +
> >  void tegra210_put_utmipll_in_iddq(void)
> >  {
> >  	u32 reg;
> > @@ -3163,6 +3500,40 @@ static int tegra210_reset_deassert(unsigned long id)
> >  	return 0;
> >  }
> >  
> > +static void tegra210_mbist_clk_init(void)
> > +{
> > +	int i, j;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(tegra210_pg_mbist_war); i++) {
> > +		int num_clks = tegra210_pg_mbist_war[i].num_clks;
> > +		struct clk_bulk_data *clk_data;
> > +
> > +		if (!num_clks)
> > +			continue;
> > +
> > +		clk_data = kmalloc_array(num_clks, sizeof(*clk_data),
> > +					 GFP_KERNEL);
> > +		if (WARN(!clk_data,
> > +			"no space for MBIST WAR clk array for %d\n", i)) {
> > +			tegra210_pg_mbist_war[i].handle_lvl2_ovr = NULL;
> > +			continue;
> > +		}
> 
> Printing error messages on memory allocation failures are not needed and
> have been removed from various drivers. So lets no add any error
> messages or warnings here.
> 
> Also I think that we should just return an error here and not bother
> continuing as there is no point.
> 
> > +
> > +		tegra210_pg_mbist_war[i].clks = clk_data;
> 
> I think that you should only populate this when all the clocks have been
> initialised correctly. You could then use this to check the clocks have
> been setup correctly when executing the war.
> 

For some domains no extra clocks are needed (ie the clocks enabled by the
power domain driver are enough). So an extra flag would be needed then.

> > +		for (j = 0; j < num_clks; j++) {
> > +			int clk_id = tegra210_pg_mbist_war[i].clk_init_data[j];
> > +			struct clk *clk = clks[clk_id];
> > +
> > +			if (IS_ERR(clk)) {
> > +				clk_data[j].clk = NULL;
> > +				WARN(1, "clk_id: %d\n", clk_id);
> 
> I think that we should return an error here.
> 

I don't think letting clock init fail because of this, is a good idea. Too
many things rely on working clocks.

> > +			} else {
> > +				clk_data[j].clk = clk;
> > +			}
> > +		}
> > +	}
> > +}
> > +
> >  /**
> >   * tegra210_clock_init - Tegra210-specific clock initialization
> >   * @np: struct device_node * of the DT node for the SoC CAR IP block
> > @@ -3197,6 +3568,24 @@ static void __init tegra210_clock_init(struct device_node *np)
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
> >  	clks = tegra_clk_init(clk_base, TEGRA210_CLK_CLK_MAX,
> >  			      TEGRA210_CAR_BANK_COUNT);
> >  	if (!clks)
> > @@ -3233,6 +3622,8 @@ static void __init tegra210_clock_init(struct device_node *np)
> >  	tegra_add_of_provider(np);
> >  	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
> >  
> > +	tegra210_mbist_clk_init();
> > +
> 
> Maybe add a print here if the mbist init fails and return. I understand
> it may not be a critical failure but it should never fail.
> 

You mean have the entire clock init fail and undo all the clock registrations?
That seems overkill to me. Returning early would only prevent some sleep states
from working because tegra_cpu_car_ops will not be initialized then. So I would
do a warning then.

> >  	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
> >  }
> >  CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
> > diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
> > index d23c9cf..a3d46f7 100644
> > --- a/include/linux/clk/tegra.h
> > +++ b/include/linux/clk/tegra.h
> > @@ -128,5 +128,10 @@ static inline void tegra_cpu_clock_resume(void)
> >  extern void tegra210_set_sata_pll_seq_sw(bool state);
> >  extern void tegra210_put_utmipll_in_iddq(void);
> >  extern void tegra210_put_utmipll_out_iddq(void);
> > +#ifndef CONFIG_ARCH_TEGRA_210_SOC
> > +static inline void tegra210_clk_handle_mbist_war(unsigned int id) {}
> > +#else
> > +extern void tegra210_clk_handle_mbist_war(unsigned int id);
> > +#endif
> >  
> >  #endif /* __LINUX_CLK_TEGRA_H_ */
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
