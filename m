From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dt: palmas: support IRQ inversion at the board
 level
Date: Mon, 03 Mar 2014 09:41:36 -0700
Message-ID: <5314B0C0.4040008@wwwdotorg.org>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org> <20140227210227.GE2931@xora-haswell> <530FAFAE.5050800@wwwdotorg.org> <20140228055818.GA29849@sirena.org.uk> <5310BA99.4050203@wwwdotorg.org> <20140303005246.GA22047@xora-yoga13>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140303005246.GA22047@xora-yoga13>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graeme Gregory <graeme-/SyDAi3Rz4f10XsdtD+oqA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/02/2014 05:52 PM, Graeme Gregory wrote:
> On Fri, Feb 28, 2014 at 09:34:33AM -0700, Stephen Warren wrote:
>> On 02/27/2014 10:58 PM, Mark Brown wrote:
>>> On Thu, Feb 27, 2014 at 02:35:42PM -0700, Stephen Warren wrote:
>>>> On 02/27/2014 02:02 PM, Graeme Gregory wrote:
>>>
>>>>>> +- ti,irq-externally-inverted : If missing, the polarity of the Palmas IRQ
>>>>>> +  output should be set to the opposite of the polarity indicated by the IRQ
>>>>>> +  specifier in the interrupts property. If absent, the polarity should be
>>>>>> +  configured to match. This allows the representation of an inverter between
>>>>>> +  the Palmas IRQ output and the interrupt parent's IRQ input.
>>>
>>>>> This has got to be the wrong way to do things, all this leads to is every
>>>>> device doing this property in its own way and having totally inconsistent
>>>>> properties all meaning the same thing.
...
>> Another alternative might be to add an extra IRQ bit in the IRQ
>> specifier (and something similar would be needed for GPIO specifiers)
>> that indicates "inversion between source and destination". This could be
>> queried by drivers in exactly the same way as the existing polarity/type
>> IRQ flags. We'd need to update each individual IRQ controller binding to
>> enable that flag, since each binding defines its own definition of such
>> flags. (although in practice since most use the same centrally suggested
>> flags, this wouldn't be any more than just saying yes, this binding
>> allows that new flag to be used).
>>
> A new flag would meet my concerns of every chip doing basic inversion
> in different ways.

OK, I'll look into a new flag.

The one thing I worry about is that we can either:

1) Have every IC driver with a configurable output polarity read a DT
flag (and we can fully standardize it's name), which is 1 line of code
per IC driver.

or:

2) We can go through every single interrupt controller's DT binding and
driver, and implement (document and parse) the new IRQ specifier flag
there, and pass it throgh the Linux IRQ stack, yet we still need code in
every IC driver to actually read the flag, so we haven't removed any
code. It seems /much/ simpler, and no more of a maintenance or
consistency burden, to just have the IC driver read the flag directly
from their own DT.

Still, as I said, I'll go try and code it up and see how bad it is in
practice.
