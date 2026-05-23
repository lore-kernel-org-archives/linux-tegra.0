Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F095356775
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525040; cv=none; b=h1584E9fEso8vnYgPkEovC62U3gFjNgNTQUbkAxhJECF2lDT+QS/YC5suzajtUG56C+UGPlFLy71wkcPtcLltH3YOZn6yNWDvlo+Ka94Vjfhq4n5Qn/QnxWvz9qU0NusrUKnRBM1u/0oZFhqLK0RLQY+pVO4UC92CKimLGF6J80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525040; c=relaxed/simple;
	bh=RFk4nd6bXVOHvzs0Um8Cm7YAd9OzwjBPCs0pyzgoFWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WiEj+yeyAGWNyLmFnGt6V5J48yBZU8Pr01edN8Cnn6djgbglbytcAOTcSXXR7g8tCc6/cJeFUN+3fIVJK9rmKD17On87Jp0MCDlGvJVmiAB/Nx0J0et9T1ovDWWRay0EjVbhzI5GAmZ0EtuJCj/JawikrlV7ARTIylh3okR88p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc675ppB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc675ppB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd8f9889a8cso919979466b.1
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525037; x=1780129837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csVvMr98OyRGdIIeLSoE7oflCBXwh48FuWRULAXXVcU=;
        b=oc675ppBo2F7gBEfP/n/NeUIwg8MU3fq00oAODh9iYz+WyRmsqF7EAMqZEPUfBbCIZ
         be2eLhO+UrtGyqPXm3Tx5+FZ4uQ/ChWj5Nk4tkIQ7XKJZD/+ZfTWOpet5eXIJyNqyPcO
         Z44NSPBPYZDnXTOQi6dF/vfH5V0J2dCjI+SfmQ+ljRR/CBgeCVW1poUsfIn5FdoyB8Uh
         zkpgHwyP44saQ2CqXh8ax8wzelauBobar0t06WjKMhUq+YnD3pyFa5LH/2tQGV/sG8Af
         aUq0olDHM3JTodU8hXyOcls+SwxSkD6v4gleByWrfA7JGOWDOYt7GzAhxCz70/GtZ/JW
         7nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525037; x=1780129837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csVvMr98OyRGdIIeLSoE7oflCBXwh48FuWRULAXXVcU=;
        b=hUKc9pz82ZO2S4/GyDlCXnu3R13E0sJLvtgiWPRc2ZCca9b17t8Mr206QmsnZD6AiU
         cjw9HpA7M3UE8so91athBGxYCIc+jKNki6sgZSqSAzk+umqIjPhU3lNWAGSfCQHLE9y8
         Jr5PrhWQNyv1RCMn+rjb5WPXGxMGtSDHIRwD8bir9gbJPrw3fWZKAYvzLbEkJXfRpo+a
         NGnlEQqcP7hWIxs+Cb8/0nK9Jq0bd5RBgardi6xxe0n5sMk4R2uRArLu3UwcAeebaoA2
         LbZYm03z4vEDeLLsdsFzykXUIJ7q3o3b1SbisiDxywsnercWQcLhsBx+hsDJdmZmzjE6
         Rr3A==
X-Forwarded-Encrypted: i=1; AFNElJ9cUfikJfRhGfL2D+A4qhCIroetE0jWxQFgdkMVst2g/z+k/U1mKl4FzLXCNhOtIfYPisFI5IoCcR+FmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhdqdDlQpU6CGWJNxgtu8cTToGZst86vxncMkNanxMtjKUJb6
	jCNynX8G8IrzRR+Envk9mDvxK2gaGOR+O6gM0VubFlXXnuoU+PYqt1Uz
X-Gm-Gg: Acq92OHxEGPXR0K/XjS8luqj+GMnUCxNrlglX1G2dgHHuTiTOaLWYRx9SMrrNXusdiq
	qAMp+hPcm7QOFkcUAC5U0aH4lRHUtmd3bhQ1ZechUYXleMl0GNlFBE+rlUZmMeMWyUlINhTQUu2
	XSww6ocLLtpGIHbvL+vS7KzVR/W745sPxB+DO+h23wTi9BcGYtyBedh5dU+Mr7dqzRpzrWg/It2
	oz57E3gyMElmHN6+MCWqePzQNB0qlbfFRPGeN3jdG28yw3Yoy44z0Mw6e037D+Kwh7ogeKrDICF
	4T/c5EGBXCuWH1QTBYMY9aRyj+1ipvy7UGe70hViWoFDEpv7ad/w3kNHbJ4XX932vaiMHNt5nO8
	ghbXkHGiBmnpXJj+5CA/k7tfdc80RUd1ahPU+AqrrrCgwu1EMh7Q1o1H0swZM/6UI1jWQTaQOEz
	yqUHz1YCml+Sosm3EHZqwP0jI=
X-Received: by 2002:a17:907:3ea2:b0:bdb:b76c:4dd0 with SMTP id a640c23a62f3a-bdd263c954cmr455094666b.40.1779525036960;
        Sat, 23 May 2026 01:30:36 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a dedicated schema
Date: Sat, 23 May 2026 11:30:09 +0300
Message-ID: <20260523083013.46372-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all Tegra-specific Chipidea devices and their properties into a
dedicated schema file, by analogy with i.MX.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 2 files changed, 88 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
new file mode 100644
index 000000000000..78046f8a63ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/chipidea,usb2-tegra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra USB2 ChipIdea USB controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-ehci
+          - nvidia,tegra20-udc
+          - nvidia,tegra30-ehci
+          - nvidia,tegra30-udc
+          - nvidia,tegra114-udc
+          - nvidia,tegra124-udc
+      - items:
+          - enum:
+              - nvidia,tegra114-ehci
+              - nvidia,tegra124-ehci
+              - nvidia,tegra210-ehci
+          - const: nvidia,tegra30-ehci
+
+  operating-points-v2:
+    description: A phandle to the OPP table containing the performance states.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nvidia,phy:
+    description: phandle of usb phy that connects to the port. Use "phys" instead.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+  nvidia,needs-double-reset:
+    description: Indicates double reset or not.
+    type: boolean
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+allOf:
+  - $ref: chipidea,usb2-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra30-udc";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA30_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        phys = <&phy1>;
+        power-domains = <&pd_core>;
+        operating-points-v2 = <&usbd_dvfs_opp_table>;
+
+        dr_mode = "otg";
+
+        hnp-disable;
+        srp-disable;
+        adp-disable;
+
+        usb-role-switch;
+        extcon = <&charger>, <&extcon>; /* vbus, id */
+        vbus-supply = <&usb_otg_vbus>;
+
+        port {
+            usb_in: endpoint {
+                remote-endpoint = <&connector_out>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..5abca0572714 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -17,20 +17,8 @@ properties:
           - chipidea,usb2
           - lsi,zevio-usb
           - nuvoton,npcm750-udc
-          - nvidia,tegra20-ehci
-          - nvidia,tegra20-udc
-          - nvidia,tegra30-ehci
-          - nvidia,tegra30-udc
-          - nvidia,tegra114-udc
-          - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
-      - items:
-          - enum:
-              - nvidia,tegra114-ehci
-              - nvidia,tegra124-ehci
-              - nvidia,tegra210-ehci
-          - const: nvidia,tegra30-ehci
       - items:
           - const: xlnx,zynq-usb-2.20a
           - const: chipidea,usb2
@@ -65,16 +53,6 @@ properties:
       - description: register offset
       - description: phy index
 
-  nvidia,phy:
-    description: phandle of usb phy that connects to the port. Use "phys" instead.
-    $ref: /schemas/types.yaml#/definitions/phandle
-    deprecated: true
-
-  nvidia,needs-double-reset:
-    description: Indicates double reset or not.
-    type: boolean
-    deprecated: true
-
   ulpi:
     type: object
     additionalProperties: false
-- 
2.51.0

