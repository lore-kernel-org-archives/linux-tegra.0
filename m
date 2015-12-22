From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 3/5] ARM: tegra: Core SoC changes for v4.5-rc1
Date: Tue, 22 Dec 2015 11:54:46 -0800
Message-ID: <20151222195446.GH30172@localhost>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
 <1450356639-7758-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450356639-7758-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2015 at 01:50:37PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
> 
>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.5-soc
> 
> for you to fetch changes up to a262e87ff354f12447bb6268bd63edf7ba1c20e0:
> 
>   ARM: tegra: select USB_ULPI from EHCI rather than platform (2015-11-24 16:47:26 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Core SoC changes for v4.5-rc1
> 
> The big thing here is Tegra210 support, which is really only the Kconfig
> symbol. Other than that there's a few miscellaneous fixes.

Hi,

We merge arch/arm and arch/arm64 and drivers/bus contents through separate
branches, so having them come in from you in one combined branch isn't working
very well.

If you don't have any downstream users of this I can just cherry-pick them into
the appropriate branches, but if you do, please send separate requests for
those three categories.


Thanks!


-Olof
