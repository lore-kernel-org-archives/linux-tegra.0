Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767200;
	b=wiTVH4SrwGby6fPfsdac0JRlfMrQYF0RPU/yKbo+VH84DaDvZ36QkE6J6tjbg/1Baj7Q
	 13hYB9QgXLFGbqhZ4PzQw0ubpGkZc1zZat6oG5cGGa0xhSksHwlqmbFlVEu5qtOyE4sSq
	 Ty1Ia724IS0XcLq92L5Bm3rHt7ZBzviBPCL4QEje5kfTyhI0NrMqf9DINDR95je1fmVJB
	 GriwBO8g36lBlZFXIDqfIt+12bNmSxz10hNlafZX/lYFGwSzHo7PEl84zHXp2M/3ptKXv
	 76lXv04Ics+kl+N7v7vCch43+gZqexjVn0Kn9TAKkw4/HeGoa5oDaK9lqvkHbupCqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767200;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	b=QjPDbwxsDBykDEsxohvJ3uRHKHqnGbGmdIau4pQ4g5mdQVayF6l5GLWeQeD4OF6AkVQj
	 lBKkZTUC74U3nPTcg+p7z5Z5fW/9bU1Khaz2LLzvOoI5q9L1JiUmJt87HRggw2Ck+w/KE
	 IeP57MmiV5j/BP6H4su/Bx/DfsKsCyi/HdkwyMDbMqtXe6mE/rrndDv18SKUViqHw9Y18
	 bM2AvbdNs7KsMbDqZ3gAld+0XiXQcetvV25bwUuCARiz/GqtFS+EwQRkIB6ADI/UhKkOo
	 PTIJnZyUDrxGABr8Lo/JYbnt2CFoYAlijJX8dhELrH3RRJySXk+iPYIuM9CxtJdA2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MQaSNtoM;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A28606A31A
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 18:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MQaSNtoM
DKIM2-Signature:  i=1; m=1; t=1794767197;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:m0dCL7f7inRYrSE/5h3lmgv5uq8b
   f/3P2rvJobyh6YxxBCpidTTxDa9MQ8K5t4WDSCbzSWGX2/4wfLUGBUP17N86T86YzKbWsqQggm3
   aX7yKFEKaqRSpMDG5Cs2q3g/QP9wsIELVIUFrAnhqoTlih/pnlaAPPakm5q2YBc7P2UFZYtN2xY
   kRtuEGVfHire75HQX+9HSIDJyQyAPea1m54bIJtSn8evZg6h26Ok8slvBEfs/CnALsHUpNRm61k
   ddAVTm/cwRwpC7RBJ9OE7d1FWYBisgcO8F1NJEUTHz+rZRHD/6e0JrdF/ODXZBG7HdvDfw3dhE1
   lwyvMZTQ7I6Krw==;
Message-Instance:  m=1;
 h=sha256:
   TpdbIe/YhtPLJnptr3vv42y+qXeXxz0r/vwUZW6KdZI=:
   Lb7Gnm9dTep3Rmpj+BZVhCNO8P3lHu7s/GqnV1VxBZI=,
  sha512:
   Sd+9vxx6OBp4IoHlD/0OBnQhgru70lQBJ/2jHozaTwN+Jvjdi6gAHpqhGxvqyqAGw3cMurxBFG+vHq6aeKJ77A==:
   XrZdonzAGX/dOfNOuB8yYlrftNGMUcXrNjRI7NNVejxoXqiN+OePgJuwQUum9qFS9IfcUEAWQq7RQFW1ORfznA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794767191; x=1795371991; i=marvin24@gmx.de;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MQaSNtoMBjWr4M3cfyCqNcNyd8GleP4WUi+EKWAFJS2d7PwfXrlLgxs1iHgxbqGi
	 /XXoMfrxxwch9Yr/ZJTBM9Z0eFimOcQCKdu9SwRFC8ow+q4YpynTu9qVS8znlqvZ9
	 8IV5n0e5iELhkBjEZouvNjPdZr1/gmQl45ciytx6x075A7YdY3gZo7Qsi2KBb6KIW
	 1VO8qOuTmi1OLQeK/TUYhTPEjIDtG1Vwf9k1kE0SdNpX9g76REe7eyFwE1yCEWj/y
	 owlrnW4dHeXHGOODG6kg96+Xkk1dH4KLacAPS3M3g7NqdfVG9PcmSELPhcbr5aB6h
	 1rhNSqh48ydzlxcxVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1xPLXe40LU-004CJr; Sun, 15
 Nov 2026 19:26:31 +0100
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target controller
Date: Sun, 15 Nov 2026 19:26:14 +0100
Message-ID: <20261115182616.354580-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
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
X-Provags-ID: V03:K1:5zg8AZzyM43xhqZaZvWwauHMZ1O9oelKMFDXLLrCjlEvCwM7UhJ
 KKtwY/akDVLbD+Gj2cBrJM1itXzXfbo6l3fMMFcL+zjaQ6c0DgYtxS+Vqo9wG2+R4IsdzwJ
 P6W82iU2cjULcCboa61Y2bUgFrBMM0Lp74q+w0c6Vz1vaT5VGsPvjTof6K5daIvDP82L/fS
 9Zj3COIUk+O4GAnmqoheA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nWIxi0KxON4=;XGJagVUgTWgN18jqKH59HktbCFz
 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
 urw2hdJeRqyMQB8K4sfue1xkCDifz4ppBR

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

