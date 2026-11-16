Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842718;
	b=Sl2By2WAREpUU+rwu1EHJjWvIRfkJty+/3k2CuhidgqWNTApRWI8da59I5FNlfv75KUX
	 WRgufYI3AzWkQa3OX93mJvIixL4RxetqfZhNxiuqmyApwsVVysnuRYkEbHb0B8J+KZN7f
	 x4yOGSGKub9/yEz9mjta1k0aYSpAAJc0o0k8ZTFhOvcoCWpOHuYzWASWC6tjelHKYbItP
	 lnhS81DYN4zuYxNJpPVbZQjVQJd4eTZdYvmaHxo5QCbNTs54/l/6UMzpK69tZaguQRyXs
	 R+c8wMmQmV9ppGOD5jVxOWFNN+XA/i1vj7hKI8b7L6CCXrR+7LqZ+gptA6XJ6bYBB/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842718;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
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
	bh=za8NZgeZ/xiWMlUBYQgNySivm2bLBpeTFokN+yZnEyY=;
	b=VNtGOrQtRkIn91yBslRqnmWH2CZJqKEStuCcFW9GQplxeIPZpyAOwdMI5e+M58MzZrPL
	 LmL2NIwVqpjwnoMr882vVTM78ZBSeqJq0up/4ALMVZ7hvbr9XFg96Gb3+SoZVbamkJOtg
	 fN4aMZQGibU3KIFbruFGX3eMGTK/WsCFcHTXxyoK2YK+Zq+glqMIRwmYk7i5uj0Nl0FBT
	 FstQSt/AB8slsb2Jk9OguAPAK4v3VTUm2tTtBu/RrviHNQv3N+qFIIigiyKdRPR7fCN9S
	 Eqz+HJGmOxuXgJhSRUQNZYnjfyZvEIFhVKTrDP5oSjSVJfX+b2JG+eEBdRXI5qr3ovQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TWjbjyTC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.2
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F66606A329;
	Mon, 16 Nov 2026 15:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F66606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TWjbjyTC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZfJMPv32tdaFxBvSpdwD1B6mW+FOxR7kze6oHdvrr5S32PCVqP5CzYR6uhBKdQvOFLTLw55XkWRKn11/tjsmXw0C1GHI+84KR+k7mzZN6UnVdkAN4PpHTGame3YLTydnR8eLZ2/CrFn3JDvzQDSglamRROydT8WqQCr5ui3K87yOhUicNrTaQbFdcgXXLuj2B/whgU+GuhS2S8GA6uV+XcehuWJWEsd2SljUh/pAv/3zG5kGn64PDg5j6LpMxYgfXyEsFu9Xz7YU7yG700QydStR4q0jSo5keYAW4FsXLfl08VaXHI9tW9oIfFSuGGY09sNgbzuaqP/+tZGI9ZhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za8NZgeZ/xiWMlUBYQgNySivm2bLBpeTFokN+yZnEyY=;
 b=SO6kj+EEDfJ1DY2/E3iDDXIOKIrEvyGr4FL9tp/xuhbnjd5XgNdWcHHitq0gMqKbHSaBAij+KiKQ87rdJ6unlKytVZaip22XDu13G+jIEqrlsxysi0KZuV+zYvILah63oFEbnHYXucHxTciLVu6QfzMc3kALSJECErrt1f0So5ChC6eQHwflFUqqPpz5qqmBKEPWSo4HzD61WXGPAZRSP+4Q+DfCztaQMWfgTnvYTPMs1iUvCwtGPlRILVtx3z/SK+KcgXBqwQUGGzZuCNWvpPkUDzIKcaujrjlB/gI+VB9taBcyTEz40bxijzH7R59O8P9T7RoqTr+41JDCU2Ytng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za8NZgeZ/xiWMlUBYQgNySivm2bLBpeTFokN+yZnEyY=;
 b=TWjbjyTCve6S17RMcbhWqeIBfVe3JMASTE5XfEiFTjfLGaf3rsJ5B6pxQOU7+to3AiIFBDLT5/B4DA2Q2Fjgio9J1B9vUzHKvIbcF+CBvwq0QqJg41wcY5iyXTa4C6rFVDDvQEV67/M2CS++lqb+8wZ3q/ioAzv+/lpg0Bz9WwVohdXBl2sqtViadotLepxSR2dIAKq70zGsSORi1hg1ZbL7LGPBV9jT78ylC9LqjaU33fSPgOGQWbixWKaB17qFnvFnf8K73HEJfakP1suWWvg2GXbBJ6rgLn4GEhAhDwdwNxN+q1cGdgtqXwcoQ4PZEku1s5Dsbm9i7XB/p4Jg6w==
Received: from PH8P221CA0062.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::14)
 by DS4PR12MB9563.namprd12.prod.outlook.com (2603:10b6:8:282::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 16 Nov
 2026 15:25:11 +0000
Received: from PH1PEPF00062F2A.namprd02.prod.outlook.com
 (2603:10b6:510:349:cafe::46) by PH8P221CA0062.outlook.office365.com
 (2603:10b6:510:349::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 15:25:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F2A.mail.protection.outlook.com (10.167.243.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:25:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:48 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:44 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:09 +0000
Subject: [PATCH v2 12/12] usb: gadget: tegra-xudc: Add support for Tegra264
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
Message-ID: <20261116-tegra-usb-v2-12-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2A:EE_|DS4PR12MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbe3fc5-31ce-41eb-3db8-08df43f5ce15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|261009223027099003|11063799006|261022075727099003|261021121427099003|261102123227099003|56012099006|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	W3vhR89ieQWyctv63oLbjw9wHvVDTfgmZ6lKBsNMA+27Zp+Q9SbSALi+1ScvII2IZn5Pw3j5fU5mCXTM+9lzrD5ArJ+FwCeCSFVRw86JQ3qpuUKyPmPXPE+lRHLeJyoleo83EIgO6cFtovaUhW4Rp0moOPZNyOeJ0eA6W4HSu9ZcHBCTzp+f2gfnXNyr5//8Hw5GDBpf0QnfsY5qeiIggEW4EuMoI/mTbbJKZlvbFFExgBX2J+9hRMTqGFdlPwd8q6JdxEq2T82mx/1divlLXzs2wcj3M3/M3Nu1b25UMb4b6fffqvAFIieAoENg91ybYHOrsIWdB2JXmhk3JTKbSW308dutbZe5MKSatBYZcYwA8lhwfXRYlRS6XS15WJHcJyAxwP6s/wUepvvsPCMaj7vB6tuzHC++g6buysShZ7fsrhIXBXodOXMRI6oiRdIRCXv+uprYGeGX6hXCavgoiIjW/HZK4BIJu7sA1YWMaFGmyp4If63aDs4kyUW0kY1pebZ8DywX1CxPiFes77itLb9YS+Uv3OL4ev9T2fjIye/N0GGMgDuIF3TH98uX+KTBOiNijz1b9tgn9pnrWaja1mmNy6AwvIGztjAwYQYSEIbPexyc7Atbb9IAoGzlqY8Nl9hnqfq82P2K5Kji0YTt3r23Yyia04yUH3CltiNXXZgB07lkLQcV/MEWpi3Q1+ESxz+TVabTu9xVNOMphHldsg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(261009223027099003)(11063799006)(261022075727099003)(261021121427099003)(261102123227099003)(56012099006)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SrUyVDxQfUjdcOXE7zZuj8k9DSCNaOA6blZr/OwQBw342Q+evEckp1m1NKtPFDr7tUXAi1MvfXGsb72R7W7ruwgPdYfs6kWzukclbEbX1fNplpEnGfHrlerO/RMUqad92RC1TXFdodu7xo4Lu6UB2k3LqGNB/IAxJvqBZRQZPfIxuZaD3ehHuVlyoy92/5x2YKC22CnhIy3jN5VsML9FqFo+ahc7ooGTlrEFNv6xsTx5k54jbKJ6JZPXD0aWtgdL+QN2ihoT9HaFsvqq1lYlFafsnFlHBYAxfF78o79P89QH/HRIoO4WZ7Evmc3x+REq4JPk7Mddt5x5aAFyW52xBCyKU4batCSrgvMg0REZ9hQhKIB+CV16r1KhIdMS86ubEfyBYFfjNqACS/7l7LkOOfTuJq9eDOZP3fVPmgJE/HyNSvUh2gRKdqNuBJiUMA3G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:25:11.2578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbe3fc5-31ce-41eb-3db8-08df43f5ce15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9563

Add support for the Tegra264 XUDC by adding the device-tree compatible
string, SoC data and additional registers that need to be configured for
Tegra264. The LMP ITP timer mask in the SSPX_CORE_CNT30 register is
different for Tegra264 and so move the mask into the SoC data.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 61 ++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index caf437d6b754..b4b6fdc9367b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -146,10 +146,15 @@
 #define SSPX_CORE_CNT0 0x10
 #define  SSPX_CORE_CNT0_PING_TBURST_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT0_PING_TBURST(x) ((x) & SSPX_CORE_CNT0_PING_TBURST_MASK)
+#define SSPX_CORE_CNT13 0x44
+#define  SSPX_CORE_CNT13_CRDTHP_TIMER_MASK GENMASK(11, 0)
+#define  SSPX_CORE_CNT13_CRDTHP_TIMER(x) ((x) & \
+				SSPX_CORE_CNT13_CRDTHP_TIMER_MASK)
+#define SSPX_CORE_CNT27 0x7c
+#define  SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK GENMASK(29, 0)
+#define  SSPX_CORE_CNT27_PING_LFPS_TRPT(x) ((x) & \
+				SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK)
 #define SSPX_CORE_CNT30 0x88
-#define  SSPX_CORE_CNT30_LMPITP_TIMER_MASK GENMASK(19, 0)
-#define  SSPX_CORE_CNT30_LMPITP_TIMER(x) ((x) & \
-					SSPX_CORE_CNT30_LMPITP_TIMER_MASK)
 #define SSPX_CORE_CNT32 0x90
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
@@ -552,9 +557,12 @@ struct tegra_xudc_soc {
 	unsigned int num_clks;
 	unsigned int num_phys;
 	unsigned int sspx_offset;
+	unsigned int crdthp_timer;
 	unsigned int lfps_ping;
+	unsigned int lfps_ping_trpt;
 	unsigned int lfps_poll;
 	unsigned int lmpitp_timer;
+	unsigned int lmpitp_timer_mask;
 	unsigned int u3_timeout;
 	bool u1_enable;
 	bool u2_enable;
@@ -3433,11 +3441,25 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, offset + SSPX_CORE_CNT0);
 	}
 
+	if (xudc->soc->crdthp_timer) {
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT13);
+		val &= ~(SSPX_CORE_CNT13_CRDTHP_TIMER_MASK);
+		val |= SSPX_CORE_CNT13_CRDTHP_TIMER(xudc->soc->crdthp_timer);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT13);
+	}
+
+	if (xudc->soc->lfps_ping_trpt) {
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT27);
+		val &= ~(SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK);
+		val |= SSPX_CORE_CNT27_PING_LFPS_TRPT(xudc->soc->lfps_ping_trpt);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT27);
+	}
+
 	if (xudc->soc->lmpitp_timer) {
 		/* Default tPortConfiguration timeout is too small. */
 		val = xudc_readl(xudc, offset + SSPX_CORE_CNT30);
-		val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
-		val |= SSPX_CORE_CNT30_LMPITP_TIMER(xudc->soc->lmpitp_timer);
+		val &= ~(xudc->soc->lmpitp_timer_mask);
+		val |= xudc->soc->lmpitp_timer & xudc->soc->lmpitp_timer_mask;
 		xudc_writel(xudc, val, offset + SSPX_CORE_CNT30);
 	}
 
@@ -3662,6 +3684,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = false,
 	.u2_enable = true,
@@ -3682,6 +3705,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3702,6 +3726,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3722,6 +3747,7 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3741,6 +3767,7 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3752,6 +3779,26 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.has_powergates = false,
 };
 
+static struct tegra_xudc_soc tegra264_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.sspx_offset = 0x4000,
+	.crdthp_timer = 0x33,
+	.lfps_ping_trpt = 0x7a1200,
+	.lfps_poll = 0x3b, /* 1.466us */
+	.lmpitp_timer = 0xc9,
+	.lmpitp_timer_mask = GENMASK(11, 0),
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+	.has_powergates = true,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3773,6 +3820,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra238-xudc",
 		.data = &tegra238_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra264-xudc",
+		.data = &tegra264_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);

-- 
2.43.0

