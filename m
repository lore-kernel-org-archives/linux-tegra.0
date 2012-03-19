From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8] dt: add property iteration helpers
Date: Mon, 19 Mar 2012 11:00:46 -0500
Message-ID: <4F67582E.9080901@gmail.com>
References: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331931269-12262-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/16/2012 03:54 PM, Stephen Warren wrote:
> This patch adds macros for_each_u32_property_value and
> for_each_string_property_value, which iterate over an array of values
> within a device-tree property. Usage is for example:
> 
> struct of_iter_string_prop iter;
> for_each_string_property_value(iter, np, "pins")
>         printk("Got value %s\n", iter.value);
> 

This seems overly complex and exposes a new struct primarily for
temporary storage. In your use, you only really use the ptr to each
string, so why not something like this:

const char *of_prop_next_string(struct property *p, const char *cur)
{
	int len;
	if (!prop)
		return NULL;
	if (!cur)
		return prop->value;
	
	len = strlen(cur) + 1;
	if (cur + len > prop->value + prop->length)
		return NULL;
	return cur + len;
}

#define of_property_for_each_string(prop, s) \
for (prop = of_find_property(), s = of_prop_next_string(prop, NULL); \
     s; \
     s = of_prop_next_string(prop, s))

Rob


> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>  include/linux/of_iter_prop.h |  139 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 139 insertions(+), 0 deletions(-)
>  create mode 100644 include/linux/of_iter_prop.h
> 
> diff --git a/include/linux/of_iter_prop.h b/include/linux/of_iter_prop.h
> new file mode 100644
> index 0000000..57e9e6a
> --- /dev/null
> +++ b/include/linux/of_iter_prop.h
> @@ -0,0 +1,139 @@
> +/*
> + * Copyright (c) 2011-2012 NVIDIA CORPORATION. All rights reserved.
> + *
> + * Iterate over properties that store arrays.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __OF_ITER_PROP_H__
> +#define __OF_ITER_PROP_H__
> +
> +#include <linux/of.h>
> +
> +#ifdef CONFIG_OF
> +struct of_iter_u32_prop {
> +	const struct property *prop;
> +	int len;
> +	const __be32 *pvalue;
> +	u32 value;
> +};
> +
> +static inline void of_iter_u32_next(struct of_iter_u32_prop *iter)
> +{
> +	if (!iter->len)
> +		return;
> +
> +	iter->len--;
> +	if (iter->len)
> +		iter->value = be32_to_cpup(iter->pvalue++);
> +}
> +
> +static inline void of_iter_u32_init(struct of_iter_u32_prop *iter,
> +				    const struct device_node *np,
> +				    const char *name)
> +{
> +	iter->prop = of_find_property(np, name, &iter->len);
> +	if (!iter->prop) {
> +		iter->len = 0;
> +		return;
> +	}
> +
> +	iter->pvalue = iter->prop->value;
> +	if (!iter->pvalue) {
> +		iter->len = 0;
> +		return;
> +	}
> +
> +	iter->len /= sizeof(*iter->pvalue);
> +
> +	if (iter->len)
> +		iter->value = be32_to_cpup(iter->pvalue++);
> +}
> +
> +static inline bool of_iter_u32_test(struct of_iter_u32_prop *iter)
> +{
> +	return iter->len > 0;
> +}
> +
> +#define for_each_u32_property_value(iter, np, prop_name) \
> +	for (of_iter_u32_init(&iter, np, prop_name); \
> +	     of_iter_u32_test(&iter); \
> +	     of_iter_u32_next(&iter))
> +
> +struct of_iter_string_prop {
> +	const struct property *prop;
> +	int len;
> +	const char *value;
> +	const char *after;
> +};
> +
> +static inline void of_iter_string_init(struct of_iter_string_prop *iter,
> +				       const struct device_node *np,
> +				       const char *name)
> +{
> +	iter->prop = of_find_property(np, name, &iter->len);
> +	if (!iter->prop) {
> +		iter->value = NULL;
> +		return;
> +	}
> +
> +	iter->value = iter->prop->value;
> +	if (!iter->value)
> +		return;
> +
> +	iter->after = iter->value + iter->len;
> +}
> +
> +static inline bool of_iter_string_test(struct of_iter_string_prop *iter)
> +{
> +	if (!iter->value)
> +		return false;
> +
> +	return iter->value < iter->after;
> +}
> +
> +static inline void of_iter_string_next(struct of_iter_string_prop *iter)
> +{
> +	int len;
> +
> +	if (!iter->value)
> +		return;
> +
> +	len = strnlen(iter->value, iter->len);
> +	iter->len -= len + 1;
> +	iter->value += len + 1;
> +}
> +
> +#define for_each_string_property_value(iter, np, prop_name) \
> +	for (of_iter_string_init(&iter, np, prop_name); \
> +	     of_iter_string_test(&iter); \
> +	     of_iter_string_next(&iter))
> +
> +#else
> +struct of_iter_u32_prop {
> +	u32 value;
> +};
> +
> +#define for_each_u32_property_value(iter, np, prop_name) \
> +	while (0)
> +
> +struct of_iter_string_prop {
> +	const char *value;
> +};
> +
> +#define for_each_string_property_value(iter, np, prop_name) \
> +	while (0)
> +
> +#endif /* CONFIG_OF */
> +
> +#endif /* __OF_ITER_PROP_H__ */
