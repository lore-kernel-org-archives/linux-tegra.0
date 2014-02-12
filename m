From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Restore licensing consistency
Date: Wed, 12 Feb 2014 09:46:57 -0700
Message-ID: <52FBA581.3000707@wwwdotorg.org>
References: <1392190238-1717-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392190238-1717-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2014 12:30 AM, Thierry Reding wrote:
> The bulk of the Tegra DRM driver is GPL v2 licensed, but some of the new
> subdrivers were licensed under an MIT license. This was simply oversight
> on my part.
> 
> One exception to this is the public header file that will eventually be
> used within libdrm. Since all the other headers in libdrm use the MIT
> license, do the same for Tegra.

The series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I guess this needs explicit acks from the following people outside
NVIDIA who touched these files:?

Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org> (dsi.c)
Emil Goode <emilgoode-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (tegra_drm.h)
