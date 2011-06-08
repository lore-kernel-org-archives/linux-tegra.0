From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] ARM: tegra/harmony: enable USB host ports
Date: Wed,  8 Jun 2011 11:13:38 +0100
Message-ID: <1307528018-14454-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Harmony board code doesn't have any support for USB, leaving
the board without any ethernet support. Add the necessary
declarations to have it up and running, at least for the J6 and J25
connectors, as well as the ethernet port.

The OTG port is left unused, short of any documentation.

Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
Not sure if this is the right time to send this, as this should
eventually be handled by the device tree. May be useful to some
people in the meantime.

Patch against v3.0-rc2.

 arch/arm/mach-tegra/board-harmony.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/boar=
d-harmony.c
index 30e18bc..b95156a 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -26,6 +26,7 @@
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/i2c-tegra.h>
+#include <linux/platform_data/tegra_usb.h>
=20
 #include <sound/wm8903.h>
=20
@@ -143,6 +144,8 @@ static struct platform_device *harmony_devices[] __init=
data =3D {
 =09&tegra_das_device,
 =09&tegra_pcm_device,
 =09&harmony_audio_device,
+=09&tegra_ehci1_device,
+=09&tegra_ehci3_device,
 };
=20
 static void __init tegra_harmony_fixup(struct machine_desc *desc,
@@ -185,6 +188,10 @@ static struct tegra_sdhci_platform_data sdhci_pdata4 =
=3D {
 =09.is_8bit=09=3D 1,
 };
=20
+static struct tegra_ehci_platform_data ehci_data =3D {
+=09.operating_mode =3D TEGRA_USB_HOST,
+};
+
 static void __init tegra_harmony_init(void)
 {
 =09tegra_clk_init_from_table(harmony_clk_init_table);
@@ -195,6 +202,9 @@ static void __init tegra_harmony_init(void)
 =09tegra_sdhci_device2.dev.platform_data =3D &sdhci_pdata2;
 =09tegra_sdhci_device4.dev.platform_data =3D &sdhci_pdata4;
=20
+=09tegra_ehci1_device.dev.platform_data =3D &ehci_data;
+=09tegra_ehci3_device.dev.platform_data =3D &ehci_data;
+
 =09platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
 =09harmony_i2c_init();
 =09harmony_regulator_init();
--=20
1.7.0.4
