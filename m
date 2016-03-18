From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: gk20a: Fix typo in compatible name
Date: Fri, 18 Mar 2016 15:31:40 -0500
Message-ID: <20160318203140.GA10337@rob-hp-laptop>
References: <1458010724-10945-1-git-send-email-acourbot@nvidia.com>
 <1458010724-10945-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458010724-10945-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 15, 2016 at 11:58:40AM +0900, Alexandre Courbot wrote:
> The correct compatible name is "nvidia,gk20a".
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This may be what is used, but having the SoC name would be preferred 
assuming gk20a is in multiple SoCs.

Rob
