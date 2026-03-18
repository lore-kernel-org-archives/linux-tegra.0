Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC833382DE;
	Wed, 18 Mar 2026 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855067; cv=fail; b=ZZxSkKWgr563em0AQrVrigm8rhQhfpu4D6/eYR0oeckBFKbfbpXDhN+CxieO8bfkat9MnZu9s2iXVYLQkj+M42r6zQMgWKXUrN0QqBgW+VejAnBHmShfpsCSk6c4jSyd0lycVqcr7Jo4oiOKW/7DNFo6TOkuyLNaaBn5ee0mB4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855067; c=relaxed/simple;
	bh=nm4at9UvkjL4rynDzU3XDZ4XcuBw85gvU66z0Z5edvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5XBT+i9I8cKe6IX3+APl8ci0wype8qDhUBmmvtaFeYLa9WDTSypXbK9ikIYDKMThbBXGNgxerwuviIsUEujpjauj0aj8wC3md3VKV5LEbc6d/4x8hi/d6vlcQb2xHktxiCNswmEXb81Z52GuihsrbnLt03C3+iMuOIyn6l7K5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I2fzHbDV; arc=fail smtp.client-ip=52.101.62.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I2fzHbDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4j42k6AQLvpvI99yOtVWHBZsRrTowgA6rjM5wwxv4plYu10br8j2XD1ALqO5toJ0wixj2YjPllnpValvmRKXa7rloUzm+4wZ8UbMSE8eXKmIZcNYwimvsk7VlbVoyxe7PWSmZiqzSNMAGGuInlLkLA9oyW3eH8ovW6xFjPIkKLI5RjqnGJ7WLNgMyWQdsLCcY+V59EH7J74skRL1axVbqJT/mMzOyln9vDII2/aIaL9FGMCNTmQH5NswD6iORpb66qRJnl6/9/9f9Xc74cfa9wW3lAB2bHFnRVpfNU8Ls8i2ZQsIG0+St1Ml5cRIJb1KUrKkbUZ032l3AlLP4jhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxdW/sL5EZN94MQGemkRDY0y5TTGOnjiSK2IeyToJy4=;
 b=tbCMp1VWQWE8y+qR/jdiGevEjODSk+EKJ7u6HlAJAPeKDJ0UwnTf/52tYRTdPfwYNhY+arQnbBnohz6Kykrj1VzzpaZhXvyApAPv+Kn5xrlRcAys4CcgPzpo67l9ttkh/pGojXCl9ov2VkT+VApH44CYzl4fwsc1TKDsINpHUCN+hg1uvPUy58+yW1Nyb63nGqUCK9s8r++MXoN9xHhMElwLKiHMztErPeIdQRcSwNgvzWSZc9OpyAVy06PB4koj7lqHhT2ET199iAKNtSxOCdO6J/uSBtvHq3NzfZB8np6MSGNSx9l8kvCM4L1MZoOrFwTMtJSHAh0ravgHPwXLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxdW/sL5EZN94MQGemkRDY0y5TTGOnjiSK2IeyToJy4=;
 b=I2fzHbDVNoNjQouzNPbzVieKCulUN9XywIAJsZ0mnjJe+aTn9/+GwDeMbqmInRqSf1BqSywNIzCqDA0uSlan6o4OEoAo4BnY7Dz3GRsuziBrxJEaYpNUQ9G836rtY/N1txti85mSNwuTVvIZSBnv67CkaOLCzAA1SKw08N6Gqe0mQspYkbbsZJxxjct7iXYJZgmbuPgB1SrYA3yIAc0FFvpS+08t+VTtAA6vzn/bnOp3uPXhMexlRKuv8W1TBXhnIIWfJPRFIo+I1M4XOiB3fqV5DilSC5H4GzoVCoI/a+O2DEgGL0c11rPUFFx+dTPXGJgRNDnAy5bILVwxw39SiA==
Received: from BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::16)
 by CH3PR12MB9732.namprd12.prod.outlook.com (2603:10b6:610:253::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:30:41 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::b) by BY1P220CA0008.outlook.office365.com
 (2603:10b6:a03:59d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:15 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:08 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 08/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Wed, 18 Mar 2026 22:57:21 +0530
Message-ID: <20260318172820.13771-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|CH3PR12MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: 884ae3a2-6a78-40cf-b49d-08de851412af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QfMX2ZejuDAvnFte4SMVZoL3NJYAjhhEibjKGFnva4AT3zBYB8iI/xmzL7f73/6EqD/G24DmfciNpQ6rx6n+CKbDrvN8I+oBJd7IaQg575k+e8KLdF4Ovp12IaKTgm2jMl/VePCeUf2YYsMjsLLpysTBMN7zYpmUrGY5vMqvnpH+5RLr200YnEYlbi0hJ/aIf4RkM5d7PXkfcGW5/71cVRq/98vf99e0sEp+a7YFaVPg6fFXI9n8SeH7samm2XQCeVDfUyp8H5OI3/bRX33BUUBynfDycSE6zw5iISnUdwAaGKkegeiqd89evZ3KIbtdVmyvbJuwWxCqZCPPJ004YffnjTWB6aeI59G91bLJ9bg1ZqyEHbXUp56NY4gU0drV0k/wd34u0VNteuoXTuZ1S8hkMqz10PQpLoxKTj3nmGGQ/c60h9YgpIJC5iuWw42ZpseVjTGaXPAPTqU7gSXkwFoJoza7WiwtuF4H6DwqVCQNppWG+wt/frpOxWXIKfVCqUmxBDuP5nv/si5p0SZQhI3FEaXJnhBOL4HWtidfUzoMuB0nP2Kwbe/jdkcE2qzgr12rNbdirq27vkGbHvO5BZ6IgCTNhawhPisySuSVOngubpvRtfpwGqYS+GivEJd1mlLcYoMKTIchwFsNA40sk0kiRYuVeWhTGFFhqTJEGTz376DwcvFFjuMXGa5EF+5QTm5zsnEgyTG/3c8kZm/xgmlKHBOewt+S19zxPhefeWsBd2MuKrJdRUya5AiZAe0/P7G0gSVEgaZMYtXkDdTv83K/1nnarcMmDIob/XDBcmj0DQta4VFqsRD7jY7x6Qgw
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z3IQgpGVQvfsYQlxYy8MKHuhuaXCXbwT/32lnsVCEXC/9HNKUaQVrp+X5Il8hVDZkbZHkKT/QANT8RvPI9N0z+B6UuQk9vvpLTD8pOxOrDFtTeo60NyKIu9OrXX3FRw1BG0BSF07HAKMOuzElMLewj627iuxUw6oEIva4SM5K+3JBumoFVWYRc0wOetiCE8YkRHSCkdMC+FvBhX93CRZn1q+wyC/83eIMMNcRljaLm3hW64JSbnL4DEaMbsLDUYnq/h+NGf1QKHw5TvwkTlXmCUbRVWhTj6vrTedJGpNkeGlNStymIaBxlb2mfr2I0R8eZfli3dae0vF7IAJLPkdLpKNCF5P7nkqWbXHIKQFbZYjTj8nhzAZS81gd/oZAyJz3z7oYAImwRCIfzeGG0+5d7CtJoG89CKFwM1C/HIUZXJlTA4ekqoaMJyC9slzyD+l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:39.1499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884ae3a2-6a78-40cf-b49d-08de851412af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9732

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static
addresses to all I3C devices on the bus. SETHID stops HID bit
flipping by the SPD Hub on which the SPD devices are connected.
It is a prerequisite command to be sent before SETAASA as recommended
by JESD300-5 and JESD403 sideband bus specifications.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..05ccdf177b6d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -308,6 +308,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
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

