From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Sat, 2 Feb 2019 17:01:57 +0300
Message-ID: <d37e901b-1c26-3d9c-7f68-29e06f4ff993@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.02.2019 20:07, Sowjanya Komatineni пишет:
> This patch adds DMA support for Tegra I2C.
> 
> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
> transfer size of the max FIFO depth and DMA mode is used for
> transfer size higher than max FIFO depth to save CPU overhead.
> 
> PIO mode needs full intervention of CPU to fill or empty FIFO's
> and also need to service multiple data requests interrupt for the
> same transaction. This adds delay between data bytes of the same
> transfer when CPU is fully loaded and some slave devices has
> internal timeout for no bus activity and stops transaction to
> avoid bus hang. DMA mode is helpful in such cases.
> 
> DMA mode is also helpful for Large transfers during downloading or
> uploading FW over I2C to some external devices.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V9] : Rebased to 5.0-rc4
> 	Removed dependency of APB DMA in Kconfig and added conditional check
> 	in I2C driver to decide on using DMA mode.
> 	Changed back the allocation of dma buffer during i2c probe.
> 	Fixed FIFO triggers depending on DMA Vs PIO.
>  [V8] : Moved back dma init to i2c probe, removed ALL_PACKETS_XFER_COMPLETE
> 	interrupt and using PACKETS_XFER_COMPLETE interrupt only and some
> 	other fixes
> 	Updated Kconfig for APB_DMA dependency
>  [V7] : Same as V6
>  [V6] : Updated for proper buffer allocation/freeing, channel release.
> 	Updated to use exact xfer size for syncing dma buffer.
>  [V5] : Same as V4
>  [V4] : Updated to allocate DMA buffer only when DMA mode.
> 	Updated to fall back to PIO mode when DMA channel request or
> 	buffer allocation fails.
>  [V3] : Updated without additional buffer allocation.
>  [V2] : Updated based on V1 review feedback along with code cleanup for
> 	proper implementation of DMA.
> 
>  drivers/i2c/busses/i2c-tegra.c | 368 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 335 insertions(+), 33 deletions(-)


[snip]


> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct dma_chan *dma_chan;
> +	u32 *dma_buf;
> +	dma_addr_t dma_phys;
> +	int err = 0;
> +
> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
> +		return -ENODEV;

Another detail is that we need to keep older kernels working on T186+ after its device-tree will get the "dmas" property, device-tree changes shall be backwards-compatible with older kernels. Hence we need to check that platform actually wants the APB DMA driver, otherwise T186+ will be failing with -EPROBE_DEFER.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 32d5744bce45..822a84013a6d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -227,6 +227,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
+	bool has_apb_dma;
 };
 
 /**
@@ -396,7 +397,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_addr_t dma_phys;
 	int err = 0;
 
-	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
+	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA) || !i2c_dev->hw->has_apb_dma)
 		return -ENODEV;
 
 	dma_chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
@@ -1283,6 +1284,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_std_mode = 0x0,
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
+	.has_apb_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1306,6 +1308,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_std_mode = 0x0,
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
+	.has_apb_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1329,6 +1332,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_std_mode = 0x0,
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
+	.has_apb_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1352,6 +1356,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_std_mode = 0x0,
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
+	.has_apb_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1375,6 +1380,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_std_mode = 0,
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
+	.has_apb_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1398,6 +1404,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_std_mode = 0,
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
+	.has_apb_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1421,6 +1428,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
+	.has_apb_dma = false,
 };
 
 /* Match table for of_platform binding */
