From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V13 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 19:07:20 +0300
Message-ID: <9c6524ec-b40b-5b0f-eb70-f9ce2c426fd9@gmail.com>
References: <1549464441-1836-1-git-send-email-skomatineni@nvidia.com>
 <1549464441-1836-3-git-send-email-skomatineni@nvidia.com>
 <4ecd3894-a1cb-20dd-8675-26e6e84254e7@gmail.com>
 <BYAPR12MB3398A6C76EC731D259FC3EA4C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB33988DCC1F4997AAF2112447C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33988DCC1F4997AAF2112447C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 18:55, Sowjanya Komatineni пишет:
> 
> 
>>> Two ";;" at the end.
>>>
>>>
>>>
>>> Good news: DVC I2C works now and tps6586x probes fine! :) Bad news: 
>>> atmel-touch still has same problems as in V12 :(
>>>
>>> DMA-only V13: http://dpaste.com/0XJ1Z8G.txt
>>
>> Strangely, there are many transactions to touch and all of them are good except DMA timeout only when reading T44 and T5 atmel_mxt_ts 0-004c: Failed to read T44 and T5 (-110)
> 
> [    0.923138] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> [    0.923148] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> [    0.923337] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> [    0.923347] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> [    0.923355] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> [    0.935048] tegra-i2c 7000d000.i2c: starting DMA for length: 16
> [    0.935058] tegra-i2c 7000d000.i2c: unmasked irq: 0c
> [    1.028750] tegra-i2c 7000c000.i2c: DMA transfer timeout
> [    1.028816] atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-110)
> 
> Looking into timestamps and transactions, DMA timeouts after start of DMA for I2C1 to touch during this transaction.
> While it is waiting for I2C1 DMA transfer, lots of DVC transactions happened thru DMA which are successful
> 
> What is the I2C1 speed?

400KHz

> Also incase if device is running slow for some reason, probably timeout was not enough as this patch series changes timeout with base 100mS + msg transfer time based on transfer size.
> Can you give quick try with increased timeout incase if device is running slow?
> 

Tried to increase the timeout to 1 second, doesn't help.

What helped again is the I2C HW resetting after each transfer. Likely that means that HW isn't programmed correctly, please carefully check every bit.

DMA-only + I2C HW reset: http://dpaste.com/26AQXFM.txt

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a9391c3646b6..e0a569b69572 100644
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
@@ -1044,8 +1046,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
                xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
        xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-       i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
-                                   i2c_dev->dma_buf;
+       i2c_dev->is_curr_dma_xfer = !!i2c_dev->dma_buf;
        tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
        dma = i2c_dev->is_curr_dma_xfer;
 
@@ -1203,10 +1204,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
                i2c_dev->msg_err);
 
        i2c_dev->is_curr_dma_xfer = false;
+       tegra_i2c_init(i2c_dev, true);
        if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
                return 0;
 
-       tegra_i2c_init(i2c_dev, true);
        /* start recovery upon arbitration loss in single master mode */
        if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
                if (!i2c_dev->is_multimaster_mode)
