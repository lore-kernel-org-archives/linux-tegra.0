From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH 6/6] arm64: tegra: Enable XUSB host in P2972-0000 board
Date: Thu, 3 Oct 2019 14:00:32 +0800
Message-ID: <2b50ad58-e5da-2f93-0c18-f16843fe64ac@nvidia.com>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-7-jckuo@nvidia.com> <20191002102611.GH3716706@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002102611.GH3716706@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 10/2/19 6:26 PM, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 04:00:51PM +0800, JC Kuo wrote:
>> This commit enables XUSB host and pad controller in Tegra194
>> P2972-0000 board.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 31 +++++++++-
>>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 59 +++++++++++++++++++
>>  2 files changed, 89 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> index 4c38426a6969..cb236edc6a0d 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> @@ -229,7 +229,7 @@
>>  						regulator-max-microvolt = <3300000>;
>>  					};
>>  
>> -					ldo5 {
>> +					vdd_usb_3v3: ldo5 {
>>  						regulator-name = "VDD_USB_3V3";
>>  						regulator-min-microvolt = <3300000>;
>>  						regulator-max-microvolt = <3300000>;
>> @@ -313,5 +313,34 @@
>>  			regulator-boot-on;
>>  			enable-active-low;
>>  		};
>> +
>> +		vdd_5v_sata: regulator@4 {
>> +			compatible = "regulator-fixed";
>> +			reg = <4>;
>> +
>> +			regulator-name = "vdd-5v-sata";
> 
> Please keep capitalization of regulator names consistent. We use
> all-caps and underscores for the others (which mirrors the names in the
> schematics), so please stick with that for this one as well.
> 
Sure. I will fix this.
> Also, I'm wondering if perhaps you can clarify something here. My
> understanding is that SATA functionality is provided via a controller on
> the PCI bus. Why is it that we route the 5 V SATA power to the USB port?
> Oh wait... this is one of those eSATAp (hybrid) ports that can take
> either eSATA or USB, right? Do we need any additional setup to switch
> between eSATA and USB modes? Or is this all done in hardware? That is,
> if I plug in an eSATA, does it automatically hotplug detect the device
> as SATA and if I plug in a USB device, does it automatically detect it
> as USB?
> 
Yes, this 5V supply is for the eSATAp port. eSATA cable will deliver the 5V to
SATA device. No SATA/USB switch is required as USB SuperSpeed and PCIE-to-SATA
controller each has its own UPHY lane. SATA TX/RX pairs also have dedicated pins
at the eSATAp connector. External SATA drive can be hotplug and hardware will
detect automatically.

>> +			regulator-min-microvolt = <5000000>;
>> +			regulator-max-microvolt = <5000000>;
>> +			gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
> 
> This will actually cause a warning on boot. For fixed regulators the
> polarity of the enable GPIO is not specified in the GPIO specifier.
> Instead you're supposed to use the boolean enable-active-high property
> to specify if the enable GPIO is active-high. By default the enable GPIO
> is considered to be active-low. The GPIO specifier needs to have the
> GPIO_ACTIVE_HIGH flag set regardless for backwards-compatibilitiy
> reasons.
> 
> Note that regulator@3 above your new entry does this wrongly, but
> next-20191002 should have a fix for that.
> 
Thanks for the information. I will fix this in the next revision.
>> +		};
>> +	};
>> +
>> +	padctl@3520000 {
> 
> Don't forget to move this into /cbb as well to match the changes to
> patch 5/6.
> 
Sure, will do.
>> +		avdd-usb-supply = <&vdd_usb_3v3>;
>> +		vclamp-usb-supply = <&vdd_1v8ao>;
>> +		ports {
> 
> Blank line between the above two for better readability.
> 
Okay.
>> +			usb2-1 {
>> +				vbus-supply = <&vdd_5v0_sys>;
>> +			};
>> +			usb2-3 {
> 
> Same here and below.
> 
>> +				vbus-supply = <&vdd_5v_sata>;
>> +			};
>> +			usb3-0 {
>> +				vbus-supply = <&vdd_5v0_sys>;
>> +			};
>> +			usb3-3 {
>> +				vbus-supply = <&vdd_5v0_sys>;
>> +			};
>> +		};
>>  	};
>>  };
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> index d47cd8c4dd24..410221927dfa 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>> @@ -222,4 +222,63 @@
>>  			};
>>  		};
>>  	};
>> +
>> +	padctl@3520000 {
> 
> Same comment as above. Move this into /cbb.
> 
>> +		status = "okay";
>> +
>> +		pads {
>> +			usb2 {
>> +				lanes {
>> +					usb2-1 {
>> +						status = "okay";
>> +					};
>> +					usb2-2 {
> 
> And blank lines for readability here and below.
> 
>> +						status = "okay";
>> +					};
>> +					usb2-3 {
>> +						status = "okay";
>> +					};
>> +				};
>> +			};
>> +			usb3 {
>> +				lanes {
>> +					usb3-0 {
>> +						status = "okay";
>> +					};
>> +					usb3-3 {
>> +						status = "okay";
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		ports {
>> +			usb2-1 {
>> +				mode = "host";
>> +				status = "okay";
>> +			};
>> +			usb2-3 {
>> +				mode = "host";
>> +				status = "okay";
>> +			};
>> +			usb3-0 {
>> +				nvidia,usb2-companion = <1>;
>> +				status = "okay";
>> +			};
>> +			usb3-3 {
>> +				nvidia,usb2-companion = <3>;
>> +				nvidia,disable-gen2;
>> +				status = "okay";
>> +			};
>> +		};
>> +	};
>> +
>> +	tegra_xhci: xhci@3610000 {
> 
> Also needs to move into /cbb. Also, you can drop the tegra_xhci label
> here since we never reference the controller from elsewhere.
> 
> Also make sure to update the name here to match the changes in 5/6.
> 
Got it. Thanks for the reminder.
> Thierry
> 
>> +		status = "okay";
>> +		phys =	<&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
>> +			<&{/padctl@3520000/pads/usb2/lanes/usb2-3}>,
>> +			<&{/padctl@3520000/pads/usb3/lanes/usb3-0}>,
>> +			<&{/padctl@3520000/pads/usb3/lanes/usb3-3}>;
>> +		phy-names = "usb2-1", "usb2-3", "usb3-0", "usb3-3";
>> +	};
>>  };
>> -- 
>> 2.17.1
>>
