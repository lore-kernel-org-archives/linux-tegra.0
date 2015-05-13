From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 8/8] ARM: tegra: Default configuration updates for v4.2-rc1
Date: Wed, 13 May 2015 18:12:03 +0200
Message-ID: <16894539.kk24apyd4m@wuerfel>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com> <1431524980-13599-9-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-9-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 May 2015 15:49:40 Thierry Reding wrote:
> ARM: tegra: Default configuration updates for v4.2-rc1
> 
> This is a set of changes to the Tegra default configuration that enable
> various new features (HDMI audio, watchdog) on Toradex Apalis T30.
> 

Applied into next/defconfig.

I noticed that you have not included the config options in
multi_v7_defconfig. Please check that all drivers you need
are also enabled in that generic configuration (as loadable
modules if possible), and send an update for that config as
well.

Thanks,

	Arnd
