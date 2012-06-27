From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: tegra: set DMA_CYCLIC capability
Date: Wed, 27 Jun 2012 19:19:23 +0530
Message-ID: <1340804963.1562.257.camel@vkoul-udesk3>
References: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com>
	 <1340803748.1562.244.camel@vkoul-udesk3>  <4FEB0DB6.7040105@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FEB0DB6.7040105-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-06-27 at 19:12 +0530, Laxman Dewangan wrote:
> Not really,
> I called dma_cookie_complete() only from the isr
> handle_once_dma_done() 
> which is only called if it is non-cyclic mode.
Ah got it my bad.

Applied now, Thanks 
-- 
~Vinod
