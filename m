From: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] spi: Tegra: add device tree binding doc for SPI/QSPI
Date: Mon, 26 Oct 2015 18:04:34 +0000
Message-ID: <77b185ab23764f1e8cde0a41189bb490@HQMAIL104.nvidia.com>
References: <1445643042-5764-1-git-send-email-twarren@nvidia.com>
 <562E55BD.7070000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562E55BD.7070000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org" <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, October 26, 2015 9:33 AM
> To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org;
> galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH v2] spi: Tegra: add device tree binding doc for SPI/QSPI
> 
> On 10/23/2015 05:30 PM, Tom Warren wrote:
> > This patch adds the device tree binding doc for the Tegra SPI/QSPI
> > controllers on Tegra114 and Tegra210.
> 
> > diff --git a/doc/device-tree-bindings/spi/spi-tegra.txt
> > b/doc/device-tree-bindings/spi/spi-tegra.txt
> 
> Since this is a patch to the Linux kernel, it should use the path and file names
> from the Linux kernel, so that should be:
> 
> Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
I thought I was adding a binding doc to U-Boot, so the QSPI driver for T210 can go in. I wasn't aware that I had to submit a changelist against the kernel's binding first. I'll redo the file path.

> 
> (or perhaps an earlier SoC number if this HW block first appeared before
> Tegra210)
AFAICT, QSPI first appeared in Tegra210/X1.

> 
> > +NVIDIA Tegra SPI/QSPI controller.
> 
> There's already a binding document for the regular SPI controller. The plain SPI
> entries should be removed from this file, leaving it covering the QSPI controller
> only.
There is no spi binding for Tegra114 in U-Boot at present, hence my duplication. I'll remove the SPI entries from this file, and perhaps copy over the kernel's tegra114 spi binding for U-Boot at a later date.

> 
> Can you confirm that there physically is a separate QSPI controller in HW and
> that it has different registers to the regular SPI controller?
> Or, is QSPI simply a new mode of operation for the existing HW?
QSPI is its own controller, separate from the traditional 4 Tegra SPI controllers. It has its own address space, and some differences in bits in some registers, and adds misc and timing registers that don't exist in the SPI controller. It supports Master mode only (no slave mode), and adds Dual (x2)  and Quad mode (x4) transfer options. It's basically a superset of the Tegra SPI controller.

> 
> > +Required properties:
> > +- compatible : should be one of the following:
> > +  "nvidia,tegra114-spi" (for Tegra114)
> > +  "nvidia,tegra210-qspi" (for Tegra210)
> > +- reg: Should contain SPI registers location and length.
> > +- interrupts: Should contain SPI interrupts.
> 
> Are there multiple interrupts or just one? I imagine just one, in which case just
> "interrupt" at the end of that description.
Only 1 interrupt for QSPI. Note that this was copied verbatim from the kernel's current nvidia,tegra114-spi.txt binding, so if it's wrong, it's wrong there, too.

Tom
--
nvpublic
