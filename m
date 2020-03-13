From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 02/10] firmware: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:40 +0100
Message-ID: <20200313165848.2915133-2-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313165848.2915133-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-firmware

for you to fetch changes up to 6c2d3a14b7aff13f74fb2331d9a54202c66bea4d:

  firmware: tegra: Fix a typo in Kconfig (2020-02-17 08:54:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.7-rc1

A trivial typofix for the Kconfig entry of the Tegra IVC library.

----------------------------------------------------------------
Christophe JAILLET (1):
      firmware: tegra: Fix a typo in Kconfig

 drivers/firmware/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
