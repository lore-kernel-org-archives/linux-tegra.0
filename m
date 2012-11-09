From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: tamonten: Add temperature sensor support
Date: Fri, 09 Nov 2012 10:26:40 -0700
Message-ID: <509D3CD0.4070006@wwwdotorg.org>
References: <1352466474-27581-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352466474-27581-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 06:07 AM, Thierry Reding wrote:
> The Tamonten SOM has an ON Semiconductor NCT1008 connected to the DVC
> bus which is used to measure the ambient (local) temperature as well as
> the on-die (remote) temperature.

> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi

> +		nct1008@4c {

Given nodes are typically named after object type, should that be:

		temperature-sensor@4c {

as it is on Seaboard?

> +			compatible = "onnn,nct1008";
> +			reg = <0x4c>;
> +		};
>  	};
>  
>  	pmc {
> 
