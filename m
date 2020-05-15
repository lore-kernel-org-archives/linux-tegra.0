From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 01/11] cpufreq: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:01 +0200
Message-ID: <20200515145311.1580134-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-cpufreq

for you to fetch changes up to 9ce274630495c731257fb1b569dd7b84a2fdba14:

  cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported now) (2020-05-06 18:59:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
cpufreq: Changes for v5.8-rc1

This change move Tegra20 and Tegra30 to the generic DT CPU frequency
scaling driver.

----------------------------------------------------------------
Dmitry Osipenko (1):
      cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported now)

 drivers/cpufreq/Kconfig.arm       |   6 +-
 drivers/cpufreq/tegra20-cpufreq.c | 217 ++++++++++----------------------------
 2 files changed, 59 insertions(+), 164 deletions(-)
