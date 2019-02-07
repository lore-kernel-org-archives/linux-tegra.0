From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 19:01:45 +0300
Message-ID: <0a7d62c4-9dcd-08dd-4e3f-877184848daa@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <32b0b694-f912-044e-1a50-55b9c355d0c3@gmail.com>
 <BYAPR12MB3398350797241F90AE347FB5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398350797241F90AE347FB5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

07.02.2019 18:23, Sowjanya Komatineni пишет:
> 
>> It became apparent to me that there is a problem here. The size of dma_buf is 4096 bytes and maximum message length is 4096 too, we have pushed 12 bytes packet_header to the buffer >and now there are 4084 bytes left for the message in the buffer. Hence transfer of 4KB will cause buffer overflow and either crash kernel or corrupt memory. One solution is to just always >push packet_header using PIO, other to reduce max_write_len or increase dma_buf size.
> 
> Yes, This is known to me and I will add separate patch for this to update quirks to take care for t186 and t194 to exclude packet hdr lengths
> There was separate patch when quirks were added and it got merged already from 5.0-rc1 but don’t want to sneak that here. Will send separate patch to take care of this.
> Need to update quirk to exclude packet header
> 

No. This is a bug of this patch, it must be fixed in this patch as well. 

Please include this snippet into the next version of this patch.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7921d3e6237d..0ed8162a37e4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1293,7 +1293,7 @@ static const struct i2c_algorithm tegra_i2c_algo = {
 static const struct i2c_adapter_quirks tegra_i2c_quirks = {
        .flags = I2C_AQ_NO_ZERO_LEN,
        .max_read_len = 4096,
-       .max_write_len = 4096,
+       .max_write_len = 4096 - I2C_PACKET_HEADER_SIZE,
 };
 
 static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
@@ -1545,7 +1545,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
        i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
                                                  "nvidia,tegra20-i2c-dvc");
        i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
-       i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len;
+       i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_read_len;
        init_completion(&i2c_dev->msg_complete);
        init_completion(&i2c_dev->dma_complete);
        spin_lock_init(&i2c_dev->xfer_lock);
