From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Mon, 9 Oct 2017 16:56:57 -0500
Message-ID: <2c1abc4e-828e-8cd6-cce7-73050f5322fb@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com> <20171006110749.GB22706@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171006110749.GB22706@ulmo>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 10/06/2017 06:07 AM, Thierry Reding wrote:
> On Thu, Sep 28, 2017 at 09:22:17AM -0500, Grygorii Strashko wrote:
>>
>>
>> On 09/28/2017 04:56 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi Linus,
>>>
>>> here's the latest series of patches that implement the tighter IRQ chip
>>> integration as well as the banked GPIO infrastructure that we had
>>> discussed a couple of weeks/months back.
>>>
>>> The first couple of patches are mostly preparatory work in order to
>>> consolidate all IRQ chip related fields in a new structure and create
>>> the base functionality for adding IRQ chips.
>>>
>>> After that, I've added the Tegra186 GPIO support patch that makes use of
>>> the new tight integration.
>>>
>>> To round things off the new banked GPIO infrastructure is added (along
>>> with some more preparatory work), followed by the conversion of the two
>>> Tegra GPIO drivers to the new infrastructure.
>>
>> Hm. So you've ignored my comments [1].
>>
>> Sry, but I do not agree with this series.
>> - no prof that it can be re-used by other drivers than tegra
>>   (at least I do not see reasons to re-use it for any TI drivers)
> 
> I had done some research based on Linus' feedback from an earlier series
> and identified the following potential candidates[0] that could move to
> this new infrastructure:
> 

below based on code check:

> 	- gpio-intel-mid.c

one irq per all gpios in controller

> 	- gpio-merrifield.c

one irq per all gpios in controller

> 	- gpio-pca953x.c
one irq per all gpios in controller

> 	- gpio-stmpe.c
one irq per all gpios in controller
> 	- gpio-tc3589x.c
one irq per all gpios in controller
> 	- gpio-ws16c48.c

one irq per all gpios in controller

> 
> Note that this is based on code inspection rather than DT inspection,
> because that's fundamentally flawed. If you look at this from a DT
> perspective you're going to be tempted to change the DT bindings, but
> you can't do that because of backwards compatiblity. This new framework
> also doesn't address the issues at that level, but rather tries to be
> some common code that is otherwise duplicated in one way or another in
> various drivers and therefore hard to maintain. This is what Linus had
> originally requested, and that's what the series does.

I've looked at this again, and again. I've looked on drivers listed above.
Sry, I do not see how this change can improve/simplify above drivers :(
May be it will clean up my doubts, if it will be possible to convert more drivers?

> 
>> - no split
> 
> What does this mean? The series is nicely split into separate patches,
> so each one individually is easy to review. I've also gone through quite
> some trouble to make sure everything builds fine after each patch, so
> it's possible to apply individual bits of the series. For example we
> could opt to apply everything up to the banked GPIO support if that's
> still contentious.

i've commented it in [1]. copy paste here

>>
So, can it be split? I think, patches which reorganize gpio irqchip specific fields placement 
and move them in gpio_irq_chip can be considered separately if they will not introduce
functional changes. Also, omap changes can be considered separately.
(Pay attention that new fields introduced in patch 1). 
>>

This will reduce size of your series and concentrate review attention on actual functional changes.


[1] https://lkml.org/lkml/2017/9/15/442

> 
>> - all GPIO IRQs mapped statically
> 
> This series predates your work on the dynamic IRQ mapping, so I hadn't
> picked up those changes. This should be easily solved by the attached
> patch, though.
> 
>> - irq->map[offset + j] = irq->parents[parent]; holds IRQs for all pins
>>    which is waste of memory
> 
> It's the only way to generically do this. Also I don't think this wastes
> that much memory. We have one unsigned int per pin, which even for very
> large GPIO controllers is unlikely to exceed one 4 KiB page.

for system with <128M of memory even 4k is a win.


> 
>> - DT binding changes not documented and no DT examples
> 
> That's because this is completely orthogonal to DT bindings. We can't
> make any changes to the bindings because of ABI stability.
> 
>> - below is ugly ;)
>> +	bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
>> +	pin = (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;
> 
> If by ugly you mean wrong, then yes, it's actually the wrong way around.
> It should be:
> 
> 	bank = (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
> 	line = (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;

 
Wrong yep. And No. What I do not like is encoding bank & line in the same field.
It creates some not clear DT standard bindings requirements as for me, comparing to the
current well known GPIO bindings 
 gpios = <&[controller] [line number in controller] [flags]>;
line number in controller ::= [0..max lines]

Actually, as per gpio.txt:
"Note that gpio-specifier length is controller dependent.  In the
above example, &gpio1 uses 2 cells to specify a gpio, while &gpio2
only uses one.", 
so, if this going to be part of gpiolib it should be
 described in bindings/gpio/gpio.txt (or some other documents), as
 above note will not be exactly correct and new "banked" gpio controllers
will be expected to use thin new binding.



-- 
regards,
-grygorii
