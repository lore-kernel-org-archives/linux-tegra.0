From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [TEGRA194_CPUFREQ PATCH v6 1/3] dt-bindings: arm: Add NVIDIA Tegra194 CPU Complex binding
Date: Wed, 15 Jul 2020 19:01:23 +0530
Message-ID: <1594819885-31016-2-git-send-email-sumitg@nvidia.com>
References: <1594819885-31016-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1594819885-31016-1-git-send-email-sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation to represent Tegra194
CPU Complex with compatible string under 'cpus' node. This
can be used by drivers like cpufreq which don't have their
node or CPU Complex node to bind to. Also, documenting
'nvidia,bpmp' property which points to BPMP device.

Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/nvidia,tegra194-ccplex.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml

diff --git a/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
new file mode 100644
index 0000000..1043e4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/nvidia,tegra194-ccplex.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NVIDIA Tegra194 CPU Complex device tree bindings
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+  - Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+description: |+
+  Tegra194 SOC has homogeneous architecture where each cluster has two
+  symmetric cores. Compatible string in "cpus" node represents the CPU
+  Complex having all clusters.
+
+properties:
+  $nodename:
+    const: cpus
+
+  compatible:
+    enum:
+      - nvidia,tegra194-ccplex
+
+  nvidia,bpmp:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      Specifies the bpmp node that needs to be queried to get
+      operating point data for all CPUs.
+
+examples:
+  - |
+    cpus {
+      compatible = "nvidia,tegra194-ccplex";
+      nvidia,bpmp = <&bpmp>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cpu0_0: cpu@0 {
+        compatible = "nvidia,tegra194-carmel";
+        device_type = "cpu";
+        reg = <0x0>;
+        enable-method = "psci";
+      };
+
+      cpu0_1: cpu@1 {
+        compatible = "nvidia,tegra194-carmel";
+        device_type = "cpu";
+        reg = <0x001>;
+        enable-method = "psci";
+      };
+
+      cpu1_0: cpu@100 {
+        compatible = "nvidia,tegra194-carmel";
+        device_type = "cpu";
+        reg = <0x100>;
+        enable-method = "psci";
+      };
+
+      cpu1_1: cpu@101 {
+        compatible = "nvidia,tegra194-carmel";
+        device_type = "cpu";
+        reg = <0x101>;
+        enable-method = "psci";
+      };
+    };
+...
-- 
2.7.4
