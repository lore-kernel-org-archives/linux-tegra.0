From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: tegra: fix residual calculation for cyclic
 case
Date: Fri, 13 Jul 2012 08:45:36 +0530
Message-ID: <1342149336.1726.5.camel@vkoul-udesk3>
References: <1341217328-6676-1-git-send-email-ldewangan@nvidia.com>
	 <4FF1C62B.5070005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF1C62B.5070005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-07-02 at 10:02 -0600, Stephen Warren wrote:
> On 07/02/2012 02:22 AM, Laxman Dewangan wrote:
> > In cyclic mode of DMA, the byte transferred can be more
> > than the requested size and in this case, calculating
> > residuals based on the current position of DMA transfer to
> > bytes requested i.e. bytes required to transfer to reach
> > bytes requested from current DMA position.
> > 
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This makes sense to me, although I wonder if details like this aren't
> something that the dmaengine core should be handling.
No core doesn't know anything about the how much you are transferring
and where you are. That is the driver to calculate and provide.

-- 
~Vinod
