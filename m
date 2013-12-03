From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v4 0/3] regulator: tps6586x: add version detection and voltage tables
Date: Tue,  3 Dec 2013 23:18:45 +0100
Message-ID: <cover.1386108712.git.stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is the 4rd version of this patchset which adds version detection
for the tps6586x mfd family. Just discovered a missing null reference
check which did not triggered in my tests, sorry about that.

This is required because some regulator versions use different voltage
tables. The regulator driver now uses the right voltage table according
to the version.

While at it, there are a few other incorrect regulator entries in the
device tree, change them accordingly (this patch is new and grew out
of a patch with the same name which Lucas Stach posted in July).

Tested on Colibri T20 V1.1 and V1.2 which makes use of diffent version
of that regulator.

Changes since v3:
  - Check if version specific table is necessary

Changes since v2:
  - Avoid moving devm_kzalloc
  - Removed reg_ from reg_version
  - Moved walk through version dependent tables to find_regulator_info,
    removed the inline definition. This reduces .o size and encapsulates
    the logic of finding the right regulator into one function. It comes
    with a slight code duplication, the table search now appears twice.

Changes since v1:
  - Merged DT and driver change (preserves bisectability)
  - Use different regulator tables for different regulator version
    * This also makes the TPS6586X_ANY version needless
  - Replaced enum with defines
  - Move version message in a sperate function
  - Include regulator bugfix, use correct supply voltage
  - Checked all voltages, fix SM0/SM1 (Core/CPU) and LDO6 voltage (VDAC/VI)
    in another commit
  - Rebased on top of v3.13-rc2


Stefan Agner (3):
  mfd: tps6586x: add version detection
  regulator: tps6586x: add and use correct voltage table
  ARM: tegra: correct Colibri T20 regulator settings

 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 34 +++++------
 drivers/mfd/tps6586x.c                     | 43 ++++++++++++--
 drivers/regulator/tps6586x-regulator.c     | 93 ++++++++++++++++++++++++------
 include/linux/mfd/tps6586x.h               |  7 +++
 4 files changed, 136 insertions(+), 41 deletions(-)

-- 
1.8.4.2
