From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 22 Feb 2012 16:34:44 +0000
Message-ID: <201202221634.45159.arnd@arndb.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de> <1329923841-32017-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329923841-32017-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 22 February 2012, Thierry Reding wrote:

>  #include <linux/module.h>
> +#include <linux/of_pwm.h>
>  #include <linux/pwm.h>

You should probably reorder the patches for bisectability, or move the
of_* related changes out of this patch into patch 3. At the point
where patch 2 is applied, linux/of_pwm.h does not exist yet.

>  
> +/**
> + * pwmchip_find() - iterator for locating a specific pwm_chip
> + * @data: data to pass to match function
> + * @match: callback function to check pwm_chip
> + */
> +struct pwm_chip *pwmchip_find(void *data, int (*match)(struct pwm_chip *chip,
> +						       void *data))
> +{
> +	struct pwm_chip *ret = NULL;
> +	struct pwm_chip *chip;
> +
> +	mutex_lock(&pwm_lock);
> +
> +	list_for_each_entry(chip, &pwm_chips, list) {
> +		if (match(chip, data)) {
> +			ret = chip;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&pwm_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pwmchip_find);

Is this only used for the device tree functions? If so, I would recommend
making it less generic and always search for a device node.

> +static int pwm_show(struct seq_file *s, void *unused)
> +{
> +	const char *prefix = "";
> +	struct pwm_chip *chip;
> +
> +	list_for_each_entry(chip, &pwm_chips, list) {
> +		struct device *dev = chip->dev;
> +
> +		seq_printf(s, "%s%s/%s, %d PWM devices\n", prefix,
> +			   dev->bus ? dev->bus->name : "no-bus",
> +			   dev_name(dev), chip->npwm);
> +
> +		if (chip->ops->dbg_show)
> +			chip->ops->dbg_show(chip, s);
> +		else
> +			pwm_dbg_show(chip, s);
> +
> +		prefix = "\n";
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwm_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, pwm_show, NULL);
> +}

When you have a seq_file with a (possibly long) list of entries, better
use seq_open instead of single_open and print each item in the
->next() callback function.

	Arnd
