From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/3] pinctrl: bcm/samsung/tegra: make bool code non-modular
Date: Mon, 22 May 2017 16:56:45 -0400
Message-ID: <20170522205648.23545-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexandre Courbot <gnurou@gmail.com>, Ashwini Ghuge <aghuge@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Pritesh Raithatha <praithatha@nvidia.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Sherman Yin <syin@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@v
List-Id: linux-tegra@vger.kernel.org

This is the last of the pinctrl cleanups I have in my queue.  So
hopefully once these are in and any current but out-of-tree drivers
are submitted, there won't be any more examples of non-modular code
using modular infrastructure for people to inadvertently copy off of.

Nothing really new here -- if the Kconfig and/or the Makefile does
not allow building the code as modular, then we don't need to be
using module_xyz() functions and/or MODULE_XYZ macros.

Here we audit and remove such instances in three subdirectories of
the pinctrl subsystem: bcm, samsung, and tegra, which allows us
to have a positive net removal of unused code as per the diffstat.

Rather than do one commit per driver, we take advantage of the
fact that the drivers are grouped already and bundle the changes
per family, since the changes are not really deeply technical.

Build tested for allmodconfig on linux-next for arm, arm64; also
explicitly compiled each file for both arch to ensure nobody got
missed on the allmodconfig.  (there are missing renesas_sdhi syms
in today's linux-next arm but that is not caused by these changes.)

Linus - thanks for your patience in merging all these to date.

Paul.

---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Ashwini Ghuge <aghuge@nvidia.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Jon Mason <jonmason@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pritesh Raithatha <praithatha@nvidia.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Sherman Yin <syin@broadcom.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org

Paul Gortmaker (3):
  pinctrl: samsung: clean up modular vs. non-modular distinctions
  pinctrl: tegra: clean up modular vs. non-modular distinctions
  pinctrl: bcm: clean up modular vs. non-modular distinctions

 drivers/pinctrl/bcm/pinctrl-bcm281xx.c       | 16 ++++++++--------
 drivers/pinctrl/bcm/pinctrl-bcm2835.c        | 20 +++-----------------
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c     | 11 +++++------
 drivers/pinctrl/samsung/pinctrl-exynos.c     |  1 -
 drivers/pinctrl/samsung/pinctrl-exynos5440.c | 15 +++------------
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c    |  2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c    |  2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c    | 13 +------------
 drivers/pinctrl/tegra/pinctrl-tegra.c        |  1 -
 drivers/pinctrl/tegra/pinctrl-tegra114.c     | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra124.c     | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra20.c      | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra210.c     |  9 ++-------
 drivers/pinctrl/tegra/pinctrl-tegra30.c      | 11 ++++-------
 14 files changed, 40 insertions(+), 94 deletions(-)

-- 
2.11.0
