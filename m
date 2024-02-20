Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3F67E67;
	Tue, 20 Feb 2024 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431485; cv=fail; b=F18ATFDsL8X1mDneO7254Pe6AxfNFwVF5PtdOL5ru+8Xxd3EL4QCvUgL4K0HacVd9nQ3qKxYr095SzV7qxKkA190uzyRFgR2bMNrjYkCfWTDSYn2Ki2ZQCp6jYuubUFNnaGARkmGXg9dYM0zJZxZwDzne5O7J2VsEYZ5DGhUwK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431485; c=relaxed/simple;
	bh=vVlhhmVauCpp0m6wyRl20ROjbkL2zfQWKyIwwpSnQhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8qAlMWByLj0Kz4aNBTRoHFZycE88O1Cl8FmQQHbjOHog8XmMexsIulSn2vlvqn2EBc8OIuRlp0d/f4IZgYutdJ29VPGK0EraTmrkK32nv2O165TLpmgAqzLLQ6Bvnl5LscieaIDrEtqXDM1h0QyhMW3szryiD4B1aK0ire9p/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hOk/s9b4; arc=fail smtp.client-ip=40.107.237.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hOk/s9b4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0JVwyoJaJep3wHQ6M1QsfEzsMCv7ERfcmvFpj3F6rioiJa0BFADkEBAK1VOH8JbdzGo7SUiaK2aSpIoKJa42rDAUCM8wbjPIteePstqOCBFnnTnLiyldAfBawOCmUCe6zJLe4U/r8zI46kukKFUr41tyD2xFt65ZMW/gP8AdJ3SJpjGoyLvfK4dA/54MSfrpyBhDK2C0TBgb9iRuIrifPxzl+YHUgJfTBSXEKbMpO8ul3I4BXhiZivvWkV5ijAC89axXyt+kGnnuduJ6ClYE5dz0O4yD4WcWpE2XaOnUHUwz/BFLzDigCQSGmbzi+owM1p75BJ5ywlgr+5Qil8ScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvtazFFSvOwo4siB8eTESBTrtIG6UEvrpkw9ZzOaGNo=;
 b=i2T8N5AiPlTUvCLdwyFwSOwxw8LOROEfllhqTkoMl/H/dSd56RxEc7HT3tDgSH7Liu0NK03JooCQFkfFphOJcp7MO9O2bfEUoEhr2jyMqz7rl++xu9LIz656/xVJF1Sy+Ce/engBj17BGpYBXkd8zhR/XBXb7faEQEMCqR3NPVYwwCpWe4a0iWarzD4lXcwCeJI/L2VvCVdaTMKS7s0Lmu3QgCSXljio7Y3IFrTaz5dEL+BhRG2v4LE5Wdez1t9JksoZpI8nZrs9yNZ37DlaYELB+L54vkEkbbafqMspC+ZLrFZPxAj/PfnNkmC2TG4K04z3Phok1/bD9GqSmYuRRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvtazFFSvOwo4siB8eTESBTrtIG6UEvrpkw9ZzOaGNo=;
 b=hOk/s9b4Mod8rLO3CZMbtnwv8ZX/rhGgNnidtxXjO8Yp+Dwyr8c6h+87xSXQc5uL3waRxHuqfMc6/EiyR9t84/P/UhEj+tLYGNtXFerAO+PP2UAyVboOs1G1sC8l4kJztlTGAr5/DCn7ZbfJwcnBwPAA6Y/4xxqWU6HqkuAiBo3czTPG49SZmEOR108bdAdUeRxsX6ltiewLHSSLPBKdR3eBhWBPgh+UZZEcFtrngH0AB4qdXcWFDmfmSe7yqAXdkqM5LdWXCA3ynxUTww4N9J2CEJBXa6pJIN7RPChCm/zTn0bJQwSQBqX4rySzC2WK7IsJOgI8tsvZyscpLelVAg==
Received: from DS7PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:3bb::12)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 12:18:00 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::63) by DS7PR03CA0067.outlook.office365.com
 (2603:10b6:5:3bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 12:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:18:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:17:43 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:17:42 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:17:41 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH V2 3/3] arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier
Date: Tue, 20 Feb 2024 12:17:14 +0000
Message-ID: <20240220121714.16543-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220121714.16543-1-jonathanh@nvidia.com>
References: <20240220121714.16543-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b216193-fc17-4e32-b544-08dc320dfad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pAycUTgZ2AP6Kg7giXVLhBBq4DVwY1BqMBBW1DeKMgRK38hiChRvU42dbpam9DNZ0MEPTz5/HxHNKSHNdXgPkzaEDnZGY4buIe+ALO3ffbecwh16RLYakV6FWfVckkV6r/GJFQbUsifb5/4nc5XMs/6eTEMqgNblXGYsrDxxUZacLTwjrRXttXM/E+kFPOReETItTRzpMZF67Fgct8UZvZ0PQYbYfj9s1TMWY4xdPzU+ZUlyjpRhSUgrQaYgucEqzxZpAKMpR4+3/mgEbcoeaMd0MGmz2SbIdb5bg5Ej4p13PHLkPkQXBY8gD9Mr2qfRRUkVkkNDN9xCEsNDf8TsvRXixQozz0SXcpvdq3KKOSsHV+GWVJN54raZsP1rHzfiN8sxoaaC+Jsru8ZqaSro6BUaPzjfIoywQRSi20mntChjAJCGgip79tHXHw2E0RqS8KSJkZ7VDd8NjkhqU2MhTY50wkNZZkjYEs3DtreBm5Sa2C5IcNJJ5vpEUrZrwYRiAAFwFAjbW4eSVK+k1f7v9dOYRgelgr5bFQr2K/UCs1mq2T7K/CNsB4i/o3suFSCvzzRjOAecqzROHAGNjFqrLJ98xNXoHp2ebznNXkZ/t788+jNjJjdIEFhNkvhyTC11K0zj0akkHg/ZfQ1fVZffpAa3flqIT0Z8LXvJk5OsI9c=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:18:00.1803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b216193-fc17-4e32-b544-08dc320dfad9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268

Populate the Cypress USB Type-C controller for Tegra194 Jetson AGX
Xavier board.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 63d6cca542f7..c32876699a43 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2062,8 +2062,15 @@ usb3-3 {
 
 			ports {
 				usb2-0 {
-					mode = "host";
+					mode = "otg";
+					usb-role-switch;
 					status = "okay";
+
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
 				};
 
 				usb2-1 {
@@ -2114,6 +2121,40 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3";
 		};
 
+		i2c@c240000 {
+			typec@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio_aon>;
+				interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&hs_typec_p0>;
+							};
+						};
+					};
+				};
+			};
+		};
+
 		i2c@c250000 {
 			status = "okay";
 
-- 
2.34.1

