From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: add support for Tegra114 SoC
Date: Mon, 07 Jan 2013 10:03:47 -0700
Message-ID: <50EAFFF3.4050600@wwwdotorg.org>
References: <1357387568-26010-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357387568-26010-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/05/2013 05:06 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has APB DMA controller which supports channel wise
> pause control. The global pause is used for clock gating and hence
> DMA registers are not accessible if DMAs are globally disabled.
> 
> Add support for use of channel wise pause feature for Tegra114 SOCs.

Aside from the comments already made by Vinod,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
