From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 3/7] of: Add PWM support.
Date: Tue, 20 Dec 2011 14:45:41 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E6A@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-4-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324377138-32129-4-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> This patch adds helpers to support device-tree bindings for the generic
> PWM API.

> diff --git a/drivers/of/pwm.c b/drivers/of/pwm.c

> +/**
> + * of_get_named_pwm() - get a PWM number and period to use with the PWM API
> + * @np:		device node to get the PWM from
> + * @propname:	property name containing PWM specifier(s)
> + * @index:	index of the PWM
> + * @period_ns:	a pointer to the PWM period (in ns) to fill in
> + *
> + * Returns PWM number to use with the Linux generic PWM API or a negative
> + * error code on failure. If @period_ns is not NULL the function fills in
> + * the value parsed from the period-ns property.
> + */
> +int of_get_named_pwm(struct device_node *np, const char *propname,
> +		     int index, unsigned int *period_ns)
> +{
...
> +	if ((cells > 1) && period_ns)
> +		*period_ns = be32_to_cpu(spec[1]);

What if the client needs to know period_ns, yet the DT doesn't provide
it?

I think a better approach would be to use an "of_xlate" function like
GPIO and IRQ do. This way, the PWM device's own bindings get to define
what the extra cells mean, and the definition of of_xlate can be such
that it must return a period_ns value in all cases; in some cases, the
driver may return a hard-coded value if the HW doesn't support the
feature, whereas in most cases the value would be parsed from the
extra cells.

Without seeing the complete binding documentation and an example, it's
difficult to think about whether it's a good idea to include period_ns
in the PWM specifier or not. An alternative might be a property in the
PWM node itself.

> diff --git a/include/linux/pwm.h b/include/linux/pwm.h

> @@ -65,6 +65,10 @@ struct pwm_chip {

> +#ifdef CONFIG_OF_PWM
> +	struct device_node	*of_node;
> +#endif
>  };

Can we remove the conditionals here? That would allow a PWM driver to
unconditionally assign this field, rather than having to wrap the 
assignment in ifdefs.

Actually, even better would be for struct pwm_chip to contain a struct
device * instead. That'd allow the PWM core to use that for e.g. dev_err
calls, and it includes the of_node for use in the match function above.

-- 
nvpublic
