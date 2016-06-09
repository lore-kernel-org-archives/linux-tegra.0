From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM64: tegra: Add device node for system PMIC MAX77620
Date: Thu, 9 Jun 2016 14:29:14 +0900
Message-ID: <CAAVeFuJeVLs7avKgs+YZn_JZ+jeJ9sScEHx6LrQ1aN0QFvhjLA@mail.gmail.com>
References: <1465299897-2491-1-git-send-email-ldewangan@nvidia.com> <1465299897-2491-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465299897-2491-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 7, 2016 at 8:44 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Jetson-TX1 uses the Maxim MAX77620 as system Power management IC.
> Add device node for the MAX77620 with following details:
> - Add device max77620 with.
>         - Add all pins configurations.
>         - Configure FPS of the device.
>         - Configure SD/DCDC and LDOs regulators.
> - populate the bus expander on base board P2597.
> - Populate all fixed voltage regulators controlled by GPIOs from Tegra,
>   PMIC and bus expanders.
>
> For the different details, jetson-CV device tree files are referred from
> downstream.

I think Thierry posted a similar change:

http://permalink.gmane.org/gmane.linux.ports.tegra/26815
