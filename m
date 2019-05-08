From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v5.2 merge window
Date: Wed, 8 May 2019 12:51:37 +0100
Message-ID: <20190508115137.GM31645@dell>
References: <20190505154325.30026-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190505154325.30026-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Enjoy!

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v5.2

for you to fetch changes up to 744b13107d0d2ec36c5293d7b59129d3186c9396:

  mfd: max77620: Provide system power-off functionality (2019-05-08 12:50:14 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v5.2 merge window

----------------------------------------------------------------
Dmitry Osipenko (5):
      dt-bindings: mfd: max77620: Add compatible for Maxim 77663
      dt-bindings: mfd: max77620: Add system-power-controller property
      mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
      mfd: max77620: Support Maxim 77663
      mfd: max77620: Provide system power-off functionality

 Documentation/devicetree/bindings/mfd/max77620.txt |  9 ++-
 drivers/mfd/max77620.c                             | 87 +++++++++++++++++++++-
 include/linux/mfd/max77620.h                       |  5 +-
 3 files changed, 97 insertions(+), 4 deletions(-)
 
-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
