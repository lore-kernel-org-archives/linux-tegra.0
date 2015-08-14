From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/9] pinctrl: tegra: Changes for v4.3-rc1
Date: Fri, 14 Aug 2015 16:48:33 +0200
Message-ID: <1439563720-13189-3-git-send-email-thierry.reding@gmail.com>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-pinctrl

for you to fetch changes up to 9462510ce31e2b91156bdcc33e4c737e6768e5f8:

  pinctrl: tegra: Only set the gpio range if needed (2015-08-13 16:24:33 +0200)

As mentioned before I've created this branch with Tomeu's change and
based the for-4.3/dt branch onto that. Feel free to pull this into your
tree if necessary. It will also go in through the ARM SoC tree via the
device tree updates that depend upon it.

Thierry

----------------------------------------------------------------
pinctrl: tegra: Changes for v4.3-rc1

Contains a single patch from Tomeu to avoid setting up a duplicate GPIO
range.

----------------------------------------------------------------
Tomeu Vizoso (1):
      pinctrl: tegra: Only set the gpio range if needed

 drivers/pinctrl/pinctrl-tegra.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)
