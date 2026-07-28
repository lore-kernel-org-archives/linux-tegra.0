Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8663BF695;
	Tue, 28 Jul 2026 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222148; cv=fail; b=Aso/CKfuc+VVpqOqrJzGvd8ki/mkQ90yCFVajC3Luzp9jcCWNvgQ+vgOD+6hk8xW8e09GwBAo1Or0eXxJ4ZZaGOd+ttozuQTz94y1YOF5enl4rlqLaOWBVVC29uYUncirxxWacfLLc2e2SkXL67FT39iXA8YP6nCszsYaxaybf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222148; c=relaxed/simple;
	bh=cnBxZfKlFcPWDDScr3bRU6n4zC7SxOLBJhii9RPj3Vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ED+BC6LPTA53r6OX7mzTdLzjkYHBJhXMmV5Pmjc/5ZE4YbkQl9jcPGvBHjkW405KRH6RPBrphCqngvvKvXo9I+ZTxl2LYXrjOyF2XM+I6S5FYGH6STx/vcME2aEHVa3wQBSWmMj2MgFiJCl+SAF10iKwz3ha+ophL/HrPdg4pac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sK//moHB; arc=fail smtp.client-ip=40.93.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sK//moHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg6Re5tx/IbI4e+nm3EQq/HvivM6RzVHUhRshDq3Vwx8WHk1+Eu0x1pIdwLnrRevI4VYkS30Kuqf5AX3xP5P+ifR0u4q+7NgbGaNplDbWMPoocJse47hA22cMrUe4DofTHJ5yTE+y1OE/HtPrCjGiCrhFownPO9JAbtCUNehMR84LqfxXW0aW9TksP7sa72pHvP723UVFzxk4MfcCkF3hpMf/GBx8YidfsRSjVVPcX3ar5JLqrbvIWqFA5f0hfBo7hL8gz9F7jPdy8v760bEGAVL+qUAp1mj8dBsAz/lVCDo6KlZ/CgUAkS13ZMyVkQQwTABendyqjPTkscZa2c2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=yuvk19ivayShbCTldETyt1JdA+L+fu8NfZdN5NDJaxtPdv7mQDZ5OXzvW36CZ1w4/t49bYd0+lDMqHoCuPoxNcBkk4/5NuQ++7YcoMU5ZtqmqO9Q2RhKGMzrttB+APrZs1OR9+lErnwMf0K3PzO/W+V6EotIGOmGbYIGzLMQjgvBAVfg4Ed66ugNOlLVbk38tNvS1MjwF10BvsOMYatT8phS8Xa8HkPHd3YQx4qBbPT47HlgtA2lxO5VpPPPhffhittEod9J0ThOsfkaT2eaqBuG5B5ZMUGLQqE7UxoK5+5hTA6J7FTKlb8gaxh9ZXPLY+xOcbzkCBIu9iRTyAR/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=sK//moHBu8EGg3qKOjXK4v/sDKJzef49/uIswOoQUYSrANlu7V9oaTf29fwOwxeWKHigXsMtyMmBW9whufKxsxsixzGs3iKI2BTSxh6hQYxOySvpGj0ueQD0lb1ek/77FNDsafCuuXoQfHJNtwpbpVGO9OMwWG6A4MpCbpSm74hijQPNrRsJLTMnedvOU9wZB8gp1urJG2Pjxpq4PqSc+/POc3y0D6v4+DYyg+X1YOcCQlmn1Usd6UayaB5v+m8djKD9yibVMYR2CKrWdYppyKYdzGxheX2P7aK5LPcQkMTeWkDz8twjvJVmDGX9trSOiYTsM1tPsYD5xnV8OqWuLw==
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:23 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::8f) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:06 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:05 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:00 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Tue, 28 Jul 2026 06:59:49 +0000
Message-ID: <20260728065955.809445-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc72c40-069e-4906-44f7-08deec762bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|82310400026|376014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xTF6JjRqwcfKenAg6bzCK4gcdVdSoVvsoulsVaMdITdvFOrK2yEcDXuwcHwUvQ3j2cSheil50/QTWMnMO0Cx74uXXMMCFn3iN8nfcPM/BbIbzmQNQUDklCliTPdCBNjV2mk3jZMox262njhOTWQbFVZahPIRuU9q0FpJ9n/ybEO6FvEAjqxThdhJB0Pkj+giackQBY74zqrq0oz/K+D5rwzKyiCf7BZ5h7+vclRgtdgoV31+cA1eCH5WCAzjAIA+w9xLbUXinGxFGNXeanLDcworN0G9ozpAjjkFVqSPeOQfDE6PgV7BXmY44U0jTADHu5D+GQwmfeMfVsJyNZ8WJ6xAxzBZqqN8HoK4cAMpYEcLeVqBRESzqzGgbqQn4ZPF0t2WmFyQ3FxxNB+DPniIHfxnfm4UAmFvmKXrdoYXXpsHGzmuAUN8YjAdhYFDaRA8MKPzjDQ/5ymyqrVCH+kL58pa8k7YXNLEBlp6JDYQYzTZ96n7fJC7BeK7oqbLPpD6URH9r5esWR6ghvd6644SgX+gVmRYWk5Vw/IiHvlZ/82Rm+NXKpq6SAu1zfu77xJplpjtb1qgd0pLmjNQINlkcNFGENmWRNHbpBqGFbDah4jjksuqsXz6oZYAq4f04TxGoN0VpBQbYeGQQwGIqYeyNTmtjwts/KbAqSvlvRhhyE6JyHSObfNgI7bUDafYHYVFcfHgfK0D94x2tV1H6vr7iA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(82310400026)(376014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpwsFXG9nLWOOItWN+nhDWkrZRJ6/wfOFrBAaTqnwTjN6Ap8Vmac1WD8W0DtSKH3wSPyYFso2cO1AYwI9teNxIwc70EzKEARZ7nlPpe3vkQjZKu1q4vqv/B61fq13fReD87WEsrE/Xo/wum51KgB3H3Ig1NfM5feKYXBTuvgyQWcVhkf9O/rrDM9Ko2eY42DctRFN2SVONxEoSV74JeXCodYyzV9x5ONDUbHUTJjtpg6u4zdV26tL22uoNkZ0NLR39h+4cr43q0LJgQJfShjeEq/EEwjex4wf7Wsj0fDRJtagExQrHROohPqluyCm3JvN1DcRu1eGrPJ8UHTtEHi01sWsR3LBRXZibqcF91JmUjkFCu/43VVc5hbMGYGfIfq1GYZo/z5H1dYS8Z6EGBlE3zoV/XmYlicm1kFIkHxfoku5P1udl1RxOfUFP2LWTFL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:21.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc72c40-069e-4906-44f7-08deec762bef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..29030fd9594a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.43.0

