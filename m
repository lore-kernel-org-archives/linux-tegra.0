From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] dma: tegra: avoid channel lock up after free
Date: Tue, 30 Oct 2012 12:05:27 -0600
Message-ID: <509016E7.800@wwwdotorg.org>
References: <508EA04D.5050805@wwwdotorg.org> <1351552833-4132-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351552833-4132-1-git-send-email-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, ldewangan@nvidia.com
Cc: vinod.koul@intel.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/29/2012 05:20 PM, Dmitry Osipenko wrote:
> Fixed channel "lock up" after free.
> 
> Lock scenario: Channel 1 was allocated and prepared as slave_sg, used and freed.
> Now preparation of cyclic dma on channel 1 will fail with err "DMA configuration
> conflict" because tdc->isr_handler still selected to handle_once_dma_done.
> 
> This happens because tegra_dma_abort_all() won't be called on channel freeing
> if pending list is empty or channel not busy. We need to clear isr_handler
> on channel freeing to avoid locking. Also I added small optimization to prepare
> functions, so current channel type checked before making allocations.

Reviewed-by: Stephen Warren <swarren@nvidia.com>

I believe this looks OK. However, I would like Laxman to also ack/review
this since he wrote the driver.
