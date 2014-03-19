From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 62/62] ARM: tegra: make debug_ll code build for ARMv6
Date: Wed, 19 Mar 2014 13:40:06 -0600
Message-ID: <5329F296.6030308@wwwdotorg.org>
References: <1395257399-359545-1-git-send-email-arnd@arndb.de> <1395257399-359545-63-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395257399-359545-63-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2014 01:29 PM, Arnd Bergmann wrote:
> In a combined ARMv6/v7 kernel, we cannot use the
> movt/movw instructions to load an immediate, as they
> are not valid on ARMv6.
> 
> This changes the file to use an indirect load instead,
> as lots of other implementations do.

Hmmm. This code is guaranteed to only execute on Tegra (well, perhaps
someone can turn on the wrong debug option and run it on non-Tegra, but
then it's guaranteed not to work since the HW it touches doesn't exist).
As such, the code ought to be able to use ARMv7 instructions.

As a fix for similar issues in assembly code in arch/arm/mach-tegra/*.S,
Makefile there does:

asflags-y                               += -march=armv7-a

(I think you added that? Yes, in 408e713545ca "ARM: tegra: build
assembly files with -march=armv7-a")

Shouldn't we use the same fix in this case too?
