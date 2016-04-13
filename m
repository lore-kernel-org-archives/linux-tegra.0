From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Wed, 13 Apr 2016 14:38:28 +0530
Message-ID: <570E0C8C.4070600@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-7-git-send-email-ldewangan@nvidia.com> <570E0BAE.8090404@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570E0BAE.8090404-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Wednesday 13 April 2016 02:34 PM, Jon Hunter wrote:
> On 12/04/16 15:56, Laxman Dewangan wrote:
>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>> or 3.3V I/O voltage levels. Also IO pads can be configured for
>> power down state if it is not in used. SW needs to configure the
>> voltage level of IO pads based on IO rail voltage and its power
>> state based on platform usage.
>>
>> Add DT binding document for detailing the DT properties for
>> configuring IO pads voltage levels and its power state.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../bindings/pinctrl/nvidia,tegra210-io-pad.txt    | 102 +++++++++++++++++++++
>>   .../dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h  |  24 +++++
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
>>   create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
>> new file mode 100644
>> index 0000000..97cdd4f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
>> @@ -0,0 +1,102 @@
>> +NVIDIA Tegra210 PMC IO pad controller
>> +
>> +NVIDIA Tegra210 supports IO pads which can operate at 1.8V or 3.3V I/O
>> +power rail voltages. SW needs to configure the voltage level of IO pads
>> +based on platform specific power tree.
>> +
>> +The voltage configurations of IO pads should be done in boot if it is not
>> +going to change other wise dynamically based on IO rail voltage on that
>> +IO pads.
>> +
>> +The node for the Tegra210 io-pad driver must be sub node of pmc@0,7000e400.
> This should be 'pmc@7000e400'. We were incorrectly adding the '0,'
> previously.

For T210, 64 bit, it is
  tegra210.dtsi:    pmc: pmc@0,7000e400 {

For T124, it is

pmc@7000e400



>
>> +
>> +Required properties:
>> +- compatible: "nvidia,tegra210-io-pad"
> I think you have have "Must be ..." here. I am also wondering if the
> pinctrl device should be registered by the pmc driver and so not a
> separate driver to the PMC driver. In other words, the PMC driver calls
> pinctrl_register() directly.

I like to keep the pmc driver as main interface and other sub 
functionalities like pad control for voltage and power states, no 
iopower control etc as sub drivers. This will help in modular approach 
of the driver.


>
>> +The voltage supported on the pads are 1.8V and 3.3V. The enums are defined as:
>> +	For 1.8V, use TEGRA210_IO_RAIL_1800000UV
>> +	For 3.3V, use TEGRA210_IO_RAIL_3300000UV
> You may consider just using integer values here like we do for regulators.

We just support two values 1.8V and 3.3V only. I am fine with either way 
also.

>
>> +				  TEGRA210_IO_PAD_DEEP_POWER_DOWN_DISABLE for
>> +					disable.
>> +				  TEGRA210_IO_PAD_DEEP_POWER_DOWN_ENABLE for
>> +					enable.
> Sounds like a boolean parameter. So may consider that if the property
> 'nvidia,io-pad-deep-power-down' is present then it means enable
> deep-power-down and if not present then don't. Then you do not need to
> assign a value to it.

Three states, enable, disable and left default. So absent will be left 
default.
