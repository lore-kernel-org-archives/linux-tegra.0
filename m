Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793984772;
	b=luUC4NfidkBdymkiDgXhHyvGy1nVfG9thH3A3O2ekhWifAKLc2dBgMtPI+rEFlNbnlcc
	 9hgdoBN/xqW9bvmGNz20G1I3QGulvYOLDQUeyT21T86OUDgEwK8/Ka8NwWFkLHaszzkJ8
	 RKT0zf9bptBxcrr+5w1B195oUG4L/24fInctU8gEyYPnDVzJIYcFg8B6gzOVHUokRC7lg
	 dlbx9k5Qj8p6/jL8NDhvC6RYNllMabyz+JwaOrRFz9bGHcp7kMbBlEKMMAsbyrsHZzOYW
	 2rIh75DFC/2q2tkCkQn0cyDJ0Im7cTkRLcD5TzIzjST2MBJgrajy1QNsVlaQeb7sKaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984772;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=ejLgYZSR0yfY2bJ6OliuaybzgHG7znmXv/KanPOgxEc=;
	b=4RDK9LiFN6G71tofbUzUNfGfZeWAJ69mqJe0CQiw8LRuwqP64jvI2o89gPpBDCryfzrM
	 2pmzWCaxg7Lnmr+hn/kprcIkN/cO0W49BoWmU9hkugFHK+PW+Zti32v1xf78pjCkIeJoy
	 BP4ZD5PYlNCj8J7yETYf6RrmFxDSj0wy3uuHYljtquM9u75uwgYaU3UqpWCi/7jyMpSuW
	 gsuJ5gZiXdBOI4Pi6WBd3LAmzdezAdBdN3fBlSQRI8G4XkBfzV1KoprYBkw8ZVbByrejB
	 aXMYDXoeMq6qmJQ1shfVcPQQdYwG2LTxAYk++OsM4hh71U6VPcjrO92H4/V4ftsHmGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s8Xj4tPe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EAE606A32C;
	Fri,  6 Nov 2026 17:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s8Xj4tPe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TK3cQdf7t8pD9uAQJFkIr7LgW+C8MlrT0V2gRMMknD+OHTH9ciP32KczoizvwTXd3VLlH41UOm/SMSccIgJznsIf1OOivPd/j9OXN7PbJ0XnuhMxg2wzHX+snT0iQLAOS/QGof4dHEDYiYsWoXwnb6lbpHWVT0Uj9hBWKAH9SygO1e8XDdm/WCUeX1vcm4qulCEUbCP7xRFBu0c/LiDUnLkyrzMtHUPP0x7NjjXWlYRiRYtPIHpb0fpoKnGpZKuV9h/Y0dMfsp0MT6/dSXso6ktVNyG9ZXJz2WwXomDzNNdEvCYJ2mZ3IohGLjGxGOgKLgInDTy/yvKjTBv8HtEYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejLgYZSR0yfY2bJ6OliuaybzgHG7znmXv/KanPOgxEc=;
 b=DW+CszaPqNxodeMYzIlniXJTndJafB9ZUG+r5fouBD+AHo4PC4tQNRThwEPfXs/w5J8jzKnmFTtthV/S5P71AiRthedW+VJ+8nCEKHoessiXzMdo51BhRxfgZAriQ36bubdAV7u4hAAn3XcP6/Z4vap4ZSoxVn5rfXbSdDMfbXCrFAC+oX+E1OL7NTRBQ4gfdFHq2M3hGneyo15CuSNw+ai4XJJgIgNWegq6iYYWlUkf+A+iZa4x1JpEhpYVbGJfGE0zBkSim4VWZgOWUkN59GrARbzfp8wxPsJxiczbpyxLgUeODiOceZ8Lz1qnD8o2dY4ZDH4n49UJqF1ChQJp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejLgYZSR0yfY2bJ6OliuaybzgHG7znmXv/KanPOgxEc=;
 b=s8Xj4tPeF1vuphJQiBrmmViNVhMxfy/G0rv/9znJpjt83mALwTzGNejm5arz9blVMzAtUgxf9cjxyEMPV8NExv7qE6hb+uJTXMy4Ha2vznH6d8RY81tmz4DrQbRomsD5xqJXQQQCXoOcjxbTiF7Tgt+sPYFRzSHx3/4ZsipNXcJG+qVuvCgmOpIDaMGcyC+2tkZARrLcQoE6uO4PSnOvVpdRIGPMjqNftfTDB3rMPonCLmTsQ3PAxknBWkEEo+InishpdKLa7u5dZlCTbqPmaHEjWBoZ+AVqb3ezMeGNqu30+E2Vl30R3JJ8EErTqgyYz/55ak9M+E4a0P+Lxn3Z9Q==
Received: from BY3PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:39b::13)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 17:06:03 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::a5) by BY3PR05CA0038.outlook.office365.com
 (2603:10b6:a03:39b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 17:06:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 17:06:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 09:05:43 -0800
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 09:05:41 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 6 Nov 2026 17:05:40 +0000
Subject: [PATCH] phy: tegra: Set has_per_pad_term for Tegra238
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-tegra-phy-fixes-v1-1-b53911c20b77@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAOMI7moC/yXMywqDMBCF4VeRWXcgCV6gryIuNJ7E6cJKxpaK+
 O5Gu/w4/GcnRRIoPYudEr6i8p4z7KMgP/VzBMuYTc642lpT84qYel6mjYP8oBw8bIOmcmUIlKs
 l4R5y1HZ/62d4wa/XDR3HCW7EWbtzAAAA
X-Change-ID: 20261106-tegra-phy-fixes-fce17e7524ff
To: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
	"Thierry Reding" <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa7170b-fc4b-4fb9-68d4-08df3c283d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|18002099003|56012099006|11063799006|261026121527099003|261102130727099003|261102123227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eK/Gu3hVCnp3wK6tP/nXS7XWqToDoOB9Zk0EYYNY7cotNzYTe3f9zwAPAmMbb33eUCtSl5YgOeVSD1/7RyRtJ05Fm0OKNqj/25Mw1wHb8BzUp3uhjYnZ2MTibbX5pa0ItoWlk48xBX2j+Hh358Zj+mkqwnjF+xBOemr1Hk4Y5oPNcom0uT8ayhSOfRahcwce3Zl5NMzGu+1clTL5vN4uhsgItGOGpw25ndiVyAkxn9n6Fe2VPD+CfAiJpOGgDVCm34Ac9Y7CAIKlIk7USNGTsPuKSgKUD21bpowG6ahvqgK1PAKeR/jkhrWyYhsewtG0zEdKtmMsuCyj4Kk2KvHcFn+mBdYPRoEiI5LmcMicXnztcKBKx11x/HsqdARM2mA6ixbyyl0Ty90Hv4DBeNDCKK+plZk6na91+52Kr2IAaSd7MtpzZckAGlX07BXnK+48vpD0Hn3/x1PoUTLI8BFeqUPURSIo99apZd33fk7CGjwCmFk012xYg5Lsypd6SCkyqGuxdF40soqXPNx6YXqqhf4zpxs4MXFvAZ6Rl+cOqEzz3TE3jeAzthb7mPGVVedCHH5Qnm7PwECUJfs/KusmNd603iA3JARH1calEVnObViELoxNePWZe6L6UKFMQeSJtSA0sQB5GgAUH856+vv5LRcDO6Lk/cKNENM85vsFYEIi2KMQ4YbEYQz+N2mFrpzd
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261102130727099003)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OjKuS1IDpVs4P9IbHp6zmK/Vt2Opf0dzi1zAWRlGC9wqCz3ppJ1y4kzFPn/FaBXo+8OtmpazcT9f1Ouut9NyTr+qDP/92D+cvQCGldKj3MW+J0XzEtaO+IjT73UB13759/aol6hF1G1r3EXRQLqY3VkygGX1Pu0jhzdjKVTMhQL3ZLlHP7W0h1gZlmHRWn+9g6W+Uj7mpjZdVR1xPJJQcRX9qvOWmX/fh1lsw8GTm8Msq9dpU6D8NiJ6IMWQkXJ/v8rqWHAUPoRQ8cWexonA0HDYy6XBhrrX11lw1ujDxThXt8WADSNRhkttM4BmTpt1UFTke5Xw9W8PnaCGSVmXRjoCi7qv49kFM1nLtAKceOlYKhpYXwpuZgwYtmTDJE2f8tVzIMxBwiCPz7HK71d2HT1d8Jzotl9i3L47xLCpd5/tGSNTlUs1z3CdoIlBVhEc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:06:03.0747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa7170b-fc4b-4fb9-68d4-08df3c283d14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694

The Tegra238 device supports per-pad termination, but this is not
currently set in the SoC data for the device. Fix this by adding this
for Tegra238.

Fixes: 8f56fdf3d8cb ("phy: tegra: Add support for Tegra238 XUSB pad controller")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index aa8ab94fad4c..4191acebdbc2 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1770,6 +1770,7 @@ const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc = {
 	.poll_trk_completed = true,
 	.trk_hw_mode = false,
 	.supports_lp_cfg_en = true,
+	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra238_xusb_padctl_soc);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-tegra-phy-fixes-fce17e7524ff

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

