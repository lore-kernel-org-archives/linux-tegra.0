Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173116;
	b=S8c5vQlhwOwphNDDrffqu2OFtnNC/J7XpD9uH+Wy1aY57mpx+ecScTBGSo/1ZWtNlRrw
	 BVejVFEDU+i4IUiLGmmIwp+mdINbVL0N5FfUzxVIKoQwMZRieIbBDOSKOYFbDk8rwRHQ2
	 nYTi/tfelq2o28lrzWorawM8LRSy0ryYp2ykopOYO/zbMuemKb7sf8QFgivLEcDP9BffN
	 LUmseMIoFtwbJmx3ebxPI1GmeP4dyYhSJS2yWUXYrdB5nP1ZV0THh2WsriE1l3YQRefIt
	 eOoAn7CwK8aHvr5wcpN2vz/a/173k/Kw3uLMqZC/6TqDfebjpTzEyd5JmsT320Mxc5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173116;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	b=lYNnUz5e8FmkuNN+5MHbceqqc4nEkh7AvDD+KcNtbNHfBC3XzTD/s9dfdzscctoMBqDf
	 lP6ZRFCIP1IId5BmhEBtI3Xm3O0F0ILoc6shrdmqyzMTZZPPB5bYQtqdLuXIbxsiuciUk
	 BuZfRiD46dlk06J26LjqP2EU/7PvzJzlx0mJqaWC0izKm/zquSo7hdMYYMP2ZMLBHJ5fl
	 AABL5/OsGZMn1cNAV/Wc23ppjl7R0XFYX5WqVnOPQeYrKO5TsVtJYv9PD45e8UByNGUih
	 yV5gVOlKoTbQZhZMAaG4W6ID9kHqkt5UJK8Y52CzF5k+fOIKdD5VbMHs1VmEr+bW4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ayQVsBq+;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266BA606A334;
	Sun,  8 Nov 2026 21:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266BA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ayQVsBq+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794173109; x=1794777909; i=marvin24@gmx.de;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ayQVsBq+g9doSWewW+bAJskXTAVGXKTYaWsFkLiXm3bkjgM61CBMk0PB9nUrpVrl
	 GILJXUyFN/HdviHnEftzAb6NRZHYjeOzfNJFGm3VwKFWpkt6VJD2PlA94pQnKHLIS
	 DqgWO2LiK4vj+niVn41uhI45k0LOrGfDBHGXYWOtCqQ7yA8diMgAJFq+tr99TXB4A
	 JBOeoNWuXZ7DV6kl2yAwq7bpz/4ivu789B82wiy6jrdlRGVcxQ3wzITNtnUBaBRwV
	 E86aTRkFthhfcVf8tAKdjg3Sk5QzNVpYiEkxPTMlTzNMZAhx3lOW+cIDGU7nEWFoL
	 VZDSC1C3Cr16X6yxoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1wSnSn34f3-00xAlz; Sun, 08
 Nov 2026 22:25:08 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target controller
Date: Sun,  8 Nov 2026 22:24:57 +0100
Message-ID: <20261108212458.275980-2-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108212458.275980-1-marvin24@gmx.de>
References: <20261108212458.275980-1-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8O2NLmi8FJkFg2RMWrEdtl1BRKEV7raosafPqfdoo3J/VAJPpaR
 RaSM+tzu/UTqoxAvQOEdLvIv4DTESLJll04pvXixLEPMnNqSz3ugKFxSw8XyPWCG/ma/BxA
 B0nbIwMTUt//kcw2qvUPPARcETa54aajYV1eDOt7yaLVyG1zcaxXdH9EYVsaABnqfhStnkA
 +e+dlEruG5KCf09/AITVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lo4xIUxlsNI=;DGJ/DUdpORPHQX1Y+XgZP0D/hOG
 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
 NlcNbz6DHg==

Tegra20 SoCs supports 3 instances of an I2C target controller. They share
ressouces with the I2C controller instances and are introduced here via an
additional compatible.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 51241c1293e3..2d7ee8e8750d 100644
=2D-- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
 properties:
   compatible:
     oneOf:
-      - description: Tegra20 has 4 generic I2C controller. This can suppo=
rt
-          master and slave mode of I2C communication. The i2c-tegra drive=
r
-          only support master mode of I2C communication. Driver of I2C
-          controller is only compatible with "nvidia,tegra20-i2c".
+      - description: Tegra20 has 3 instances of a generic I2C controller.
+          It supports controller and target mode of I2C communication.
+          The i2c-tegra driver only supports master mode of I2C communica=
tion.
+          Driver of I2C controller is only compatible with "nvidia,tegra2=
0-i2c".
         const: nvidia,tegra20-i2c
+      - description: The i2c-tegra-target driver supports the target mode=
 of
+          the generic Tegra20 I2C controller. Driver of the I2C target
+          controller is only compatible with "nvidia,tegra20-i2c-target".
+        const: nvidia,tegra20-i2c-target
       - description: Tegra20 has specific I2C controller called as DVC I2=
C
           controller. This only support master mode of I2C communication.
           Register interface/offset and interrupts handling are different=
 than
@@ -222,3 +226,18 @@ examples:
         #address-cells =3D <1>;
         #size-cells =3D <0>;
     };
+
+  - |
+    i2c@7000c500 {
+        compatible =3D "nvidia,tegra20-i2c-target";
+        reg =3D <0x7000c500 0x100>;
+        interrupts =3D <0 92 0x04>;
+        clocks =3D <&tegra_car 67>, <&tegra_car 124>;
+        clock-names =3D "div-clk", "fast-clk";
+        clock-frequency =3D <80000>;
+        resets =3D <&tegra_car 67>;
+        reset-names =3D "i2c";
+
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+    };
=2D-=20
2.55.0

