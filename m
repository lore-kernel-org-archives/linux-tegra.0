From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 2/3] ARM: tegra: Changes for v4.7-rc1
Date: Sun, 24 Apr 2016 23:29:10 +0200
Message-ID: <8017890.92B3ctfOGM@wuerfel>
References: <1460731323-31001-1-git-send-email-thierry.reding@gmail.com> <1460731323-31001-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460731323-31001-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 15 April 2016 16:42:02 Thierry Reding wrote:
> ARM: tegra: Changes for v4.7-rc1
> 
> A couple of patches that cleanup some Kconfig, enable various features,
> use stdout-path to define the debug serial port (so that it doesn't have
> to be manually specified on the kernel command-line) and cleanup and fix
> some minor device trees bugs.

I'd rather have seen the Kconfig changes in a separate branch, or mixed
in with the PULL 1/3, but it's not important enough to ask for a respin.

Pulled into next/dt, thanks!

	Arnd
