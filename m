From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH 1/2] regulator: max77620: Initialize values for DT properties
Date: Thu, 10 Jan 2019 12:11:16 +0800
Message-ID: <20190110041117.8216-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Jinyoung Park <jinyoungp@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If regulator DT node doesn't exist, its of_parse_cb callback
function isn't called. Then all values for DT properties are
filled with zero. This leads to wrong register update for
FPS and POK settings.

Signed-off-by: Jinyoung Park <jinyoungp@nvidia.com>
Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 drivers/regulator/max77620-regulator.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max=
77620-regulator.c
index b94e3a721721..cd93cf53e23c 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -1,7 +1,7 @@
 /*
  * Maxim MAX77620 Regulator driver
  *
- * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2018, NVIDIA CORPORATION.  All rights reserved.
  *
  * Author: Mallikarjun Kasoju <mkasoju@nvidia.com>
  *	Laxman Dewangan <ldewangan@nvidia.com>
@@ -803,6 +803,14 @@ static int max77620_regulator_probe(struct platform_de=
vice *pdev)
 		rdesc =3D &rinfo[id].desc;
 		pmic->rinfo[id] =3D &max77620_regs_info[id];
 		pmic->enable_power_mode[id] =3D MAX77620_POWER_MODE_NORMAL;
+		pmic->reg_pdata[id].active_fps_src =3D -1;
+		pmic->reg_pdata[id].active_fps_pd_slot =3D -1;
+		pmic->reg_pdata[id].active_fps_pu_slot =3D -1;
+		pmic->reg_pdata[id].suspend_fps_src =3D -1;
+		pmic->reg_pdata[id].suspend_fps_pd_slot =3D -1;
+		pmic->reg_pdata[id].suspend_fps_pu_slot =3D -1;
+		pmic->reg_pdata[id].power_ok =3D -1;
+		pmic->reg_pdata[id].ramp_rate_setting =3D -1;
=20
 		ret =3D max77620_read_slew_rate(pmic, id);
 		if (ret < 0)
--=20
2.19.2
