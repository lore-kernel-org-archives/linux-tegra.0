From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 14:55:01 +0300
Message-ID: <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 1:46, Sowjanya Komatineni пишет:
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
>  [V12] : Replaced dma_alloc_coherent with dma_alloc_attrs to force the allocated
> 	 buffer to be contiguous also in physical memory as Tegra194 supports max
> 	 64K and dma_alloc_coherent doesnt guarentee contiguous memory.
> 	 Changed return code from EIO to EINVAL incase of failure to obtain dma
> 	 descriptor.
> 	 Fixed coding style check issues.	 
>  [V11] : Replaced deprecated dmaengine_terminate_all with dmaengine_termine_async
> 	 from non-atomic context and dmaengine_terminate_sync from atomic context.
> 	 Fixed to program fifo trigger levels properly when transfer falls back to
> 	 pio mode in case of dma slave configuration failure and other minor fixes.
>  [V10] : APBDMA is replaced with GPCDMA on Tegra186 and Tegra194 designs.
> 	 Added apbdma hw support flag to now allow Tegra186 and later use
> 	 APBDMA driver.
> 	 Added explicit flow control enable for DMA slave config and error handling.
> 	 Moved releasing DMA resources to seperate function to reuse in
> 	 multiple places.
> 	 Updated to register tegra_i2c_driver from module level rather than subsys
> 	 level.
> 	 Other minor feedback
>  [V9] :  Rebased to 5.0-rc4
> 	 Removed dependency of APB DMA in Kconfig and added conditional check
>  	 in I2C driver to decide on using DMA mode.
> 	 Changed back the allocation of dma buffer during i2c probe.
> 	 Fixed FIFO triggers depending on DMA Vs PIO.
>  [V8] :  Moved back dma init to i2c probe, removed ALL_PACKETS_XFER_COMPLETE
> 	 interrupt and using PACKETS_XFER_COMPLETE interrupt only and some
> 	 other fixes
> 	 Updated Kconfig for APB_DMA dependency
>  [V7] :  Same as V6
>  [V6] :  Updated for proper buffer allocation/freeing, channel release.
> 	 Updated to use exact xfer size for syncing dma buffer.
>  [V5] :  Same as V4
>  [V4] :  Updated to allocate DMA buffer only when DMA mode.
> 	 Updated to fall back to PIO mode when DMA channel request or
> 	 buffer allocation fails.
>  [V3] :  Updated without additional buffer allocation.
>  [V2] :  Updated based on V1 review feedback along with code cleanup for
> 	 proper implementation of DMA.
> 
> 
>  drivers/i2c/busses/i2c-tegra.c | 413 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 369 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 118b7023a0f4..77277a09e485 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -8,6 +8,9 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dmapool.h>

We are not using DMA pools anywhere in the code, <linux/dmapool.h> isn't needed. Let's remove it.

> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> @@ -44,6 +47,8 @@
>  #define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
>  #define I2C_FIFO_CONTROL_TX_TRIG_SHIFT		5
>  #define I2C_FIFO_CONTROL_RX_TRIG_SHIFT		2
> +#define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
> +#define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
>  #define I2C_FIFO_STATUS				0x060
>  #define I2C_FIFO_STATUS_TX_MASK			0xF0
>  #define I2C_FIFO_STATUS_TX_SHIFT		4
> @@ -125,6 +130,19 @@
>  #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
>  #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
>  
> +/* Packet header size in bytes */
> +#define I2C_PACKET_HEADER_SIZE			12
> +
> +#define DATA_DMA_DIR_TX				BIT(0)
> +#define DATA_DMA_DIR_RX				BIT(1)

The DATA_DMA_DIR_TX/RX are not used anywhere in the code, let's remove them.

[snip]

		TEGRA_I2C_TIMEOUT);
>  	tegra_i2c_mask_irq(i2c_dev, int_mask);
> @@ -814,6 +1133,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		time_left, completion_done(&i2c_dev->msg_complete),
>  		i2c_dev->msg_err);
>  
> +	i2c_dev->is_curr_dma_xfer = false;

This line could be removed because there is no need to clear "is_curr_dma_xfer" at this point.

>  	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
>  		return 0;
[snip]


Sowjanya, I tried to enforce DMA transferring + setting DMA burst to a one word and this combination doesn't work well while it should, if I'm not missing something. Could you please take a look at the problem or explain why that happens?

Here is the change I made:

-----------------
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c538ed5f8e2c..59e245d4417d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -6,6 +6,8 @@
  * Author: Colin Cross <ccross@android.com>
  */
 
+#define DEBUG
+
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
@@ -929,12 +931,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
        val = i2c_readl(i2c_dev, reg);
 
        if (i2c_dev->is_curr_dma_xfer) {
-               if (len & 0xF)
                        dma_burst = 1;
-               else if (len & 0x10)
-                       dma_burst = 4;
-               else
-                       dma_burst = 8;
 
                if (i2c_dev->msg_read) {
                        chan = i2c_dev->rx_dma_chan;
@@ -1046,8 +1043,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
                xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
        xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-       i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
-                                   i2c_dev->dma_buf;
+       i2c_dev->is_curr_dma_xfer = !!i2c_dev->dma_buf;
        tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
        dma = i2c_dev->is_curr_dma_xfer
-----------------

And here what happens:

-----------------
...
[    0.761144] tegra_rtc 7000e000.rtc: registered as rtc1
[    0.761199] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    0.761406] i2c /dev entries driver
[    0.919233] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.919246] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.919345] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.919355] tegra-i2c 7000c000.i2c: starting DMA for length: 8
[    0.919363] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.919628] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.919641] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.919649] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.919746] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.919755] tegra-i2c 7000c000.i2c: starting DMA for length: 112
[    0.919763] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.923140] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
[    0.923150] atmel_mxt_ts 0-004c: Family: 160 Variant: 0 Firmware V1.0.AA Objects: 18
[    0.923208] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.923217] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.923314] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.923323] tegra-i2c 7000c000.i2c: starting DMA for length: 224
[    0.923331] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.933564] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
[    0.933599] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.933609] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.933760] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.933770] tegra-i2c 7000c000.i2c: starting DMA for length: 12
[    0.933779] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.934284] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.934309] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.934317] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.934500] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.934509] tegra-i2c 7000c000.i2c: starting DMA for length: 12
[    0.934518] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.935023] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.935081] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.935091] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.935240] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.935249] tegra-i2c 7000c000.i2c: starting DMA for length: 4
[    0.935258] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.935399] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.935416] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.935424] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.935655] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.945445] tegra-i2c 7000d000.i2c: starting DMA for length: 16
[    0.945456] tegra-i2c 7000d000.i2c: unmasked irq: 0c
[    0.969236] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.969245] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.969361] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.969370] tegra-i2c 7000c000.i2c: starting DMA for length: 4
[    0.969379] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.969462] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.982587] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.982596] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.982722] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.982731] tegra-i2c 7000c000.i2c: starting DMA for length: 12
[    0.982740] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.983071] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.983090] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.983098] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.983252] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.983261] tegra-i2c 7000c000.i2c: starting DMA for length: 136
[    0.983269] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.987605] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
[    0.987623] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    0.987631] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.987800] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    0.987809] tegra-i2c 7000c000.i2c: starting DMA for length: 12
[    0.987817] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    0.988324] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.009227] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    1.009236] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.009374] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.009383] tegra-i2c 7000c000.i2c: starting DMA for length: 4
[    1.009391] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.009479] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.009497] atmel_mxt_ts 0-004c: Warning: Info CRC error - device=0xF436DC file=0x000000
[    1.009588] tegra-i2c 7000c000.i2c: starting DMA for length: 272
[    1.009597] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.017483] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
[    1.017496] tegra-i2c 7000c000.i2c: starting DMA for length: 120
[    1.017504] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.020896] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
[    1.020909] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    1.020918] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.021055] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.032230] tegra-i2c 7000c000.i2c: starting DMA for length: 16
[    1.032239] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.032359] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.032368] tegra-i2c 7000c000.i2c: starting DMA for length: 12
[    1.032376] tegra-i2c 7000c000.i2c: unmasked irq: 0c
[    1.032704] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
[    1.049224] tegra-i2c 7000d000.i2c: i2c transfer timed out
[    1.049253] tps6586x 3-0034: Chip ID read failed: -110
[    1.049281] tps6586x: probe of 3-0034 failed with error -5
...
-----------------
