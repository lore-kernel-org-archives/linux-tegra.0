From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Question about "missing" tegra features
Date: Mon, 21 Jul 2014 09:18:13 -0600
Message-ID: <53CD2F35.4000804@wwwdotorg.org>
References: <c3a33a3d722302b1f4d877649d485d2f@webmail-alfa3028.alfahosting-server.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3a33a3d722302b1f4d877649d485d2f-n3SY6/QrmYUdxdNa7N5bz2CGZHFJa5fA29i0knmqyyNx9qoA87EPLA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/03/2014 01:11 AM, Richard Leitner wrote:
> Hello folks,
> I've a general question regarding the linux-tegra development:
> Why are there tegra features which are available in NVIDIA's kernel tree
> [1], but not included in mainline (or at least your tegra tree)?
> I've just noticed that for the USB device controller
> (drivers/usb/gadget/tegra_udc.{c,h}), but it seems there are more such
> "cases".

Just like I think Marc already responded, It's simply a matter of
resources; the upstreaming team isn't as large as the product team.

> Is there any documentation on what is supported/included in mainline
> already and what not?

I don't believe so, no.

The main features I can think of are:

* Various power/performance optimizations.
* Various IO controllers on newer chips (such as SATA, Tegra124 PCIe,
USB3), although there are patches sent for all of these now. NOR flash,
I2C/SPI slave mode, one-wire, perhaps a few other minor IO controllers.
* Various features in supported IO controllers (e.g. high-speed eMMC/SD
modes, USB2 bus suspend, ...)
* USB device mode.
