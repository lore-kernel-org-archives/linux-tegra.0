From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.9-rc1
Date: Wed, 14 Sep 2016 17:27:27 +0200
Message-ID: <2773980.1MuS3EVqLd@wuerfel>
References: <20160909152032.9550-1-thierry.reding@gmail.com> <20160909152032.9550-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160909152032.9550-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, September 9, 2016 5:20:32 PM CEST Thierry Reding wrote:
> arm64: tegra: Device tree changes for v4.9-rc1
> 
> Add a couple of devices (AGIC, ADMA) on Tegra210 and enable them on
> Smaug. Also enable DPAUX on Smaug to allow the I2C bus that shares pads
> with the DPAUX to be used to access various audio devices. Furthermore,
> enable the XUSB controller on Smaug for USB 3.0 support.
> 
> Finally, select PM_GENERIC_DOMAINS for 64-bit Tegra devices to make sure
> devices are probed only after their power partitions have been enabled.
> 

Pulled into next/dt64, thanks!

	Arnd
