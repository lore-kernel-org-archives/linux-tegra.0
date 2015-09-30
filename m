From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] nouveau: arm: Add MODULE_FIRMWARE for gk20a
Date: Wed, 30 Sep 2015 13:57:10 +0900
Message-ID: <CAAVeFuJLJO4LvLqq2w9gMe6V6L3VDi+Gz59GvwKF2v8OWTWgBQ@mail.gmail.com>
References: <1443452893-18246-1-git-send-email-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443452893-18246-1-git-send-email-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2015 at 12:08 AM, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch is needed by initramfs tools to detect
> the required firmware files for the module.
>
> This patch tests for either TEGRA_124_SOC or TEGRA_132_SOC
> for the firmwares related to the Tegra K1 generation.
>
> v2: move the MODULE_FIRMWARE to the nvidia_platform.c file.
>  This will avoid to test for NOUVEAU_PLATFORM_DRIVER

Nice, thanks for doing this change!

Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
