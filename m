From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 07/12] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Wed, 10 Apr 2013 17:05:00 -0600
Message-ID: <5165F01C.70703@wwwdotorg.org>
References: <1365000318-28256-1-git-send-email-thierry.reding@avionic-design.de>
 <1365000318-28256-8-git-send-email-thierry.reding@avionic-design.de>
 <515DF096.2000703@wwwdotorg.org>
 <20130405073703.GB15848@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130405073703.GB15848-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/05/2013 01:37 AM, Thierry Reding wrote:
> On Thu, Apr 04, 2013 at 03:28:54PM -0600, Stephen Warren wrote: 
> [...]
>>> diff --git
>>> a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>>> b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>>
>>>
>>> 
+Required properties:
>> 
>>> +- interrupts: the interrupt outputs of the controller +-
>>> interrupt-names: list of names to identify interrupts
>> 
>> The specification part of this file should define which
>> interrupt outputs must be included in this list, and the order
>> they must appear in the list.
...
>> I believe that the entries in the interrupts property must have a
>> defined order, so I'm not sure whether interrupt-names is useful 
>> here?
> 
> Actually the interrupt-names property is there specifically so that
> the order doesn't matter. The driver uses
> platform_get_irq_byname(), using "intr" and "msi" respectively so
> that they don't have to appear in a specific order. I did this so
> that it is more in line with properties such as clocks and reg.

I believe that reg and interrupts must be possible to interpret
without resorting to reg-names and interrupt-names. In other words,
one must always define a specific order for those properties, and the
-names properties must follow that order. This is different than some
newer bindings where the order is arbitrary and based on whatever
random order the entries appear in *-names.

Given that, I'm not actually convinced that reg-names or
interrupt-names actually make any sense...

For background, see:
http://www.spinics.net/lists/linux-samsung-soc/msg16704.html

>>> +- ranges: describes the translation of addresses for root
>>> ports
>> 
>> Shouldn't there be some discussion re: how the range are expected
>> to be set up so that everything works? We shouldn't expect people
>> to just blindly copy the example without any way of understanding
>> it.
> 
> Possibly. I wouldn't like to go too much into the details, though,
> since the ranges property is not only rather complex but also well
> documented in other places.

The complexity is exactly why this needs to be fully documented. It's
very important to document not only what needs to be there, but also
the rationale behind the choice of exactly what and how to represent
in ranges. This is necessary so that (a) everyone who participated in
the discussion of that ranges definition can ensure that the final
result and rationale is what was expected (b) if somebody else extends
the binding for a new Tegra SoC in the future, they will have enough
information to fully respect the rationale behind the existing binding.

Is ranges really well-documented elsewhere? The raw property certainly
is (although a link would be useful), but I'm not convinced that the
concept of what each cell in the PCIe controller's own internal
address space means actually is documented. Otherwise, why would there
have been such a discussion on this topic?

> But I could add some explanation about which entries are expected
> and how they work together. In this case even order is important.
> The port register entries need to be listed before the 
> non-prefetchable memory window entry, otherwise the ranges parser
> gets confused. How does the following sound?
> 
> - ranges: Describes the translation of addresses for root ports and
> standard PCI regions. The entries must be 6 cells each, where the
> first three cells correspond to the address as described for the
> #address-cells property above, the fourth cell is the physical CPU
> address to translate to and the fifth and six cells are as
> described for the #size-cells property above. - The first two
> entries are expected to translate the addresses for the root port
> registers, which are referenced by the assigned-addresses property
> of the root port nodes (see below). - The remaining entries setup
> the mapping for the standard I/O, memory and

s/setup/set up/

> prefetchable PCI regions. The first cell determines the type of
> region

I assume this definition of "the first cell determines ..." only
applies to these remaining entries, and not the first two entries.
Perhaps prefix that sentence with "For these entries, "?

> that is setup: - 0x81000000: I/O memory region - 0x82000000:
> non-prefetchable memory region - 0xc2000000: prefetchable memory
> region Please refer to the standard PCI bus binding document for a
> more detailed explanation.

That looks OK, yes.


>>> +- clocks: the clock inputs of the controller +- clock-names:
>>> list of names to identify clocks
>> 
>> The specification part of this file should define which clocks
>> are required, and not rely on the example below to do this. I
>> would suggest re-writing this as:
>> 
>> - clocks : Must contain an entry for each entry in clock-names. -
>> clock-names : Must include the following entries: "pex" (The
>> Tegra clock of that name) "afi" (The Tegra clock of that name) 
>> "pcie_xclk" (The Tegra clock of that name) "pll_e" (The Tegra
>> clock of that name)
> 
> Okay, sounds good. Although the Tegra clocks are named somewhat 
> differently.

Hmm. That's true. Perhaps replace "(The Tegra clock of that name)"
with some more logical-level description of what those clocks are used
for by the module.

> "pex" is named "pcie" and "pcie_xclk" is "unassigned" (!) according
> to the nvidia,tegra20-car.txt binding document. Perhaps I should
> update the binding document to replace unassigned with pcie_xclk 
> for clock 74.

The CAR binding shouldn't change for now at least. The clock IDs there
were chosen to match /both/ the CAR clock enable registers /and/ the
CAR module reset registers. Where there isn't an exact 1:1
correspondance between those two sets of registers, that clock ID was
not used, and instead a clock ID >96 was chosen. This was done to
hightlight the lack of 1:1 correspondence. See the explanatory text
before the list, in the CAR binding document.

> And maybe rename pex in the PCIe binding to pcie to match the CAR
> binding?

The PCIe binding should really name its resources based on what makes
sense for the PCIe HW in isolation. pex is probably fine here,
especially if it happens to match some PCIe signal.

>>> +Board DTS: + +	pcie-controller { +		status = "okay"; + +
>>> vdd-supply = <&pci_vdd_reg>; +		pex-clk-supply =
>>> <&pci_clk_reg>; + +		/* root port 00:01.0 */ +		pci@1,0 { +
>>> status = "okay";
>> 
>> Is it worth putting a comment here stating that the explicit
>> devices included below in this example are entirely optional?
> 
> Would it be acceptable to annotate the 01:00.0 bridge with
> "optional"? Like so:
> 
> pcie-controller { ... pci@1,0 { ... /* bridge 01:00.0 (optional)
> */ pci@0,0 {

Yes, that'd be fine.

> Alternatively I could add something like below:
> 
> ---snip---
> 
> Note that devices on the PCI bus are dynamically discovered using
> PCI's bus enumeration and therefore don't need corresponding device
> nodes in DT. However if a device on the PCI bus provides a
> non-probeable bus such as I2C or SPI, device nodes need to be added
> in order to allow the bus' children to be instantiated at the
> proper location in the operating system's device tree (as 
> illustrated by the optional nodes in the example above).
> 
> ---snip---
> 
> Maybe I'll just do both.

Yes, that explanatory text is very useful & good.
