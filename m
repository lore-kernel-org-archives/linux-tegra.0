Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE1496D39;
	Mon, 21 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993189; cv=fail; b=C5IYYqfLRn/Za8BHw7xK0daxxosayrzRFBCPpkfHMmAeF70wQYLUMZqZln39rqkVbLcmAL677JLu8eturlPJdvRxmtAVI+yvdpuHP1SxxAPeskivJJ90S+BemSv/0E4DpO1lVyOfKrN9e4utimfsFGqIe6MTDZmqT7W2zHU1+1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993189; c=relaxed/simple;
	bh=Dl9anT7pN0YJKCu4tbWVBWYWGocXLWk71YL4Imdb0H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uyZiVOu1MHHH6foiMSUzQTNBmeYGz8gcUSbK86ZZdCTEK3Bb/1MZcS3H1MpPdCkT0JGsrF8Suc4RIkiR2o4Z1unwHdhN7qaM8EsJ3+Q9ZtbVhDyYooyJxbMv3SGyEcX2Tddr7Sgu3piKd2LAEuZYh/cdj2ZLOLgtQlZkGlbnlRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LpyGm2xJ; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LpyGm2xJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icn8Uf9Y4clDrzpXcTJ4wiqCcqllG2R0Xog/eg/12HYVe9Ve+RxjrOfPyrsCNkeCAWOEBjqA1A9bQPFtsLzkC+N3ZmbmSwZ0i0caWvCP2ThqIiKQ0/LHDK9VgQCRy47zu6jNYz9Srul7yZMZbXA3mGYMaiTP5AwTxWPVWl7vSk5suAHQpTfldH27G01uE4xBA+HS6oJ7cYm7OHhhN8Ki75ArtNo77GJwGpNqLtd0oA7z2wqQMhh3CR7dgYVIHpT8lGiDu/QV7vnYn4SkfwUNh/g2YeAyVi9UazB7/h6VnrvbT3RTryrRbGp0K1ZVOlR4twZsveLUwZ2rax8NYq5EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc5iuxbC8br3atpisHTqyMni7Dog8LvqsT6EKvpcfiA=;
 b=ab6fxreIxyoiMzxG7IH3W3/1HivrtIyi1ycaJhYw8iJSu6QXc46hQrrFmR5O+LssCffnhg9hWZEGjl3DoKsqxBo1XDDVeB8POk5nhGoDykh1W/Dkl8BTv5bSplGzWl67heOzibsqwnm61CnYbJYeZ70xz9soJsV5ihIIj9/0ZnRyhgfKkX7ECs+GUhLN7FnIh7u6adUGf3SxSJG1FiNT9a5jQfH1kKVLMULCEP2kG4EVe56LstdQ+G4U2Zwcdqxf+pWo5vF0Id3gPOPyK2lxbdXAAl+CPN3prRhvvmomzIOlEtMeiIobcqZoAlDxDBwWOCbR2wqOCNfvKyNK13TzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rc5iuxbC8br3atpisHTqyMni7Dog8LvqsT6EKvpcfiA=;
 b=LpyGm2xJM7v801XKN2AndevmAqhd0qPRz9N66jloSJpGTHidaRohwS56Cp4TnPQGJnjY6uS5DKOHal2r1L4QSTa5G46AF87Bb3rUkIy0InkFejTKH4gGiMwG/S+N9T4K2NiBfRk8TsxpEKpSSPX7QZcLdrWnGuMN1S3AUSn9mphpi8hceIa2P4UfGdfYchKxRVrHDGZYmSK2Iy3R1H27SYBD4DgTj45GTQGdTPFHm+1u3jY9dUpTE4xbLbV3rgmk9bLhCGlMaiHDCwXaagDU72GPnPh7BpvhVBwC47Wopp035n+OuPbGlH00GT6yoN0sUVZ2LCmiMoBuu2Qh600b7A==
Received: from DS7PR05CA0021.namprd05.prod.outlook.com (2603:10b6:5:3b9::26)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 12:19:41 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:3b9:cafe::53) by DS7PR05CA0021.outlook.office365.com
 (2603:10b6:5:3b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Mon, 21
 Sep 2026 12:19:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Mon, 21 Sep 2026 12:19:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:20 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:16 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:02 +0100
Subject: [PATCH 2/9] dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC
 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-2-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: a056f0ea-9b30-478d-3d92-08df17da9c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|7416014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/IQFpFlImx1mt9JfwnV+/Mz+735T/+xd4Rr98CJmrzRDyw7pWBYnac6woDtZ4g3r1izK1zH4j6m3wuYm+CZvYERcQkECaQ4la/dWZ48BQUyuyVENQMWtBuNBOXKYnBqnQrn5F9nVJcYnRaFHd76s7dxgNwi4wdZr8n38D1fZOB640oyaumz/V4a8xNut7idx7kDYePhb3Tpdm/XUz/LhcL4wNvpjMR2fYzHkOYlRDkMz89v+J6hMXZ5+qDhWBpfArse2u1U28rQxvgW4ekwBYhNQ61qKqo8q63iGi/7nwoMnz7qj8a/s/HqJKcHIYlpLlEPEVwV+2Wv8Zi+FBhOzxp38mwKJ1abvRnxMX64JN8AcQGuJ/YIrdVoCdkmRzH8FY2IQ+s0W8PHmgfvNbrO8SlDv/BBJ0nshgNyI81li/LMmIFdXDMmRxRwp7yuqh9ppoY0TyTaDTDZiDt5SLvUW78h32JU9t/gDGIKsrLINh3M6yI3LOnd6Xcr+lNJy6ebBQ/827J1NFLaJZMtoHh2ESAIFjpTifBZGISAdDvW8tV+hAG3EDpyKa8xoOgy7yktmmvvfFmiGhbl4M2gaoRrlyT7JxYQrRSTTmRd/xLAbKDKlMvxqu16qbCpQGlF9OXlbTEDckfG1AdvUz7p2xZMrJiubMtANfP6fQZ7PZND37Qcfyvl3ij9Vn96WY+XhZYRdJWpeI3Ie2xb1ybz6uGisnA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h5/+/NqYvyKuPd7X83dI0XF2nJ1/EWkgZkbohy3o9ghmteabOd+JTvy6zkkTZ1F/wmL+FG30yRgohxm5Y0VwrOKve0N8CD19GRxIEaIOdQoWsnSv5dLNCn3oHwWzoZLr7CITv6KKGz4soZQUpDWQXgRLJf1hW0z6qrW5xTzDo3y6EtVUwIfQJiO2ouwaVv/AjImqW9fnTPa+hm3zgK99FCd+B9H/tXgQ9rLLVAiL3fHADcpVla9tNCJ/ny9BNBIbwFy3ntGgN9C+sd45olLo+v4vOR7nhu3XFPt/cm6lMiyDoe9hgBa7G5iDYTGz+QXiFQlsExQK/j5mx8h33Dq5c0CVV6bDbowCtCDrgvVK0u2EwaTp/IUUmSCqpLgjRYVWdXUKsp1K42iPRh97jEvpHTOod/Tj0fiXrCh9iOJYx6LCPiAGgMrkvA2CcQE7VmXM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:39.7466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a056f0ea-9b30-478d-3d92-08df17da9c17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

Add a compatible string for the Tegra238 XUDC device. The Tegra238 XUDC
is similar to that found on the Tegra234 device but only support 3 PHYs
compared to the 4 PHYs on the Tegra234. The XUDC binding only defines
which of the available PHYs is used by the XUDC controller and the Tegra
XUSB pad controller binding [0] defines the PHYs that are available.

[0] Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index c6e661e8915c..a57ad8815d12 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -23,6 +23,7 @@ properties:
           - nvidia,tegra186-xudc # For Tegra186
           - nvidia,tegra194-xudc # For Tegra194
           - nvidia,tegra234-xudc # For Tegra234
+          - nvidia,tegra238-xudc # For Tegra238
 
   reg:
     minItems: 2
@@ -152,6 +153,7 @@ allOf:
               - nvidia,tegra186-xudc
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
+              - nvidia,tegra238-xudc
     then:
       properties:
         reg:
@@ -170,6 +172,7 @@ allOf:
             enum:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
+              - nvidia,tegra238-xudc
     then:
       required:
         - dma-coherent

-- 
2.43.0

