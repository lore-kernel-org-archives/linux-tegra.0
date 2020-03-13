From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 04/10] memory: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:42 +0100
Message-ID: <20200313165848.2915133-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-memory

for you to fetch changes up to 141267bffd1dc19a76e4d50e3e4829f85a806875:

  memory: tegra: Correct debugfs clk rate-range on Tegra124 (2020-03-11 15:24:16 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.7-rc1

These patches contain fixes for EMC scaling debugfs support on Tegra20,
Tegra30 and Tegra124.

----------------------------------------------------------------
Dmitry Osipenko (3):
      memory: tegra: Correct debugfs clk rate-range on Tegra20
      memory: tegra: Correct debugfs clk rate-range on Tegra30
      memory: tegra: Correct debugfs clk rate-range on Tegra124

 drivers/memory/tegra/tegra124-emc.c | 5 +++++
 drivers/memory/tegra/tegra20-emc.c  | 5 +++++
 drivers/memory/tegra/tegra30-emc.c  | 5 +++++
 3 files changed, 15 insertions(+)
