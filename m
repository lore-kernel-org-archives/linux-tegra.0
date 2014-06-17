From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pinctrl: Add NVIDIA Tegra XUSB pad controller
 support
Date: Tue, 17 Jun 2014 14:20:25 +0300
Message-ID: <53A02479.8080405@nvidia.com>
References: <1402930623-28886-1-git-send-email-thierry.reding@gmail.com> <1402930623-28886-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402930623-28886-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This v3 breaks SATA; see below

On 16/06/14 17:57, Thierry Reding wrote:
...
> +                       regval = padctl_readl(padctl, lane->offset);
> +
> +                       if (!value)
> +                               regval &= ~lane->iddq;
> +                       else
> +                               regval |= lane->iddq;
> +
> +                       padctl_writel(padctl, regval, lane->offset);
...

The bits at at lane->iddq are actually IDDQ_DISABLE bits, so this is the 
wrong way around: having iddq = <0> in device tree leads to the device 
turning off. So either the DT property should be renamed or the branches 
of the if here should be switched around.

v2 used the wrong variable so the else branch ended up being chosen each 
time, this also meant that SATA worked by chance.

- Mikko
