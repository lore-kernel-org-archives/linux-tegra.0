From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 4/4] ARM: tegra: Core code changes for v3.19
Date: Fri, 28 Nov 2014 22:49:57 +0100
Message-ID: <201411282249.58149.arnd@arndb.de>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com> <1416570832-6220-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416570832-6220-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 21 November 2014, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:
> 
>   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.19-soc
> 
> for you to fetch changes up to e4a680099a6e97ecdbb81081cff9e4a489a4dc44:
> 
>   ARM: tegra: Re-add removed SoC id macro to tegra_resume() (2014-11-17 11:43:21 +0100)
> 

Hmm, I guess this should have been part of 3.18, but I just sent out
a pull request for fixes today, and it may have been the last time.

Pulled into next/fixes-non-critical now. I see that there is a stable
tag on it, which means that it will find its way into 3.18.x, but it's
really the wrong way to send a patch for the following merge window when
there is a stable tag on it.

	Arnd
