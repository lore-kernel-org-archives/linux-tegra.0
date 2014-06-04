From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: tegra: enable igb, stmpe, i2c chardev, spidev,
 lm95245, pwm leds
Date: Wed, 04 Jun 2014 08:20:59 +0200
Message-ID: <538EBACB.70100@ziswiler.com>
References: <c5522b0efcbfc7690dcde6aaf78b9dd568f99604.1401665237.git.marcel@ziswiler.com> <39a8704a4c8170d6b0620a1e5e44042eae6d8810.1401665237.git.marcel@ziswiler.com> <538CA24B.1010602@wwwdotorg.org> <538CA635.4050502@ziswiler.com> <20140602221627.GP31751@sirena.org.uk> <538D64FD.2010909@ziswiler.com> <20140603094537.GQ31751@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140603094537.GQ31751-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/03/2014 11:45 AM, Mark Brown wrote:
> When you say "generic user space access" you are describing a specific
> detail of how this device happens to be controlled with your software.

No, not at all. In fact I did not even specify neither the exact type of 
device apart from it being a SPI device nor any property of the software 
apart from the generic user space access thereof implemented in the 
Linux kernel. I really don't see any difference to i2c chardev which is 
already enabled in multi_v7_defconfig.

> This is not a description of your hardware, it is a description of how
> it is controlled with your current software.

Sorry, but I really don't know what you are referring to. It's a pure 
hardware description of some pins being the SPI bus namely MISO/MOSI and 
the clock plus an accompanying chip-select pin.

I fear for some reason or another you have some affinity against spidev 
which strikes me odd. Admittedly it is not perfect but it is the only 
generic SPI user space access currently implemented in the Linux kernel 
and so far did its job perfectly for many of our customers.
