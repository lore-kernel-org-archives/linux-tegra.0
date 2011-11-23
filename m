From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DT DMA channel binding for Tegra I2S
Date: Wed, 23 Nov 2011 15:54:44 -0600
Message-ID: <4ECD6BA4.1010607@gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF174F08C803@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174F08C803-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mark Brown (broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org)" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/23/2011 03:25 PM, Stephen Warren wrote:
> Rob, Grant,
> 
> Re: http://www.spinics.net/lists/arm-kernel/msg148899.html
> 
> Background: Tegra's DMA controller needs to be told which DMA "request
> select" to use for each transfer. The identifies which peripheral to
> transfer to/from.
> 
> The Tegra I2S driver needs to know its own "request select" value to
> pass to the audio driver DMA path. The board files typically provide
> this to the driver as an IORESOURCE_DMA. I don't think there's any
> standard binding that creates such a resource when instantiating a
> platform device from device tree, and the discussions I found when
> looking for one didn't seem to reach conclusion that there should be
> one. So, I proposed the following property in the I2S driver's DT
> binding for this:

I think this is a case of every platform being different and
IORESOURCE_DMA is not too widely used. Even on PPC, there's not a
standard way.

> 
> Doc:
> 
> - dma-channel : The Tegra DMA controller's channel ID for this I2S controller
> 
> Example:
> 
> i2s@70002800 {
> 	compatible = "nvidia,tegra20-i2s";
> 	reg = <0x70002800 0x200>;
> 	interrupts = < 45 >;
> 	dma-channel = < 2 >;
> };
> 
> Does that look reasonable? Or, should I pursue some more standardized
> solution?

I had some discussion with Thomas Abraham about this for the pl330 dma:

http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-September/008269.html

So I would just add a phandle to the dma controller here.

> 
> (although perhaps dma-request-select would be a better name, since each
> of the DMA controller's 16 channels can be used for any of the DMA
> selects)

You'll find h/w with all sorts of relationships between requests and
channels on DMA controller h/w...

> 
> For reference, the code turns out as below; it might be nicer if the
> DT parsing code could create this resource for us, although there was
> some previous discussion about IORESOURCE_DMA not being the correct
> representation for this anyway.
> 
> 	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
> 	if (!dmareq) {
> 		if (of_property_read_u32(pdev->dev.of_node,
> 					 "nvidia,dma-channel",
> 					 &dma_ch) < 0) {

It would, but I think IORESOURCE_DMA is supposed to be for ISA bus DMA.
Also, I think often you need more information than just a request line
like a mode or type of transfer or burst length parameters.

Rob
