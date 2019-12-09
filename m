From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH 01/18] dt-bindings: phy: tegra-xusb: Add usb-role-switch
Date: Mon, 9 Dec 2019 10:15:29 +0530
Message-ID: <59527c41-7388-b6ae-f49e-0f8eb1407063@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
 <1575629421-7039-2-git-send-email-nkristam@nvidia.com>
 <20191206144905.GC2085684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191206144905.GC2085684@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



> On 06-12-2019 20:19, Thierry Reding wrote:
> 
> On Fri, Dec 06, 2019 at 04:20:04PM +0530, Nagarjuna Kristam wrote:
>> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
>> entry is used by XUSB pad controller driver to register for role changes
>> for OTG/Peripheral capable USB 2 ports.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> index 9fb682e..0f19ed6 100644
>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> @@ -179,6 +179,10 @@ Optional properties:
>>    is internal. In the absence of this property the port is considered to be
>>    external.
>>  - vbus-supply: phandle to a regulator supplying the VBUS voltage.
>> +- usb-role-switch: boolean property to indicate use of USB Role Switch.
> That first sentence here seems a bit useless and vague. It doesn't
> really convey anything other than the name already does. Perhaps
> something like:
> 
> 	Boolean property to indicate that the port support OTG. If
> 	present, the port supports switching between USB host and
> 	peripheral roles.
> 
Will update this accordingly.

>> +  This property is MUST for OTG,Peripheral capable USB 2 ports. Connector
> If this is mandatory, why not add it to the list of required properties?
> I guess since it's only mandatory for ports that support OTG, perhaps we
> could add a section "Required properties for OTG capable ports:" or
> something like that? Then you can also omit the second sentence in the
> description.
> 
Will add section "Required properties for OTG/Peripheral capable ports:" under ports
and add usb-role-switch there.

>> +  should be added as subnode, see connector.txt. vbus-gpio in connector is
> There's no file called "connector.txt". Are you referring to
> 
> 	Documentation/devicetree/bindings/connector/usb-connector.txt
> 
> ? Also, that file calls the property "vbus-gpios" and lists it as
> optional. What would happen if we don't specify it? Doesn't that just
> mean that we can't support role detection?
> 
After going through other bindings found usb/usb-conn-gpio.txt is the one that should
be referred. Will update accordingly. All details on gpios are documented clearly
in usb/usb-conn-gpio.txt.

>> +  Mandatory.
> "mandatory"
> 
> Thierry
> 
>>  
Will update.

Thanks,
Nagarjuna
>>  ULPI ports:
>>  -----------
>> -- 
>> 2.7.4
>>
