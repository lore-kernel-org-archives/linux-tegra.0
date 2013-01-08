From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/2] dma: tegra: add channel wise pause control support
 and Tegra114 SoCs.
Date: Tue, 8 Jan 2013 02:54:47 -0800
Message-ID: <20130108105447.GG19691@intel.com>
References: <1357489323-21359-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1357489323-21359-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: djbw@fb.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jan 06, 2013 at 09:52:01PM +0530, Laxman Dewangan wrote:
> This patch series add the channel wise pause control on dma driver and then
> add support for Tegra114 SoCs.
> 
> The orginal change was in single patch and based on review comment, trying to split
> the change to have more meaningful changelog matches with actual code change.
Applied thanks

Can you check my next, I got some conflicts and resolved them manually

--
~Vinod
> 
> 
> Laxman Dewangan (2):
>   dma: tegra: add support for channel wise pause
>   dma: tegra: add support for Tegra114 SoC
> 
>  drivers/dma/tegra20-apb-dma.c |   54 +++++++++++++++++++++++++++++++++++++----
>  1 files changed, 49 insertions(+), 5 deletions(-)
> 
