From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 2/7] ARM: tegra: update device trees for USB binding
 rework
Date: Wed, 03 Apr 2013 13:16:52 -0600
Message-ID: <515C8024.30204@wwwdotorg.org>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com> <1364978502-22887-3-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364978502-22887-3-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> This patch updates all Tegra board files so that they contain all the
> properties required by the updated USB DT binding. Note that this patch
> only adds the new properties and does not yet remove the old properties,
> in order to maintain bisectability. The old properties will be removed
> once the driver has been updated to assume the new bindings.

The binding documentation says that the vbus-supply property is required
in all cases. However, many of the DT files still don't have that
property even after this patch. That's inconsistent.

> diff --git a/arch/arm/boot/dts/tegra20-iris-512.dts b/arch/arm/boot/dts/tegra20-iris-512.dts
> index 52f1103..c99eccc 100644
> --- a/arch/arm/boot/dts/tegra20-iris-512.dts
> +++ b/arch/arm/boot/dts/tegra20-iris-512.dts
> @@ -41,6 +41,10 @@
>  		dr_mode = "otg";
>  	};
>  
> +	usb-phy@c5000000 {
> +		dr_mode = "otg";
> +	};

Since this port claims to be OTG-capable, presumably a vbus-supply
property is mandatory here? If you don't know enough about the board to
correctly set up such a regulator, lets just mark this port as host-only
for now; we can switch it back to OTG-mode later once someone implements
the required regulator. This won't lose any functionality, since we
don't support OTG-mode yet anyway. However, it will allow the device
tree to be correct/consistent in the mean time.

> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts

> +	usb-phy@c5000000 {
> +		vbus-supply = <&vbus_reg>;
> +		dr_mode = "otg";
> +	};

Where is the nvidia,vbus-gpio property? Since your code changes don't
actually implement use of the vbus-supply property yet, they will expect
the vbus-gpio property to exist in the PHY node.

> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
> index 955bf49..8f2bb9b 100644
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> @@ -305,17 +305,21 @@
>  		nvidia,vbus-gpio = <&gpio 170 0>; /* gpio PV2 */
>  	};
>  
> +	usb-phy@c5000000 {
> +		vbus-supply = <&vbus_reg>;
> +	};

Same here; isn't nvidia,vbus-gpio needed in the PHY node until the
driver is converted to use vbus-supply?

I guess this is a case of a host-only port where there is SW-control
over VBUS...
