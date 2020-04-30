From: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Date: Thu, 30 Apr 2020 16:15:20 +0200
Message-ID: <20200430141520.GA101194@piout.net>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200430140701.GA21776@bogus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 30/04/2020 09:07:01-0500, Rob Herring wrote:
> On Fri, Apr 17, 2020 at 07:08:23PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > The RTC present on MAX77620 can be used to generate an alarm at a given
> > time, which in turn can be used as a wakeup source for the system if it
> > is properly wired up.
> > 
> > Document how to enable the RTC to act as a wakeup source.
> > 
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mfd/max77620.txt          | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> > index 5a642a51d58e..f05005b0993e 100644
> > --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> > +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> > @@ -125,6 +125,17 @@ MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
> >  			control) then, GPIO1/nRST_IO goes LOW.
> >  			this property is valid for max20024 only.
> >  
> > +Realtime Clock
> > +--------------
> > +The MAX77620 family of power management ICs contain a realtime clock block
> > +that can be used to keep track of time even when the system is powered off.
> > +
> > +The realtime clock can also be programmed to trigger alerts, which can be
> > +used to wake the system up from sleep. In order to configure the RTC to act
> > +as a wakeup source, add an "rtc" child node and add the "wakeup-source"
> > +property.
> > +
> > +
> >  For DT binding details of different sub modules like GPIO, pincontrol,
> >  regulator, power, please refer respective device-tree binding document
> >  under their respective sub-system directories.
> > @@ -159,4 +170,8 @@ max77620@3c {
> >  			maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_SW>;
> >  		};
> >  	};
> > +
> > +	rtc {
> > +		wakeup-source;
> 
> Is the RTC really the only thing that could wake the system in this 
> PMIC?
> 
> I don't think it's really valid to have 'wakeup-source' without 
> 'interrupts' unless the wakeup mechanism is somehow not an interrupt. So 
> I think this belongs in the parent node.
> 

I don't think this is true because in the case of a discrete RTC, its
interrupt pin can be connected directly to a PMIC to power up a board
instead of being connected to the SoC. In that case we don't have an
interrupt property but the RTC is still a wakeup source. This is the
usual use case for wakeup-source in the RTC subsystem. Else, if there is
an interrupt, then we assume the RTC is a wakeup source and there is no
need to have the wakeup-source property.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
