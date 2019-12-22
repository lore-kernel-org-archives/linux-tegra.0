From: Dejin Zheng <zhengdejin5@gmail.com>
Subject: Re: [PATCH v2 08/10] usb: phy: tegra: Use u32 for hardware register
 variables
Date: Sun, 22 Dec 2019 21:24:59 +0800
Message-ID: <20191222132227.GA7096@nuc8i5>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191220015238.9228-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 20, 2019 at 04:52:36AM +0300, Dmitry Osipenko wrote:
> There is a mix of u32/ULONG usage in the driver's code. Let's switch to
> u32 uniformly, for consistency.
> 
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index d5739b6e0b6c..551c94e3877a 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -202,7 +202,7 @@ static inline struct tegra_usb_phy *to_tegra_usb_phy(struct usb_phy *u_phy)
>  static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	if (phy->soc_config->has_hostpc) {
>  		val = readl_relaxed(base + TEGRA_USB_HOSTPC1_DEVLC);
> @@ -221,7 +221,7 @@ static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
>  static void set_phcd(struct tegra_usb_phy *phy, bool enable)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	if (phy->soc_config->has_hostpc) {
>  		val = readl_relaxed(base + TEGRA_USB_HOSTPC1_DEVLC);
> @@ -320,7 +320,8 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
>  {
>  	struct tegra_utmip_config *config = phy->config;
>  	void __iomem *base = phy->pad_regs;
> -	unsigned long val, flags;
> +	unsigned long flags;
> +	u32 val;
Why are you still using unsigned long here?

>  	int err;
>  
>  	err = clk_prepare_enable(phy->pad_clk);
> @@ -355,7 +356,8 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
>  static int utmip_pad_power_off(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->pad_regs;
> -	unsigned long val, flags;
> +	unsigned long flags;
> +	u32 val;
ditto

>  	int err;
>  
>  	if (!utmip_pad_count) {
> @@ -393,7 +395,7 @@ static int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
>  static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	/*
>  	 * The USB driver may have already initiated the phy clock
> @@ -425,7 +427,7 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
>  static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	/*
>  	 * The USB driver may have already initiated the phy clock
> @@ -460,7 +462,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
>  {
>  	struct tegra_utmip_config *config = phy->config;
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  	int err;
>  
>  	val = readl_relaxed(base + USB_SUSP_CTRL);
> @@ -611,7 +613,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
>  static int utmi_phy_power_off(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	utmi_phy_clk_disable(phy);
>  
> @@ -646,7 +648,7 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
>  static void utmi_phy_preresume(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	val = readl_relaxed(base + UTMIP_TX_CFG0);
>  	val |= UTMIP_HS_DISCON_DISABLE;
> @@ -656,7 +658,7 @@ static void utmi_phy_preresume(struct tegra_usb_phy *phy)
>  static void utmi_phy_postresume(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	val = readl_relaxed(base + UTMIP_TX_CFG0);
>  	val &= ~UTMIP_HS_DISCON_DISABLE;
> @@ -667,7 +669,7 @@ static void utmi_phy_restore_start(struct tegra_usb_phy *phy,
>  				   enum tegra_usb_phy_port_speed port_speed)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	val = readl_relaxed(base + UTMIP_MISC_CFG0);
>  	val &= ~UTMIP_DPDM_OBSERVE_SEL(~0);
> @@ -687,7 +689,7 @@ static void utmi_phy_restore_start(struct tegra_usb_phy *phy,
>  static void utmi_phy_restore_end(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  
>  	val = readl_relaxed(base + UTMIP_MISC_CFG0);
>  	val &= ~UTMIP_DPDM_OBSERVE;
> @@ -698,7 +700,7 @@ static void utmi_phy_restore_end(struct tegra_usb_phy *phy)
>  static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
>  {
>  	void __iomem *base = phy->regs;
> -	unsigned long val;
> +	u32 val;
>  	int err;
>  
>  	err = gpio_direction_output(phy->reset_gpio, 0);
> -- 
> 2.24.0
> 
