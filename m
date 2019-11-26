From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Tue, 26 Nov 2019 09:51:57 +0530
Message-ID: <0fd1f30c-5155-e1df-69b9-a49271b7cbce@nvidia.com>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-4-jckuo@nvidia.com> <20191009233900.GA9109@bogus>
 <20191014131752.GF422231@ulmo>
 <CAL_Jsq+aKxfAir3skanfqmM+nFFzXPFL4eMa-+pq1kH-90YTbg@mail.gmail.com>
 <57692050-8284-a31f-71fd-7441823f3f2b@nvidia.com>
 <20191017120128.GE3122066@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191017120128.GE3122066@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-tegra@vger.kernel.org, Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 17-10-2019 17:31, Thierry Reding wrote:
> On Thu, Oct 17, 2019 at 03:48:52PM +0800, JC Kuo wrote:
>> Hi Thierry, Hi Rob, Hi Kishon,
>> Please let me know your thoughts of the below implementation.
>>
>> 1. Add a "bool disable_gen2" to "phy->attrs" structure.
>> 2. In _of_phy_get() of phy-core.c to add the follow to parse a generic property.
>>
>> 	phy->attrs.disable_gen2 = of_property_read_bool(args.np,
>> 							"usb-disable-gen2");
> 
> Regarding this, I'm not sure how Rob imagined the generic properties to
> work. Perhaps he was thinking about something like the max-link-speed
> property found in the PCI bindings.
> 
> We could have something like this:
> 
>   - max-link-speed:
>       If present this property specifies the USB generation supported on
>       the PHY/port. Must be:
>         1: for USB 3.1 Gen 1 (a.k.a. USB 3.0)
>         2: for USB 3.1 Gen 2
> 
> I'm not sure if we need to consider anything prior to USB 3.0. I suppose
> we could do a similar mapping to what I proposed for the PHY ->set_mode
> callback:
> 
>   - max-link-speed:
>       If present this property specifies the USB generation supported on
>       the PHY/port. Must be:
>         0x0100: for USB 1.0 (Low-Speed)
>         0x0101: for USB 1.1 (Full-Speed)
>         0x0200: for USB 2.0 (Hi-Speed)
>         0x0300: for USB 3.0 (SuperSpeed) (a.k.a. USB 3.1 Gen 1)
>         0x0301: for USB 3.1 (SuperSpeed 10 Gbit/s) (a.k.a. USB 3.1 Gen 2)
>         0x0302: for USB 3.2 (SuperSpeed 20 Gbit/s) (a.k.a. USB 3.2 Gen 2 x 2)
>         ...
> 
> Or those could just be sequentially enumerated, like in the above
> example.
> 
> Rob, any thoughts?
> 
> Thierry
> 

"Documentation/devicetree/bindings/usb/generic.txt" file already has dt-property named
maximum-speed, which fulfills current requirement. So to disable gen2 feature simply
add below entry to corresponding usb3 port entry.
		padctl@3520000 {
			status = "okay";

			ports {
				usb3-3 {
					maximum-speed = "super-speed";
				};
		};

Read the property using API usb_get_maximum_speed.

Thanks,
Nagarjuna
>> 3. In individual phy driver, to add SOC/PHY specific programming accordingly.
>>
>> Thanks,
>> JC
>>
>> On 10/14/19 9:40 PM, Rob Herring wrote:
>>> On Mon, Oct 14, 2019 at 8:17 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>>
>>>> On Wed, Oct 09, 2019 at 06:39:00PM -0500, Rob Herring wrote:
>>>>> On Wed, Oct 09, 2019 at 10:43:41AM +0800, JC Kuo wrote:
>>>>>> Extend the bindings to cover the set of features found in Tegra194.
>>>>>> Note that, technically, there are four more supplies connected to the
>>>>>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
>>>>>> , but the power sequencing requirements of Tegra194 require these to be
>>>>>> under the control of the PMIC.
>>>>>>
>>>>>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
>>>>>> possible for some platforms have long signal trace that could not
>>>>>> provide sufficient electrical environment for Gen 2 speed. To deal with
>>>>>> this, a new device node property "nvidia,disable-gen2" was added to
>>>>>> Tegra194 that be used to specifically disable Gen 2 speed for a
>>>>>> particular USB 3.0 port so that the port can be limited to Gen 1 speed
>>>>>> and avoid the instability.
>>>>>
>>>>> I suspect this may be a common issue and we should have a common
>>>>> property. Typically, this kind of property is in the controller though
>>>>> and supports multiple speed limits. See PCI bindings for inspiration.
>>>>
>>>> Given that support for gen 2 speeds is dependent on signal trace length,
>>>> it doesn't really make sense to restrict the whole controller to a given
>>>> speed if only the signal trace for a single port exceeds the limit for
>>>> which gen 2 would work.
>>>>
>>>> Also, the USB PHYs are in a different hardware block than the USB
>>>> controller, so this really is a property of the PHY block, not the USB
>>>> controller.
>>>
>>> Okay, but still should be common for USB PHYs IMO.
>>>
>>> Rob
>>>
