From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 12:23:42 +0200
Message-ID: <50A3712E.7000104@nvidia.com>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A357D3.9080002@nvidia.com> <20121114084931.GA31837@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121114084931.GA31837-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.11.2012 10:49, Thierry Reding wrote:
> Can you find out how the host1x clock is setup without this change? I
> was told that freezes can occur when you try to access the registers
> without the host1x clock being enabled. However, the host1x driver
> should take care to properly setup the clock.
> 
> To find out if the non-running clock is the issue, can you try to patch
> that line and make the final element true instead of false? That should
> enable the clock on boot so that it should always be running.

I tried with fastboot and U-Boot, and whenever that line is there,
kernel boot will halt at nvhost init. Same happens if I just change the
false to true.

nvhost will enable the clock and disable as it need. Also, part of
host1x initialization did proceed, but it ended up hanging after a few
registers were initialized. So it's not a case of host1x being off, but
host1x hanging after a while.

If I change this line to:

       { "host1x",     "pll_p",        216000000,      false },

it will also work properly. It looks like we have some problem with
pll_c in Tegra20, or clock configuration with your patch. In Tegra30,
pll_c with 144MHz seems to work fine, but on Tegra20, it doesn't.

In internal kernel, we use pll_c for host1x, so hardware shouldn't be
the problem here.

Best regards,
Terje
