From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
	gpio's from the device tree.
Date: Fri, 03 Jun 2011 14:25:43 -1000
Message-ID: <4DE97B87.1040109@firmworks.com>
References: <20110527205444.21000.90209.stgit@riker>
	<20110527205721.21000.78599.stgit@riker>
	<20110528012427.GB5971@opensource.wolfsonmicro.com>
	<BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
	<20110530033826.GE4130@opensource.wolfsonmicro.com>
	<20110530061155.GC23517@ponder.secretlab.ca>
	<4DE336A1.5040509@firmworks.com>
	<20110530070138.GA5036@opensource.wolfsonmicro.com>
	<8d2515b13c817cc956b185d043bcef00@kernel.crashing.org>
	<BANLkTi=hkScxYpt449CQCky+bLU3UvkC_A@mail.gmail.com>
	<4DE403C5.7060003@firmworks.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0498E1C22D@HQMAIL01.nvidia.com>
	<4DE536AD.5080200@firmworks.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0498E1C3F5@HQMAIL01.nvidia.com>
	<4DE6AFF7.3040905@firmworks.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0498E1C870@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498E1C870-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/3/2011 11:24 AM, Stephen Warren wrote:
> Mitch Bradley wrote at Wednesday, June 01, 2011 3:33 PM:
>> On 6/1/2011 5:59 AM, Stephen Warren wrote:
>>> ...
>>> I have to say, I don't like that aspect; i.e. having to repeat
>>> #mode-cells in every gpio definition that's inside/underneath the
>>> controller definition; in my mind, "passing on" the requirement to
>>> define the mode would be the default state, so forcing the namer of
>>> GPIOs (i.e. whoever writes the "gpio1: gpio@12,0 {" definitions) to
>>> do this seems almost like busy work. Is there a way in *.dts to mark
>>> the #mode-cells field as inherited by children unless overridden?
>>
>> That is a very good point.  Addressing it led me to a revised scheme
>> that I like much better.  (Notice that in the notes below I address your
>> reasonable desire for an immutable SoC core definition.)
>>
>> The example:
>>
>>       gpio-controller1: gpio-controller {
>>           #address-cells =<2>;
>>           #mode-cells =<2>;
>>           unbound_gpio1: gpio {
>>               /* No reg property */
>>               /* No mode property */
>>           }
>>           fully_bound_gpio1: audio-chipsel@12,0 {
>>               reg =<12 0>;
>>               mode =<55 66>;
>>               usage = "Audio Codec chip select";  /* Optional */
>>           }
>>           address_bound_gpio1: gpio@13,0 {
>>               reg =<13 0>;
>>               /* No mode property */
>>           }
>>           mode_bound_gpio1: open-drain-gpio {
>>               /* No reg property */
>>               mode =<77 88>;
>>           }
>>       };
>>       gpio-controller2: gpio-controller {
>>            #address-cells =<1>;
>>            #mode-cells =<1>;
>>            unbound_gpio2: gpio {
>>                /* No reg property */
>>                /* No mode property */
>>            }
>>            address_bound_gpio2: gpio@4 {
>>                reg =<4>;
>>                /* No mode property */
>>            }
>>       };
>>       [...]
>>       chipsel-gpio =
>>           <&fully_bound_gpio1>,
>>           <&unbound_gpio1 13 0 55 77>,
>>           <&mode_bound_gpio1 14 0>,
>>           <&address_bound_gpio2 88>,
>>           <&unbound_gpio2 5 1>;
>
> Sorry for the slow response. Some brief comments:
>
> a) I like this better than the previous proposal; the handling of
>     #address-cells and #mode-cells is more consistent here.
>
> b) I like that the GPIO controller (or some overlay file on top of it)
>     can provide names for GPIOs and names for modes.
>
> c) I suspect that something like the following won't work:
>
>     chipsel-gpio =
>         <&address_bound_gpio2&mode_bound_gpio2>;
>
>     It's an attempt to symbolically reference both a GPIO name/address
>     and mode. I feel this kind of reference would be the most common
>     case; a device wanting to use symbolic names for a particular GPIO
>     location and mode. Only being able to specify name/address *or* mode
>     symbolically, but not both, seems like a rather serious hole, and
>     makes the scheme a lot less interesting to me.
>
> d) Doing this all with DT node references seems complex and overkill. I'd
>     personally far rather see the device-tree compiler grow something like
>     the C pre-processor, so you could just do:
>
>     gpioc: gpio-controller {
>         #address-cells =<2>;
>         #mode-cells =<2>;
>     };
>     #define TEGRA_GPIO_PA1 0 0
>     #define TEGRA_GPIO_PX2 23 1
>     #define TERGA_GPIO_PULLUP 0
>     #define TERGA_GPIO_PULLDOWN 1
>     #define TEGRA_GPIO_FAST 0
>     #define TEGRA_GPIO_SLOW 1
>
>     And then reference them like:
>
>     chipsel-gpio =
>         <&gpioc TEGRA_GPIO_PX2 TEGRA_GPIO_PULLUP TEGRA_GPIO_FAST>;
>
>     Related to this, I'm having difficulty understanding why editing a
>     GPIO reference in the style immediately above is any harder than
>     editing a GPIO node within the GPIO controller of the style you most
>     recently proposed.
>

It seems that your focus is on the syntax of the device tree compiler. 
That's fine, but my focus is rather different - I'm concerned about the 
semantics of the "object model" represented by the tree layout.  I don't 
use the device tree compiler.  I do full-on Open Firmware systems, in 
which device node are active objects with methods.

My intention in suggesting this scheme was primarily to promote the idea 
that gpios "underneath" a gpio-controller could be addressed using the 
device tree's normal physical addressing rules.  It seems to me that a 
GPIO identification number is an "address" according to the device tree 
rules, thus the portion of the "gpio cells" list that identifies the 
specific pin should be thought of as a bona-file address, instead of 
something new and different.

That thought led me to consider what individual GPIO nodes would look 
like, and that led me to the thought that it might be useful to "bind" 
some of them, so clients could refer to the "bound package" without 
having to know the details.  This seemed good from an information-hiding 
perspective.  I liked the idea that you could change the board and fix 
the reassignment in one place, instead of having to track down all the 
usage points.

I sympathize with your desire for a human-readable DTC syntax that is 
not error-prone.  I think that's somewhat orthogonal to the semantic 
issues of the device tree structure.  Both are important.
