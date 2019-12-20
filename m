From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [Patch V2 00/18] Tegra XUSB OTG support
Date: Fri, 20 Dec 2019 15:35:14 +0800
Message-ID: <5212a532-1366-ff4f-e9c2-94b04e23eefd@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <20191219131349.GI1440537@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219131349.GI1440537@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 12/19/19 9:13 PM, Thierry Reding wrote:
> On Wed, Dec 18, 2019 at 02:46:13PM +0530, Nagarjuna Kristam wrote:
>> This patch series adds OTG support on XUSB hardware used in Tegra210 and
>> Tegra186 SoCs.
>>
>> This patchset is composed with :
>>  - dt bindings of XUSB Pad Controller
>>  - dt bindings for XUSB device Driver
>>  - Tegra PHY driver for usb-role-switch and usb-phy
>>  - Tegra XUSB host mode driver to support OTG mode
>>  - Tegra XUSB device mode driver to use usb-phy and multi device mode
>>  - dts for XUSB pad controller
>>  - dts for xudc
>>
>> Tegra Pad controller driver register for role switch updates for
>> OTG/peripheral capable USB ports and adds usb-phy for that corresponding
>> USB ports.
>>
>> Host and Device mode drivers gets usb-phy from USB2's phy and registers
>> notifier for role changes to perform corresponding role tasks.
>>
>> Tests done:
>>  - device mode support using micro-B USB cable connection between ubuntu
>>    host and DUT on micro-B port
It's a micro-AB port according to Micro USB specifications.

>>  - host mode support by connecting pen-drive to micro USB port on DUT
>>    using micro-B OTG cable.
It's a standard-A to micro-A converter.

>>  - toggling between these 2 modes by hot plugging corresponding cables.
> 
> Are there any tests we can run without manual intervention? Can we force
> the device into peripheral mode and then setup a configuration using
> configfs? I'm not sure how useful that would be since it doesn't really
> exercise the driver code very much and doesn't tell whether it's
> actually working.
> 
> Any other way how we can test this?
> 
I don't think there is a way to test role-swap and host/device driver without
swapping cables. Thanks.

> Thierry
> 
>>
>> DUT: Jetson-tx1, Jetson tx2.
>>
>> V2:
>>  - Updated usb-role-switch documentation for Padctl driver.
>>  - Update XUDC bindings doc as suggested by Rob.
>>  - Used standard error codes for error return.
>>  - Added of_platform_depopulate during error and driver removal.
>>  - Updated error variable during phy initialization in XUDC driver.
>>  - Updated Tegra210 soc dtb file as per changes to binding doc.
>>
>> Nagarjuna Kristam (18):
>>   dt-bindings: phy: tegra-xusb: Add usb-role-switch
>>   dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
>>   phy: tegra: xusb: Add usb-role-switch support
>>   phy: tegra: xusb: Add usb-phy support
>>   phy: tegra: xusb: Add support to get companion USB 3 port
>>   phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
>>   phy: tegra: xusb: Add set_mode support for utmi phy on Tegra186
>>   usb: xhci-tegra: Add OTG support
>>   usb: gadget: tegra-xudc: Remove usb-role-switch support
>>   usb: gadget: tegra-xudc: Add usb-phy support
>>   usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
>>   usb: gadget: tegra-xudc: support multiple device modes
>>   arm64: tegra: update OTG port entries for jetson-tx1
>>   arm64: tegra: update OTG port entries for jetson-tx2
>>   arm64: tegra: Add xudc node for Tegra210
>>   arm64: tegra: Enable xudc on Jetson TX1
>>   arm64: tegra: Add xudc node for Tegra186
>>   arm64: tegra: Enable xudc node on Jetson TX2
>>
>>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   6 +
>>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 ++++++++++++++
>>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  23 +-
>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  19 ++
>>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  34 ++-
>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 ++
>>  drivers/phy/tegra/Kconfig                          |   1 +
>>  drivers/phy/tegra/xusb-tegra186.c                  | 109 ++++++--
>>  drivers/phy/tegra/xusb-tegra210.c                  | 126 ++++++++--
>>  drivers/phy/tegra/xusb.c                           | 134 ++++++++++
>>  drivers/phy/tegra/xusb.h                           |   5 +
>>  drivers/usb/gadget/udc/tegra-xudc.c                | 276 ++++++++++++++-------
>>  drivers/usb/host/xhci-tegra.c                      | 225 ++++++++++++++++-
>>  include/linux/phy/tegra/xusb.h                     |   2 +
>>  14 files changed, 1031 insertions(+), 138 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
>>
>> -- 
>> 2.7.4
>>
