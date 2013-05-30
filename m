From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: tegra: avoid channel lock up after free
Date: Thu, 30 May 2013 23:37:10 +0530
Message-ID: <20130530180710.GI3767@intel.com>
References: <1368289853-20011-1-git-send-email-digetx@gmail.com>
 <1368289853-20011-2-git-send-email-digetx@gmail.com>
 <519112D4.7010004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <519112D4.7010004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 13, 2013 at 10:20:36AM -0600, Stephen Warren wrote:
> On 05/11/2013 10:30 AM, Dmitry Osipenko wrote:
> > Lock scenario: Channel 1 was allocated and prepared as slave_sg, used and freed.
> > Now preparation of cyclic dma on channel 1 will fail with err "DMA configuration
> > conflict" because tdc->isr_handler still setted to handle_once_dma_done.
> > 
> > This happens because tegra_dma_abort_all() won't be called on channel freeing
> > if pending list is empty and channel not busy. We need to clear isr_handler
> > on channel freeing to avoid locking.
> ...
> > Reposting with dma maintainers cc'd as suggested by Stephen.
> > Added Stephen's ack.
Applied, both thanks
> 
> Just for reference (not need to repost again): You'd usually send the
> messages *to* the DMA maintainers since they will be taking the patches
> through their tree, and then Ccing anyone else.
get_maintainer.pl is your friend for this

--
~Vinod
