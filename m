From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Wed, 21 Dec 2011 09:04:43 -1000
Message-ID: <4EF22DCB.10502@firmworks.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE@HQMAIL01.nvidia.com>
 <20111221093257.GF542@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE9302E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE9302E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/21/2011 8:20 AM, Stephen Warren wrote:
> Thierry Reding wrote at Wednesday, December 21, 2011 2:33 AM:
>> * Stephen Warren wrote:
>>> Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
>> [...]
>>>> +  - default-brightness: the default brightness setting
>>>> +  - max-brightness: the maximum brightness setting
>>>
>>> What are the units of those two properties? Percentage seems like a
>>> reasonable choice, although that's not what the patch implements.
>>
>> That's just the way the pwm-backlight driver works. Typically the maximum
>> brightness is set to 255. I think you can set these values to pretty much
>> anything, and the driver will convert the brightness set via sysfs to the
>> range from 0 to max-brightness.
>
> It sounds like this numbering scheme is some SW abstraction then and not
> directly related to HW. It's questionable that this should be represented
> in DT, although if it's not I'm not sure where else it could be.
>
> I think from a pure HW perspective, you need to represent:
> * PWM period. nS is fine here.
> * Minimum PWM duty cycle. nS or percentage is probably fine here. I don't
>    know which is more likely to be specified in data sheets.
>    (This is missing in the current patch, but supported in pwm_bl.c, so
>    I assume there's a need for this, and hence it should be added to DT)
> * Maximum PWM duty cycle. nS or percentage is probably fine here. I don't
>    know which is more likely to be specified in data sheets.
>    (I think this is assumed to be 100% duty cycle by pwm_bl.c, so perhaps
>    there isn't a need to represent this in DT?)
>
> Now, the Linux PWM driver then needs to know a range to map those min/max
> HW duty cycles to. These are the values where it's unclear to me if/how
> DT should represent them. It looks like the SW min value is always 0, and
> the SW max value is what max-brightness is in the patch. Is there any
> particular reason that max-brightness has to be a particular value, or
> even defined in the DT at all? Could we hard-code it to 255 in the DT
> parsing code, and not store it in the DT at all; would anything break
> if we did that?
>
> If we do need to represent it in DT, given it's a Linux-specific value,
> perhaps the property name should have a "linux," or "linux-pwm-bl,"
> prefix?
>
> Thinking some more, perhaps the concept of "number of distinct useful
> brightness steps" is a reasonable pure HW concept.

On the PWM-controlled backlights that I have used, there is no such 
quantization at the hardware level.  The light (LED or fluorescent tube) 
sees an analog signal, typically a low-pass-filtered PWM waveform, and 
responds accordingly.  Human factors may establish a limit on the number 
of useful distinct levels, but there is no way to determine that from a 
data sheet, and thus no definitive hardware-defined value to assign to a 
property.

The objective hardware parameters are often

a) clock frequency choices for the PWM input
b) counter choices for base period
c) counter choices for on phase

There is usually wide latitude for choosing (a) and (b).  Depending on 
the analog filtering and the response characteristics of the light 
source, some choices may result in flickering.  So it would be 
reasonable to report frequency and base period settings that, on the 
hardware in question, result in a reasonable number of flicker-free 
brightness steps.

To further complicate matters, the relationship between PWM duty cycle 
and perceived brightness is usually nonlinear, so equally-spaced duty 
cycle percentages might not result in the best perceived brightness ramp.

One useful way to describe a given hardware system would be to have 
properties reporting values that work well for that hardware.  You would 
need to report a good base clock frequency, a good base period, and an 
array of N values that give a good perceived brightness ramp.

The backlight control on my PC laptop has 16 levels, 0 to 15.  That 
seems adequate to me.

> If we rename max-
> brightness to something representing that concept, we can still use the
> value as max_brightness in the driver (well, subtract 1) and everyone's
> happy? Perhaps "num-brightness-levels"?
>
> If we store a "default brightness" in the DT, perhaps we should represent
> it in the same way as the min/max PWM duty cycle values, and convert it
> to the 0..max_brighness range when parsing the DT. I'm not sure what we'd
> do if the selected value didn't align with a value obtainable using one
> of the "num-brightness-steps" though. I guess that implies that the default
> should be an integer step ID (as it is in your patch), not a duty cycle?
>
