From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH 4/6] dt-bindings: phy: tegra: Add Tegra194 support
Date: Thu, 3 Oct 2019 09:50:42 +0800
Message-ID: <f0455be3-a73e-4abe-2031-425f9b936890@nvidia.com>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-5-jckuo@nvidia.com> <20191002094438.GD3716706@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002094438.GD3716706@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Thanks Thierry. I will fix the typo in the next revision.

On 10/2/19 5:44 PM, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 04:00:49PM +0800, JC Kuo wrote:
>> Extend the bindings to cover the set of features found in Tegra194.
>> Note that, technically, there are four more supplies connected to the
>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
>> , but the power sequencing requirements of Tegra194 require these to be
>> under the control of the PMIC.
>>
>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
>> possible for some platforms have long signal trace that could not
>> provide sufficient electrical environment for Gen 2 speed. To deal with
>> this, a new device node property "nvidia,disable-gen2" was added to
>> Tegra194 that be used to specifically disable Gen 2 speed for a
>> particular USB 3.0 port so that the port can be limited to Gen 1 speed
>> and avoid the instability.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> index 9fb682e47c29..3bef37e7c365 100644
>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> @@ -37,6 +37,7 @@ Required properties:
>>    - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
>>    - Tegra210: "nvidia,tegra210-xusb-padctl"
>>    - Tegra186: "nvidia,tegra186-xusb-padctl"
>> +  - Tegra194: "nvidia,tegra194-xusb-padctl"
>>  - reg: Physical base address and length of the controller's registers.
>>  - resets: Must contain an entry for each entry in reset-names.
>>  - reset-names: Must include the following entries:
>> @@ -62,6 +63,10 @@ For Tegra186:
>>  - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>>  - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
>>  
>> +For Tegra194:
>> +- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
>> +  3.3 V.
>> +- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>>  
>>  Pad nodes:
>>  ==========
>> @@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is given below:
>>  - sata: sata-0
>>    - functions: "usb3-ss", "sata"
>>  
>> +For Tegra194, the list of valid PHY nodes is given below:
>> +- usb2: usb2-0, usb2-1, usb2-2, usb2-3
>> +  - functions: "xusb"
>> +- usb3: usb3-0, usb3-1, usb3-2, usb3-3
>> +  - functions: "xusb"
>>  
>>  Port nodes:
>>  ===========
>> @@ -221,6 +231,9 @@ Optional properties:
>>    is internal. In the absence of this property the port is considered to be
>>    external.
>>  
>> +- nvidia,disable-gen2: A boolean property whose presence determines that a port
>> +  should be limited to USB 3.1 Gen 1. This properlty is only for Tegra194.
> 
> s/properlty/property/
> 
> With that:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
