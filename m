From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 2/8] ARM: tegra: minor fixes
Date: Tue, 9 Apr 2013 15:13:58 +0200
Message-ID: <201304091513.58302.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> This branch contains a variety of small build and run-time fixes that
> weren't important enough for 3.9.
> 
> * Enable CPU errata WARs in secondary reset handler as a preparation
>   for multi-platform support, and a related fix.
> * Don't touch DBLGAR in reset/resume handlers, so enable the code to
>   run on A15 cores.
> * Minor build fixes.
> * A fix to the Tegra clock driver.
> * Some error-handling fixes.
> 
> This branch is based on the previous fixes-for-mmc pull request.
> 

Pulled into next/fixes-non-critical, thanks!

	Arnd
