From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: tegra: avoid channel lock up after free
Date: Mon, 13 May 2013 10:20:36 -0600
Message-ID: <519112D4.7010004@wwwdotorg.org>
References: <1368289853-20011-1-git-send-email-digetx@gmail.com> <1368289853-20011-2-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368289853-20011-2-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/11/2013 10:30 AM, Dmitry Osipenko wrote:
> Lock scenario: Channel 1 was allocated and prepared as slave_sg, used and freed.
> Now preparation of cyclic dma on channel 1 will fail with err "DMA configuration
> conflict" because tdc->isr_handler still setted to handle_once_dma_done.
> 
> This happens because tegra_dma_abort_all() won't be called on channel freeing
> if pending list is empty and channel not busy. We need to clear isr_handler
> on channel freeing to avoid locking.
...
> Reposting with dma maintainers cc'd as suggested by Stephen.
> Added Stephen's ack.

Just for reference (not need to repost again): You'd usually send the
messages *to* the DMA maintainers since they will be taking the patches
through their tree, and then Ccing anyone else.
