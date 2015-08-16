From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: add "jedec,spi-nor" flash compatible binding
Date: Sun, 16 Aug 2015 08:13:25 +0200
Message-ID: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
"nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
binding indicating support for JEDEC identification.

Use it for all flashes that are supposed to support READ ID op accordin=
g
to the datasheets.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi      | 2 +-
 arch/arm/boot/dts/tegra124-venice2.dts    | 2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts   | 2 +-
 arch/arm/boot/dts/tegra30-beaver.dts      | 2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts=
/tegra114-dalmore.dts
index 8b7aa0d..5de23de 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1082,7 +1082,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <25000000>;
 		spi-flash@0 {
-			compatible =3D "winbond,w25q32dw";
+			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
 			reg =3D <0>;
 			spi-max-frequency =3D <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/=
dts/tegra124-jetson-tk1.dts
index bd43ed6..44097c6 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1611,7 +1611,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <25000000>;
 		spi-flash@0 {
-			compatible =3D "winbond,w25q32dw";
+			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
 			reg =3D <0>;
 			spi-max-frequency =3D <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/t=
egra124-nyan.dtsi
index a9aec23..7d26f49 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -343,7 +343,7 @@
 		spi-max-frequency =3D <25000000>;
=20
 		flash@0 {
-			compatible =3D "winbond,w25q32dw";
+			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
 			spi-max-frequency =3D <25000000>;
 			reg =3D <0>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
index 79e724b..4decb3c 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -866,7 +866,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <25000000>;
 		spi-flash@0 {
-			compatible =3D "winbond,w25q32dw";
+			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
 			reg =3D <0>;
 			spi-max-frequency =3D <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dt=
s/tegra20-trimslice.dts
index d99af4e..c4cff8b 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -282,7 +282,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <48000000>;
 		spi-flash@0 {
-			compatible =3D "winbond,w25q80bl";
+			compatible =3D "winbond,w25q80bl", "jedec,spi-nor";
 			reg =3D <0>;
 			spi-max-frequency =3D <48000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/t=
egra30-beaver.dts
index 3dede39..c9d230c 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1884,7 +1884,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <25000000>;
 		spi-flash@1 {
-			compatible =3D "winbond,w25q32";
+			compatible =3D "winbond,w25q32", "jedec,spi-nor";
 			reg =3D <1>;
 			spi-max-frequency =3D <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/=
tegra30-cardhu.dtsi
index bb1ca15..df7f845 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -354,7 +354,7 @@
 		status =3D "okay";
 		spi-max-frequency =3D <25000000>;
 		spi-flash@1 {
-			compatible =3D "winbond,w25q32";
+			compatible =3D "winbond,w25q32", "jedec,spi-nor";
 			reg =3D <1>;
 			spi-max-frequency =3D <20000000>;
 		};
--=20
1.8.4.5
