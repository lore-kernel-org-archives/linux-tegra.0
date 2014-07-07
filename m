From: Guillaume Clement <gclement@baobob.org>
Subject: [PATCH 4/5] staging:nvec: Add missing blank line after declarations.
Date: Tue,  8 Jul 2014 00:31:36 +0200
Message-ID: <1404772297-6549-5-git-send-email-gclement@baobob.org>
References: <1404772297-6549-1-git-send-email-gclement@baobob.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404772297-6549-1-git-send-email-gclement@baobob.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Guillaume Clement <gclement@baobob.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Guillaume Cl=C3=A9ment <gclement@baobob.org>
---
 drivers/staging/nvec/nvec_power.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/n=
vec_power.c
index aacfcd6..6446e15 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -226,6 +226,7 @@ static int nvec_power_get_property(struct power_sup=
ply *psy,
 				   union power_supply_propval *val)
 {
 	struct nvec_power *power =3D dev_get_drvdata(psy->dev->parent);
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_ONLINE:
 		val->intval =3D power->on;
--=20
1.8.5.5
