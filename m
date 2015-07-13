From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CPUFreq support for Tegra124 Chromebooks
Date: Mon, 13 Jul 2015 14:08:24 +0100
Message-ID: <55A3B848.2080205@nvidia.com>
References: <1433331821-9648-1-git-send-email-jonathanh@nvidia.com> <556EE8B0.2060205@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556EE8B0.2060205-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/15 12:44, Jon Hunter wrote:
> Adding LAKML. Jon
> 
> On 03/06/15 12:43, Jon Hunter wrote:
>> Add the device-tree DFLL clock node and CPU regulator phandle for
>> tegra124 chromebooks to enable CPUFreq support on these boards.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> This has been tested on a tegra124 nyan-big by using the userspace
>> CPUFreq governor with a simple CPU benchmark to measure the time taken
>> for the test to execute.
>>
>> The tegra124 chromebooks use the same ams,as3722 PMIC as the Jetson TK1
>> board and hence, this change is based upon that for the Jetson TK1.
>>
>>  arch/arm/boot/dts/tegra124-nyan.dtsi | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
>> index a9aec23e06f2..40c23a0b7cfc 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
>> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
>> @@ -159,7 +159,7 @@
>>  				vin-ldo9-10-supply = <&vdd_5v0_sys>;
>>  				vin-ldo11-supply = <&vdd_3v3_run>;
>>  
>> -				sd0 {
>> +				vdd_cpu: sd0 {
>>  					regulator-name = "+VDD_CPU_AP";
>>  					regulator-min-microvolt = <700000>;
>>  					regulator-max-microvolt = <1350000>;
>> @@ -397,6 +397,13 @@
>>  		non-removable;
>>  	};
>>  
>> +	/* CPU DFLL clock */
>> +	clock@0,70110000 {
>> +		status = "okay";
>> +		vdd-cpu-supply = <&vdd_cpu>;
>> +		nvidia,i2c-fs-rate = <400000>;
>> +	};
>> +
>>  	ahub@0,70300000 {
>>  		i2s@0,70301100 {
>>  			status = "okay";
>> @@ -487,6 +494,12 @@
>>  		};
>>  	};
>>  
>> +	cpus {
>> +		cpu@0 {
>> +			vdd-cpu-supply = <&vdd_cpu>;
>> +		};
>> +	};
>> +
>>  	gpio-keys {
>>  		compatible = "gpio-keys";

Stephen, Thierry,

Are you ok with this change?

Jon
