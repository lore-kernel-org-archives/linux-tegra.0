From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/4] ARM: tegra: Core code changes for v3.19
Date: Fri, 21 Nov 2014 12:53:52 +0100
Message-ID: <1416570832-6220-4-git-send-email-thierry.reding@gmail.com>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416570832-6220-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi ARM SoC maintainers,

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

  Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.19-soc

for you to fetch changes up to e4a680099a6e97ecdbb81081cff9e4a489a4dc44:

  ARM: tegra: Re-add removed SoC id macro to tegra_resume() (2014-11-17 11:43:21 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core code changes for v3.19

This contains a single fix for a bug that was introduced back in v3.13.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Re-add removed SoC id macro to tegra_resume()

 arch/arm/mach-tegra/reset-handler.S | 1 +
 1 file changed, 1 insertion(+)
