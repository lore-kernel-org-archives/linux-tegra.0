From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 0/2] pinctrl: tegra-xusb: Clean-up and fixes
Date: Wed, 27 May 2015 14:11:52 +0100
Message-ID: <1432732314-372-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some clean-up and fixes for tegra-xusb driver.

This had been boot tested on tegra20-trimslice, tegra30-beaver,
tegra114-dalmore-a04 and tegra124-jetson-tk1 and no issues seen.
Complete test information can be found below.

http://nvt.pwsan.com/pub/jonathanh-tester/testlogs/test_20150527055028_b031599c28a38c92b745822d702e9b073d49dbaa/20150527055028

Changes since v1:
- Dropped 3rd patch as it was unnecessary
- Simplified implementation of get_group_pins function based upon
  Thierry's feedback.

Jon Hunter (2):
  pinctrl: tegra-xusb: Remove unused structure
  pinctrl: tegra-xusb: Fix allocation of pins

 drivers/pinctrl/pinctrl-tegra-xusb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
1.9.1

