From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra PCIe
Date: Thu, 29 Jan 2015 15:45:38 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501291543030.16475@utopia.booyaka.com>
References: <20150128234935.20644.89300.stgit@dusk.lan> <20150128234937.20644.9400.stgit@dusk.lan> <CAL_JsqKMm=r+57ShskgbtNqnCGF1yKYDSJJFQ7o05keNzh5z+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKMm=r+57ShskgbtNqnCGF1yKYDSJJFQ7o05keNzh5z+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rob

On Thu, 29 Jan 2015, Rob Herring wrote:

> On Wed, Jan 28, 2015 at 5:49 PM, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Add compatible strings for the PCIe IP blocks present on several Tegra
> > chips.  The primary objective here is to avoid checkpatch warnings,
> > per:
> >
> > http://marc.info/?l=linux-tegra&m=142201349727836&w=2
> >
> > Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  .../bindings/pci/nvidia,tegra20-pcie.txt           |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > index d763e047c6ae..e772884f1c33 100644
> > --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > @@ -5,6 +5,8 @@ Required properties:
> >    - "nvidia,tegra20-pcie"
> >    - "nvidia,tegra30-pcie"
> >    - "nvidia,tegra124-pcie"
> > +  - "nvidia,tegra132-pcie" (not yet matched in the driver)
> > +  - "nvidia,tegra210-pcie" (not yet matched in the driver)
> 
> Whether the driver matches or not is irrelevant to the binding and may
> change over time. Does this mean the driver matches on something else
> or Tegra132 is not yet supported in the driver? 

It means that the driver currently matches on one of the first three 
strings that don't carry that annotation.

> If the former, what is important is what are the valid combinations of 
> compatible properties and that is not captured here. In other words, 
> what is the fallback compatible string for each chip?

The intention was to try to be helpful: to document that anyone adding a 
"nvidia,tegra132-pcie" compatible string would also need to add one of the 
other strings as a fallback.  Would you like that to be documented in a 
different way, or removed?


- Paul
