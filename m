From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/4] pinctrl: Add NVIDIA Tegra XUSB pad controller
 support
Date: Wed, 18 Jun 2014 12:53:31 +0300
Message-ID: <53A1619B.8080806@nvidia.com>
References: <1403006877-19850-1-git-send-email-thierry.reding@gmail.com> <1403006877-19850-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403006877-19850-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 17/06/14 15:07, Thierry Reding wrote:
> +static int tegra_xusb_padctl_pinconf_group_get(struct pinctrl_dev *pinctrl,
> +                                              unsigned int group,
> +                                              unsigned long *config)
> +{
> +       struct tegra_xusb_padctl *padctl = pinctrl_dev_get_drvdata(pinctrl);
> +       const struct tegra_xusb_padctl_lane *lane;
> +       enum tegra_xusb_padctl_param param;
> +       u32 value;
> +
> +       param = TEGRA_XUSB_PADCTL_UNPACK_PARAM(*config);
> +       lane = &padctl->soc->lanes[group];
> +
> +       switch (param) {
> +       case TEGRA_XUSB_PADCTL_IDDQ:
> +               value = padctl_readl(padctl, lane->offset);
> +               value = (value >> lane->iddq) & 0x1;
> +               *config = TEGRA_XUSB_PADCTL_PACK(param, value);
> +               break;
> +
> +       default:
> +               dev_err(padctl->dev, "invalid configuration parameter: %04x\n",
> +                       param);
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}

I guess `value' should also be negated here?
