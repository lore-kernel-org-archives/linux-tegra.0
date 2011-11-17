From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Thu, 17 Nov 2011 09:44:15 -0600
Message-ID: <4EC52BCF.7020609@gmail.com>
References: <1321542430-17971-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321542430-17971-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/17/2011 09:07 AM, Peter De Schrijver wrote:
> Convert tegra20 IRQ intialization to the GIC devicetree binding. Modify the
> interrupt definitions in the dts files according to
> Documentation/devicetree/bindings/arm/gic.txt
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

One minor comment below, but otherwise:

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

> ---
>  arch/arm/boot/dts/tegra-paz00.dts |    2 +-
>  arch/arm/boot/dts/tegra20.dtsi    |   52 ++++++++++++++++++------------------
>  arch/arm/mach-tegra/irq.c         |   18 +++++++++++-
>  3 files changed, 43 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
> index 15a949f..7ff8f6f 100644
> --- a/arch/arm/boot/dts/tegra-paz00.dts
> +++ b/arch/arm/boot/dts/tegra-paz00.dts
> @@ -32,7 +32,7 @@
>  		#size-cells = <0>;
>  		compatible = "nvidia,nvec";
>  		reg = <0x7000C500 0x100>;
> -		interrupts = <124>;
> +		interrupts = <0 92 0x04>;
>  		clock-frequency = <80000>;
>  		request-gpios = <&gpio 170 0>;
>  		slave-addr = <138>;
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 795b921..cd01b01 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -5,9 +5,9 @@
>  	interrupt-parent = <&intc>;
>  
>  	intc: interrupt-controller@50041000 {
> -		compatible = "nvidia,tegra20-gic";
> +		compatible = "arm,cortex-a9-gic";
>  		interrupt-controller;

You should add an "interrupt-parent;" here so the gic's parent is null
and not the gic.

Rob
> -		#interrupt-cells = <1>;
> +		#interrupt-cells = <3>;
>  		reg = < 0x50041000 0x1000 >,
>  		      < 0x50040100 0x0100 >;
>  	};
