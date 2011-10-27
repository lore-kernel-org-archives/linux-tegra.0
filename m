From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/3] arm/dt: tegra: add dts file for paz00
Date: Thu, 27 Oct 2011 09:50:03 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B48D7@HQMAIL01.nvidia.com>
References: <cover.1319658296.git.marvin24@gmx.de>
 <e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Wednesday, October 26, 2011 1:59 PM:
> This adds a dts file for paz00. As a side effect, this also enables
> the embedded controller which controls the keyboard, touchpad, power,
> leds, and some other functions.
...
> +++ b/arch/arm/boot/dts/tegra-paz00.dts
> @@ -0,0 +1,70 @@
> +/dts-v1/;
> +
> +/memreserve/ 0x1c000000 0x04000000;
> +/include/ "tegra20.dtsi"
> +
> +/ {
> +	model = "Toshiba AC100 / Dynabook AZ";
> +	compatible = "compal,paz00", "nvidia,tegra20";
> +
> +	chosen {
> +		bootargs = "mem=448@0 console=ttyS0,115200n8 root=/dev/mmcblk1p1";

You shouldn't need the mem= parameter here; it wasn't in your first patch set.

> +	};
> +
> +	memory@0 {
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	i2c@7000c000 {
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000c400 {
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000c500 {
> +		status = "disable";
> +	};
> +
> +	nvec@7000c500 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,nvec";

I'm not convinced that's the correct compatible value, but I should
discuss this more in the nvec patch...

> +		reg = <0x7000C500 0x100>;
> +		interrupts = <124>;
> +		clock-frequency = <80000>;
> +		request-gpios = <&gpio 170 0>;
> +		slave-addr = <138>;
> +	};


> +++ b/arch/arm/mach-tegra/Makefile
> @@ -31,6 +31,7 @@ obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
> 
>  obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
>  obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
> +obj-$(CONFIG_MACH_TEGRA_DT)             += board-paz00-pinmux.o
>  obj-${CONFIG_MACH_TEGRA_DT}             += board-seaboard-pinmux.o

What branch is your patch based on? Those lines use braces not brackets
in the latest code (incorrect yes, but that's what's there; Olof said
he'll fix it for the next merge window). Do you have some local patches
in your branch before this patchset? Note: Feel free to add your lines
using the correct syntax; I'm just wondering about the existing context
in your patch.

-- 
nvpublic
