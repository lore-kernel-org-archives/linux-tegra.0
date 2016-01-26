From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 07/11] of: Add bindings of hw-trip-points for soctherm
Date: Mon, 25 Jan 2016 20:41:57 -0600
Message-ID: <20160126024157.GA15270@rob-hp-laptop>
References: <1453718796-4393-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453718796-4393-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 25, 2016 at 06:46:36PM +0800, Wei Ni wrote:
> Add hw-trips sub-node for soctherm, which is
> used to describe the hardware trip points for
> each soctherm sensors.

This seems like something that should be common. There was a hwmon 
binding just the other day with temperature set points.

> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/thermal/tegra-soctherm.txt | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> index 6b68cd150405..75dc9dbe7e1a 100644
> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> @@ -26,6 +26,15 @@ Required properties :
>      of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
>      list of valid values when referring to thermal sensors.
>  
> +Optional properties:
> +- hw-trip-points : A sub-node which is a container of hardware trip points
> +    for each sensors.
> +  * sensors: Sub-nodes which are used to describe the HW trip points info,
> +        must be named as "cpu", "gpu", "mem", "pll".
> +      Properties:
> +      - thermtrip-temperature : Shutdown or reset temperature in millicelsius,
> +        once the temperature of this sensor is higher than the
> +        thermtrip-temperature, the system will be shutdown or reset.

Append units and temperature is a bit redundant. Something like 
thermtrip-mC or thermtrip-milliC

You could easily have multiple levels of trip points, so perhaps the 
name needs to reflect the action (i.e. shutdown).

Rob
