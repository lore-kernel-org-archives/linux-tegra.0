From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv3] irqchip: arm-gic: take gic_lock when updating irq type
Date: Wed, 28 Mar 2018 11:51:30 +0200
Message-ID: <20180328095130.GA20664@kroah.com>
References: <20180328085430.3401-1-aniruddha.nitd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180328085430.3401-1-aniruddha.nitd@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Aniruddha Banerjee <aniruddha.nitd@gmail.com>
Cc: marc.zyngier@arm.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, aniruddhab@nvidia.com, stable@vger.kernel.org, vipink@nvidia.com, strasi@nvidia.com, swarren@nvidia.com, jonathanh@nvidia.com, talho@nvidia.com, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 28, 2018 at 02:24:30PM +0530, Aniruddha Banerjee wrote:
> The kernel documentation states that the locking of the irq-chip
> registers should be handled by the irq-chip driver. In the irq-gic,
> the accesses to the irqchip are seemingly not protected and multiple
> writes to SPIs from different irq descriptors do RMW requests without
> taking the irq-chip lock. When multiple irqs call the request_irq at
> the same time, there can be a simultaneous write at the gic
> distributor, leading to a race. Acquire the gic_lock when the
> irq_type is updated.
> 
> Signed-off-by: Aniruddha Banerjee <aniruddhab@nvidia.com>
> ---
> Changes from V1:
> 
> * Moved the spinlock from irq-gic to irq-gic common, so that the fix
> is valid for GIC v1/v2/v3.
> 
> Change from V2:
> 
> * Fixup the Signed-off-by line.
> 
>  drivers/irqchip/irq-gic-common.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
