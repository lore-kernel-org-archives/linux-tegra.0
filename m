From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/4] ARM: tegra: Core SoC changes for v4.4-rc1
Date: Tue, 20 Oct 2015 15:17:36 +0200
Message-ID: <1445347058-8834-2-git-send-email-thierry.reding@gmail.com>
References: <1445347058-8834-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445347058-8834-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.4-soc

for you to fetch changes up to e77b675f8786f38d40fc1562e1275875daf67fef:

  ARM: tegra: paz00: use con_id's to refer GPIO's in gpiod_lookup table (2015-10-02 14:30:57 +0200)

----------------------------------------------------------------
ARM: tegra: Core SoC changes for v4.4-rc1

A single patch to restore rfkill support on AC100.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: paz00: use con_id's to refer GPIO's in gpiod_lookup table

 arch/arm/mach-tegra/board-paz00.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
