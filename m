From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 0/7] Add cros_ec changes for newer boards
Date: Thu, 17 Apr 2014 10:59:23 -0700
Message-ID: <1397757570-19750-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org, abrestic@chromium.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Matt Porter <matt.porter@linaro.org>, Jean Delvare <jdelvare@suse.de>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Kevin Strasser <kevin.strasser@linux.intel.com>, dgreid@chromium.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>
List-Id: linux-tegra@vger.kernel.org

This series adds the most critical cros_ec changes for newer boards
using cros_ec.  Specifically:
* Fixes timing/locking issues with the previously upstreamed (but
  never used upstream) cros_ec_spi driver.
* Updates the cros_ec header file to the latest version which allows
  us to use newer EC features like i2c tunneling.
* Adds an i2c tunnel driver to allow communication to the EC's i2c
  devices.

This _doesn't_ get the EC driver fully up to speed with what's in the
current Chromium OS trees.  There are a whole slew of cleanup patches
there, an addition of an LPC transport mode, and exports of functions
to userspace.  Once these patches land and we have functionality we
can continue to pick more cleanup patches.


Bill Richardson (1):
  mfd: cros_ec: Sync to the latest cros_ec_commands.h from EC sources

David Hendricks (1):
  mfd: cros_ec: spi: calculate delay between transfers correctly

Doug Anderson (5):
  mfd: cros_ec: spi: Add mutex to cros_ec_spi
  mfd: cros_ec: spi: Make the cros_ec_spi timeout more reliable
  mfd: cros_ec: spi: Increase cros_ec_spi deadline from 5ms to 100ms
  i2c: ChromeOS EC tunnel driver
  ARM: tegra: Add the EC i2c tunnel to tegra124-venice2

 .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |   36 +
 arch/arm/boot/dts/tegra124-venice2.dts             |   27 +
 drivers/i2c/busses/Kconfig                         |    9 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |  304 ++++++
 drivers/mfd/cros_ec.c                              |    7 +-
 drivers/mfd/cros_ec_spi.c                          |   67 +-
 include/linux/mfd/cros_ec.h                        |    4 +-
 include/linux/mfd/cros_ec_commands.h               | 1128 ++++++++++++++++++--
 9 files changed, 1491 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
 create mode 100644 drivers/i2c/busses/i2c-cros-ec-tunnel.c

-- 
1.9.1.423.g4596e3a
