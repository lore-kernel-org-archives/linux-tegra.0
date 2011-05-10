From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM: Tegra: Device Tree Support: Add i2c devices
Date: Tue, 10 May 2011 15:41:44 -0700
Message-ID: <4DC9BF28.8090902@secretlab.ca>
References: <20110510201108.22693.50319.stgit@riker> <20110510201430.22693.66151.stgit@riker> <74CDBE0F657A3D45AFBB94109FB122FF04986AA070@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA070-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org" <linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

My comments are inline below.

- John

On 05/10/2011 03:10 PM, Stephen Warren wrote:
> John Bonesio wrote at Tuesday, May 10, 2011 2:15 PM:
>> This patch initializes i2c controller devices in board-dt.c. The i2c
>> controller
>> is added to tegra250.dtsi so later on-board i2c devices can be found and
>> initialized based on the device tree information.
> 
>> diff --git a/arch/arm/boot/dts/tegra250.dtsi b/arch/arm/boot/dts/tegra250.dtsi
> 
>> +
>> +	i2c@7000C000 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "nvidia,tegra250-i2c";
>> +		reg = <0x7000C000 0x100>;
>> +		interrupts = < 70 >;
>> +	};
> 
> Could we add 'status = "disabled"' for all of these in the core Tegra SoC
> file. Then, the board-specific files (e.g. tegra-harmony.dts) will set
> 'status = "ok"' for just the particular controllers that are actually used
> by the board. The SDHCI controllers are setup this way now per my recent
> patches.

Good idea.

> 
>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> 
>> +static struct tegra_i2c_platform_data harmony_i2c1_platform_data = {
>> +	.bus_clk_rate   = 400000,
>> +};
> 
> Similar to my comments on the SDHCI patch, shouldn't the platform data
> come only from devicetree?
> 
>> +static void __init harmony_i2c_init(void)
> 
> It'd be nice not to name stuff in board-dt.c after "harmony", since the
> idea is for it to work on arbitrary boards given the appropriate
> devicetree.

Yep. I'll fix this in the next revision.

> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> 
> Since the driver and board files go to separate subsystems, shouldn't
> the changes to this file be a separate patch, to aid eventual
> upstreaming?

Maybe. Let's see what others think.

> 
> BTW, thanks for working on Tegra!
> 

:-)
