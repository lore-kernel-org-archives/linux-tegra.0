From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 6/7] ARM: tegra: Default configuration changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:59 +0200
Message-ID: <20200717161300.1661002-6-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717161300.1661002-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm-defconfig

for you to fetch changes up to 3a3cb021b0380e2cbf7e1d158c37402874b54a9a:

  ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500 (2020-07-16 14:22:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.9-rc1

Enables a few new configuration options that are useful on the new Nexus
7 and Acer A500 devices, as well as the userspace CPU frequency governor
that's mainly used for testing.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500

Jon Hunter (1):
      ARM: tegra: Enable CPUFREQ userspace governor

 arch/arm/configs/tegra_defconfig | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
