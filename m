From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/5] ARM: tegra: Devicetree changes for v4.5-rc1
Date: Tue, 22 Dec 2015 11:55:20 -0800
Message-ID: <20151222195520.GI30172@localhost>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
 <1450356639-7758-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450356639-7758-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2015 at 01:50:38PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
> 
>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.5-dt
> 
> for you to fetch changes up to 336f79c7b6d7d04f7dad0361b9f4c8995107c062:
> 
>   arm64: tegra: Add NVIDIA Jetson TX1 Developer Kit support (2015-11-24 16:52:25 +0100)
> 
> Note that this pulls in the device tree bindings for the Tegra210 clock
> and reset controller. A separate pull request is sent to the clock tree
> maintainers including this commit. I've included this patch in the diff
> stat below.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Devicetree changes for v4.5-rc1
> 
> This adds support for the Tegra132 Norrin and various Tegra210-based
> reference designs. There is also an initial device tree for the Jetson
> TX1 development kit.

Unfortunately can't merge this due to the feedback on your soc branch that is
part of this.


-Olof
