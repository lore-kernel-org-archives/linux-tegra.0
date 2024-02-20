Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F246A67E6F;
	Tue, 20 Feb 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431489; cv=fail; b=mqGna21qM/s/JhaE4P8vXBjlw4WQvegoWSsuvUvHb+oUUz35AKy5XUNuVqG5qcSgjy1OEcMcWsk2doquff47H+FBh0loG1WhgngvIfjYn+SCb7Oltr/XYkMuRw5ENEfmCbC9g9Is1nz9VAR32abYBm8ccBeAuHrXczuGYnFvZ6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431489; c=relaxed/simple;
	bh=RwDcO0G8U1OGOIPxPoIIPIacJTPw6um/pAGtHCjYADk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0JVX2D2SDxnen/s0Q3MnWJGV+UsgektDFw7HNWbyiB23m1d5nelTmuZN5tdNDs/aKW2eaH6k6Hf8X8EK0OAhqNQ/VxpxZJVuNJ6yOnPNQftlXQLpnOjcjg71RMK6MMpr1eCsnJye1VJQjqV66l0rjucmyX70Y997qo4pbxXCZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PSIJfCli; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PSIJfCli"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mffNMajU6rGiyOmK53POAHpYFFF6h0Y/XTUPLrgknuSz12/i9M0q96mqP4s6wMUcEux5IXzpF01MvULNL0SRWF3kAHULRvwtYdvMRITlYXnVfcXqNBPUdu+mI8NRhfpQ3R/xDK05Pg6Cdr1bMdDa1JwnydHlokATRnBNNV8LStkLiqO9NkK02hWeDRl5Xvpf0dFBZHwVvdonmRJmH/qWPke55V5mcAU17oJjqRH2rU1ttv82h8sPZNpKw1SKxjdEG5wS3OlXjJhg3dnIwBjmE3fgnChW/ryBSdBVuFrK/+GljxRoA3ws8UfcHYHaCaGadFtCc3hn+QZiv6nq64FUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/cRgmdzk9dkakwkG1MlXemz5AUIYgTShTcIltwxXXs=;
 b=jpe3+6C/Q2McnyvVFwGhTDppMRqmGOVmIngnzq/sYDznKTzA9OgCOYMdVZ9E9mV8dZrCGrddNrYVZXBukbqMNEjDfoGLvFu0+11utrB62jp9MSgW7BUEDySMH3DZFKsZsV/b079251HQEdyjVDrXye3ff0dpV4LjB2gdiQxhsf+QXtE+npgnMoNmvqq4E/CAdC8J/yJyJmOSO9NHA9Tz5233L08KuEPq2XafvAVex4IanwKqvLbTpZtb78u2/14mMPKsyh+16L3xKTZj5lDeVNYlrHjk84kuAyODtRM3IT6psrBZZYdnbANI0Tw4UbwRsYqm291vGCDUTqO3HmCdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/cRgmdzk9dkakwkG1MlXemz5AUIYgTShTcIltwxXXs=;
 b=PSIJfCliHKC0/3F+we31fiwOJ8QDlGmQHoNtCDSrW6qN8k40/RpiqC4NRelE2nmD/Mcg/xngfpyYNW6pCBKMUL/Jz3c21RD5hRk07yMebFditnm11c6Jbt21yrWhNqd1wDHyLqKC6ArqmwilZsFcJ3cD/+XQJ+FOdiyTqvY1dxklvA3rqopq9lsgYI2wB5eIZA7RuBmJle3rrlyT9+1O1V3W2ISttPcEDh9TiummaMNLw12/FbX7Wtw9CaDV7neJYQjFhA3RGh8ek//wjWnJ8nor397dfbYdBckifJ48UeoaxVH01lZ8vA9DwmjIX10JQqvvEFOf2yYBgGl6AemJAw==
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 12:18:02 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::f7) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:18:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:17:41 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:17:40 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:17:39 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH V2 2/3] arm64: tegra: Add USB device support for Jetson AGX Xavier
Date: Tue, 20 Feb 2024 12:17:13 +0000
Message-ID: <20240220121714.16543-3-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|PH7PR12MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 30112921-443c-47c4-46c8-08dc320dfc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	foZIJXGJx38D1LjQvFWDwBo4z6dI0ZF4sSK4b73JR+ZuM9EStzV/Z8+QNbswpESLuNW9ByeV2dSSSEAjK38gmvc7PkVAjvWVowsrrnmXSsr1qCSJ68Jb/DosgZlk4kMvG6/ma2QJbieifFbWpuMF90kXGRrdJGS/S3wiVLCqJifn2qVqIp+iGmM8qu/BXXXQsPNqiHvgUQ9uCekTrxfAYke/wdZEsvYYbTddVI2QW8n8X+t57G8hLYO3FjSuDoIZ2fN0AgOXBl1BwmUFJ+PwUpQ/LaP9DQNBA0HrembS0IvY/62C87cxqwJSzruhZrykbpYHYLyJeVY3Wv+tvO20vFbDV6Qu3eGNQ90i+BM1HGkvBhuBGYhmQ26peWBOJUCIntaSEPP27r9FNdfRstgUUKSPSb/jSQ48zvURwpf9M0Zm8kXRdDGf3WWoDHVZScLQu2w9SDD5jrvX1lUSVfAOfpI85akY0wm2ANVCJyEPHhudBSa3BHz9GU2Bbp8SfKmWkX01i/7z4C7hp5FUNx/a5neFCzvvOwXBjiVoKu5LkYck/PR4dwGLqsY99h+MWQsMvc2KAtX6dKe4RW4Elm7669k72hGqVjLuxDMOaY7xLzXiib4ju/n7Vr2C5cKG1FKx2mklqxsuUoWvdNsh+26IuVVQ8COxiI6878pO5A6/VM0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:18:02.1370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30112921-443c-47c4-46c8-08dc320dfc04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

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

