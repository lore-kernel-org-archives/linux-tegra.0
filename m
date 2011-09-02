From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: IRQF_TRIGGER_LOW and ARM GIC
Date: Fri, 2 Sep 2011 12:28:29 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B327A657@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Russell King - ARM Linux (linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org)" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell, Colin,

The Tegra Harmony board contains a TPS6586x chip, which has an active-low
interrupt output. This is then fed to Tegra's PMC's PWR_INT pin, which can
be programmed to accept active-low or active-high interrupt signals. This
then feeds into a GIC interrupt.

The problem is that the PMC appears to default to expecting the attached
signal to be active-high not active-low.

At a driver level, it seems that IRQF_TRIGGER_LEVEL_LOW should be passed
to request_threaded_irq() to solve this. However, gic.c:gic_set_type()
prohibits IRQ_TYPE_* except LEVEL_HIGH and EDGE_RISING.

I'm not quite sure how to solve this; should gic_set_type() be modified
to remove the restriction if gic_arch_extn.irq_set_type is present, and
assume that gic_arch_extn.irq_set_type will handle converting the input
signal from LEVEL_LOW to LEVEL_HIGH or EDGE_FALLING to EDGE_RISING?

In at least some non-mainline kernels, this has been solved by having
individual board files poke PMC registers to invert the signal to the
gic's expected LEVEL_HIGH. However, I assume that's not a good solution
for mainline.

Thanks.

-- 
nvpublic
