Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C149504F;
	Mon, 21 Sep 2026 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993176; cv=fail; b=Rf81AMAnuC9p6LdtCkpuQUFj0Fjhng3nl90IqvX83YRDmXKIZAYLgxO+/Odybj2Be0sRCVz+yV4hpIKrsRzNLeIb/1hQra45qUlbkaLxzqYkIcXwmfEx+8YXicVDAjwoYXPZ9XrVsCnnHskiPgbpmOFQtLzTTprMP7HAvesjDFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993176; c=relaxed/simple;
	bh=o7m+aWEMFaLCvi2c3/TpI4Eq06M55sC7hlAbE4Sv+5U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EmznkYYahRIMtkC1J95P1nMcmfy67SLhFtR8xqhAhLLmaZDGmlWXWGlJZkR+9QfDDYqULkN/ve7omkOpmsQFOuZNb02OZzTGcIIuL4K0tHyER5QBCgZHuAV1PyKy3S7sLtJAigjK0es6DS3n8Xc5okY33ENIYIvqoW9kLNAMmkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U0kIMip/; arc=fail smtp.client-ip=40.107.200.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U0kIMip/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=supI6DRoKdZBqIv8rLVfi8FvBpYgnGb5F/8vRTmiApez+iB5rSzVen78dLGIsLsMSIyWbx0VQgjm2J7Ywh5HS1cJNmu8lyyX9TEfncCkGs7aWw2nqS0MULE5opU6D0JwakOiq3qZX+0hm9F1pPhe6OxVK+b61imCsljvAgE6glIwH8cxP2iIQprPMj1wFOMMRKyopK5czfzZc+i2XIkJP893EvAeR9yuFIYV/a4vq6a0vzvFRARAOKs/WAuaFphBpluTSR4fs8ou5Lmw2UNgitSXCoGjkGmwdneIT6uyD8Tu15mi3Ugdg0jq1/R3mMfPriFtdVogQjdVMonDoJ+8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo1CDrn1zP/dKeVfbuJC+RcEWTDIyqhpAzoh6yoGCIc=;
 b=OcKtMrYhCnECNLEFI/q8Aa2tNqI3RuUfinUgSRmn/qHm9qOvYKNdjL/sg7Tlf+03KyMYep1Fem88BaFu6cWhvZHjDJoyt7zs86Z07jZeu4ATlWsV4d2+JqWrxgkMpn+FVsKNFxKw3PH+a6CzBmnc9HH7cavK8woEjG4MPpRU0hKYNqfHzrsoZImHefiUC4hKz56EECi35i3LohL3E2fyWmSlvgyayT4DKE0zSx2BurgqwP09yMZOz16EEO38t37VR4+RqM12gAkEdMvpeP5aSQ6/aBwi0JgGKUb0Kww4H87KVGCj13YQqdwWJ6JAZ7WuwYMCl2xvb7fW9y0MREYumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo1CDrn1zP/dKeVfbuJC+RcEWTDIyqhpAzoh6yoGCIc=;
 b=U0kIMip/YV9aii//P0fz+ntMkIzcsv6Je6adH45GeSaIp6gWhoLIkAUEIYFJszhHsSNVk01rQwBDlU3KuVVG8+ED1sHWSdb6HyDpbcKJXzYRRlUw/3ufUACJeeMBj1HQ3earkcMh+13qdf0bxYJqhCQLzCmbKUiDni3iZ0IlTJndkHFQwGFibpbSOaBRVBklso4JcA78p/bSp0Y7KezQvRY1D16wVo41lyF7Tf8vcOP2C+ce45z/ussniGhErwdVNBCQ3L1Usjsq/4kJPGKCvwvrvsTAmbA3YTdDV0LKM59dnflP6bl34gmN/fbuoOAgBHsBAjIlvAmh4xIbUL+MxQ==
Received: from DS7PR05CA0002.namprd05.prod.outlook.com (2603:10b6:5:3b9::7) by
 DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.15; Mon, 21 Sep 2026 12:19:30 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:3b9:cafe::52) by DS7PR05CA0002.outlook.office365.com
 (2603:10b6:5:3b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Mon, 21
 Sep 2026 12:19:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Mon, 21 Sep 2026 12:19:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:13 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:09 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/9] usb: Add support for Tegra238 and device support for
 Tegra264
Date: Mon, 21 Sep 2026 13:19:00 +0100
Message-ID: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQgsWoC/yXMSw6CMBSF4a2Qji3pi7YQY9yHYXChF+0A0BZQQ
 9i7FYb/ycm3kojBYyRVtpKAi49+HFLwU0baBwx3pN6lJoIJzUpu6YT3AHSODS2s484yVKY0JP2
 fATv/2a1bfXTA15zI6RhJjzHCTlbZ+RCZZEYVssw1l0IwyukbvgO212HxzkPejv3ljzcQkabo/
 VRlqAsDSitowBrZFQidbMEK3mhUjGttlCqF06Teth9XFewp4gAAAA==
X-Change-ID: 20260918-tegra-usb-58d1d80e4797
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM4PR12MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 9682c24f-05b4-489a-6f1e-08df17da965a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|10067099003|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	E6tbJuiwu5Cng+DeFcOC76h/3TnT8K58wrmbhQUx63flFY3GayW4Xl+S+h7LKi4cr3fx18S4F/cAZ+zHbjB8cQonLHhjhTXkHoCDZdkAxKQyDj6VLwQ2z5kSicvIsejgBVSOmZTV66JPLK6qm6fSdMKI46mm5NekseE5whTPZxZm2ZA2pdIlxzzuaaiQHeTYuPve81KDL+QQq8uezR4xzKXZg1nJapDOd5Jv/vOmbOPipNNGVVzKB+cRdl6vSpsCH3BAmfh3nu3JtP5hN5Ta9luPtnX9lFiHdXqrOPeZOEuFUpVhuB9ejHwPIhzK7TSpCFURE8OOv4yclDFn8cTiKHP3NWyIE3PhD2Fb4IsyEQ+erwmGrL4YGByVNKDZqRPHIx0/cSheoVFvRqsVz8VdqaFQQsebuEwzIBPgAG4ZBv8EHFKT5aTf7he0YFqejnq+ySUzthJvjRspMjJ6qVOKE2yYIn80vdiLka2vaFAbzlSAcbR3UaMCdcAcz/Czb7Pcjs7UV0rwWboQK4yHyNxMRmqeAvzx1x5A3kgW7RNmcGvG/MvzrF2s6mw0UjmurkhROFSc+Db7EVgC+fGXsB/6iOSDSVsyHLW/glGS1xlUXj0RMkDC7wz9a4Faud5LPwUdgBXOvw6jw9b4tCJvfifH95hDBuULY2xyDhnFqncyTfntDDXUwwVh9jwgEHiou3DRlc8wZaTsY0ySagc3EAGZ2A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sp3e5LikQTbA+E6JHt6fMoQDF0PK/LRsAqndnklQA1uVhju4ddbw1CymKUVFTAmMaNhxAbT5HELEzLnUHNS8mF4GSnpZ1aExkH1G5tDTZkeyv9q7WKOJ0NwC55Wg/thIlA4emxe/lhcVxRknGC1LnnJrQjyipgT61J+zXeojfFaufSKX+cVR4W97nBiOsEKToF69/kCkiSBhLzZRLWAuQnUa5+pnkzJXKtAk+eWi35Hdh+YeTkSaaGVduFoxjbqx9AfmZP7WihRr8ewBxu2hGuhAm5lvmXpR8R61wG/0HWb3Uug2MEEEeRkDaS5DjO4kXNvVvREgUruMx+N3YsASkBzsHkrsC27RwoVJ7Vp0tIBx1RmlB73Aw1JejmsbosZyMzZpz990Xko7On+dhBY4NlOXsLOGzQEHRJwqY2CJOvh/Oc9UiuKUI3UeM6y5QlR0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:30.1539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9682c24f-05b4-489a-6f1e-08df17da965a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9734

Add USB device and host support for the Tegra238 device and add
USB device support for the Tegra264 device. USB host support for
Tegra264 has already sent in a separate series [0] and this series
is based on top of that series.

The series adds the necessary device-tree binding updates for these
devices and adds the SoC data to the USB drivers. For the Tegra264 USB
device, the register offsets and default settings differ from previous
generations and so the driver has been updated accordingly.

I have also included one fix for the Tegra XUDC driver which appears to
be a long standing bug in the driver.

[0] https://lore.kernel.org/linux-tegra/20260903074539.613220-1-waynec@nvidia.com/

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Jon Hunter (9):
      dt-bindings: usb: Add Tegra238 XUSB host controller support
      dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC support
      dt-bindings: usb: tegra-xudc: Add Tegra264 XUDC support
      usb: xhci: tegra: Add support for Tegra238
      usb: gadget: tegra-xudc: Fix CNT65 configuration
      usb: gadget: tegra-xudc: Add support for Tegra238
      usb: gadget: tegra-xudc: Add SSPX register offset to SoC data
      usb: gadget: tegra-xudc: Add default settings to SoC data
      usb: gadget: tegra-xudc: Add support for Tegra264

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   6 +
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |  20 ++
 drivers/usb/gadget/udc/tegra-xudc.c                | 227 +++++++++++++++------
 drivers/usb/host/xhci-tegra.c                      |  32 +++
 4 files changed, 224 insertions(+), 61 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-tegra-usb-58d1d80e4797
prerequisite-message-id: <20260903074539.613220-1-waynec@nvidia.com>
prerequisite-patch-id: 1056b5f21efaa7acac3291cfccda57616492420d
prerequisite-patch-id: adc0a0861d215b39273395d38088f0f972745d6f
prerequisite-patch-id: 07f5cde5e49f7d9e231827ba2382bb371715161b

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

