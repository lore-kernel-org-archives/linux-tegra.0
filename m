From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Mon, 6 Jun 2016 17:52:14 -0400
Message-ID: <b28b44d9-7f3e-c1bb-7df8-238191ab1941@nvidia.com>
References: <1464985365-11612-1-git-send-email-rklein@nvidia.com>
 <57551AAD.2020805@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57551AAD.2020805@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 6/6/2016 2:39 AM, Laxman Dewangan wrote:
> 
> On Saturday 04 June 2016 01:52 AM, Rhyland Klein wrote:
>> +
>> +			max77620_default: pinmux@0 {
>> +				pin_gpio {
>> +					pins = "gpio0", "gpio1", "gpio2", "gpio5",
>> +					       "gpio6", "gpio7";
> gpio5 and gpio6 are already there in below nodes and hence it is not 
> needed here.

Yep thanks.

> 
>> +					function = "gpio";
>> +				};
>> +
>> +				/*
>> +				 * GPIO3 is used to en_pp3300, and it is part of power
>> +				 * sequence, So it must be sequenced up (automatically
>> +				 * set by OTP) and down properly.
>> +				 */
>> +				pin_gpio3 {
>> +					pins = "gpio3";
>> +					function = "fps-out";
>> +					drive-open-drain = <1>;
>> +					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
>> +					maxim,active-fps-power-up-slot = <4>;
>> +					maxim,active-fps-power-down-slot = <2>;
>> +				};
>> +
>> +				pin_gpio5_6_7 {
> node name should be gpio5_6 as there is no gpio7 inside this node.

Thanks.
> 
> 
>> +
>> +			regulators {
>> +				in-ldo0-1-supply = <&pp1350>;
>> +				in-ldo2-supply = <&pp3300>;
>> +				in-ldo3-5-supply = <&pp3300>;
>> +				in-ldo7-8-supply = <&pp1350>;
>> +
>> +				ppvar_soc: sd0 {
>> +					regulator-name = "PPVAR_SOC";
>> +					regulator-min-microvolt = <825000>;
>> +					regulator-max-microvolt = <1125000>;
>> +					regulator-enable-ramp-delay = <146>;
>> +					regulator-disable-ramp-delay = <4080>;
>> +					regulator-ramp-delay = <27500>;
>> +					regulator-ramp-delay-scale = <300>;
> 
> There is no disable-ramp-delay in mainline.
> Please use the correct value for property as:
>                                       regulator-ramp-delay = <9000>;
>                                       maxim,ramp-rate-setting = <27500>;
> 
> 
> instead of regulator-ramp-delay and regulator-ramp-delay-scale.
> The property differs from downstream.
> 
> regulator-ramp-delay is what you see in platform and 
> maxim,ramp-rate-setting is what you want in register.

Where does "<9000>" come from in the above comment? It looks like
maxim,ramp-rate-setting sets the slew rate, and regulator-ramp-delay
will as well, but will be ignored if maxim,ramp-delay-setting is set. So
does it ever make sense to have both defined for a regulator? And if
not, should max77620 regulators just use the maxim property and not the
regulator core property?

-rhyland

-- 
nvpublic
