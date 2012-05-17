From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra20: Rename "emc" to "memory-controller"
Date: Thu, 17 May 2012 08:47:47 +0300
Message-ID: <1337233667-23770-4-git-send-email-hdoyu@nvidia.com>
References: <CAOesGMhw5hJSF96FBuENnwx2=ACyAYwX6uny9zQeTsimcebF8A@mail.gmail.com>
 <1337233667-23770-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337233667-23770-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use a more plain english name.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/arm/tegra/emc.txt          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/emc.txt b/Documentation/devicetree/bindings/arm/tegra/emc.txt
index 09335f8..4c33b29 100644
--- a/Documentation/devicetree/bindings/arm/tegra/emc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/emc.txt
@@ -15,7 +15,7 @@ Child device nodes describe the memory settings for different configurations and
 
 Example:
 
-	emc@7000f400 {
+	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
-- 
1.7.5.4
