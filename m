From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix ignored return value of regulator_enable
Date: Wed,  6 Mar 2013 17:16:25 -0700
Message-ID: <1362615385-13418-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This fixes:

arch/arm/mach-tegra/board-harmony-pcie.c: In function =E2=80=98harmony_=
pcie_init=E2=80=99:
arch/arm/mach-tegra/board-harmony-pcie.c:65:18: warning: ignoring retur=
n
    value of =E2=80=98regulator_enable=E2=80=99, declared with attribut=
e
    warn_unused_result [-Wunused-result]

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pcie.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-t=
egra/board-harmony-pcie.c
index 3cdc1bb..d195db0 100644
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ b/arch/arm/mach-tegra/board-harmony-pcie.c
@@ -62,7 +62,11 @@ int __init harmony_pcie_init(void)
 		goto err_reg;
 	}
=20
-	regulator_enable(regulator);
+	err =3D regulator_enable(regulator);
+	if (err) {
+		pr_err("%s: regulator_enable failed: %d\n", __func__, err);
+		goto err_en;
+	}
=20
 	err =3D tegra_pcie_init(true, true);
 	if (err) {
@@ -74,6 +78,7 @@ int __init harmony_pcie_init(void)
=20
 err_pcie:
 	regulator_disable(regulator);
+err_en:
 	regulator_put(regulator);
 err_reg:
 	gpio_free(en_vdd_1v05);
--=20
1.7.10.4
