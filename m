From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] spi: Tegra: add device tree binding doc for SPI/QSPI
Date: Mon, 26 Oct 2015 10:33:01 -0600
Message-ID: <562E55BD.7070000@wwwdotorg.org>
References: <1445643042-5764-1-git-send-email-twarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445643042-5764-1-git-send-email-twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/23/2015 05:30 PM, Tom Warren wrote:
> This patch adds the device tree binding doc for the Tegra
> SPI/QSPI controllers on Tegra114 and Tegra210.

> diff --git a/doc/device-tree-bindings/spi/spi-tegra.txt b/doc/device-tree-bindings/spi/spi-tegra.txt

Since this is a patch to the Linux kernel, it should use the path and 
file names from the Linux kernel, so that should be:

Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt

(or perhaps an earlier SoC number if this HW block first appeared before 
Tegra210)

> +NVIDIA Tegra SPI/QSPI controller.

There's already a binding document for the regular SPI controller. The 
plain SPI entries should be removed from this file, leaving it covering 
the QSPI controller only.

Can you confirm that there physically is a separate QSPI controller in 
HW and that it has different registers to the regular SPI controller? 
Or, is QSPI simply a new mode of operation for the existing HW?

> +Required properties:
> +- compatible : should be one of the following:
> +  "nvidia,tegra114-spi" (for Tegra114)
> +  "nvidia,tegra210-qspi" (for Tegra210)
> +- reg: Should contain SPI registers location and length.
> +- interrupts: Should contain SPI interrupts.

Are there multiple interrupts or just one? I imagine just one, in which 
case just "interrupt" at the end of that description.
