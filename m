From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ARM: tegra: update device trees for USB binding
 rework
Date: Mon, 13 May 2013 11:29:55 -0600
Message-ID: <51912313.1080805@wwwdotorg.org>
References: <1368194051-4925-1-git-send-email-vbyravarasu@nvidia.com> <1368194051-4925-4-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368194051-4925-4-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2013 07:54 AM, Venu Byravarasu wrote:
> This patch updates all Tegra board files so that they contain all the
> properties required by the updated USB DT binding. Note that this patch
> only adds the new properties and does not yet remove the old properties,
> in order to maintain bisectability. The old properties will be removed
> once the driver has been updated to assume the new bindings.
> 
> The only exception is otg property which was removed, as VBUS details
> for all the boards are not known. This should not affect for those boards
> in any way, as otg is not really supported in Tegra20 USB driver, though

I would change "really" to "yet" here. I hope one day it will be...

> delta from v2:
> 1. Removed dr_mode setting to otg, due to:
>   a. Any ways existing Tegra USB driver does not support OTG.

The DT should be describing the HW, and not be related to what some
particular driver currently supports...

>   b. lack of knowledge of all Vbus supplies, on all target platforms.

Hence, this part of the change should only be applied to those boards
where we don't know the details of the VBUS supply. For example, Iris
512. For Seaboard, we do know all the required information, so there's
no need to make this change.

> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts

>  	usb@c5000000 {
>  		status = "okay";
>  		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
> -		dr_mode = "otg";

You don't need to make that change ...

> +	};
> +
> +	usb-phy@c5000000 {
> +		vbus-supply = <&vbus_reg>;

Since we have all the details we need in order to define vbus-supply here.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> -	phy1: usb-phy@c5000400 {
> +	phy1: usb-phy@c5000000 {

One last change throughout this file: the PHY nodes in tegra20.dtsi
should all be marked with:

	status = "disabled";

... just like the EHCI nodes already are. This ensures that the devices
aren't activated on boards where those PHYs and EHCI controllers are not
used.

You will also need to add:

	status = "okay";

to the top of all PHY nodes in all board .dts files where those PHYs are
used; you can tell which boards need them because those boards will also
set that status property for the relevant EHCI nodes.
