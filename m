From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [Patch V2 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Fri, 20 Dec 2019 16:08:30 +0800
Message-ID: <fe47fd52-efd0-4f84-d1e4-4bce5571e425@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
 <20191219130503.GG1440537@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219130503.GG1440537@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/19/19 9:05 PM, Thierry Reding wrote:
> On Wed, Dec 18, 2019 at 02:46:14PM +0530, Nagarjuna Kristam wrote:
>> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
>> entry is used by XUSB pad controller driver to register for role changes
>> for OTG/Peripheral capable USB 2 ports.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>> V2:
>>  - Moved usb-role-switch to seperate Required section as suggested by Thierry.
>>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
>> ---
>>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> index 9fb682e..23bf354 100644
>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> @@ -174,6 +174,12 @@ Required properties:
>>    - "device": for USB device mode
>>    - "otg": for USB OTG mode
>>  
>> +Required properties for OTG/Peripheral capable USB2 ports:
>> +- usb-role-switch: Boolean property to indicate that the port support OTG or
> 
> "supports", and also, why if it supports OTG *or* peripheral? Doesn't
> OTG imply peripheral? OTG means it can be either peripheral or host,
> right? So I think the end of that sentence can be just:
> 
> 	"... the port supports OTG."
An USB OTG port is capable of both USB host and peripheral operations. An USB
peripheral port can only act as an USB peripheral.

The micro USB ports found on Jetson TX1/TX2 platforms are micro-AB ports which
should implement both host and peripheral capabilities. We say such ports
support OTG. The micro USB port found on Jetson Nano is a micro-B port which
should implement peripheral capability only. We say such ports support
peripheral, rather than OTG.

Thanks,
JC

> 
> Otherwise:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
