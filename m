From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 5/6] ARM: tegra: Changes for v4.8-rc1
Date: Wed, 6 Jul 2016 22:38:19 -0700
Message-ID: <20160707053819.GR32389@localhost>
References: <20160701145026.25760-1-thierry.reding@gmail.com>
 <20160701145026.25760-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160701145026.25760-5-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Fri, Jul 01, 2016 at 04:50:25PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-arm
> 
> for you to fetch changes up to 1cedbdf624145076992c794ae07b85fe20063c1b:
> 
>   ARM: tegra: Initial support for Apalis TK1 (2016-07-01 16:34:16 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Changes for v4.8-rc1
> 
> Mostly cleanups, but also initial support for the Toradex Apalis TK1.

I'm a little confused by how you choose to organize your patches this release.
You've had several small driver branches that you sent out individually (this
is not a problem). However, here you're lumping together SoC and DT changes in
one branch, something we normally merge into separate categories at our end.

Please revisit this branch and separate out DT and arch/arm/mach* contents.


-Olof
