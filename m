From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/2] regulator: tps6586x: support for input supply
Date: Fri, 13 Jul 2012 19:20:30 +0530
Message-ID: <1342187432-18668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, ccross@android.com, olof@lixom.net, swarren@wwwdotorg.org, lrg@ti.com
Cc: thierry.reding@avionic-design.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch series add the support for the input supply of tps6586x
regulator.
The changes are based on on discussion on patch
[PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
on which the input supply name should be require in DT case and
unconditionally set on the desc.supply_name.

To add this, the existing user (non-dt) of this PMIC also need to fill
require input supply so that it will not break the functionality with
this support.
Currently harmony is using this PMIC and hence making the changes
on this as first change of series to avoid any functionality break.

The grep shows that there is no more user of this regulator and hence it
is safe to change in tps6586x regulator driver.

Laxman Dewangan (2):
  ARM: tegra: harmony: add regulator supply name and its input supply
  regulator: tps6586x: add support for input supply

 .../devicetree/bindings/regulator/tps6586x.txt     |   17 +++++++
 arch/arm/mach-tegra/board-harmony-power.c          |   33 ++++++++-----
 drivers/regulator/tps6586x-regulator.c             |   47 ++++++++++---------
 3 files changed, 62 insertions(+), 35 deletions(-)

