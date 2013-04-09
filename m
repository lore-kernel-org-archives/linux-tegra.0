From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 7/8] ARM: tegra: multi-platform conversion
Date: Tue, 9 Apr 2013 16:59:08 +0200
Message-ID: <201304091659.08376.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-7-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> This branch converts Tegra to support multi-platform/single-zImage.
> 
> One header is made accessible to drivers. The earlyprintk implementation
> is moved to the multi-platform location. Some Kconfig changes are made
> to enable multi-platform. Some dead files are deleted.
> 
> The APIs exposed in the now-global tegra-powergate.h should be replaced
> with standard reset and power domain APIs in the future.
> 
> This branch is based on (part of) the previous soc pull request.
> 

Pulled into next/multiplatform, thanks a lot!

We now have a total of eight new platforms lined up for supporting a
multiplatform kernel in 3.10, and I still have some (limited) hope
for exynos.

I had to reorder the branches in arm-soc to avoid starting a
next/multiplatform2 branch, but I saw nothing that prevents us from
having multiplatform after soc.

	Arnd
