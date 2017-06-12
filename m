From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: Add bindings for nvidia,tegra186-ccplex-cluster
Date: Mon, 12 Jun 2017 13:23:04 +0300
Message-ID: <1497262984-2346-1-git-send-email-mperttunen@nvidia.com>
References: <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496304245-24024-2-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
registers that initiate CPU frequency/voltage transitions.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt
new file mode 100644
index 000000000000..0c80cd8ee839
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt
@@ -0,0 +1,20 @@
+NVIDIA Tegra CCPLEX_CLUSTER area
+
+The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
+registers that initiate CPU frequency/voltage transitions.
+
+Required properties:
+- compatible: Should contain one of the following:
+  - "nvidia,tegra186-ccplex-cluster": for Tegra186
+- reg: Must contain an (offset, length) pair of the device's MMIO
+  register area
+- nvidia,bpmp: phandle to BPMP device that can be queried for OPP tables
+
+Example:
+
+	ccplex@e000000 {
+		compatible = "nvidia,tegra186-ccplex-cluster";
+		reg = <0x0 0x0e000000 0x0 0x3fffff>,
+
+		nvidia,bpmp = <&bpmp>;
+	};
-- 
2.1.4
