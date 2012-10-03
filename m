From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dma: tegra: fix interrupt name issue with apb dma.
Date: Wed, 3 Oct 2012 11:17:57 -0700
Message-ID: <20121003181757.GA24871@kroah.com>
References: <1349284687-22311-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1349284687-22311-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: arm@vger.kernel.org, djbw@fb.com, vinod.koul@intel.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 03, 2012 at 10:48:07PM +0530, Laxman Dewangan wrote:
> When watching the interrupts through /proc/interrupts,
> the name of the interrupts are blank or garbage. The
> reason is the pointer passed for devname during irq
> registration is stack and so it get changed after
> dma registration completes.
> Allocate the pointer as part of dma channel and pass
> this pointer as the devname for irq registration to
> avoid change of name.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/dma/tegra20-apb-dma.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
