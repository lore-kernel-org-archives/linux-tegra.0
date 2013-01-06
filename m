From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: add support for Tegra114 SoC
Date: Sun, 6 Jan 2013 06:37:38 -0800
Message-ID: <20130106143738.GC29209@intel.com>
References: <1357387568-26010-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357387568-26010-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Jan 05, 2013 at 05:36:08PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has APB DMA controller which supports channel wise
> pause control. The global pause is used for clock gating and hence
> DMA registers are not accessible if DMAs are globally disabled.
> 
> Add support for use of channel wise pause feature for Tegra114 SOCs.
Looks fine to me. Only issue being that changelog tells me you are adding
support for 114, but patch seems more of adding pause support and while at it
also add entries for 114. 
Care to update changelog & title...

--
~Vinod
