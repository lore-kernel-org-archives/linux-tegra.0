From: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dts: add generic DMA DT binding for tegra apbdma
Date: Thu, 1 Aug 2013 10:49:29 +0800
Message-ID: <20130801024929.GA31469@rizhao-lap>
References: <1374639002-16753-1-git-send-email-rizhao@nvidia.com>
 <1374639002-16753-2-git-send-email-rizhao@nvidia.com>
 <51F2CC30.5090200@wwwdotorg.org>
 <20130730025448.GI15855@rizhao-lap>
 <51F7EE81.1060105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F7EE81.1060105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 31, 2013 at 12:49:05AM +0800, Stephen Warren wrote:
> On 07/29/2013 08:54 PM, Richard Zhao wrote:
> > On Sat, Jul 27, 2013 at 03:21:20AM +0800, Stephen Warren wrote:
> >> (Stripping the Cc list a lot, but adding in the DT binding maintainers)
> >>
> >> On 07/23/2013 10:09 PM, Richard Zhao wrote:
> >>> All Tegra device drivers will soon move to generic DMA device tree bindings.
> >>> Add the required properties to the Tegra DT files to support that. The legacy
> >>> property nvidia,dma-request-selector will be removed after all drivers have
> >>> been converted, in order to maintain bisectability.
> >>>
> >>> Changes:
> >>>  - Add '#dma-cells' for apbdma nodes
> >>>  - And properties 'dmas' and 'dma-names' for apbdma client nodes
> >>>  - update apbdma DT binding doc
> >>>
> >>> Signed-off-by: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>  .../devicetree/bindings/dma/tegra20-apbdma.txt     |  1 +
> >>>  arch/arm/boot/dts/tegra114.dtsi                    | 27 ++++++++++++++++++++++
> >>>  arch/arm/boot/dts/tegra20.dtsi                     | 27 ++++++++++++++++++++++
> >>>  arch/arm/boot/dts/tegra30.dtsi                     | 25 ++++++++++++++++++++
> >>
> >> This patch should be split differently.
> >>
> >> Patch 1 in the series should include the binding document change and the
> >> associated DMA driver change, which will support both the old and new
> >> bindings.

Binding doc is used to define the way dts describe hw. I still think it
is better to squash into this patch. But it's not such a big deal. I'll
move it to dma patch  since you like it.

Thanks
Richard

> >>
> >> Patch 2 should contain the *.dtsi changes.
> >
> > The reason I update apbdma binding doc here is to make it consistent
> > with the mass properties added in dtsi files.
> > apbdma has less places of changes than dtsi files.
> 
> It'll still be consistent if you update the binding documentation first,
> then update the *.dtsi to conform to the new binding docs. It won't
> affect the number of changes.
