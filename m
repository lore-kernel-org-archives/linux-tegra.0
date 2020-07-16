From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/9] dt-bindings: fuse: tegra: Document Tegra234 compatible string
Date: Thu, 16 Jul 2020 16:18:50 +0200
Message-ID: <20200716141856.544718-4-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra234 FUSE block is very similar to that on prior chips but not
completely compatible. Document the new compatible string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 2aaf661c04ee..b76cf42639f1 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -7,6 +7,7 @@ Required properties:
   For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
   For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
   "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
+  For Tegra234 must conatin "nvidia,tegra234-efuse".
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
-- 
2.27.0
