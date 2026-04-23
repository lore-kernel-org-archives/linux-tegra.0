Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCA36492A;
	Thu, 23 Apr 2026 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934809; cv=fail; b=LfUJNzuHESWvvauNS0NBHA4iAfLJ+QLko20TMDOoLKxniZYCvs+/LVJjseT2v7RNzMoDThNPuiiFiw5m9opDcKSBJeUCjsd3f65VpyTExtdDpA1QSR94WcoTXOGNLZrpnEvm/EXDsFxf8LWUw12lWBSY0T15cJfUCDK3PtDcwKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934809; c=relaxed/simple;
	bh=tyL6RgiJRdYXU2Fyf6YPahnXi1W0yTEtKI1qyFVxCuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTF/JB8ndiEctBI+0+CEss2L+znTcc7++tPAWMtjge4BcBpMWA/+MDDzo4z9v3kfiAlSi3PvLwFNCA9z9Ea6XCDUEyauVnbwKE61ib6ih5iymbq7YS9TuUY8ehk4JsJRFK4I/ttjlVTu+TD2xk54UUCv1zscwTAng0nTGHs9lh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UHxi9AbY; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UHxi9AbY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLXilCoFis5YUb/SP6Tujv/PmWU/VuWwzNwZzksz6DCdi7LPNScms2luA4WYgKuTsjABNQH7ULAGSfmXCpRIbIG0qAo45G4+zikFw+zXtYv2uqBe50D5dtoABkf7MtZtI6ZxL7vfMjCjbDeRyJFcocBQXBc7HWEX59LpU42cdabjCiIA5DtmgnCLwAB/NWMvRbMMXJIsCbqlpGAQakzrKKLdJAG1GDJFpE7oPs9zm1LUViPqlHBXgamkSio680UNqDeG3yJCyTgjRlKdVP+y4D7JgWz7SjwBHe6QS2OoGsDBZkNu7TyiNlRR00Z8opx4Q+MWcRdRPiftTfGiAogXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XR8/qF1NXML8MzYD0wm1c9AGP/8DLVVfAwlHv2yliE=;
 b=Uk09MRXCuGGZPYvJtKFPiVg++E3SPlGXTSTuLESUX8cmB/zOLqfy1ZF4/T0SaGdsNtRfDoXS8JwvH+vQq/x3N1OoXsCV8TXeqZVOWr2MyXh+stV+agxvf6rMVDMLU/96l3Fb9Zy+xh2VlQvKZAUCsk+h7t9imLy12N09OdPICC+dw13yM+14szSVNr8fe9dzC3p1OnVCzCG7yruHcw2sUQQKUwKQeGrwKzTBcB2ywO4gLkUXNpF2tTo7cXm999nG23B1OYwraDOu877uK7eexQtfrpuOp+62oFfpeZxpqfdWvugBA8VwDzQxBQ7cBbx4lAlz0EfKzaz+MaHTCZEISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XR8/qF1NXML8MzYD0wm1c9AGP/8DLVVfAwlHv2yliE=;
 b=UHxi9AbYkzRblnD9LGUXcZyFt8EcTDiibnRBDzqPRv394hx65kT8L8z6fivtnMP6Q1s8g9OL6Ks3DG3cqxt5IsxchT68NXDtpBXrCIYmH7p/T3n2cjKX+TqnMmoGlv2Yefrj6Dqvxal+4ITSfhj87Izl60hL5mPtN12Cx2puUCTYi92j/A5PoZTLBta9Z0W7kqNUhqOZAUnZ3m7aEEsdfgHndSwAndsxqNGWlOn2QwC5sMluuFXq0cmUW/iwjhWoWSses1xI/Vw3rLGkdMO5XRsMtTQJD37DkYepXWT5mGieYrs3bbW+RpVUaXrpo7rUs07pc8gAEvXI9UgzZKVL7g==
Received: from CH0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:610:77::28)
 by PH7PR12MB7913.namprd12.prod.outlook.com (2603:10b6:510:27b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 09:00:02 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::1) by CH0PR04CA0053.outlook.office365.com
 (2603:10b6:610:77::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 09:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:43 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:59:34 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 08/13] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Thu, 23 Apr 2026 14:27:07 +0530
Message-ID: <20260423085718.70762-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH7PR12MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc871b5-8e64-4b4a-56d3-08dea116b412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oh52OucviWcHmNli93g++9SZ3rU4JCaTTbw/Sh3bDOYzarRuXOEIaGkFR03Gjz3xAlwaz3T7MtIPyc/cQs6QNTUQEZY376X/4WsR5U1+T5LBGKVFp4XsA47hImJFHoqCs6V6NlssUx6O94ioF8aJIfPe3/+gd4wqUr9n2snpn9ccCFr85XJ98mHvXByK6+8zeiDVnUQeP0YJVZJVDQUJ5+M7pOpfNKIvoIeyCniIvXa4f0Ve6VgThpsZ46684/rYVx3pw4oqREM6/ylcTWMA6tXJCMebbMugI+znIqbyRigdyE+hcuw5IhYFPNDwMQilZ21OpZaHACljXk1ypvWnKtkCs+e4p5FlAALO4KjnxviPOrmC72vw8U0JmfI4Z6Zn1cfGcYogIkjGb59idAVUWA3rsFlQnwZpGrwKyCEaq7v9ebxI3mijinPWKRopjsw5PP16BpCxLe5E8RyJEuEo9eIOs1K7apxQhDz00ExWoO/SO9P+F8jEFUp14Mg+oPge+RLgxSVQerbw/qqsPH4VxEsBIDo6sjy0R0V9NaQbigJ4YTg/NVfBbGah9xKlp6uECVlb/T5TTAoHArDpz/JT7uCzhm+2URNM3MeCXFdEfIk5ThJ9c49kh6oQRow+sqaiRaF1FuiM91M/R6AuMR5kwlMwdqEWm9xMl8TIfybcRfyevXdgP3p0SNDgw1aTCh0bWHhrepNizkc4vpdTVbUYyU/v2MNRLxAu86aKPqdFNFuBSsIb0TeMZEjEVlPv5ynvFKNmmlOLm3n1Pa2u22JFYfCipnibjMGgAM31qwF/pZMeu5K6Ro8LaS5g8SA+yxet
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	frv3PJGqA9QS7RDgMlhSRkeogHZCTVzDu6WQYlYxYNLJ4IdGea51lsZAo8ZwzP4AwaOu10AOWcMpjqhKfwBMBj5wBQ3X6gb2H1ypXpDSaafOvDP5oOlwonGUCClDfIwcHQKlitVrCASCywJaPmvgH9/Dy05DbLo+F/7NjGCnrnODK+AwYuc12duZ7ViMDTp6a71V1YAO39Zrf6luy+MfcpZvNMieZC4R13Vs49v6Lr1PzCd5cz5E7G2F4kc4ROPyKXId7oTZFnVoieGpgX5Ujq7ZKY02F124gItqWn94z/m1whr/5tWs+Pkvu9y5r9PNy3UkOfB7ig5T2l/nJEGvI+WU/fDojMm/lpRZeU4+MRn0Urph3CObsSfMYfIQK8NM3rOBXxGXCc6awHaZpCwIaIC2KBA32V1fQ4BrZfDGEj8ZkZpBmDC/M1Y+l57+885b
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:01.3937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc871b5-8e64-4b4a-56d3-08dea116b412
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7913

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..edd42daf7553 100644
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
2.50.1

