From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/5] dt-bindings: Add memory controller bindings
Date: Thu, 13 Feb 2020 17:39:55 +0100
Message-ID: <20200213163959.819733-2-thierry.reding@gmail.com>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200213163959.819733-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add the DT schema for memory controller and consumer bindings.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/memory-controllers/consumer.yaml | 14 ++++++++
 .../memory-controllers/memory-controller.yaml | 32 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/consumer.yaml b/Documentation/devicetree/bindings/memory-controllers/consumer.yaml
new file mode 100644
index 000000000000..7b71a6110c51
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/consumer.yaml
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common memory controller consumer binding
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+
+properties:
+  memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
diff --git a/Documentation/devicetree/bindings/memory-controllers/memory-controller.yaml b/Documentation/devicetree/bindings/memory-controllers/memory-controller.yaml
new file mode 100644
index 000000000000..26257a666c3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/memory-controller.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common memory controller binding
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+
+description: |
+  The memory access hierarchy in a modern device can be fairly complicated.
+  Accesses to system memory typically end up going through a memory controller
+  that ensures that data is stored. Along the way, these accesses can undergo
+  classification and be prioritized and/or arbitrated.
+
+  The interconnect bindings (see ../interconnect/interconnect.txt) provides a
+  way of describing the data paths between devices and system memory. However
+  these interconnect paths, in order to be most flexible, describe the paths
+  in a very fine-grained way, so situations can arise where it is no longer
+  possible to derive a unique memory parent for any given device.
+
+  In order to remove such potential ambiguities, a memory controller can be
+  specified in device tree. A memory controller specified in this way will be
+  used as the DMA parent for a given device. The memory controller defines a
+  memory bus via the "dma-ranges" property, which will in turn be used to set
+  the range of memory accessible to DMA children of the memory controller.
+
+properties:
+  "#memory-controller-cells": true
+  dma-ranges: true
-- 
2.24.1
