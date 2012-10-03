From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: fix interrupt name issue with apb dma.
Date: Wed, 03 Oct 2012 14:53:44 -0600
Message-ID: <506CA5D8.1050201@wwwdotorg.org>
References: <1349284913-22350-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349284913-22350-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/03/2012 11:21 AM, Laxman Dewangan wrote:
> When watching the interrupts through /proc/interrupts,
> the name of the interrupts are blank or garbage. The
> reason is the pointer passed for devname during irq
> registration is stack and so it get changed after
> dma registration completes.
> Allocate the pointer as part of dma channel and pass
> this pointer as the devname for irq registration to
> avoid change of name.

(Dropping stable Cc; Olof/Arnd or Vinod, is it possible you could add
that into the patch description when applying this?)

Reported-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
