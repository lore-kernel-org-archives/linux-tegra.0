From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 8/8] dt-bindings: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:53 +0100
Message-ID: <20200111003553.2411874-8-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200111003553.2411874-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm64-defconfig

for you to fetch changes up to ddb8840d2777bfca7c9ebc8c24ea20f9a37145ba:

  arm64: defconfig: Enable tegra XUDC support (2020-01-10 18:34:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.6-rc1

This contains a conversion of the Tegra124 EMC bindings to json-schema
as well as the addition of the bindings for the memory subsystem found
on Tegra186 and Tegra194.

----------------------------------------------------------------
Nagarjuna Kristam (1):
      arm64: defconfig: Enable tegra XUDC support

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
