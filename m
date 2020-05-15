From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 04/11] of: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:04 +0200
Message-ID: <20200515145311.1580134-5-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-of

for you to fetch changes up to 4a470f00e10e3336350ab60ec6c3206177093019:

  of: Make <linux/of_reserved_mem.h> self-contained (2020-05-12 22:45:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
of: Changes for v5.8-rc1

These changes add support for multiple reserved-memory regions per
device.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      of: Make <linux/of_reserved_mem.h> self-contained

Thierry Reding (2):
      of: reserved-memory: Support lookup of regions by name
      of: reserved-memory: Support multiple regions per device

 drivers/of/of_reserved_mem.c    | 41 +++++++++++++++++++++++++++++------------
 include/linux/of_reserved_mem.h | 12 ++++++++++++
 2 files changed, 41 insertions(+), 12 deletions(-)
