From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] dma: tegra: use sg_dma_address() for getting dma buffer
 address
Date: Fri, 22 Jun 2012 11:12:47 -0600
Message-ID: <4FE4A78F.4090307@wwwdotorg.org>
References: <1340377870-10035-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340377870-10035-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/22/2012 09:11 AM, Laxman Dewangan wrote:
> Use the sg_dma_address() to get the segment buffer address for
> DMA transfer in place of sg_phys() which returns the physical
> address of an sg entry.
> The sg_dma_address() returns the correct buffer memory address
> for DMA transfer.

It's what everyone else is doing, so:
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
