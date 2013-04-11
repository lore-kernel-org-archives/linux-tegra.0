From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 8/8] ARM: tegra: defconfig changes
Date: Thu, 11 Apr 2013 10:53:19 -0700
Message-ID: <20130411175319.GD373@quad.lixom.net>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
 <1365181426-11547-8-git-send-email-swarren@wwwdotorg.org>
 <201304091716.36058.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201304091716.36058.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 09, 2013 at 05:16:35PM +0200, Arnd Bergmann wrote:
> On Friday 05 April 2013, Stephen Warren wrote:
> > Various new features are enabled:
> > 
> > * Tegra114 support.
> > * Various PMICs and related options for Tegra114 platforms.
> > * KEYBOARD_GPIO, mainly as a suspend wakeup source.
> > * tegra_defconfig is rebuilt based on v3.9-rc1, which causes various
> >   layout changes.
> > 
> > This branch is based on v3.9-rc1.
> 
> Pulled into next/soc.
> 
> I'm currently thinking about creating a next/defconfig branch after all,
> since we have a couple of pull requests in next/soc that only do
> defconfig changes. Olof, any opinion?

Sorry, didn't see this until now. Either way is fine with me. Main reason
for not keeping it in a branch on its own is that defconfig churn is
usually frowned upon and it makes some sense to show that it's caused
by other development (soc/board/etc).  But if we have enough volume to
keep separate then that's fine too.

Also, if we keep it separate we can always merge it together with another
branch before sending it up if it's very small for a particular merge window.


-Olof
