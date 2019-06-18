From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Date: Tue, 18 Jun 2019 10:13:54 +0100
Message-ID: <61c2dbcd-85f2-2094-7596-78ac01f55421@nvidia.com>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 18/06/2019 09:42, Bitan Biswas wrote:
> tegra_i2c_xfer_msg initiates the I2C transfer in DMA
> or PIO mode. It involves steps that need FIFO register
> access, DMA API calls like dma_sync_single_for_device, etc.
> Tegra I2C ISR has calls to tegra_i2c_empty_rx_fifo in PIO mode
> and in DMA/PIO mode writes different I2C registers including
> I2C interrupt status. ISR cannot start processing
> before the preparation step at tegra_i2c_xfer_msg is complete.
> Hence, a synchronization between ISR and tegra_i2c_xfer_msg
> is in place today using spinlock.
> 
> Spinlock busy waits and can add avoidable delays.
> 
> In this patch needed synchronization is achieved by disabling
> I2C interrupt during preparation step and enabling interrupt
> once preparation is over and spinlock is no longer needed.
Sorry but I still don't understand the problem you are trying to solve.
Yes spinlocks are busy waits but is this busy wait an actual problem? If
so what is the problem with this?

It appears that the spinlock was added to prevent error interrupts
occurring until the transfer has started. If this is for error cases,
then probably it is not often that the CPU is stuck busy waiting on the
spinlock.

Furthermore, in addition to the spinlock we also have calls to
tegra_i2c_unmask_irq/tegra_i2c_mask_irq. Therefore, if we are going to
change this it would seem like a good idea to consolidate the
masking/unmasking of IRQs and the spinlock, if possible.

Finally, I still see that we have a spinlock in the downstream kernels
we are shipping and so I would prefer to see such a change also be
tested in the downstream kernels we are releasing.

Cheers
Jon

-- 
nvpublic
