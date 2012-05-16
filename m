From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra{20,30}: Rename "MC" to "Memory Controller"
Date: Wed, 16 May 2012 09:53:46 +0300
Message-ID: <1337151226-7266-2-git-send-email-hdoyu@nvidia.com>
References: <20120516095107.3510cb39d0f9cd2527e0bf1e@nvidia.com>
 <1337151226-7266-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337151226-7266-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use a more plain english name.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/tegra/nvidia,tegra20-mc.txt       |    2 +-
 .../bindings/arm/tegra/nvidia,tegra30-mc.txt       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt
index c25a0a5..ea6d6b4 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt
@@ -8,7 +8,7 @@ Required properties:
 - interrupts : Should contain MC General interrupt.
 
 Example:
-	mc {
+	memory-controller {
 		compatible = "nvidia,tegra20-mc";
 		reg = <0x7000f000 0x024
 		       0x7000f03c 0x3c4>;
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
index e47e73f..bdf1a61 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
@@ -8,7 +8,7 @@ Required properties:
 - interrupts : Should contain MC General interrupt.
 
 Example:
-	mc {
+	memory-controller {
 		compatible = "nvidia,tegra30-mc";
 		reg = <0x7000f000 0x010
 		       0x7000f03c 0x1b4
-- 
1.7.5.4
