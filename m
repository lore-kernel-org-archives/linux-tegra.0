Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C62CCB4;
	Fri, 16 Feb 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086511; cv=fail; b=iIKGlbkeUS1aqKRU5bTHYK9rjxsTY1FEoEJRa5VUmrn8XFEMUp2LXGL+0dNgSDloTdXvG99Y84Ucm0vyzxxGvzwbj0TlX4uNRN5KdSfcIhLDln8dhSIeMuPiH0+9wELm38xc5bhOfLACpWLxN3QE+CkzGoI9GOTLhXwF9VQZdfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086511; c=relaxed/simple;
	bh=RwDcO0G8U1OGOIPxPoIIPIacJTPw6um/pAGtHCjYADk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdxa/MAtzGXyLj24f379YqRNfra6WtnqLMbh7FsCmO1ixxepR8FKVIRiMRkx+XXddxTyuc+mjjBdkNrQG4AEMrn6BQmc0W/tOMAgESeT8GjqWKtm536zKymTPSx7CC0uaZgMYfkIzO0p4WqTf8x3qfP1pOz0oMcS7JFqQu26CE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OWIODMNe; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OWIODMNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S12ApaVXIq8NpYwQAcjYhYwlVwsxc31/aMPE/ne6YlzzQiIQHLIf7z45EnmyerlvJ06iNngNrKC0jaF+tnrV1oKMlFn4GS6SOGbHnNgz6dy1l8LSLVuLzuBOVCklF1IYBUyHG0xrrS3g0Wq4CZ2/ZO6JS1W3Eym9WwMu4wTglelz815mhuhp6P8qRA7bOcasfTRo3lJLENGvcEVWCCLITDTqWttz6o67iDWIhxhkUFGMr5DJiPwTRqdyHAcHXt84tuaf7qdtcAsY5w7TxgXKYyugroH/s8Oz/48jbwxmMp8z8vc1eThVG/LVTY5a0ufPOURmz6Z318nQUocjpZOjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/cRgmdzk9dkakwkG1MlXemz5AUIYgTShTcIltwxXXs=;
 b=CprBv/K7IAP0x3/yWPoAkXG8kQoGqdlTbeXkTjMMiMDa+8yPive9DXM0n/3gjW5y7yDbJljn7RS3VdLVtDkC5VgLhMtnKEvokI3xH0rqOaCve1M8GtrawY28Pqx4BNro/yBEsZxD1H9gHYlMV4uLXNtk0Oxo5quGHqFMnWAq/a1YOHrCyggwNE0ueryrCqJbySogXP3zJk8flKqOug9Tvx3vPxugA0WTZ/16LlevS5VSeAupREzhjzNNNJVuWBJ3+Ti30okzJYCrKutnQcbezlgwO4uix1+DxzPb+5ytzvMuTZe1E5HuSlARx4D9ljweaFuTECtj8ZSwoGHJGYhkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/cRgmdzk9dkakwkG1MlXemz5AUIYgTShTcIltwxXXs=;
 b=OWIODMNe1M49iaThu0EkadzVwDKVeOlABoTqRv+psBxq35C2hDj9vZhdZuPraay5uYmM5F2j0NhvdSoxsvVZkTRJBuZj1xNwcDFdPiZUi2vEvqnSBkdmN1TB+JAv31M7P4lT824mc0amp18wHkE0aP8pTceFkyxKSjkbpNQT66MryMezo0gOl6JgffW7+xrVIbs24Kjd/WRDM6jqJESZRWY86i5zSSW5tbUgWE42feNMBBCaAsqOCbrZTQ9GRgXTqiVAk3GPfIeN3GkPnMhRhmV2IfB58o0CYld9g3VPSP3z/eLrIgT2Xc5MpjHRalU3fvFzgbGgIDaNrYFsU0wY7Q==
Received: from CH5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:1f1::21)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Fri, 16 Feb
 2024 12:28:26 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::51) by CH5PR03CA0023.outlook.office365.com
 (2603:10b6:610:1f1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29 via Frontend
 Transport; Fri, 16 Feb 2024 12:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:28:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:28:15 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:28:15 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:28:14 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Add USB device support for Jetson AGX Xavier
Date: Fri, 16 Feb 2024 12:28:04 +0000
Message-ID: <20240216122805.32529-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216122805.32529-1-jonathanh@nvidia.com>
References: <20240216122805.32529-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c03021-aae2-42e6-a2b3-08dc2eeac652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1tKZOF5+V3S7WvUN/1LrCWGO4hPUK3js+wl8/BHhOX+aojxAFc7J+T1/mikXM5ieumICZ2dIS09StCb5FQjb8bmjRp1/oc8U9M3QeQonqLj0FkqC95tZkOVN9VuPFlOdM5jQBiVNHR3zeY+hJt0bYMJfNqHtYP/bo6yEkdspkOJWo4w/K6Zp+UhC0A2iaJyBPso2zQjxylRfvnpiBPof2cj9wd7s8oJp66BRx8wYad8Z5vlDnS16cfD+KyiqINiPRfqBoLt2cP6ao1sJWWZA3qH3TF+4PKCeyaUzxgYFqQLmGrLyqRjKoJS2/Hg8+y4MG7eCV6nw8rFXazjTbgod5RXDh91iAxq5ZnWDvgN2HLe6F/tsY+2mCJTJBdxFI05wOQ5z6kQyg3FM5nTygJzfO8oFAeyEOU8R/RHQBJebvFxDZ76/8zPRX6bTVYZc42rlXC7Z1+cPvWxjTXWhiWGp4UZoEtOeHYNC/3aaz8bOmqdLebK3gb44PcqNHBR7M7dvAgUr3NPdgTM+qsoJ/f9dLvKp4TQonde/h0MRtyEIZKVGr6e4PzZw69CqUuefdLk5MQScYDCQMurKKq4WauBYeXu496q8/c9q41CgAU1Qic+a2t6+QRDzOjZg29iSAtBh/ezwlo7ZdLI5RZhVBqs1lh7Qlx5cvSEO6hXzcilWe7A=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(36860700004)(82310400011)(64100799003)(186009)(1800799012)(40470700004)(46966006)(2906002)(4326008)(4744005)(86362001)(70206006)(426003)(7696005)(36756003)(26005)(356005)(6666004)(7636003)(8936002)(478600001)(82740400003)(336012)(107886003)(1076003)(2616005)(5660300002)(8676002)(70586007)(316002)(110136005)(54906003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:28:26.2734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c03021-aae2-42e6-a2b3-08dc2eeac652
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460

Enable the USB device support for the Jetson AGX Xavier platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 64a3398fe7a6..63d6cca542f7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2094,6 +2094,14 @@ usb3-3 {
 			};
 		};
 
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb3-0";
+		};
+
 		usb@3610000 {
 			status = "okay";
 
-- 
2.34.1

