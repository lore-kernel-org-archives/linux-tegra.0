Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842710;
	b=w6IxSSvHqEfVY/I3j6LqBuBkijkut2Nkjv4JFpfr4sNgnAKWeUzT8qNcLTsVE6W1HliO
	 XA4uPgjRRvgwmUaj9aZPVSBWXlFnIG/62n2/taRpwzTvK/1WzSsqEPQwHynfCBtLpfK46
	 OINB7uqo0mEj7wYAJCX2GGkq5gElO9/hoOyPTU3nyRtBNHRQCYLDHHmbR7Wk770mVyiRD
	 6nrKhXuIrrjp9efXgdaPQiMangkVeJtBaE+8jjN6WHYSW+3n6w+haglTsswEDwXFhWa8w
	 18d2C8kvvuRXpmJmRz4yQBghEefQIHhUA4wF9661c95pJDbtUKQ0QUciqxom1IjY0lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842710;
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
	bh=3us6JBKETwK7OH4LRnIZGcF/i4ou3ca/g6AKx7uU6KE=;
	b=Gi+nF8NyCp/lqhrNWKpPTD5tBtNGEVw3FiImwfXtzlUKMtOeqvYYyVu4VsNEM4lWLCfo
	 v9+hjjxhAC+RsIP3x3uictiLstCbtqWKpTLFw6MBq674c+V37B+vCqITYbRaxQMs9Il5o
	 W3qvwePUIwaxmKqMq5nLhSRp5eorWk0p6bVe10TI/3niViy+egxo2AfDbK7sDhbZsVp9m
	 i1WEyi09xYBzE5LQXNl3CgdYgWMYjbwsgn3woqmKnYyNAQCDzxXs5QPBXEHe9QDJmQbUx
	 6bsD0swUR54CElEcEy7+hQckvdydNwAs18QqwE7WjsH5Tyv0WNGb5Q6/D4OPZgZcs0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Afc5+uGU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.60
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396E606A886;
	Mon, 16 Nov 2026 15:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F396E606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Afc5+uGU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF5U1UM499ThQGIDM6EgzJTSstl3/23W7+ju1H0o3ObQxcUSVuGajPkDWznCnsBZyUkV8aSkG855MsXMxzpIC/n1wR5oLAhp2PDSoUL8kADNtc10sAAfFZpf0am+ARkClpNlNDBP7M8GzQBN1/lNhIxOX02PalcFFtnjndZavtCdPkb4HLguUnXoejyuDG0uJbBpLsaSQxtB15bwEbeCnYkW90bcA81vH7yZZ0U7g4To0DgdrJokg5gubyTWVDzKRsEYxP15cfNY7XfkOcc/sP9mhYeDGB45vwNLNMCTLvuIxIXtxuv9r4HbRVm+fMBwcgKUp6cIFVUGFbQ8IWC8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3us6JBKETwK7OH4LRnIZGcF/i4ou3ca/g6AKx7uU6KE=;
 b=dAYgfbnWQKZoYVQyzKzolJvuep8beODxsAGpt00ijNZWYkhrbiAOtKNsHPqH0BP/2mRd8yPXQ2+cwX/h2ZaPQUUeu1qQp4aKNfr8WaAWJJwSHE9EUYrj10N7Ji/qv3G5NeWgcBmq/eRSWABnyhPgwHJ5JUBtFX7WnGsdZs3Ed68Xg7A4hJvmlwyzBkfSu/6n8MAuCft8ZCA7Iwt+a3E4iOxghDu/tgutR8y5EFrJTbqYiXXrm+EYTu9kMrrSXIfXFV1Ilq/d0og4jwF3EALGMLR9tX9FVO6w8pftfh0GasOwdsXWgiHT2/49HnVDDVpcbj7XP+3jVA0TfHvGE59UlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3us6JBKETwK7OH4LRnIZGcF/i4ou3ca/g6AKx7uU6KE=;
 b=Afc5+uGUgJ0LtlR6x2enR+xdKXqUUByzDstDUEw7qcUJaoeL5Mcm30c/2Fx0Qp36T0vPT8/fUkRqyxz+b9Vc6z29Gb92CZwrHOnbEi7GiBNVzspMSh8QK0HoZDqXNMfNz0KeFGZ5VKfPcal2qM86oiNgtNJ+w5ec60UZBj6v/BVJsn5mb93UL8sMgvLc2BY2Lc6O0nNRmsZYW04zSDYU8PE/2ihhBxg8ay9YCS+opzJYRmC6O0Qip2i+QtJZZKb+pBlmefPPb60i0Gp7YJ4/ErYalk33EC8GlYtCLdQHyIZCb5ALui9Cm1nb04JMAo0pC83zRV7S2WZmFZlOZWb6og==
Received: from MW4PR03CA0182.namprd03.prod.outlook.com (2603:10b6:303:b8::7)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 15:25:02 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::61) by MW4PR03CA0182.outlook.office365.com
 (2603:10b6:303:b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:25:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:25:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:37 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:34 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:06 +0000
Subject: [PATCH v2 09/12] usb: gadget: tegra-xudc: Add support for Tegra238
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
Message-ID: <20261116-tegra-usb-v2-9-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: ca753d36-6fac-416d-39ab-08df43f5c863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261022075727099003|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	lNOGpXWoBHqIXeOmOOeb0jMmXViroNQ/O1lWGeByh+lN7qXAy7uXPBrqCb9bakoalnHlUofjijz2phaM6nLqZ1xQ/3jX3tKKZjohFVhfmh/+8u+4iL782QhlDeJRo189PvVvzMTb4FKueB+tkYlNeOwILZxkvioj/2U+ugh3E7QoP04WG9eLUewpdvebtD4RGsUUpL7Uh9PLLTDYWd/YuEmkNDdB81WXeeKv9VcpLnGzxiU4OK2t/ZLEXzEfkNM9tTvuT7ulNgOhBkQOxcTKogP9n3eCdZ49qUqB4ERahqFDPu7iEjZZeFe3WcREIPZ9AgRlOj6VZA/BXJsdsvoSLbinPs2Q7HqjrWx4JBIoN4n9X0+O74JYmjJqPt2vM0c5285miQtSvObBGNSLy+4DWSQhOl6rtvxqHhWcRaKQ3M3cupbmdeY1QhSOEkFNmFAxmJf0RStNx2Kw9xznJCdqHZgAgxm3aEmcsntjF6xSbXXhzC/xZvUDUhBYqy1XvmCMJ7OttMlq6VbDwWIUtlsxBDf41FDvYW38XD2WgBdJYRFqvoQbezDGSA8DdcVefHgY2UJMkVF9sLFtKDxHTpK+bbiT/qbTTYzk9UdIqW+oc1EsjJGNUvtEAkJOJw9DROieoC6Z47pmi1vOd7dx/i3XUSqov775I+UvO8lPwg4dS95w0/osCKdxMb3N3oshNP+WyOeMSXjJCM8R6IDRS3oXIA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VDAmgeY0C+cIlvFTV4gYNvXPMg4aN3qEDN9Mt3RC22wm8HJK5tqq1ZYEgyhWc2fWyGPqrHxfu9MlYDIKluQoiTc/EMpH/mnlQoCDyP+EQYfIFYMqwsMjexbqz7c93RgQqZMyk1vwkP1jl6rF5d63qv22HY0y4gAvEB6mssanHxPkQZCziITVC9st8zl6LM4TPQLkKqh+T5YsPnXwEI58L0HgC2gWWK9H4N1raTPcmhXfa63Tb6UbGGtPxdyRGNFUgh813BjnGEAB04HW6MdXLaMduNs7YAECKDGH4Ab2n/sjUhuSPyFClzVejYMJS8VXCpFZfKa+XT68A8JpTLtAazrTL9uxW9psrDpBSW9NzmiUQiLgZqk4QuR5wGiqGYvdxVPzyIauAPnPooCMzvpeevd9ItX7Sbd2sDbsUXr/wO4ENAUQdJWZERjRIrUNcvMY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:25:01.7593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca753d36-6fac-416d-39ab-08df43f5c863
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416

Add XUDC support for the Tegra238 SoC which is similar to Tegra234 XUDC
but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.

Unlike other Tegra devices, Tegra238 does not have powergates for the
USB device and Superspeed controllers, so it only needs reset management
for these controllers. Add a 'has_powergates' variable to the SoC data
to select between power domains and reset controls. Acquire xusb_dev
exclusively and xusb_ss shared because the latter is also used by the
host controller.

Handle the resets independently. During suspend and removal, assert DEV
before SS and attempt both assertions without rollback. Always release
the shared SS vote even if DEV assertion fails, so subsequent activation
does not accumulate unmatched deassert votes. Log assertion failures and
retain best-effort teardown behavior.

During activation, deassert DEV before SS and unwind failed deassertions.
Shared reset deassertion increments its count even on provider failure,
so balance a failed SS deassertion before reasserting DEV and disabling
clocks and regulators.

Rename tegra_xudc_powergate and tegra_xudc_unpowergate to
tegra_xudc_deactivate and tegra_xudc_activate because Tegra238 does not
use powergates.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 118 +++++++++++++++++++++++++++++++-----
 1 file changed, 103 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 43a1940ed88a..3d7254d6ebcd 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -501,6 +501,9 @@ struct tegra_xudc {
 
 	struct clk_bulk_data *clks;
 
+	struct reset_control *dev_rst;
+	struct reset_control *ss_rst;
+
 	bool device_mode;
 	bool current_device_mode;
 	struct work_struct usb_role_sw_work;
@@ -556,6 +559,7 @@ struct tegra_xudc_soc {
 	bool port_reset_quirk;
 	bool port_speed_quirk;
 	bool has_ipfs;
+	bool has_powergates;
 };
 
 static inline u32 fpci_readl(struct tegra_xudc *xudc, unsigned int offset)
@@ -3649,6 +3653,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.port_reset_quirk = true,
 	.port_speed_quirk = false,
 	.has_ipfs = true,
+	.has_powergates = true,
 };
 
 static struct tegra_xudc_soc tegra186_xudc_soc_data = {
@@ -3663,6 +3668,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.port_reset_quirk = false,
 	.port_speed_quirk = false,
 	.has_ipfs = false,
+	.has_powergates = true,
 };
 
 static struct tegra_xudc_soc tegra194_xudc_soc_data = {
@@ -3677,6 +3683,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.port_reset_quirk = false,
 	.port_speed_quirk = true,
 	.has_ipfs = false,
+	.has_powergates = true,
 };
 
 static struct tegra_xudc_soc tegra234_xudc_soc_data = {
@@ -3690,6 +3697,21 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.pls_quirk = false,
 	.port_reset_quirk = false,
 	.has_ipfs = false,
+	.has_powergates = true,
+};
+
+static struct tegra_xudc_soc tegra238_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 3,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+	.has_powergates = false,
 };
 
 static const struct of_device_id tegra_xudc_of_match[] = {
@@ -3709,6 +3731,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra234-xudc",
 		.data = &tegra234_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra238-xudc",
+		.data = &tegra238_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
@@ -3849,9 +3875,25 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	if (err)
 		goto disable_regulator;
 
-	err = tegra_xudc_powerdomain_init(xudc);
-	if (err)
-		goto put_powerdomains;
+	if (xudc->soc->has_powergates) {
+		err = tegra_xudc_powerdomain_init(xudc);
+		if (err)
+			goto put_powerdomains;
+	} else {
+		xudc->dev_rst = devm_reset_control_get_exclusive(xudc->dev, "xusb_dev");
+		if (IS_ERR(xudc->dev_rst)) {
+			err = PTR_ERR(xudc->dev_rst);
+			dev_err(xudc->dev, "failed to get xusb_dev reset: %d\n", err);
+			goto disable_regulator;
+		}
+
+		xudc->ss_rst = devm_reset_control_get_shared(xudc->dev, "xusb_ss");
+		if (IS_ERR(xudc->ss_rst)) {
+			err = PTR_ERR(xudc->ss_rst);
+			dev_err(xudc->dev, "failed to get xusb_ss reset: %d\n", err);
+			goto disable_regulator;
+		}
+	}
 
 	err = tegra_xudc_phy_init(xudc);
 	if (err)
@@ -3916,6 +3958,23 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	return err;
 }
 
+static void tegra_xudc_assert_resets(struct tegra_xudc *xudc)
+{
+	int err;
+
+	err = reset_control_assert(xudc->dev_rst);
+	if (err)
+		dev_err(xudc->dev, "failed to assert device reset: %d\n", err);
+
+	/*
+	 * Release the shared SS reset vote even if the device reset fails,
+	 * otherwise the next activation adds an unbalanced deassert vote.
+	 */
+	err = reset_control_assert(xudc->ss_rst);
+	if (err)
+		dev_err(xudc->dev, "failed to assert SS reset: %d\n", err);
+}
+
 static void tegra_xudc_remove(struct platform_device *pdev)
 {
 	struct tegra_xudc *xudc = platform_get_drvdata(pdev);
@@ -3931,7 +3990,10 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 	tegra_xudc_free_eps(xudc);
 	tegra_xudc_free_event_ring(xudc);
 
-	tegra_xudc_powerdomain_remove(xudc);
+	if (xudc->soc->has_powergates)
+		tegra_xudc_powerdomain_remove(xudc);
+	else
+		tegra_xudc_assert_resets(xudc);
 
 	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
 
@@ -3948,12 +4010,12 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 	tegra_xusb_padctl_put(xudc->padctl);
 }
 
-static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
+static int __maybe_unused tegra_xudc_deactivate(struct tegra_xudc *xudc)
 {
 	unsigned long flags;
 	u32 val;
 
-	dev_dbg(xudc->dev, "entering ELPG\n");
+	dev_dbg(xudc->dev, "entering %s\n", __func__);
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
@@ -3972,16 +4034,19 @@ static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
 
 	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
 
-	dev_dbg(xudc->dev, "entering ELPG done\n");
+	if (!xudc->soc->has_powergates)
+		tegra_xudc_assert_resets(xudc);
+
+	dev_dbg(xudc->dev, "exiting %s\n", __func__);
 	return 0;
 }
 
-static int __maybe_unused tegra_xudc_unpowergate(struct tegra_xudc *xudc)
+static int __maybe_unused tegra_xudc_activate(struct tegra_xudc *xudc)
 {
 	unsigned long flags;
 	int err;
 
-	dev_dbg(xudc->dev, "exiting ELPG\n");
+	dev_dbg(xudc->dev, "entering %s\n", __func__);
 
 	err = regulator_bulk_enable(xudc->soc->num_supplies,
 			xudc->supplies);
@@ -3990,7 +4055,21 @@ static int __maybe_unused tegra_xudc_unpowergate(struct tegra_xudc *xudc)
 
 	err = clk_bulk_prepare_enable(xudc->soc->num_clks, xudc->clks);
 	if (err < 0)
-		return err;
+		goto err_clocks;
+
+	if (!xudc->soc->has_powergates) {
+		err = reset_control_deassert(xudc->dev_rst);
+		if (err) {
+			dev_err(xudc->dev, "failed to deassert device reset: %d\n", err);
+			goto assert_dev;
+		}
+
+		err = reset_control_deassert(xudc->ss_rst);
+		if (err) {
+			dev_err(xudc->dev, "failed to deassert SS reset: %d\n", err);
+			goto assert_ss;
+		}
+	}
 
 	tegra_xudc_fpci_ipfs_init(xudc);
 
@@ -4007,8 +4086,17 @@ static int __maybe_unused tegra_xudc_unpowergate(struct tegra_xudc *xudc)
 	xudc->powergated = false;
 	spin_unlock_irqrestore(&xudc->lock, flags);
 
-	dev_dbg(xudc->dev, "exiting ELPG done\n");
+	dev_dbg(xudc->dev, "exiting %s\n", __func__);
 	return 0;
+
+assert_ss:
+	reset_control_assert(xudc->ss_rst);
+assert_dev:
+	reset_control_assert(xudc->dev_rst);
+	clk_bulk_disable_unprepare(xudc->soc->num_clks, xudc->clks);
+err_clocks:
+	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
+	return err;
 }
 
 static int __maybe_unused tegra_xudc_suspend(struct device *dev)
@@ -4025,7 +4113,7 @@ static int __maybe_unused tegra_xudc_suspend(struct device *dev)
 	if (!pm_runtime_status_suspended(dev)) {
 		/* Forcibly disconnect before powergating. */
 		tegra_xudc_device_mode_off(xudc);
-		tegra_xudc_powergate(xudc);
+		tegra_xudc_deactivate(xudc);
 	}
 
 	pm_runtime_disable(dev);
@@ -4040,7 +4128,7 @@ static int __maybe_unused tegra_xudc_resume(struct device *dev)
 	int err;
 
 	if (!pm_runtime_status_suspended(dev)) {
-		err = tegra_xudc_unpowergate(xudc);
+		err = tegra_xudc_activate(xudc);
 		if (err < 0)
 			return err;
 	}
@@ -4060,14 +4148,14 @@ static int __maybe_unused tegra_xudc_runtime_suspend(struct device *dev)
 {
 	struct tegra_xudc *xudc = dev_get_drvdata(dev);
 
-	return tegra_xudc_powergate(xudc);
+	return tegra_xudc_deactivate(xudc);
 }
 
 static int __maybe_unused tegra_xudc_runtime_resume(struct device *dev)
 {
 	struct tegra_xudc *xudc = dev_get_drvdata(dev);
 
-	return tegra_xudc_unpowergate(xudc);
+	return tegra_xudc_activate(xudc);
 }
 
 static const struct dev_pm_ops tegra_xudc_pm_ops = {

-- 
2.43.0

