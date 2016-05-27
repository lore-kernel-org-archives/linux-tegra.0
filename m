From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC 4/5] ARM: tegra: Enable UDC on Dalmore
Date: Fri, 27 May 2016 11:18:51 +0800
Message-ID: <20160527031851.GB3034@shlinux2>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
 <20160526154005.11558-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160526154005.11558-5-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 26, 2016 at 05:40:04PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Override the compatible string of the first USB controller to enable
> device mode.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index c970bf65c74c..53d664f718ff 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -1122,6 +1122,17 @@
>  		non-removable;
>  	};
>  
> +	usb@7d000000 {
> +		compatible = "nvidia,tegra114-udc";
> +		status = "okay";
> +		dr_mode = "otg";
> +	};
> +
> +	usb-phy@7d000000 {
> +		status = "okay";
> +		dr_mode = "otg";
> +	};
> +

It is a USB PHY node, you don't need to set dr_mode for it.

-- 

Best Regards,
Peter Chen
