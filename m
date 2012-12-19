From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement flags parameters for cyclic transfer
Date: Wed, 19 Dec 2012 10:02:53 -0700
Message-ID: <50D1F33D.1050709@wwwdotorg.org>
References: <1355924434-7930-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355924434-7930-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: djbw-b10kYP2dOMg@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 06:40 AM, Laxman Dewangan wrote:
> The flag parameter is added in the cyclic transfer request.
> Use the flag option of:
> - DMA_PREP_INTERRUPT for enabling interrupt.
> - DMA_CTRL_ACK for deciding whether ack is requred or not for
>   descriptor.

Do the relevant drivers that use Tegra's DMA engine already set flags
correctly, so that this change won't cause any regressions?

Why would you not want to enable interrupts; how does a client know when
to refill the buffer?
