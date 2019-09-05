From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V8 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date: Thu, 5 Sep 2019 10:02:16 +0530
Message-ID: <cac7603a-ba64-5ce1-edd9-43bdad729f61@nvidia.com>
References: <1567585440-13751-1-git-send-email-nkristam@nvidia.com>
 <1567585440-13751-7-git-send-email-nkristam@nvidia.com>
 <1567590435.7317.55.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567590435.7317.55.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 04-09-2019 15:17, Chunfeng Yun wrote:
> On Wed, 2019-09-04 at 13:53 +0530, Nagarjuna Kristam wrote:
>> Enable XUSB device mode driver for USB0 slot on Jetson TX1.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Reviewed-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 31 +++++++++++++++++++++++++-
>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> index a7dc319..6aba1ba 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> @@ -1362,7 +1362,7 @@
>>  				status = "okay";
>>  
>>  				lanes {
>> -					usb2-0 {
>> +					micro_b: usb2-0 {
>>  						nvidia,function = "xusb";
>>  						status = "okay";
>>  					};
>> @@ -1483,6 +1483,21 @@
>>  		vmmc-supply = <&vdd_3v3_sd>;
>>  	};
>>  
>> +	usb@700d0000 {
>> +		status = "okay";
>> +		phys = <&micro_b>;
>> +		phy-names = "usb2";
>> +		avddio-usb-supply = <&vdd_3v3_sys>;
>> +		hvdd-usb-supply = <&vdd_1v8>;
>> +		usb-role-switch;
>> +
>> +		port {
>> +			usb_role_switch: endpoint {
>> +				remote-endpoint = <&usb_b_conn_ep>;
>> +			};
>> +		};
>> +	};
>> +
>>  	regulators {
>>  		compatible = "simple-bus";
>>  		#address-cells = <1>;
>> @@ -1641,4 +1656,18 @@
>>  			linux,code = <KEY_VOLUMEUP>;
>>  		};
>>  	};
>> +
>> +	usb_type_b: connector {
>> +		compatible = "linux,usb-conn-gpio", "gpio-usb-b-connector";
> please use "gpio-usb-b-connector" and "usb-b-connector", due to
> "linux,usb-conn-gpio" is not supported now
> 
> 

Thanks for info, will update accordingly.

>> +		label = "micro-USB";
>> +		type = "micro";
>> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
>> +
>> +		port {
>> +			usb_b_conn_ep: endpoint {
>> +				remote-endpoint = <&usb_role_switch>;
>> +			};
>> +		};
>> +	};
>> +
>>  };
> 
> 
