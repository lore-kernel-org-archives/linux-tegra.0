From: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/dt: Add SoC detection macros
Date: Mon, 19 Sep 2011 10:26:08 -0700
Message-ID: <3C7A7ACA8617D24290826EC008B5CD083E17B00988@HQMAIL03.nvidia.com>
References: <1315555339-12685-1-git-send-email-amartin@nvidia.com>
 <20110917102811.GC16381@n2100.arm.linux.org.uk>
 <20110917103457.GP28104@game.jcrosoft.org>
 <20110917112321.GE16381@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110917112321.GE16381-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Russell King - ARM Linux' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> What I'm saying is that in that scenario it should not be necessary to edit the
> kernel to invent new SoC types, and then teach it that Tegra4 is mostly the
> same as Tegra3.  That information should all be encoded into the DT rather
> than the C code in the kernel.
> 
> So, I think adding this SoC type stuff is the wrong approach to the problem.

What ends up happening in practice for a lot of hw blocks inside the SoC, is that tegra4 is mostly the same as tegra3 with a few new registers and bug fixes that slightly change the programming model.  So either we have to add device quirks to teach device tree about the differences, and pass those in as flags to the driver, or we can do SoC detection at runtime in the driver.  It sounds like the consensus from you and Olof is that the first is preferable.

-Allen
