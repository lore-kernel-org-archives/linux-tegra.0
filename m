From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Thu, 20 Aug 2015 19:00:42 -0700
Message-ID: <20150821020042.GN4865@localhost>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
 <1439563720-13189-10-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439563720-13189-10-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 14, 2015 at 04:48:40PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> 
>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-defconfig
> 
> for you to fetch changes up to 258d9bc5e77fa40e290a0bd480d5349224374480:
> 
>   ARM: tegra: Update multi_v7_defconfig (2015-08-14 16:26:00 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Default configuration updates for v4.3-rc1
> 
> Enable the GK20A GPU (via the Nouveau driver) and CPU frequency scaling
> on Tegra124.

I know there are issues surfaced by these changes, but the bug is unrelated to
the defconfig update per se.

I've chosen to merge this, with the hope that the root cause will be found and
fixed quickly. If needed, we can revert the options that are causing problems.


-Olof
