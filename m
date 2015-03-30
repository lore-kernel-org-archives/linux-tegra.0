From: Andrey Danin <danindrey@mail.ru>
Subject: [PATCH v2 0/4]  arm: tegra: implement NVEC driver using tegra i2c.
Date: Mon, 30 Mar 2015 23:00:11 +0300
Message-ID: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
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
To: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Julian Andres Klode <jak@jak-linux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Marc Dietrich <marvin24@gmx.de>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Andrey Danin <danindrey@mail.ru>
List-Id: linux-tegra@vger.kernel.org

NVEC driver contains code to manage tegra i2c controller in slave mode.
I2C slave support was implemented in linux kernel. The goal of this
patch serie is to implement I2C slave mode in tegra drived and rework
NVEC driver to use it.

Patches are based on i2c for-next.

Changes for v2:
- rebased on top of new i2c slave framework.
- old code is removed in separate patch
- documentation patch is integrated to main nvec patch


Thanks in advance

Andrey Danin (4):
  i2c: tegra: implement slave mode
  staging/nvec: reimplement on top of tegra i2c driver
  staging/nvec: remove old code
  dt: paz00: define nvec as child of i2c bus

 .../devicetree/bindings/nvec/nvidia,nvec.txt       |  21 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |  22 +-
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-tegra.c                     | 119 ++++++
 drivers/staging/nvec/nvec.c                        | 411 +++++++--------------
 drivers/staging/nvec/nvec.h                        |  10 -
 6 files changed, 269 insertions(+), 315 deletions(-)

-- 
1.9.1
