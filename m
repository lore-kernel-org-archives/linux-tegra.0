From: rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: Re: [PATCH 1/4] [ARM] tegra: Add support for Tegra USB PHYs
Date: Tue, 8 Feb 2011 23:05:40 -0800
Message-ID: <20110209070540.GA17627@morell.nvidia.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com>
 <1297228927-23497-2-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297228927-23497-2-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 08, 2011 at 09:22:04PM -0800, Benoit Goby wrote:
> Interface used by Tegra's gadget driver and ehci driver
> to power on and configure the USB PHYs.
> 
> Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---

For some reason this patch (along with patch 3) appears to contain
spaces as indentation (no hard tabs), although patches 2 and 4 in this
series have the correct tabs.

[...]

> +#define USB_USBSTS             0x144
> +#define   USB_USBSTS_PCI       (1 << 2)

This doesn't appear to be used?

[...]

> +static DEFINE_SPINLOCK(utmip_pad_lock);
> +static int utmip_pad_count;
> +
> +static const int udc_freq_table[] = {
> +       12000000,
> +       13000000,
> +       19200000,
> +       26000000,
> +};
> +
> +static const u8 udc_delay_table[][4] = {
> +       /* ENABLE_DLY, STABLE_CNT, ACTIVE_DLY, XTAL_FREQ_CNT */
> +       {0x02,         0x2F,       0x04,       0x76}, /* 12 MHz */
> +       {0x02,         0x33,       0x05,       0x7F}, /* 13 MHz */
> +       {0x03,         0x4B,       0x06,       0xBB}, /* 19.2 MHz */
> +       {0x04,         0x66,       0x09,       0xFE}, /* 26 Mhz */
> +};

Use an array of structs here?  Writing
"UTMIP_PLL_ACTIVE_DLY_COUNT(udc_delay_table[phy->freq_sel][2])" below is a
lot less clear and more prone to bugs than, say,
"UTMIP_PLL_ACTIVE_DLY_COUNT(udc_delay_table[phy->freq_sel].active_dly)".

It'd be even better to combine all three tables into one; something
like:
static const struct udc_... udc_table[] = {
        { .freq = 12000000,
          .delay = {
            .enable = 0x02,
            .stable = 0x2f,
            .active = 0x04
          },
          .xtal_freq_cnt = 0x76,
          .debounce = 0x7530,
        },
        [... etc]
};

[...]

> +static int utmip_pad_open(struct tegra_usb_phy *phy)
> +{
> +       phy->pad_clk = clk_get_sys("utmip-pad", NULL);
> +       if (IS_ERR(phy->pad_clk)) {
> +               pr_err("%s: can't get utmip pad clock\n", __func__);
> +               return -1;

return PTR_ERR(phy->pad_clk);

> +       }
> +
> +       if (phy->instance == 0) {
> +               phy->pad_regs = phy->regs;
> +       } else {
> +               phy->pad_regs = ioremap(TEGRA_USB_BASE, TEGRA_USB_SIZE);
> +               if (!phy->pad_regs) {
> +                       pr_err("%s: can't remap usb registers\n", __func__);
> +                       clk_put(phy->pad_clk);
> +                       return -ENOMEM;
> +               }
> +       }
> +       return 0;
> +}

[...]

> +static int utmip_pad_power_off(struct tegra_usb_phy *phy)
> +{
> +       unsigned long val, flags;
> +       void __iomem *base = phy->pad_regs;
> +
> +       if (!utmip_pad_count) {
> +               pr_err("%s: utmip pad already powered off\n", __func__);
> +               return -1;

return -EINVAL?

> +       }
> +
> +       clk_enable(phy->pad_clk);
> +
> +       spin_lock_irqsave(&utmip_pad_lock, flags);
> +
> +       if (--utmip_pad_count == 0) {
> +               val = readl(base + UTMIP_BIAS_CFG0);
> +               val |= UTMIP_OTGPD | UTMIP_BIASPD;
> +               writel(val, base + UTMIP_BIAS_CFG0);
> +       }
> +
> +       spin_unlock_irqrestore(&utmip_pad_lock, flags);
> +
> +       clk_disable(phy->pad_clk);
> +
> +       return 0;
> +}
> +

[...]

> +static void ulpi_phy_power_on(struct tegra_usb_phy *phy)
> +{
> +       unsigned long val;
> +       void __iomem *base = phy->regs;
> +       struct tegra_ulpi_config *config = phy->config;
> +
> +       gpio_direction_output(config->reset_gpio, 0);
> +       msleep(5);
> +       gpio_direction_output(config->reset_gpio, 1);
> +
> +       clk_enable(phy->clk);
> +       msleep(1);

This msleep seems excessive.  Does it take that long for the clock to
settle?

> +
> +       val = readl(base + USB_SUSP_CTRL);
> +       val |= UHSIC_RESET;
> +       writel(val, base + USB_SUSP_CTRL);
> +
> +       val = readl(base + ULPI_TIMING_CTRL_0);
> +       val |= ULPI_OUTPUT_PINMUX_BYP | ULPI_CLKOUT_PINMUX_BYP;
> +       writel(val, base + ULPI_TIMING_CTRL_0);
> +
> +       val = readl(base + USB_SUSP_CTRL);
> +       val |= ULPI_PHY_ENABLE;
> +       writel(val, base + USB_SUSP_CTRL);
> +
> +       val = 0;
> +       writel(val, base + ULPI_TIMING_CTRL_1);
> +
> +       val |= ULPI_DATA_TRIMMER_SEL(4);
> +       val |= ULPI_STPDIRNXT_TRIMMER_SEL(4);
> +       val |= ULPI_DIR_TRIMMER_SEL(4);
> +       writel(val, base + ULPI_TIMING_CTRL_1);
> +       udelay(10);
> +
> +       val |= ULPI_DATA_TRIMMER_LOAD;
> +       val |= ULPI_STPDIRNXT_TRIMMER_LOAD;
> +       val |= ULPI_DIR_TRIMMER_LOAD;
> +       writel(val, base + ULPI_TIMING_CTRL_1);
> +
> +       val = ULPI_WAKEUP | ULPI_RD_RW_WRITE | ULPI_PORT(0);
> +       writel(val, base + ULPI_VIEWPORT);
> +
> +       if (utmi_wait_register(base + ULPI_VIEWPORT, ULPI_WAKEUP, 0)) {
> +               pr_err("%s: timeout waiting for ulpi phy wakeup\n", __func__);
> +               return;

Why does this function return void if it can fail?
tegra_usb_phy_power_on() can propagate the error.

> +       }
> +
> +       /* Fix VbusInvalid due to floating VBUS */
> +       ulpi_viewport_write(phy, 0x08, 0x40);
> +       ulpi_viewport_write(phy, 0x0B, 0x80);
> +
> +       val = readl(base + USB_PORTSC1);
> +       val |= USB_PORTSC1_WKOC | USB_PORTSC1_WKDS | USB_PORTSC1_WKCN;
> +       writel(val, base + USB_PORTSC1);
> +
> +       val = readl(base + USB_SUSP_CTRL);
> +       val |= USB_SUSP_CLR;
> +       writel(val, base + USB_SUSP_CTRL);
> +       udelay(100);
> +
> +       val = readl(base + USB_SUSP_CTRL);
> +       val &= ~USB_SUSP_CLR;
> +       writel(val, base + USB_SUSP_CTRL);
> +}

[...]

> +struct tegra_usb_phy *tegra_usb_phy_open(int instance, void __iomem *regs,
> +                       void *config, enum tegra_usb_phy_mode phy_mode)
> +{
> +       struct tegra_usb_phy *phy;
> +       struct tegra_ulpi_config *ulpi_config;
> +       unsigned long parent_rate;
> +       int freq_sel;
> +       int err;
> +
> +       phy = kmalloc(sizeof(struct tegra_usb_phy), GFP_KERNEL);
> +       if (!phy)
> +               return ERR_PTR(-ENOMEM);
> +
> +       phy->instance = instance;
> +       phy->regs = regs;
> +       phy->config = config;
> +       phy->mode = phy_mode;
> +
> +       if (!phy->config) {
> +               if (instance == 1) {

Instead of all of the (instance == 1) checks here and below (I count
eleven separate places this is checked), it might be more readable to
have a macro or static inline function such as bool phy_is_ulpi(phy).

> +                       pr_err("%s: ulpi phy configuration missing", __func__);
> +                       err = -EINVAL;
> +                       goto err0;
> +               } else {
> +                       phy->config = &utmip_default[instance];
> +               }
> +       }
> +
> +       phy->pll_u = clk_get_sys(NULL, "pll_u");
> +       if (IS_ERR(phy->pll_u)) {
> +               pr_err("Can't get pll_u clock\n");
> +               err = PTR_ERR(phy->pll_u);
> +               goto err0;
> +       }
> +       clk_enable(phy->pll_u);
> +
> +       parent_rate = clk_get_rate(clk_get_parent(phy->pll_u));
> +       for (freq_sel = 0; freq_sel < ARRAY_SIZE(udc_freq_table); freq_sel++) {
> +               if (udc_freq_table[freq_sel] == parent_rate)
> +                       break;
> +       }
> +       if (freq_sel == ARRAY_SIZE(udc_freq_table)) {
> +               pr_err("invalid pll_u parent rate %ld\n", parent_rate);
> +               err = -EINVAL;
> +               goto err1;
> +       }
> +       phy->freq_sel = freq_sel;
> +
> +       if (phy->instance == 1) {
> +               ulpi_config = config;
> +               phy->clk = clk_get_sys(NULL, ulpi_config->clk);
> +               if (IS_ERR(phy->clk)) {
> +                       pr_err("%s: can't get ulpi clock\n", __func__);
> +                       err = -ENXIO;
> +                       goto err1;
> +               }
> +               tegra_gpio_enable(ulpi_config->reset_gpio);
> +               gpio_request(ulpi_config->reset_gpio, "ulpi_phy_reset_b");
> +               gpio_direction_output(ulpi_config->reset_gpio, 0);
> +       } else {
> +               err = utmip_pad_open(phy);
> +               if (err < 0)
> +                       goto err1;
> +       }
> +
> +       return phy;
> +
> +err1:
> +       clk_disable(phy->pll_u);
> +       clk_put(phy->pll_u);
> +err0:
> +       kfree(phy);
> +       return ERR_PTR(err);
> +}

[...]

The rest seems okay.

> --
> 1.7.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
