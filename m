From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 03/10] of: Add PWM support.
Date: Wed, 22 Feb 2012 16:15:11 +0000
Message-ID: <201202221615.11605.arnd@arndb.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de> <1329923841-32017-4-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329923841-32017-4-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 22 February 2012, Thierry Reding wrote:
> This patch adds helpers to support device tree bindings for the generic
> PWM API. Device tree binding documentation for PWM controllers is also
> provided.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> 
>  Documentation/devicetree/bindings/pwm/pwm.txt |   48 +++++++++
>  drivers/of/Kconfig                            |    6 +
>  drivers/of/Makefile                           |    1 +
>  drivers/of/pwm.c                              |  130 +++++++++++++++++++++++++
>  include/linux/of_pwm.h                        |   51 ++++++++++
>  include/linux/pwm.h                           |   17 +++

I think it would make more sense to stick the device tree specific parts
into drivers/pwm/of.c instead of drivers/of/pwm.c, but it's not a strong
preference on my part.

> @@ -0,0 +1,48 @@
> +Specifying PWM information for devices
> +======================================
> +
> +1) PWM user nodes
> +-----------------
> +
> +PWM users should specify a list of PWM devices that they want to use
> +with a property containing a 'pwm-list':
> +
> +	pwm-list ::= <single-pwm> [pwm-list]
> +	single-pwm ::= <pwm-phandle> <pwm-specifier>
> +	pwm-phandle : phandle to PWM controller node
> +	pwm-specifier : array of #pwm-cells specifying the given PWM
> +			(controller specific)
> +
> +PWM properties should be named "[<name>-]pwms". Exact meaning of each
> +pwms property must be documented in the device tree binding for each
> +device.
> +
> +The following example could be used to describe a PWM-based backlight
> +device:
> +
> +	pwm: pwm {
> +		#pwm-cells = <2>;
> +	};
> +
> +	[...]
> +
> +	bl: backlight {
> +		pwms = <&pwm 0 5000000>;
> +	};
> +
> +pwm-specifier typically encodes the chip-relative PWM number and the PWM
> +period in nanoseconds.

I like these bindings, this looks very straightforward to use while also
able to describe all possible cases.

> +/**
> + * of_node_to_pwmchip() - finds the PWM chip associated with a device node
> + * @np: device node of the PWM chip
> + *
> + * Returns a pointer to the PWM chip associated with the specified device
> + * node or NULL if the device node doesn't represent a PWM chip.
> + */
> +struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
> +{
> +	return pwmchip_find(np, of_pwmchip_is_match);
> +}
> +
> +int of_pwm_simple_xlate(struct pwm_chip *pc, const struct of_phandle_args *args,
> +			struct pwm_spec *spec)
> +{
> +	if (pc->of_pwm_n_cells < 2)
> +		return -EINVAL;
> +
> +	if (args->args_count < pc->of_pwm_n_cells)
> +		return -EINVAL;
> +
> +	if (args->args[0] >= pc->npwm)
> +		return -EINVAL;
> +
> +	if (spec)
> +		spec->period = args->args[1];
> +
> +	return args->args[0];
> +}

I'm not sure why these functions are global. They are clearly marked
so in your header file, but it seems that these are an implementation
detail that neither a pwm controller driver not a driver using one
would need to use directly.

> +/**
> + * of_get_named_pwm() - get a PWM number and period to use with the PWM API
> + * @np: device node to get the PWM from
> + * @propname: property name containing PWM specifier(s)
> + * @index: index of the PWM
> + * @spec: a pointer to a struct pwm_spec to fill in
> + *
> + * Returns PWM number to use with the Linux generic PWM API or a negative
> + * error code on failure. If @spec is not NULL the function fills in the
> + * values parsed from the device tree.
> + */
> +int of_get_named_pwm(struct device_node *np, const char *propname,
> +		     int index, struct pwm_spec *spec)
> +{

This interface does not feel right to me, in multiple ways:

* I would expect to pass a struct device in, not a device_node.

* Why not include the pwm_request() call in this and return the
  pwm_device directly? You said that you want to get rid of the
  pwm_id eventually, which is a good idea, but this interface still
  forces one to use it.

* It is not clear what a pwm_spec is used for, or why a device
  driver would need to be bothered by this. Maybe it just needs
  more explanation, but it seems to me that if you do the previous
  change, the pwm_spec would not be needed either.

> +EXPORT_SYMBOL(of_get_named_pwm);

EXPORT_SYMBOL_GPL?

> +static inline int of_get_named_pwm(struct device_node *np,
> +                                  const char *propname, int index,
> +                                  unsigned int *period_ns)
> +{

The function prototype does not match.

	Arnd
