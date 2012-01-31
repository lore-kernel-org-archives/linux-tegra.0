From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 3/5] ARM: dt: tegra: add ADT7461 temperature sensor to paz00 device tree
Date: Tue, 31 Jan 2012 19:53:21 +0100
Message-ID: <9421201.72pNsFM5zn@ax5200p>
References: <cover.1327776641.git.marvin24@gmx.de> <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF178E12414D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E12414D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the ADT7461 temperature monitoring IC which is connected via
the DVC controller.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-
paz00.dts
index f667343..81e1d30 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -35,6 +35,11 @@
 
        i2c@7000d000 {
                clock-frequency = <400000>;
+
+               adt7461@4c {
+                       compatible = "adi,adt7461";
+                       reg = <0x4c>;
+               };
        };
 
        i2s@70002800 {
-- 
1.7.5.4
