Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629688;
	b=5UWh76qRdeL05plImxGs/fM+KzvnQhpV0UMQ2XimTe93ABvnpbpwfywHX26SFox3DIwh
	 XZ/sSSNc4ZPBoDngSi6B8CkNN91Zd2whVtSQej/5WfopI2bTBh5ag/2UGBaeoCnLAey0I
	 rDcTlm1aJIZghZAJeSB3KlmwRTbzUS248p9FUzQxv39fxDQrPJymmwHVNZSb6atmQ/51a
	 hLTDPpYgIyBZuVLbzRn5Ffyu13jLelRpXs82H1Leq3Xhx5MMdvBkRbXwl8n8glUd+qsXb
	 obUpKkIOl23rnENFlnoUnYByai5T6a8aGDU2k/dEDUfYWbbwWZd5Bll+SxiWPqHOyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629688;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXG5ng9UK2dketrcnTT7J+p4mT8docKS72kpHf0+r7A=;
	b=klA8diu1bKQYndm1mZmUzn0Eeg18UbVfyY7Q5IpYZ60rD08c4a9HnZ43dFlIpRkP4RfR
	 2BJzwbGRYSiHudB2R607mL+Bk+FCkWSxLNheZPG1fJ06uY/5BMitSiTmcAUnCdMFCEZXQ
	 eqBST+naO82JZ5hHt52YOzFphOGecLI/jPheia/Oz/Qed4r9l6+63FJGdVGQzq+gO3gqr
	 mvnyD0jAW/NFMlPRBGl+lkAXNWTXbp51G+fdEgQvzoxrDfAARmdj/q9di6BG37Ri7/BpH
	 KASLniAmFgjZOSVGtMyhXMqCxPcW9jmHqmnHNulJXb3NMtVQ4j2jxEavuUAqbDyIHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilReywkt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C51607F6F2;
	Mon,  2 Nov 2026 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilReywkt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C661F00A1A;
	Mon,  2 Nov 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629688;
	bh=uXG5ng9UK2dketrcnTT7J+p4mT8docKS72kpHf0+r7A=;
	h=From:To:Cc:Subject:Date;
	b=ilReywktqKg7UxMpVX3VwvO+FxchoepfEWWl9xM3aIbIGYJTNC//IEhj52mE021e0
	 u8JVf7Vm3gCL/vzJT7Jw7LzWoDnLjc2UwTc0o0wTIiGqDoivbNdKjGfKfSZ+hzG3ma
	 rOsEb80QHYwOvBIfoqxStgdfQyuPUgcVB8TgoGGb2uDmPMWv0TruIPqA++KQfu+KeQ
	 mSASEWsHE2DJphbsEFLqxCq8Mn4QKAzsFLonlyQ3AKTDBFJ7HKyuAdfObBlmY07KK0
	 uBEeeGJoXGFY6uLOKOulXLEYpsnaH83vG+kwEU3mHl84605GwuYSgHyBtZaAw/6Qub
	 V1IJawuhScecg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: nvidia,tegra20-dc: Move 'rgb' node properties
Date: Mon,  2 Nov 2026 08:28:01 -0600
Message-ID: <20261102142802.2742565-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties are supposed to be defined in the main schema and not in
conditional schemas. Move the properties for the 'rgb' node to the main
schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/tegra/nvidia,tegra20-dc.yaml      | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd562..a42bf7ed37a2 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -77,8 +77,27 @@ properties:
     description: A list of phandles of outputs that this display controller can drive.
 
   rgb:
+    description: Each display controller node has a child node that represents the
+      RGB output associated with the controller.
     type: object
 
+    properties:
+      nvidia,ddc-i2c-bus:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle of an I2C controller used for DDC EDID probing
+
+      nvidia,hpd-gpio:
+        description: specifies a GPIO used for hotplug detection
+        maxItems: 1
+
+      nvidia,edid:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: supplies a binary EDID blob
+
+      nvidia,panel:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle of a display panel
+
 allOf:
   - if:
       properties:
@@ -105,27 +124,9 @@ allOf:
             - const: winb-vfilter
             - const: winc
             - const: cursor
-
-        rgb:
-          description: Each display controller node has a child node, named "rgb", that represents
-            the RGB output associated with the controller.
-          type: object
-          properties:
-            nvidia,ddc-i2c-bus:
-              $ref: /schemas/types.yaml#/definitions/phandle
-              description: phandle of an I2C controller used for DDC EDID probing
-
-            nvidia,hpd-gpio:
-              description: specifies a GPIO used for hotplug detection
-              maxItems: 1
-
-            nvidia,edid:
-              $ref: /schemas/types.yaml#/definitions/uint8-array
-              description: supplies a binary EDID blob
-
-            nvidia,panel:
-              $ref: /schemas/types.yaml#/definitions/phandle
-              description: phandle of a display panel
+    else:
+      properties:
+        rgb: false
 
   - if:
       properties:
-- 
2.53.0

