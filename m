From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 1/8] ARM: tegra: DT-related fixes needed by the MMC tree
Date: Tue, 9 Apr 2013 13:01:04 +0200
Message-ID: <201304091301.04472.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> In order to convert the Tegra MMC driver to using mmc_of_parse(), some
> bugs in the Tegra device-tree content need to be fixed first; it's
> currently wrong but unused, and mmc_of_parse() causes that data to be
> used for the first time.
> 
> (This branch has also been merged into the MMC tree. I'm sending it as a
> separate pull request as an FYI, but you can feel free to skip it and just
> pull in 2/8 which is the main Tegra fixes branch and includes this)
> 

Pulled into next/dt for completeness, thanks!

	Arnd
