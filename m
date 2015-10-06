From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Tue, 6 Oct 2015 17:04:09 -0600
Message-ID: <56145369.7040404@wwwdotorg.org>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444047007-30494-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/05/2015 06:10 AM, Jon Hunter wrote:
> Add device-tree binding documentation for the Tegra210 Audio DMA
> controller.

> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt

> +- #dma-cells : Must be <2>. The first cell denotes the transmit or
> +  receive request number and should be between 1 and the maximum number
> +  of requests supported (see properties "dma-rx-requests" and
> +  "dma-tx-requests"). This value corresponds to the RX/TX_REQUEST_SELECT
> +  fields in the ADMA_CHn_CTRL register. The second cell denotes whether
> +  the channel is a receive or transmit channel and must be either 2 for
> +  a receive channel and 4 for a transmit channel. These values correspond
> +  to the TRANSFER_DIRECTION field of the ADMA_CHn_CTRL register.

Is it typical to encode the direction into the dma cells? I would have 
thought the client would provide that information at run-time when 
requesting a DMA channel.
