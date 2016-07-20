From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add power domains to Tegra BPMP firmware
Date: Wed, 20 Jul 2016 07:46:56 -0500
Message-ID: <20160720124656.GA18773@rob-hp-laptop>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2016 at 01:14:40PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The Tegra186 BPMP is also a provider of power domains. Enhance the device
> tree binding to describe this.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> These patches all build on top of Joseph Lo's baseline BPMP binding patches[1]
> and enhance them to represent a few more features of the firmware.
> 
> [1] https://lkml.org/lkml/2016/7/19/280
> "[PATCH V3 01/10] Documentation: dt-bindings: mailbox: tegra: Add binding for HSP mailbox"
> 
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 10 ++++--
>  include/dt-bindings/power/tegra186-powergate.h     | 39 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/power/tegra186-powergate.h

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
