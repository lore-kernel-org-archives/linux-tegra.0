From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 2/8] ARM: tegra: Memory controller updates for v4.2-rc1
Date: Wed, 13 May 2015 17:55:45 +0200
Message-ID: <3160798.564a94qVqR@wuerfel>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com> <1431524980-13599-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 May 2015 15:49:34 Thierry Reding wrote:
> ----------------------------------------------------------------
> ARM: tegra: Memory controller updates for v4.2-rc1
> 
> Adds support for Tegra132 (which is mostly the same as for Tegra124,
> except for cache maintenance). debugfs support is also introduced for
> the SMMU part of the memory controller, which allows users to inspect
> the translation state for SWGROUPs and memory clients.
> 
> 

Pulled into next/drivers, thanks!

	Arnd
