From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Tue, 20 Oct 2015 09:56:12 -0600
Message-ID: <5626641C.8040009@wwwdotorg.org>
References: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
 <5626130A.5090604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5626130A.5090604@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 10/20/2015 04:10 AM, Jon Hunter wrote:
>
> On 20/10/15 00:30, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Convert the binding to provide a PHY per lane, rather than a PHY per
>> "pad" block in the hardware. This will allow the driver to easily know
>> which lanes are used by clients, and thus only enable those lanes, and
>> generally better aligns with the fact the hardware has configuration per
>> lane rather than solely configuration per "pad" block.
>>
>> Add entries to pinctrl-tegra-xusb.h to enumerate all "pad" blocks on
>> Tegra210, which will allow an XUSB DT node to reference the PHYs it needs.
>>
>> Add an nvidia,ss-port-map register to allow configuration of the
>> XUSB_PADCTL_SS_PORT_MAP register.

>> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt

>> +The Tegra XUSB pad controller manages a set of "pads". Each pad drives output
>> +to (or receives input from) one or more SoC IO signals, or (pad) lanes. Note
>> +that in many contexts, a "pad" is an individual pin/signal/ball on a chip
>> +package. In the context of this documentation, a "pad" refers to a sub-block
>> +of the XUSB padctl HW module, which in turn is attached to potentially more
>> +than one pin/signal/ball on the chip. This unusual use of terminology is
>> +consistent with Tegra hardware documentation.
>
> Ugh, you are right I see things like "7-lane pad" in the documentation.
> In my mind pad has always been one physical ball and lane came from pcie
> for a differential pair.

Yes, so the "7-lane pad" probably has something like 28 physical 
pads/pins/balls ignoring any power/ground/...

>>   Board file extract:
>>   -------------------
>>
>>   	pcie-controller@0,01003000 {
>> -		...
>> -
>> -		phys = <&padctl 0>;
>> -		phy-names = "pcie";
>> +		status = "okay";
>> +
>> +		pci@1,0 {
>> +			status = "okay";
>> +			nvidia,num-lanes = <4>;
>> +			phys = <&padctl TEGRA_XUSB_PADCTL_PCIE 1>,
>> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 2>,
>> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 3>,
>> +			       <&padctl TEGRA_XUSB_PADCTL_PCIE 4>;
>> +			/* These are the lane IDs within this PCIe port */
>> +			phy-names = "0", "1", "2", "3";
>
> Looks good. So the above simply indicates what pad lane is used, but the
> actual pin mux is still setup by the default pin mux below?

Yes.

> Would the xlate verify the pad lane is setup correctly?

I don't think so. of_xlate() doesn't have any context such as what type 
of driver is parsing the DT or for what purpose, so it couldn't validate 
that the pinctrl settings for that node had actually assigned the 
correct option to the mux register for that lane.

>> +	padctl@0,7009f000 {
>> +		status = "okay";
>>
>> -	padctl: padctl@0,7009f000 {
>>   		pinctrl-0 = <&padctl_default>;
>>   		pinctrl-names = "default";
>>
>>   		padctl_default: pinmux {
>> +			xusb {
>> +				nvidia,lanes = "otg-1", "otg-2";
>> +				nvidia,function = "xusb";
>> +			};
>> +
>>   			usb3 {
>> -				nvidia,lanes = "pcie-0", "pcie-1";
>> +				nvidia,lanes = "pcie-5", "pcie-6";
>>   				nvidia,function = "usb3";
>> -				nvidia,iddq = <0>;
>>   			};
>>
>> -			pcie {
>> -				nvidia,lanes = "pcie-2", "pcie-3",
>> -					       "pcie-4";
>> -				nvidia,function = "pcie";
>> -				nvidia,iddq = <0>;
>> +			pcie-x1 {
>> +				nvidia,lanes = "pcie-0";
>> +				nvidia,function = "pcie-x1";
>> +			};
>> +
>> +			pcie-x4 {
>> +				nvidia,lanes = "pcie-1", "pcie-2",
>> +					       "pcie-3", "pcie-4";
>> +				nvidia,function = "pcie-x4";
>
> It is worth having a separate example for t210 versus changing the above
> because it is still valid for t124.

Perhaps I should just modify the example rather than pasting a new 
version over the top. I did a paste since I already had the DT content, 
but IIRC the only change I really need to make here is to delete the 
nvidia,iddq properties.

>> diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h

>> -#define TEGRA_XUSB_PADCTL_PCIE 0
>> -#define TEGRA_XUSB_PADCTL_SATA 1
>> +/*
>> + * These legacy specifiers represent a client that uses an unspecified subset
>> + * of the lanes within a particular "pad". Drivers that handle these
>> + * specifiers should enable all lanes of the pad.
>> + */
>> +#define TEGRA_XUSB_PADCTL_PCIE_LEGACY	0
>> +#define TEGRA_XUSB_PADCTL_SATA_LEGACY	1
>
> Do you know if the pcie and sata drivers for tegra actually use the
> "phys" and "phy-names" properties? I had a quick grep for "phy_get" and
> "phy-names" in the pcie and ata drivers but did not see any usage for
> tegra. I am wondering if tegra124 is really just relying on the default
> pin-mux as opposed to the phy properties. If so may be we could get rid
> of the above and update the binding without breaking anything?

In drivers/pci/host/pci-tegra.c tegra_pcie_get_resources() I see a call 
to devm_phy_optional_get().

The SATA driver doesn't seem to do anything with phys at the moment, 
although tegra124.dtsi does put phy-related properties into the SATA DT 
node.

So, we can either:
a) Just ignore DT ABI for these cases claiming the DT binding is not yet 
declared stable.

b) Continue to support those specifier values for ABI reasons, which 
needs the "_LEGACY" values shown above.

(a) is certainly simpler.
