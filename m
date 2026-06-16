Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E9425CC2;
	Tue, 16 Jun 2026 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603792; cv=fail; b=rkmfi2bqE1iuACrE8Yr+MVKz7GpnxDz+eODcHM6dvkrsEgB/QNmlZnu7shJqijYs30+F8NzQm515NRdTw2xoSM6qxdM07wqWyxWWesO4nY4u9uBHU2RkznPwx2FRKnUdX5HVl/jGcE0TdOKpmMqf5vGadjMb19lcudpeTL75QvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603792; c=relaxed/simple;
	bh=VFMOl9GAEZZEz10pbGDMOxRGHnc8DXmTzLgT1pZfJH4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7/rO0omJPUdItRMgttb8fuVTimQK4PgysM8pbHBukTcospsdvQ40LhS2ffoWVbcAC7LIWQTZGMDTr2Un5TzxJHFLrdf2vkTcg5c2dwb79TLF3UhkyVJdmFl9Xu7yE5Qg8G8Ilers6CBvwH209gJ3QHhnFJFwoqhxLIZ7C5iAak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hl1k77W8; arc=fail smtp.client-ip=52.101.62.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hl1k77W8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5Tlg6Ld5hACl2wOMejBSwQHCSUswQjt+tyC5KbJnSQXFONtVSGP8au3c1LqtcAoTsIGACWvxwimIRdeiO/hYa6M5uvCUFOFV309l6LwcKqNVJpsuHHS1duONyJx4Oum+JCqav04ercwWaPzjF6I8565x2zDIJ7QYVWQyBTJTWN17RUsgKM3K19u/vu1d9rCxZQR7krDT4lbNjtX6atTZ2mWnqpnKJaGmYYq9wbgMmkl1oJ7OSKbCZYBOdhagAtn2kk1ZSb1WxwxNddYy96GBWB9Z05rTD7mLhthKePS6RcVYs+p6gXoUbFSkTwFnLXEbmSF2XMCIYUJB5hz3kLYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/XP5SA6AKZyQkO5lE2T15tusFiaT8hYyUC3Eeeh0ws=;
 b=IINzxEvQsnQfv+pLB/yKu/frfaBCWuq+e3XYOxbpBjZHLrDNHmB1CGPD0s1peoECPryGlM1RAReEioGMu+fsDoGlEFoCPC9mSXxiRnE7tEHKgh0kCW/azQp4IDiwwKnRZ/DGyKdRbl1YO7VyyBjP3OVGthYxHmBFpyqlPHmYPLGU9kLrZitSO4wBPSrO5yXDenxXjbXUGvzVM92mboC2J28XH7/Kk9SBgdAG18i1EkSPWlHdEj1XvmgKcahHY33rFvZ+fH2t84uxOZgt4mrpvsFdwPXB9nNxq0Icj0aukMAF71Z12KiFiLkA0/AELh0O6jd2px1HsECN7r8VQtzLNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/XP5SA6AKZyQkO5lE2T15tusFiaT8hYyUC3Eeeh0ws=;
 b=hl1k77W81jDyU4HSVFT46rfi24JeeBbBwWOlTXj2E04nU6SJisbON8eeN6r6Ac7wAI+l3vHc763ES8FhmHPn/Fizbp4uzm4MlMI+m7Cw8M9DGDQnkrYVfD55qs9KIzxfdkbRSWjC+4oPfa+X9QceAF2T7UsZwKPq1QP1uef4wUL/P7l+P/vAWhGLvQ9DzOsK+QwyyXduwI3cIJfwVoxO0fn0ZuEcJ2FyyYI03Iw+CLNLradeeYnVeHVrdLxlhNfL0gyHBF8+2NMmWvGnYI7GoDj+V5alSzKL9mM8s0hf657oaUMNh5xAne6llk4g+plERPbD9a/I1PqeCPZr8OlhnA==
Received: from SN7PR04CA0189.namprd04.prod.outlook.com (2603:10b6:806:126::14)
 by SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:56:25 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::a3) by SN7PR04CA0189.outlook.office365.com
 (2603:10b6:806:126::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:56:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:56:15 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:56:15 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:56:11 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v4 06/12] i3c: master: match I3C device through DT and ACPI
Date: Tue, 16 Jun 2026 09:54:20 +0000
Message-ID: <20260616095429.3947205-7-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: b66a25f5-3fab-4b22-4bce-08decb8d8763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vdRY8OieJ8im9/Vg6fvmTFeDLFAoHwedih/RAxS1mR97nIanhf2Cp2GpotmEC6AsslchQMoS8+QxLp5n1xz/XPwd6DpsfpcbmatfdT1IfEfA4Jkj7Tu80ryCq/FQCh7XlHBAYptWVAPERu6TwiBXL+OEPqVtAr9aFQ4pc2aXJbpuIBdnjNwlo5MUjvXqYn5x1c2lYqUfbaldgMesGx81Mgq3rsXiwZhuGgBQP2anc83pW0fGdmT2mc9mAXQSINLeznEI+BU+C0dLOJHBWYjdfZZ5M1UhXgm66d/kIHSgRDw424WlnMGMQQSruPr4KUm6+0+o7RQSpLhjb/r1hdgFtT3wSABf0mOP/BoFonzPEy0lDeD5f0+9Orn5DSsG0gk1jrXY6lV0w+F7iHHMWThQqRKh9rxmR5lDAIZE67sXwWSw6EjRPqqK5ngKyW3qHVxHeA7uo+lponqLGxW88yqYUqpJqF6F7FbRNfWCLkIS1M59wjJ0+bF/yod7jlx01O7yUb4hyUOtAW8AMwMiWcmHjEAGPJ28dgGUMlcKv9PTfbi2UcZojpudfTXfs6Av64tG2ZCo9KGtUWsA5K7E8ttkJF5g0AFHebOkaS6NU+xDVmGDdcYpI05WHmKLCjKcYlStVsfqcBw1gdgdLk0BM/KrJg4eCF3MLdV4hhsvBNM/oUCiCR4DlpULL/IECkzxifR8dpWKGL6OQn+84pMkls8gwwmrxfkENk1QZyN4aUfnELY=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gVvOgLT5fGUUki5mGm0h2jGB6bvacm5s4jldH0kEr5VuBc4cn6FY4CWaxbr2rCybNXxC3Rylw/3RSXYE7x+p4IEEwD3aCwKGgIXwVQFlDhmDrzg1joCTxJ2jrVp4xoM5lZCs4BJJ3OBY02aWr/vmUfH47VCma+WRDicru6Yp9ekJ+8h7TEb/u73/C/EA6D/RTQmIbmydqcD2gbBSHovMF+T43B0F2hyoHoHsiMSTBpXqyDcppNVa/26HuvloeO5xixKWQQzY5HM/SzZfqC6Xq+IaUYlFaRHQFzjpeUeI4PZne2Oh8GAgGoM5CDG96izu4EO7ZKGkOQD5XNg6t82xt6T+ciZZ2wNqNbEJHUhVCh10xxo0RFCyp7m9KGQLUCsMdB/8gmzx6SRTVN5ClIyK/G3yghQ/25XIFphQvt9yyuiSnWwDOxu/4LYbIA1GYbkm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:56:25.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b66a25f5-3fab-4b22-4bce-08decb8d8763
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices
to be matched through Device Tree or ACPI.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index bcc9c2d29c34..1bd545447b81 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
 	const struct i3c_driver *i3cdrv;
+	u8 static_addr_method = 0;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
 
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
-	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
+
+	if (i3cdev->desc && i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+
+	/*
+	 * SETAASA-based devices need not always have a matching ID since
+	 * it is not mandatory for such devices to implement deviceinfo
+	 * CCC commands. Allow them to register through DT or ACPI.
+	 */
+	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
 		return 1;
 
+	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (of_driver_match_device(dev, drv))
+			return 1;
+		if (acpi_driver_match_device(dev, drv))
+			return 1;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

