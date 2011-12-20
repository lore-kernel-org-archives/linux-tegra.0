From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/7] PWM: add pwm framework support
Date: Tue, 20 Dec 2011 14:13:38 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E50@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> This patch adds framework support for PWM (pulse width modulation) devices.
...

> diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt

> +Identifying PWMs
> +----------------
> +
> +PWMs are identified by unique ids throughout the system. A platform
> +should call pwmchip_reserve() during init time to reserve the id range
> +for internal PWMs so that users have a fixed id to refer to specific
> +PWMs.

pwmchip_reserve() doesn't seem to exist in this patch.

> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c

> +/**
> + * pwmchip_add() - register a new pwm
> + * @chip: the pwm
> + *
> + * register a new pwm. pwm->pwm_id must be initialized. if pwm_id < 0 then
> + * a dynamically assigned id will be used, otherwise the id specified,

I don't see any code that assigns pwm_id if it's negative.

> + */
> +int pwmchip_add(struct pwm_chip *chip)
> +{
> +	struct pwm_device *pwm;
> +	int ret = 0;
> +
> +	pwm = kzalloc(sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
> +		return -ENOMEM;
> +
> +	pwm->chip = chip;
> +
> +	mutex_lock(&pwm_lock);
> +
> +	if (chip->pwm_id >= 0 && _find_pwm(chip->pwm_id)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	list_add_tail(&pwm->node, &pwm_list);
> +out:
> +	mutex_unlock(&pwm_lock);
> +
> +	if (ret)
> +		kfree(pwm);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pwmchip_add);

There have been discussions before re: GPIOs and interrupts that creating
a global namespace for them was a mistake. This new PWM API does the same
thing. Is there an issue here?

I suppose that coming at it purely from a device tree perspective, the
numbering scheme doesn't matter, since it can be dynamically assigned
in the same way that global GPIO and IRQ IDs are with device tree. Still,
there's plenty of non-device tree stuff around, so this is probably worth
thinking about.

Is 0 a valid ID? Given previous GPIO and IRQ discussions, we should
disallow 0 explicitly. The rationale is that such an invalid ID can be
used to indicate "no PWM", and 0 is a good value for that, since it's
what uninitialized global data gets set to.

-- 
nvpublic
