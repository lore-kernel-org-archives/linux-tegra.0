From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] Tegra: DT: add device tree binding doc for QSPI
Date: Mon, 26 Oct 2015 15:04:11 -0600
Message-ID: <562E954B.5070604@wwwdotorg.org>
References: <1445891676-3262-1-git-send-email-twarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445891676-3262-1-git-send-email-twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/26/2015 02:34 PM, Tom Warren wrote:
> This patch adds the device tree binding doc for the Tegra
> QSPI controller on Tegra210.

> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt

> +- clock-names : Must include the following entries:
> +  - qspi
> +- resets : Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names : Must include the following entries:
> +  - qspi
> +- clocks : Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.

Let's keep clocks and clock-names next to each-other in the doc. I don't 
know why they aren't in the eixsting Tegra SPI doc.

With this issue fixed, this patch looks good to me.

Note: I don't see the devicetree mailing list in the CC list. You should 
probably replace the U-Boot mailing list with it.

> +Optional properties:
> +- dmas : Must contain an entry for each entry in clock-names.
> +  See ../dma/dma.txt for details.
> +- dma-names : Must include the following entries:
> +  - rx
> +  - tx

Eventually, we should have a property that describes the SPI bus width 
(x1, x2, x4 I assume). However, we can assume that unless otherwise 
specified, the width is x1, and add a property to specify the width 
later as/when we need it if you want.
