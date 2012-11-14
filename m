From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 17:29:33 +0200
Message-ID: <50A3B8DD.7010607@nvidia.com>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A357D3.9080002@nvidia.com> <20121114150125.GA11050@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121114150125.GA11050-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.11.2012 17:01, Thierry Reding wrote:
> Funny. I just tested with this line removed and I also get the freeze.
> With the line I don't get the freeze. Does the freeze only occur with
> additional patches on top? If so I think we should keep the line in for
> now because it is what most people have tested against and which has
> proven to work. We can fix any remaining issues with host1x specific
> things when actual patches emerge.

I was running with 2D acceleration support added on top of your
gitorious tree. It was the nvhost driver, which probes host1x, and
initializes it. In middle of initialization (writing zeros to sync point
registers), host1x stops responding.

I agree, if removing the line causes regression, keep it and let's debug
this issue later.

It might be that we have a difference in bootloader. Does your
bootloader enable display? U-Boot and fastboot do, and it might be that
has an effect. They would need to initialize host1x clocks, and it might
be that kernel initialization somehow clashes with bootloader's.

Best regards,
Terje
