From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] gpio/tegra: dt: add binding for gpio polarity
Date: Fri, 15 Jul 2011 12:00:05 -0600
Message-ID: <20110715180005.GA2833@ponder.secretlab.ca>
References: <20110715051713.GA28865@quad.lixom.net>
 <74CDBE0F657A3D45AFBB94109FB122FF049E834C19@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834C19-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 15, 2011 at 09:29:08AM -0700, Stephen Warren wrote:
> Olof Johansson wrote at Thursday, July 14, 2011 11:17 PM:
> > Allocate one bit in the available extra cell to indicate if the gpio
> > should be considered logically inverted.
> > 
> > Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

Applied, thanks.

g.

> > ---
> >  .../devicetree/bindings/gpio/gpio_nvidia.txt       |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
> > b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
> > index 64aac39..adcf55c 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
> > @@ -3,5 +3,6 @@ NVIDIA Tegra 2 GPIO controller
> >  Required properties:
> >  - compatible : "nvidia,tegra20-gpio"
> >  - #gpio-cells : Should be two. The first cell is the pin number and the
> > -  second cell is used to specify optional parameters (currently unused).
> > +  second cell is used to specify optional parameters:
> > +  - bit 0 specifies polarity (0 for normal, 1 for inverted)
> >  - gpio-controller : Marks the device node as a GPIO controller.
> > --
> > 1.7.4.1
> 
> -- 
> nvpublic
> 
