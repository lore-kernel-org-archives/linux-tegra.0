From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Fri, 10 Jun 2016 11:58:13 +0530
Message-ID: <575A5DFD.6040300@nvidia.com>
References: <1465493923-23313-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465493923-23313-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 09 June 2016 11:08 PM, Rhyland Klein wrote:
> Add regulators to the Tegra210 Smaug DTS file including
> support for the max77620 PMIC.
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> +
> +				fps1 {
> +					maxim,shutdown-fps-time-period-us = <5120>;
> +					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
> +					maxim,enable-sleep;
The maxim,enabel-sleep is not the valid property.
It should be
maxim,device-state-on-disabled-event = <MAX77620_FPS_INACTIVE_STATE_SLEEP>;



> +				};
> +
> +				fps2 {
> +					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
> +				};
> +			};
> +
> +			regulators {
> +				in-ldo0-1-supply = <&pp1350>;
> +				in-ldo2-supply = <&pp3300>;
> +				in-ldo3-5-supply = <&pp3300>;
> +				in-ldo7-8-supply = <&pp1350>;
> +
> +				ppvar_soc: sd0 {
> +					regulator-name = "PPVAR_SOC";
> +					regulator-min-microvolt = <825000>;
> +					regulator-max-microvolt = <1125000>;
> +					regulator-enable-ramp-delay = <146>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +					maxim,ramp-rate-setting = <27500>;
You need to say regulator-ramp-delay if register config is same as what 
platform observed.
This is applicable for all places.


> +			regulator-always-on;
> +			gpio = <&max77620 3 0>;
GPIO3 is fps-out and hence it can not be done here. Better to do not 
provide any gpio entry.
