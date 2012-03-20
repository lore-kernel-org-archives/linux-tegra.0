From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 10/10] pwm-backlight: Add rudimentary device tree support
Date: Mon, 19 Mar 2012 20:59:59 -0600
Message-ID: <4F67F2AF.3020404@wwwdotorg.org>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de> <1331740593-10807-11-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331740593-10807-11-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/14/2012 09:56 AM, Thierry Reding wrote:
> This commit adds very basic support for device tree probing. Currently,
> only a PWM and a list of distinct brightness levels can be specified.
> Enabling or disabling backlight power via GPIOs is not yet supported.
> 
> A pointer to the exit() callback is stored in the driver data to keep it
> around until the driver is unloaded.

> +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight

> +pwm-backlight bindings
> +
> +Required properties:
> +  - compatible: "pwm-backlight"
> +  - pwm: OF device-tree PWM specification
> +  - num-brightness-levels: number of distinct brightness levels
> +  - brightness-levels: array of distinct brightness levels

I assume the values in this array are 0 (darkest/off) to 255 (max
brightness)? The doc should probably specify this.

> +  - default-brightness-level: the default brightness level

Likewise, this is an index into the default-brightness-level? Again,
it'd be best to explicitly state this.

...
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;


> +static int pwm_backlight_parse_dt(struct device *dev,
> +				  struct platform_pwm_backlight_data *data)
...
> +		ret = of_property_read_u32(node, "default-brightness-level",
> +					   &value);
> +		if (ret < 0)
> +			goto free;

Range-check that against max_brightness?

>  static int pwm_backlight_probe(struct platform_device *pdev)
...
> -	pb->pwm = pwm_request(data->pwm_id, "backlight");
> -	if (IS_ERR(pb->pwm)) {
> -		dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> -		ret = PTR_ERR(pb->pwm);
> -		goto err_alloc;
> -	} else
> -		dev_dbg(&pdev->dev, "got pwm for backlight\n");
> +	if (!pb->pwm) {
> +		pb->pwm = pwm_request(data->pwm_id, "backlight");
> +		if (IS_ERR(pb->pwm)) {
> +			dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> +			ret = PTR_ERR(pb->pwm);
> +			goto err_alloc;
> +		} else
> +			dev_dbg(&pdev->dev, "got pwm for backlight\n");
> +	}

Hmmm. It'd be more consistent if pwm_backlight_parse_dt() called
something like of_pwm_get() instead of of_pwm_request(), so that this
code could always call pwm_request() on the PWM and hence operate the
same irrespective of DT vs non-DT. GPIOs work that way at least.
