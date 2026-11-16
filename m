Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842680;
	b=gI0KonZNT3ggJvtdB2U1+q4VbXO1phdPLzFfw3ydV8RLnX4eDqU86iybh/mKjdwA5ry+
	 UOTksR4ltNaAlVLD74UQZHBre51sQTsPN/uTsHVXZ1CxwTE0564jMyqyYVs7U/CGxYwXu
	 zew752cUemxJdpmUSyuIjXqvoZYvv2x3rRQGNex3t2ymJTe7Cm4gVCSRHbdEQXQwQUREL
	 d7YlcMOVFJx/mYLdB3HLT4kuiVyh7EJQXfmb996KOtqZicooF5/i4Csm4nUv13xQhtXm2
	 QWBuHTsjQ9QAEaCJ77G5146rO0t1iI6jEm2rK+thUHaNs9kB1z+qBeyS9RnL7Wzg2SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=7U/1elVb08ga0lZ/Da21XdfnXG+vHvBqq02vLZngvH8=;
	b=Fiaatm1QFa+Ohp5O8gIeIYNLdOMLH9eQxH5Jd+SFuY1w1BsljZ1WvHA3P9YZaTPe0V7W
	 ccamWZzNnbLC9iNe24TKfdNM8J3rkO8vwY2J1PCWxhf+q1CkqmfrWT1SrhpT+U6/qYTDN
	 U72UySiX0rHfU40KloePZBuDaFecNs8SpRwmGzJiGU/OCHhL2JwFHR7SD2V/5bI0CyBNF
	 cha1voOhH6mqN7n4gFs4ySXeNGLwbt6sSSruLyUyu3xee4+M9PUeoeuSzpwP9/MvRmis2
	 CHCHUO5mEQ+sojKmM1kwYOLtSwlHN4AJHOef6miLCvbMugNfZkZnw+HC1/AvVWOllJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lvyVigzx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.51
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F2606A338;
	Mon, 16 Nov 2026 15:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844F2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lvyVigzx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8V1DJBim4OkX/4RHFXjqvg7mqLYXIGWGmD5kc7J5H8/IWQ3pggNhesdjGtEBkW08bpof6p50FvzmCXDMjSh6oADH/vFeJA8sJujrY2W076MMxL2PbpN/Sv9fGztB2SdRwIoYDvUqHf7hKqxOxib4VYijavUaiU+ytbemGJtROvSpc4AG4AogvVoa2K6p4SDDpS6mVN7JIvBSpPivfaTl0ar/J5hYf0s2p7RUZyjUrtGCukqKG3PSfpHrGPsePDMW5//jbVNhLKcknrg+8W/8KjQ0JZX3FUVA+suYorgqNfcEbPmHBL/u/JAcCYp+zizrLjE6CCphhhd3X/lDscY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7U/1elVb08ga0lZ/Da21XdfnXG+vHvBqq02vLZngvH8=;
 b=n/Zwh8Bih5sx5PBYB0Ml/rfsUe3DB5qfBJC+y8ssKnV8lJJKJihJdkXGEaVjDeh0mRe+gsDK+L+wdIWYnddQeo1h8uZta7OgdyJJZU72yBhL2QWJ+6dNTids0crbHpSHD0tT/k0HEvPfJE+kazkkENzxT0MirwOH+kd1L7hmelLPVfQ2AAew0tu5PqqoNd2r6eCAKXuB64trj4OtYOWoYcJkwmd9SZ/ZDprwVAuXWdzln/BRWZqy40Clc5oYxF0mj8saDaTcWdxorzllzYf6Iq6HdtaoG3DQ5EDGH0m+byJZZPxyhXWpUdFWBUL8dy5FNPFG4ufxhdv0puzlXiYoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7U/1elVb08ga0lZ/Da21XdfnXG+vHvBqq02vLZngvH8=;
 b=lvyVigzxmMnhyxAJ6TQEoVkhsxk31A7NECJ7X78il5OzRn/DcPikK+G/cdjCTkeX94ytgsZD10FDsFWVCTK+dY8ig22Ahi/Um/RcxbFA8D50JbTqT7qQxW79rskb9i9bjxj0Z00GzLLwB6zL9mFusqmADFLRAGCWXywyEauLDF9maHg3QpIzjaBsu0sIRAdgK+NDWNkyxTmir7h4D7UXL86uCDMjMbOHSdmEF+cz7IcVjwQjTH1L1fcU0s4HOwZFlDxb0+TZ6hfr/locUBhD0ztL9uh5ori6Y0sBjcOudkm0gKQShHxzIfsO/LuAiW4FGNddxEBzYZtZ9TxtlUBnfg==
Received: from PH8P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::6)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:34 +0000
Received: from PH1PEPF00062F26.namprd02.prod.outlook.com
 (2603:10b6:510:345:cafe::23) by PH8P220CA0002.outlook.office365.com
 (2603:10b6:510:345::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 15:24:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F26.mail.protection.outlook.com (10.167.243.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:06 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:03 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 00/12] usb: Add support for Tegra238 and device support
 for Tegra264
Date: Mon, 16 Nov 2026 15:23:57 +0000
Message-ID: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
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
X-B4-Tracking: v=1; b=H4sIAA0g+2oC/02NQQ6CMBBFr0JmbU1bQYor72FYVDrCLGx1Co2Gc
 Hcrmujyvfy8P0NEJoxwKGZgTBQp+Ax6U0A3WN+jIJcZtNR72SgjRuzZiimeRWWcckZiWTc15P2
 N8UKPtXVqP8x4n3Jy/MmB4hj4uf4l9bbftFZ/6aSEFHVpG13ZXeWMPvpEjuy2C1dol2V5AT+sb
 Ae4AAAA
X-Change-ID: 20260918-tegra-usb-58d1d80e4797
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F26:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ffb1c8b-4668-45b1-0014-08df43f5b79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|6133799003|261009223027099003|13003099007|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022113327099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	h0ar38svacRksOThRuuvDr3GHiffnAf4c/FOsL/ELLu/1kOJi+BXR/Vu36y1uDE35rLEh6bzx89tfwxgPnvCVejjCrzmBbzWOdLoF1akgimKx2doL23T9oeMOsVkdA8pFA9gkjnxO15MnLWDIS4xiJqVxVOaWuj3uL5Faf20d3XH2imVIr2GuaiJpjTHArhF9diBmSpWBn0KSbNkxw9AQLZ2ibtXyAIuAsSOG6oCNwulcJANthIQRqLqlgz6zuixD6q1YEvn0vNRSeo6VnfLBwo4MdIKHizJlC7vGChpvaZArXdEEjNnDFKoB8CDA0LRzi4CxKSUUyzN9agTFF0UeyWCXW6J9qFHvlHjMFUOzt72P0JVFy6CCzmzZIVg09k65x7NA9sqxzhq/FMEjoyGQTDx4+aOaoP7HF1K+Kp/+SDgwJMZFhuBm4oI1TpasveAhWx3z2MV0hzKvjL7TGsaZlK8eqeW+jLZrbiXNY+tPYxPDuuNBhCjbITr8schOt9V4C4j/ZxHVkfshvWRjrkzbXAWYoDCNe8k/b2IXAAf+gtrJeosKsdWCk4N95kbJmefEo7KaS5oKPSMvP0Wyqw9YX9whfZGjgw9tn4k8YnDGR2pFyF8sY5GYvXd4fT8dESf+NnNeaQ220rq5EVLh8tMNadNZshzuVpP8mIdYtPV3kqfQZ2YI1KxTk42HIqqGH5bSITM07T4IOdTQ8KcDAM3fA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(6133799003)(261009223027099003)(13003099007)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022113327099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R1YuquBIJWSFd2yKCEjZWBu5KCdp3nhRJSp+c44sCof3jmWTZMruF3H+1cIWPXMtJ7jXEPFdaASgd43wx6mb/3mmPxzTMPqestraaSzRoIqq4CVBEtdQbQ1X8qvl2vfTuvyISZV3YwZwvJ9WL+oSv9umBq2hHbRb3htIMzywLtACStPDm1E8tGTQZ9sqRnCuSLoPchQXPHECVMeslZ994X50O5bHeF53zY9eH0+SrqAWg+qTT5+BZwmtQ1rE33I6rABdMFBRDrx9imW8mcUcho/87DJqtyW4m5EHtdI0SRepJFTsTH2gTasW6hjcDr4xeU6i1iXnGLU7LdpNAKvTWQcO+gvFDt7IKwtJR3QMh8R6TGFxZWPg9bO8hx/PBmOfi2csgA9d/u1EnHNT4cHIiQI0JG6kkK6C1iqUuxa5YEnVy5J74wqMUzrZW89e1HHR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:33.5061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffb1c8b-4668-45b1-0014-08df43f5b79d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F26.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396

Add USB device and host support for the Tegra238 device and add
USB device support for the Tegra264 device. USB host support for
Tegra264 is already present in the base tree.

The series adds the necessary device-tree binding updates for these
devices and adds the SoC data to the USB drivers. For the Tegra264 USB
device, the register offsets and default settings differ from previous
generations and so the driver has been updated accordingly.

The series also fixes CNT65 register programming and preserves runtime
PM state across system suspend in the Tegra XUDC driver, and replaces an
unintended comma with a semicolon in the Tegra XHCI driver.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v2:
- Added a patch documenting required properties for the Tegra234 XUSB
  binding.
- Updated Tegra238 XHCI and XUDC bindings to require resets instead of
  power domains.
- Limited Tegra238 XHCI bindings to eight interrupts and one IOMMU entry,
  and clarified the PHY counts in the binding commit messages.
- Updated Tegra238 XHCI and XUDC drivers to manage resets directly.
- Added a patch replacing an unintended comma with a semicolon in the
  XHCI driver.
- Extended the CNT65 fix to cover both limiting and restoring port speed.
- Added a patch preserving XUDC runtime PM state across system suspend.
- Link to v1: https://patch.msgid.link/20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com

---
Jon Hunter (12):
      dt-bindings: usb: tegra234-xusb: Add required properties
      dt-bindings: usb: Add Tegra238 XUSB host controller support
      dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC support
      dt-bindings: usb: tegra-xudc: Add Tegra264 XUDC support
      usb: xhci: tegra: Fix missing semi-colon
      usb: xhci: tegra: Add support for Tegra238
      usb: gadget: tegra-xudc: Fix CNT65 configuration
      usb: gadget: tegra-xudc: Preserve runtime PM across system suspend
      usb: gadget: tegra-xudc: Add support for Tegra238
      usb: gadget: tegra-xudc: Add SSPX register offset to SoC data
      usb: gadget: tegra-xudc: Add default settings to SoC data
      usb: gadget: tegra-xudc: Add support for Tegra264

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |  38 ++-
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |  57 ++++
 drivers/usb/gadget/udc/tegra-xudc.c                | 339 ++++++++++++++++-----
 drivers/usb/host/xhci-tegra.c                      | 115 +++++--
 4 files changed, 449 insertions(+), 100 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20260918-tegra-usb-58d1d80e4797

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

