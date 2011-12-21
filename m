From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Wed, 21 Dec 2011 10:20:08 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE9302E@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE@HQMAIL01.nvidia.com>
 <20111221093257.GF542@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111221093257.GF542-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, December 21, 2011 2:33 AM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> [...]
> > > +  - default-brightness: the default brightness setting
> > > +  - max-brightness: the maximum brightness setting
> >
> > What are the units of those two properties? Percentage seems like a
> > reasonable choice, although that's not what the patch implements.
> 
> That's just the way the pwm-backlight driver works. Typically the maximum
> brightness is set to 255. I think you can set these values to pretty much
> anything, and the driver will convert the brightness set via sysfs to the
> range from 0 to max-brightness.

It sounds like this numbering scheme is some SW abstraction then and not
directly related to HW. It's questionable that this should be represented
in DT, although if it's not I'm not sure where else it could be.

I think from a pure HW perspective, you need to represent:
* PWM period. nS is fine here.
* Minimum PWM duty cycle. nS or percentage is probably fine here. I don't
  know which is more likely to be specified in data sheets.
  (This is missing in the current patch, but supported in pwm_bl.c, so
  I assume there's a need for this, and hence it should be added to DT)
* Maximum PWM duty cycle. nS or percentage is probably fine here. I don't
  know which is more likely to be specified in data sheets.
  (I think this is assumed to be 100% duty cycle by pwm_bl.c, so perhaps
  there isn't a need to represent this in DT?)

Now, the Linux PWM driver then needs to know a range to map those min/max
HW duty cycles to. These are the values where it's unclear to me if/how
DT should represent them. It looks like the SW min value is always 0, and
the SW max value is what max-brightness is in the patch. Is there any
particular reason that max-brightness has to be a particular value, or
even defined in the DT at all? Could we hard-code it to 255 in the DT
parsing code, and not store it in the DT at all; would anything break
if we did that?

If we do need to represent it in DT, given it's a Linux-specific value,
perhaps the property name should have a "linux," or "linux-pwm-bl,"
prefix?

Thinking some more, perhaps the concept of "number of distinct useful
brightness steps" is a reasonable pure HW concept. If we rename max-
brightness to something representing that concept, we can still use the
value as max_brightness in the driver (well, subtract 1) and everyone's
happy? Perhaps "num-brightness-levels"?

If we store a "default brightness" in the DT, perhaps we should represent
it in the same way as the min/max PWM duty cycle values, and convert it
to the 0..max_brighness range when parsing the DT. I'm not sure what we'd
do if the selected value didn't align with a value obtainable using one
of the "num-brightness-steps" though. I guess that implies that the default
should be an integer step ID (as it is in your patch), not a duty cycle?

-- 
nvpublic
