From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: use sg_dma_address() for getting dma
 buffer address
Date: Wed, 27 Jun 2012 19:02:36 +0530
Message-ID: <1340803956.1562.245.camel@vkoul-udesk3>
References: <1340377870-10035-1-git-send-email-ldewangan@nvidia.com>
	 <4FE4A78F.4090307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE4A78F.4090307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-06-22 at 11:12 -0600, Stephen Warren wrote:
> On 06/22/2012 09:11 AM, Laxman Dewangan wrote:
> > Use the sg_dma_address() to get the segment buffer address for
> > DMA transfer in place of sg_phys() which returns the physical
> > address of an sg entry.
> > The sg_dma_address() returns the correct buffer memory address
> > for DMA transfer.
> 
> It's what everyone else is doing, so:
And this is the right thing to do. 
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Applied, thanks

-- 
~Vinod
