From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH 2/2] regulator: max77620: disable notifier events for FPS rails
Date: Thu, 10 Jan 2019 12:11:17 +0800
Message-ID: <20190110041117.8216-2-markz@nvidia.com>
References: <20190110041117.8216-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110041117.8216-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Disabling regulator notifier events if regulator is
configured part of flexible power sequencer(FPS),
there is no SW control to enable/disable if regulator
is configured part of FPS, so disabling notifier events
if client driver try to enable/disable FPS rails.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 drivers/regulator/max77620-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max=
77620-regulator.c
index cd93cf53e23c..20e985071bfc 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -823,6 +823,13 @@ static int max77620_regulator_probe(struct platform_de=
vice *pdev)
 				rdesc->name, ret);
 			return ret;
 		}
+
+		/* there is no SW control for rails which are part of FPS
+		 * set always no contraint to true to avoid regulator
+		 * enable/disable notification
+		 */
+		if (pmic->reg_pdata[id].active_fps_src !=3D MAX77620_FPS_SRC_NONE)
+			rdev->constraints->always_on =3D true;
 	}
=20
 	return 0;
--=20
2.19.2
