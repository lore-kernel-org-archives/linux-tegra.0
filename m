From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH 07/14] ARM: tegra2: convert to
 CONFIG_MULTI_IRQ_HANDLER
Date: Fri, 23 Sep 2011 10:28:11 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1739554F81@HQMAIL01.nvidia.com>
References: <1316796692-15964-1-git-send-email-marc.zyngier@arm.com>
 <1316796692-15964-8-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316796692-15964-8-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Zyngier wrote at Friday, September 23, 2011 10:51 AM:
> Convert the tegra2 platforms to be using the gic_handle_irq
> function as their primary interrupt handler.
> 
> Tested on harmony.
> 
> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

I'm not experienced in this area of the kernel, but I traced through the
old assembly and new C code, and they appear to be doing the same thing,
and be hooked together sanely, so:

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
