From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] arm/dt: tegra: add dts file for paz00
Date: Mon, 24 Oct 2011 22:16:15 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4189@HQMAIL01.nvidia.com>
References: <cover.1319313019.git.marvin24@gmx.de>
 <90ee88bcde84141e0280ffa4ccbd288462489eba.1319313020.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90ee88bcde84141e0280ffa4ccbd288462489eba.1319313020.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Saturday, October 22, 2011 2:17 PM:
> * NOT FOR COMMIT *
> 
> This just adds the dts for paz00. I like to add it to board-dt as
> well as soon as I find out which tree to base it on.
...
> +++ b/arch/arm/boot/dts/tegra-paz00.dts

One thing that cross my mind when writing the TrimSlice support and I
forgot to mention: Should these files be named ${soc}-${board}.dts or
${vendor}-${board}.dts (tegra-paz00.dts or toshiba-paz00.dts or
compal-paz00.dts). I'm OK either way; just want to follow any outside
expectations.

> @@ -0,0 +1,51 @@
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
> +		bootargs = "console=ttyS0,115200n8 root=/dev/mmcblk1p1";
> +	};
> +
> +	memory@0 {

The other boards just have "memory" here; which is wrong?

...
> +	i2c@7000c500 {
> +		clock-frequency = <80000>;

That's a pretty odd I2C frequency...

-- 
nvpublic
