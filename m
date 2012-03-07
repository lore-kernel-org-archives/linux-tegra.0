From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] regulator: tps65910: Configure correct value for VDDCTRL vout reg
Date: Wed,  7 Mar 2012 16:39:05 +0530
Message-ID: <1331118545-26514-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

As per datasheet, the voltage output is defined as
from SEL[6:0] =3D 3 to 64 (dec)
Vout=3D (SEL[6:0] =C3=97 12.5 mV + 562.5 mV)

The list_voltage returns the vout as
    600mV +  selector * 12.5mV

and so equivalent VSEL is selector + 3.
Adding 3 on selector when configuring VSEL register for
VDDCTRL output.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps65910-regulator.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator=
/tps65910-regulator.c
index 15b5f1e..8de2835 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -715,7 +715,7 @@ static int tps65910_set_voltage_dcdc(struct regulat=
or_dev *dev,
 		tps65910_reg_write(pmic, TPS65910_VDD2_OP, vsel);
 		break;
 	case TPS65911_REG_VDDCTRL:
-		vsel =3D selector;
+		vsel =3D selector + 3;
 		tps65910_reg_write(pmic, TPS65911_VDDCTRL_OP, vsel);
 	}
=20
--=20
1.7.1.1
