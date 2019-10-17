From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Thu, 17 Oct 2019 15:48:52 +0800
Message-ID: <57692050-8284-a31f-71fd-7441823f3f2b@nvidia.com>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-4-jckuo@nvidia.com> <20191009233900.GA9109@bogus>
 <20191014131752.GF422231@ulmo>
 <CAL_Jsq+aKxfAir3skanfqmM+nFFzXPFL4eMa-+pq1kH-90YTbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+aKxfAir3skanfqmM+nFFzXPFL4eMa-+pq1kH-90YTbg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-tegra@vger.kernel.org, Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry, Hi Rob, Hi Kishon,
Please let me know your thoughts of the below implementation.

1. Add a "bool disable_gen2" to "phy->attrs" structure.
2. In _of_phy_get() of phy-core.c to add the follow to parse a generic property.

	phy->attrs.disable_gen2 = of_property_read_bool(args.np,
							"usb-disable-gen2");
3. In individual phy driver, to add SOC/PHY specific programming accordingly.

Thanks,
JC

On 10/14/19 9:40 PM, Rob Herring wrote:
> On Mon, Oct 14, 2019 at 8:17 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Wed, Oct 09, 2019 at 06:39:00PM -0500, Rob Herring wrote:
>>> On Wed, Oct 09, 2019 at 10:43:41AM +0800, JC Kuo wrote:
>>>> Extend the bindings to cover the set of features found in Tegra194.
>>>> Note that, technically, there are four more supplies connected to the
>>>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
>>>> , but the power sequencing requirements of Tegra194 require these to be
>>>> under the control of the PMIC.
>>>>
>>>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
>>>> possible for some platforms have long signal trace that could not
>>>> provide sufficient electrical environment for Gen 2 speed. To deal with
>>>> this, a new device node property "nvidia,disable-gen2" was added to
>>>> Tegra194 that be used to specifically disable Gen 2 speed for a
>>>> particular USB 3.0 port so that the port can be limited to Gen 1 speed
>>>> and avoid the instability.
>>>
>>> I suspect this may be a common issue and we should have a common
>>> property. Typically, this kind of property is in the controller though
>>> and supports multiple speed limits. See PCI bindings for inspiration.
>>
>> Given that support for gen 2 speeds is dependent on signal trace length,
>> it doesn't really make sense to restrict the whole controller to a given
>> speed if only the signal trace for a single port exceeds the limit for
>> which gen 2 would work.
>>
>> Also, the USB PHYs are in a different hardware block than the USB
>> controller, so this really is a property of the PHY block, not the USB
>> controller.
> 
> Okay, but still should be common for USB PHYs IMO.
> 
> Rob
> 
