From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] ARM: tegra: add DT binding for Tegra186 GPIO
 controllers
Date: Thu, 14 Apr 2016 09:16:41 -0600
Message-ID: <570FB459.8090802@wwwdotorg.org>
References: <1460483197-5130-1-git-send-email-swarren@wwwdotorg.org>
 <CACRpkdYmcEQBN5QwjLa-Wyorv-otPdJh5C1KgKwUjUBWXvnb_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYmcEQBN5QwjLa-Wyorv-otPdJh5C1KgKwUjUBWXvnb_w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 04/14/2016 06:42 AM, Linus Walleij wrote:
> On Tue, Apr 12, 2016 at 7:46 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Tegra186 contains two separate but mostly similar GPIO controllers.
>> Register layout differs significantly from previous Tegra generations, and
>> so a new binding is required to describe them in device tree. This patch
>> adds that binding.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>> v2: Increase indentation to make lists more readable.
>
> Very interesting patch!
>
>> +a) Security registers, which allow configuration of allowed access to the GPIO
>> +register set. These registers exist in a single contguous block of physical
>
> ^ speling: contiguous?
>
>> +Tegra HW documentation describes a unified naming convention for all GPIOs
>> +implemented by the SoC. Each GPIO is assigned to a port, and a port may control
>> +a number of GPIOs. Thus, each GPIO is named according to an alphabetical port
>> +name and an integer GPIO name within the port. For example, GPIO_PA0, GPIO_PN6,
>> +or GPIO_PCC3.
>
> I suspect that the Tegra definition of a "port" is close to what other people
> call a "bank" like I try to define in this patch?
> http://marc.info/?l=linux-gpio&m=145941547420164&w=2

There are similarities, but the concepts are quite different. In that 
thread, the term "bank" actually refers to an instance of a standalone 
HW IP block. Here, "port" is definitely something internal to a single 
HW block.

>> +The mapping from port name to the GPIO controller that implements that port, and
>> +the mapping from port name to register offset within a controller, are both
>> +extremely non-linear.
>
> That actually warrants the concept of gpio-bank = <n>;

The DT node itself represents a HW block that contains a set of ports. 
There's no DT node per port, just one per GPIO controller. There's no 
concept of numbered ID for the two GPIO controllers on Tegra, so I don't 
think gpio-bank is appropriate.

>> + The header file <dt-bindings/gpio/tegra186-gpio.h>
>> +describes the port-level mapping. In that file, the naming convention for ports
>> +matches the HW documentation. The values chosen for the names are alphabetically
>> +sorted within a particular controller. Drivers need to map between the DT GPIO
>> +IDs and HW register offsets using a lookup table.
>
> Again that use case. Can you please enter the mentioned thread
> and provide some input on how you see this working?

I don't believe that thread applies to the Tegra GPIO controller.

> Neil Armstrong provided a driver using the GPIO ranges for
> cross-reference to the pin controller as the basis for finding
> what is here the port ID. I don't know if that is such a great
> idea.
>
> I noticed that the #defines in that tegra186-gpio.h file are not used
> in the example below. Something seems wrong: this mapping must
> be important. I don't see which of the required properties it should go
> into either.

The defines would be used to calculate the GPIO ID cell of the GPIO 
specifier in DT. They work in exactly the same way as other headers in 
include/dt-bindings/gpio, in particular tegra-gpio.h is very similar in 
structure.

At present, there is no upstream-targeted Linux driver for this HW, and 
the upstream DT has not been written. I'm working on a U-Boot driver, so 
need the binding defined for that. You can find the U-Boot driver in 
this commit list:

https://github.com/swarren/u-boot/commits/tegra_dev

Search for "gpio: add Tegra186 GPIO driver". I don't want to link to a 
specific commit hash since that's my local development branch and it 
gets rebased all the time. The most relevant parts are likely 
tegra186_gpio_main_ports[], tegra186_gpio_aon_ports[], and 
tegra186_gpio_ids[]. I'd expect those tables to appear almost 
identically in any Linux driver.

>> +Each GPIO controller in fact generates multiple interrupts signals for each set
>> +of ports. Each GPIO may be configured to feed into a specific one of the
>> +interrupt signals generated by a set-of-ports. The intent is for each generated
>> +signal to be routed to a different CPU, thus allowing different CPUs to each
>> +handle subsets of the interrupts within a port.
>
> Clever. Seems like something other hardware engineers should pick
> up on.
>
>> +/* GPIOs implemented by main GPIO controller */
>> +#define TEGRA_MAIN_GPIO_PORT_A 0
...
>> +#define TEGRA_AON_GPIO(port, offset) \
>> +       ((TEGRA_AON_GPIO_PORT_##port * 8) + offset)
>
> So we definately need this stuff used in the example.

Hmm. I really hope not. That would prevent getting DT bindings defined 
early on for the HW, before drivers and DT are written for a platform. 
Any existing Tegra DT file is a good example though; the structure of 
this binding is essentially identical to the previous Tegra GPIO 
controller binding. The only thing different is the exact values that go 
into the properties, and the non-linear mapping of GPIO IDs.
