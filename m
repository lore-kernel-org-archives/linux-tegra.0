Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795091191;
	b=g6OQ9iTejBFhqyIrtNwTniW6BU2PyUBMwkLHIqPLMta6t9+MSV4KQG7d775u30pgp3fC
	 gI2ncvK7Omx22FwKTU0Ua6M6KJC3654hjewJF5DfoNM1mm1Ez7LzmhFCR1is5/yxP44rp
	 LkbXOEFHAw/I6IHErWAJ6XtcxMjwcJ9s/uQbTh76aK/YO4AuRL82z89Q0NjpaBAbuszcT
	 1IYqPO64y5Mxe+FMZ5M+X3pp2ieLgKTlm7g8wf9Pzt8l0g+GIS4XnNvf1yUmNqiK9xViu
	 GLk1CTAplzhTr1OCrQl+WUmL8qGQrqX8Qf8jf59VpHwdBVDZbN6G6ZF2yOiK9Nl9B8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4D55MCKWsw9qDFfs9GN7nl+ThDhpENVTTNnbDqbZuKs=;
	b=lOoZ3vqelELu4VqPXic3ZncjsBIX92GhGpv98/S3LWPrCauHdeoHmMHTXJndMqTztCLt
	 wSkkogqKzBef2fsSTO8m+F/sXvxIclH8DgPCKTZEQ+X7tvoBtRAZYowoAJWFX4dLs7kPZ
	 Mzr6ca5aLNWdexbPJjkkqRO+bsTs598B5t/rTw+zuNbSYnmnBYJMiep0Q9NUy6rwgl1Vy
	 5SowegcHIY5EJDB6LonuRYWwcRjObX9Mux1H4hhOi0/imtXyjVQfiInA6OuxKOnlN6HoZ
	 jlexlxZ+D0xLLXFG/ax1V7oLuqSKWyjem8tWiiTUaJdTZWaArYR1B84aVLILQ9G4qkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z9qZWe3o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404FA606A320;
	Thu, 19 Nov 2026 12:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z9qZWe3o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFZ66UnTr4MIXQwEEpDP+NcdE8ZJe1fdHAoss4FZVT/5zcHNDJ/73DJPpKzo6nz5VHJzLW3q22eMO/rAMT97aJyXmLXCmEJpm8BzA/FEzOswhe3erv83TsukgdHk1R/wwP1lndIYTerSroAhrLJUS9hVYW+Qu9fSwQYqMjpC7+ZdgcNXZevccWeJha2d1ijKXRERuLARSIB6i+VjelJBqqPX5x8nfeiKsFFin/I/ABvdrn8IaWY7Rw+hML6nFGF4eHyRwDl53nKKLjwBLXG92v43CoUMVwriQbEScOqoI5xfxJ3/TjPMbcmBhztMEVQst3QfFJNtoJEENeXHiRHErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D55MCKWsw9qDFfs9GN7nl+ThDhpENVTTNnbDqbZuKs=;
 b=dio+uAoaa+nhJeH7FX4ECOFELj5lPKOJD62/H1sjWEzLb0j8GIbUdIBANJHw+nVCrhDiJXjGjfSKUn5cGY34wTLVRDyNzlOHGljgYSSHs4eqoF2qALxpSb1ADVToTHHgoNNnEokU4FBkq7P0YuOkqaZU8lAVes/myD9F5+eSXrUzQ6pKHSThJNqeFDerPkiJjJVEIlx6JDTNSE7oftwHn+kcR2IeRkxvSxChoJK6Ot81aos1+Jn3sE0W2XaprSX3vShsTCzk1mz25Mt9Pb0gA0XRpQVWDvgDMPeyjwMSoVZxuzwebxQjok1pYGoXrJ9IJxvb1odBp2q1SojmPnMACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D55MCKWsw9qDFfs9GN7nl+ThDhpENVTTNnbDqbZuKs=;
 b=Z9qZWe3o6Qtipy0HJj0mi4SJb07wiHl2+JCKe4U+7dG5pZSUzW8b5ndu2NDF9dV/jm05bnfwLbh/OkuaoyvyMUgZm2LSoE0LGNCUdJ0f3fndQu/VbPfFM013HvUlHvwGyZiGnqVX4mtXoLuGSGokPtRDFPwuG/ZGXsLVHLHDZh3HGD+WWzhkwFgr5nLuEf0mHDGtNVjimroz8C+QxssUCOvB5gmifongJmv0JAOKlbFyhzjdenat58zbXBhAxEfiqq13Uy81ZrWkgXAOJU2n3q6c/Kz3qhbjbtYSbVMOvv+ZuH6GSA7IbXGy0w4G+y2aMqqACUYMzKt9aIF81ovXyw==
Received: from CH0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:610:32::30)
 by MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:26:25 +0000
Received: from CH2PEPF00016D4E.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::6) by CH0PR07CA0025.outlook.office365.com
 (2603:10b6:610:32::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 12:26:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00016D4E.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:26:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 04:26:12 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 19 Nov 2026 04:26:11 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Thu, 19 Nov 2026 04:26:11 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	"Mohan Kumar" <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	"Anupama Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal
	<sheetal@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: tegra: Add Tegra268 ADMAIF support
Date: Thu, 19 Nov 2026 12:25:10 +0000
Message-ID: <20261119122511.1324643-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119122511.1324643-1-sheetal@nvidia.com>
References: <20261119122511.1324643-1-sheetal@nvidia.com>
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
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4E:EE_|MN0PR12MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc9912d-81d8-41d5-1a45-08df463853f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|7416014|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NZvdBNIwCy/NDl6F433B+nSSioCEV0Cg2peJU58wZ2dGlpPd/0mhBPbbWlJKcmPbfImmCNZqhSn9TCA+6N7Raa8UaCdLpqs7qmD0sLkTPayO29eRczRn4RwcFVNUckFnwVKa458eulS+iRcKzJM62m56itTwC5YAcZT+gxexeeMJNqEUAU9g4V0xRjt5gsz0db8VeDfMrh2qFvZRX4e7gIJUConHwvXRcKYtr/tatkZt3zWSWCXzB+q8sqjkkkqPyMGVIgeuWJMo3y36q/p1shPUyZjiHbP1bkgpVJTNfbgqoRfGo58ZQeIApms2LJKA+6TSIIbtdBNo8x3EjwStYSlfdizTwYFnZbb47B7Uc162WKQV0QE4JUJeRaz1hizq99i0yzonOQoZfpZW3b+NwG6AmokvM/Sob3nhAiDws9hgacZfmUE3B39D10IFOnwAF45t0lLxQENUuqnQrsb7oF1tVj69MVFk/Sc4TFIxnrBqqWzmhAd5UNUHuDk/ocNSc2ajyal5oFQta+3d8cysSef5UHm9gaHrPr3flX19tUbY7VHx5KwE0mKBdBncZJ+imno+aYhd19o7lPNAn6hcLAFpjQ9y1UEjsv/7xiwDnEwkXlcBAJQ9y1MjtPC49wwJQRIXuaq57zgYZ4wUW2VJcdbFOpN/cQp1ISq5aS3KN8FBRTYagu0/S67mrxNOrfTeKnK4XnXqoGJ1BwUDRSiBrg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(7416014)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rd7DzLGCECpQ0zpg0yEQ7CH27W6580fB/u2O4E82mZFoQxypo5an9XZPwzUXrfMZKsTuRYGMermQuEwvj7x3EEvz9FXQKBtcvX19+bhmeiqECSVvu9zQ+ntbHel0LP479kByzujpKUju+uRIYoL82qECvdMKrYFmbplIqpUJGhdc1JR/gwrsREFkKWxqy6hMPaDydTV+09JglRGKJGjtDbk+IEoc+OoYwMem14VjgECVrSUyb/errCPsZcLFw8T/RDdrh8NwcP5dH2CLb2breKbqtAnmBrmVMl8Kpdr/93scPgRjiczNjUsuQxWAL/CBqT67zDaDbK6iRReuvL/VD6PLppuiuxGH0H7P6J3S+n1RAOpGpsuo0LGFOpeIcaKz/XBj3odBpeyCEQDVuhAqnXtCGlB3J6qvjLsmP6ECBk6dFFgf758f6voU6r607Mr0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:26:24.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc9912d-81d8-41d5-1a45-08df463853f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Add the Tegra268 ADMAIF compatible. Tegra268 ADMAIF supports five
RX and five TX channels.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Use the ASoC DT-binding subject prefix; no schema changes.

 .../sound/nvidia,tegra210-admaif.yaml         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 2ce4049f94ac..054bacf60234 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -27,6 +27,7 @@ properties:
           - nvidia,tegra210-admaif
           - nvidia,tegra186-admaif
           - nvidia,tegra264-admaif
+          - nvidia,tegra268-admaif
       - items:
           - enum:
               - nvidia,tegra234-admaif
@@ -134,6 +135,27 @@ allOf:
           minItems: 1
           maxItems: 64
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra268-admaif
+    then:
+      properties:
+        dmas:
+          description:
+            DMA channel specifiers, equally divided for Tx and Rx.
+          minItems: 1
+          maxItems: 10
+        dma-names:
+          items:
+            pattern: "^[rt]x[1-5]$"
+          description:
+            Should be "rx1", "rx2" ... "rx5" for DMA Rx channel
+            Should be "tx1", "tx2" ... "tx5" for DMA Tx channel
+          minItems: 1
+          maxItems: 10
+
 required:
   - compatible
   - reg
-- 
2.43.0

