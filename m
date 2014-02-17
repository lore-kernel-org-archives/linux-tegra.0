From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: fix Dalmore PMIC IRQ polarity
Date: Mon, 17 Feb 2014 14:02:09 +0530
Message-ID: <5301C909.1090401@nvidia.com>
References: <1392415108-4365-1-git-send-email-swarren@wwwdotorg.org> <1392415108-4365-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392415108-4365-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 15 February 2014 03:28 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The Tegra PMC's resume-from-sleep logic wants an active-low IRQ input
> from the PMIC. However, the PMIC IRQ is also routed to the GIC, which
> only supports active high IRQs (or rising edge). Hence, the signal must
> be inverted in the PMC before being routed to the GIC. This implies that
> the PMC DT property nvidia,invert-interrupt must be set, and it is.
>
> The PMIC's DT interrupts property must represent the IRQ level at the
> GIC, since that is the PMIC's parent IRQ controller. Fix the PMIC's
> interrupts property to correctly describe the GIC input polarity.
>
> However, the PMIC IRQ output's polarity is programmable in HW, and by
> default follows the parent IRQ controller's input polarity. We need to
> have an active-low output due to the inversion inside the Tegra PMC.
> Hence, add the ti,irq-externally-inverted property to the PMIC.
>
Looks good to me.

Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
