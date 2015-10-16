From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Fri, 16 Oct 2015 10:09:29 -0600
Message-ID: <56212139.4080101@wwwdotorg.org>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444980919-20331-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2015 01:35 AM, Jon Hunter wrote:
> Add device-tree binding documentation for the Tegra210 Audio DMA
> controller.

> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt

> +Required properties:

> +- interrupt-parent: Phandle to the interrupt parent controller.

Nit: Since that is more of a "system level"/standard property, it's 
typical not to document it. The property is not actually required if the 
inherited value is already correct. Still, it's obvious enough what this 
means, so I'd only suggest fixing this if you have to respin for some 
other reason.

> +- clocks: Must contain one entry for the ADMA module clock, "adma_ape".
> +- clock-names: Must contain the entry "adma_ape".

Which clock is this in the CAR? I don't see any adma_ape clock 
documented in the TRM.

Is there a dedicated reset signal for this module? If so, we should 
require a resets property.
