From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: tegra: fix suspend/resume apis
Date: Wed, 07 Nov 2012 10:11:41 -0700
Message-ID: <509A964D.2050205@wwwdotorg.org>
References: <1352300492-24779-1-git-send-email-ldewangan@nvidia.com> <1352300492-24779-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352300492-24779-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/07/2012 08:01 AM, Laxman Dewangan wrote:
> Following are changes done to fix the suspend/resume
> functionality of tegra gpio driver:
> - Protect suspend/resume callbacks with CONFIG_PM_SLEEP
>   because CONFIG_PM doesn't actually enable any of the PM callbacks, it
>   only allows to enable CONFIG_PM_SLEEP and CONFIG_PM_RUNTIME.
>   This means if CONFIG_PM is used to protect system sleep callbacks
>   then it may end up unreferenced if only runtime PM is enabled.
> 
> - Fix the suspend/resume APIs declaration as per callback prototype.

Seems plausible, so this patch,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I wonder why the suspend/resume functions weren't actually hooked up
anywhere before. Oh well.

Just one very minor nit below:

> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c

> +#ifdef CONFIG_PM_SLEEP
> +static int  tegra_gpio_resume(struct device *dev)

There are two spaces after "int" there.
