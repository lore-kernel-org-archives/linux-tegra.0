From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 4/8] ARM: tegra: core SoC support development
Date: Tue, 9 Apr 2013 16:37:53 +0200
Message-ID: <201304091637.53857.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> This branch includes major development on the core Tegra SoC support code
> in the mach-tegra directory:
> 
> * SMP support for Tegra114.
> * Exposes SoC chip ID and revision through standard sysfs files.
> * System-level suspend/resume for Tegra20/30. At present, this only
>   supports "LP2" mode (CPU power-down), but provides the basis to
>   implement "LP0"/"LP1" (various levels of core/chip power-down) in the
>   hopefully near future.
> * A minor cleanup of a duplicate include, which was introduced in this
>   branch.
> 
> This branch is based on the previous cleanup pull request.

Pulled into next/soc, thanks!

	Arnd
