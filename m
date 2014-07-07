From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 3/3] ARM: tegra: use us counter as delay timer
Date: Sun, 6 Jul 2014 17:49:35 -0700
Message-ID: <20140707004935.GF8469@quad.lixom.net>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <1403558626-13422-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403558626-13422-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 23, 2014 at 03:23:46PM -0600, Stephen Warren wrote:
> Tegra has a micro-second counter whose rate doesn't vary with cpufreq
> changes. Register it so it can be used as the delay timer, so delays
> aren't influenced by cpufreq.
> 
> I've made this a separate branch since it touches a few files outside
> arch/arm/mach-tegra/. This can be merged anywhere that conflicts need
> to be resolved, although I know of no such places at present.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:
> 
>   Linux 3.16-rc1
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.17-delay-timer

I didn't see an ack from clocksource maintainer on that patch, make
sure you get them in the future. I'll take a risk and merge it anyway
this time; the change is fairly well-contained.

Merged into next/soc.


-Olof
