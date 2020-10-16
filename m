Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6596FC433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E99B420874
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="BM+gDtdQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409189AbgJPOoT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:44:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5206 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406217AbgJPOoT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:44:19 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1b60000>; Fri, 16 Oct 2020 07:44:06 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:13 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:08 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 08/15] Documentation: of: Convert graph bindings to json-schema
Date:   Fri, 16 Oct 2020 20:12:55 +0530
Message-ID: <1602859382-19505-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859446; bh=jWRpaO6+ufXye6eS4TZZr1rUWXu2uIk2/BIw1aq0LCQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=BM+gDtdQ0/q6cT502cruOYe9mz5sKqWFZemy5b6XME0AT7F4YX5SOUsL3EguiVUOw
         uGcEFlooptA2Qn2vCkSrBubV67jy/BAfx7Aez7cklNKhAU/w0Cl+mYMsUq+Z0pjKDD
         aqzM6gYQnngSZs4AprjYat5dphbzNtEFR9OFz4oy5iOEuDN5/VatyfNQ9wLUSCMdln
         rzuGeXR+3JJRIW9BFGg2PeR0+ZbE4GFh+9Fa7x+79XWBYZ8ttdZnZprxTny30hPlzu
         65ZPr0aKOjW43X6A+hMfNGjMqwPB8YUuEx5QDAXtd0LYfX1ztcbs4FA16GzKcC8ByM
         Jv+criz+RHJaw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert device tree bindings of graph to YAML format.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/devicetree/bindings/graph.txt  | 128 --------------------
 Documentation/devicetree/bindings/graph.yaml | 170 +++++++++++++++++++++++++++
 2 files changed, 170 insertions(+), 128 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/graph.txt
 create mode 100644 Documentation/devicetree/bindings/graph.yaml

diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
deleted file mode 100644
index 0415e2c..0000000
--- a/Documentation/devicetree/bindings/graph.txt
+++ /dev/null
@@ -1,128 +0,0 @@
-Common bindings for device graphs
-
-General concept
----------------
-
-The hierarchical organisation of the device tree is well suited to describe
-control flow to devices, but there can be more complex connections between
-devices that work together to form a logical compound device, following an
-arbitrarily complex graph.
-There already is a simple directed graph between devices tree nodes using
-phandle properties pointing to other nodes to describe connections that
-can not be inferred from device tree parent-child relationships. The device
-tree graph bindings described herein abstract more complex devices that can
-have multiple specifiable ports, each of which can be linked to one or more
-ports of other devices.
-
-These common bindings do not contain any information about the direction or
-type of the connections, they just map their existence. Specific properties
-may be described by specialized bindings depending on the type of connection.
-
-To see how this binding applies to video pipelines, for example, see
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-Here the ports describe data interfaces, and the links between them are
-the connecting data buses. A single port with multiple connections can
-correspond to multiple devices being connected to the same physical bus.
-
-Organisation of ports and endpoints
------------------------------------
-
-Ports are described by child 'port' nodes contained in the device node.
-Each port node contains an 'endpoint' subnode for each remote device port
-connected to this port. If a single port is connected to more than one
-remote device, an 'endpoint' child node must be provided for each link.
-If more than one port is present in a device node or there is more than one
-endpoint at a port, or a port node needs to be associated with a selected
-hardware interface, a common scheme using '#address-cells', '#size-cells'
-and 'reg' properties is used to number the nodes.
-
-device {
-        ...
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        port@0 {
-	        #address-cells = <1>;
-	        #size-cells = <0>;
-		reg = <0>;
-
-                endpoint@0 {
-			reg = <0>;
-			...
-		};
-                endpoint@1 {
-			reg = <1>;
-			...
-		};
-        };
-
-        port@1 {
-		reg = <1>;
-
-		endpoint { ... };
-	};
-};
-
-All 'port' nodes can be grouped under an optional 'ports' node, which
-allows to specify #address-cells, #size-cells properties for the 'port'
-nodes independently from any other child device nodes a device might
-have.
-
-device {
-        ...
-        ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                        ...
-                        endpoint@0 { ... };
-                        endpoint@1 { ... };
-                };
-
-                port@1 { ... };
-        };
-};
-
-Links between endpoints
------------------------
-
-Each endpoint should contain a 'remote-endpoint' phandle property that points
-to the corresponding endpoint in the port of the remote device. In turn, the
-remote endpoint should contain a 'remote-endpoint' property. If it has one, it
-must not point to anything other than the local endpoint. Two endpoints with
-their 'remote-endpoint' phandles pointing at each other form a link between the
-containing ports.
-
-device-1 {
-        port {
-                device_1_output: endpoint {
-                        remote-endpoint = <&device_2_input>;
-                };
-        };
-};
-
-device-2 {
-        port {
-                device_2_input: endpoint {
-                        remote-endpoint = <&device_1_output>;
-                };
-        };
-};
-
-Required properties
--------------------
-
-If there is more than one 'port' or more than one 'endpoint' node or 'reg'
-property present in the port and/or endpoint nodes then the following
-properties are required in a relevant parent node:
-
- - #address-cells : number of cells required to define port/endpoint
-                    identifier, should be 1.
- - #size-cells    : should be zero.
-
-Optional endpoint properties
-----------------------------
-
-- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
-
diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
new file mode 100644
index 0000000..67804c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/graph.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/graph.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common bindings for device graphs
+
+description: |
+  The hierarchical organisation of the device tree is well suited to describe
+  control flow to devices, but there can be more complex connections between
+  devices that work together to form a logical compound device, following an
+  arbitrarily complex graph.
+  There already is a simple directed graph between devices tree nodes using
+  phandle properties pointing to other nodes to describe connections that
+  can not be inferred from device tree parent-child relationships. The device
+  tree graph bindings described herein abstract more complex devices that can
+  have multiple specifiable ports, each of which can be linked to one or more
+  ports of other devices.
+
+  These common bindings do not contain any information about the direction or
+  type of the connections, they just map their existence. Specific properties
+  may be described by specialized bindings depending on the type of connection.
+
+  To see how this binding applies to video pipelines, for example, see
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  Here the ports describe data interfaces, and the links between them are
+  the connecting data buses. A single port with multiple connections can
+  correspond to multiple devices being connected to the same physical bus.
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+definitions:
+
+  port:
+    type: object
+    description: |
+      If there is more than one 'port' or more than one 'endpoint' node
+      or 'reg' property present in the port and/or endpoint nodes then
+      '#address-cells' and '#size-cells' properties are required in relevant
+      parent node.
+
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        type: object
+        properties:
+          remote-endpoint:
+            description: |
+              phandle to an 'endpoint' subnode of a remote device node.
+            $ref: /schemas/types.yaml#/definitions/phandle
+
+  ports:
+    type: object
+    patternProperties:
+      "^port(@[0-9a-f]+)?$":
+        $ref: "#/definitions/port"
+
+properties:
+  ports:
+    $ref: "#/definitions/ports"
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: "#/definitions/port"
+
+additionalProperties: false
+
+examples:
+  # Organisation of ports and endpoints:
+  #
+  # Ports are described by child 'port' nodes contained in the device node.
+  # Each port node contains an 'endpoint' subnode for each remote device port
+  # connected to this port. If a single port is connected to more than one
+  # remote device, an 'endpoint' child node must be provided for each link.
+  # If more than one port is present in a device node or there is more than
+  # one endpoint at a port, or a port node needs to be associated with a
+  # selected hardware interface, a common scheme using '#address-cells',
+  # '#size-cells' and 'reg' properties is used to number the nodes.
+  - |
+    device {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            endpoint@0 {
+                reg = <0>;
+                // ...
+            };
+            endpoint@1 {
+                reg = <1>;
+                // ...
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            endpoint {
+                // ...
+            };
+        };
+    };
+
+  # All 'port' nodes can be grouped under an optional 'ports' node, which
+  # allows to specify #address-cells, #size-cells properties for the 'port'
+  # nodes independently from any other child device nodes a device might
+  # have.
+  - |
+    device {
+        // ...
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                // ...
+
+                endpoint@0 {
+                    reg = <0>;
+                    // ...
+                };
+                endpoint@1 {
+                    reg = <1>;
+                    // ...
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+                // ...
+            };
+        };
+    };
+
+  # Links between endpoints:
+  #
+  # Each endpoint should contain a 'remote-endpoint' phandle property that
+  # points to the corresponding endpoint in the port of the remote device.
+  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
+  # If it has one, it must not point to anything other than the local endpoint.
+  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
+  # form a link between the containing ports.
+  - |
+    device-1 {
+        port {
+            device_1_output: endpoint {
+                remote-endpoint = <&device_2_input>;
+            };
+        };
+    };
+
+    device-2 {
+        port {
+            device_2_input: endpoint {
+                remote-endpoint = <&device_1_output>;
+            };
+        };
+    };
+
+...
-- 
2.7.4

