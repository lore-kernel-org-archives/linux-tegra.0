Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7E3C38142
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjAaR7M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjAaR7H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:07 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F43A23859;
        Tue, 31 Jan 2023 09:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtYKG9NwjSbtuoSbmTnPU1UbAf8uIiKjscB+P5pyzApa/u2HnAEEbA18xscglHLktLIjXyI82qCo8b4D1JNMs7bbWvW714AcGsAXfJ2cw7zgnG4EvUw5AGI0BflcRc3SMkV245ahPY8LOmzq4ief/9VumZ4Q/9WOKSbV6FYfz25jMsdSiAnqdGSXMC31W6jNe3kHZoSmaTkn0MahSJbmQO5A11h1NK+yXz2d2gZqj/5ztVjVmg6Y4mDObMsY6SS1n3BJ+M5F714jAxZ245myor5HSVqLH9yn5nldxtDJAvHRrimoq1VsLQ7i5HSBg/xyQocAeWSyamnSagSpWVLMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOOwsZY4u5iuq50uii2xX6tbvBZVbyNTqqxjhZzzo54=;
 b=BHgp1D3CC6FGg6s8WcbNRjcoQqzjrXG+LgSYI/VVPGweqVFFHhBtJQfgrzuXJFjq7MyQrKAsjKpMIijoT2qxxh7J8bstcYcYdg1zopi44ueyogNN5TvtJakU0F9Ui+SVXv2Uv/tC3Z8fkMBe5rPPCFAVFIEwufu9T0aWHJeJ/BlOjAqK+pKRkGMadLACIZgGZ8G+riJ1PRBT9PtpdBOvRVlpLTRN/6uyRqUQ533+ElqlWsw6cj0rekI5WG8lT6fhFR4IouFW9go66RtzJ24TCK9d3SCC+19EUaHv0vF5VnnQxzw1pRiIPF3WgPJnKPhSN+sehrWk0q/ON16tGIZeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOOwsZY4u5iuq50uii2xX6tbvBZVbyNTqqxjhZzzo54=;
 b=TpfqcXxzs7lmfKAM1ywv4w/ZltzIYD6y4zqSTj/5aM4k1v2Hf9DJepb/dgewsyvN3jrUtEeVDYC0shsor4HM8WPzZMECjvccsx1KF0h3es9dUwKNJs1LxwkoiuzzzDfgS/6RtvafJf9+BBx/aQlY7kblOn+hUsWT1G4SgbDFpGmKXINJFavrqMU0NkrOsDIXf8ALGlqahb8KYSk5W9Ef7Yt5uyAINyS/9GT5oRcxNu5kKfYTLGEn80oJxLzD6YRXki5ot2whzjJaowd2zUq2srKb3yI6uDDVUHCuU4YbeozC1hy4UWDC/YdglqnOLB0IsLbQaP44C8IHnDERo6ofgw==
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 17:59:04 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::12) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 17:59:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:57 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:57 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:58:55 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Tue, 31 Jan 2023 17:57:45 +0000
Message-ID: <20230131175748.256423-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc87efe-14be-463c-255c-08db03b4d73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyfYhuI5wo60hMf+hUVaqwv7vMAefza745W3mhDeFH/C5cSjfIDT+FXJvR4YvmFMQWIt+T/trB7cPnUfjwVZqyFwVHbu0l3ERmn5F2sgfrpvgBD61KcTL/fCAKKz5KhVPyu010oolHkhe+UXl2YDCZAbOgBN+9xLf+ioxoJZQltPG4MR2KFtGjgM/C5PcBtHkrZe7R85GZw7ymZyrTlE9QYV2ZG9t7KObedNUiQeGOKcTRdcBj63NkFdOwH9f2kcFhHRxScrTmb+nIJg7fiLcHCDA/udAoFHWajgSNr8IocBTIlVKyuTIm36nP2/T2Un37am7kvgyw5Het9k5kbylZUGS1VU4ylK1whfix6dFJ/gp24npENhCj5yJzB+sOw7QxolU648mSxiyCTEoNiJ0qMEg6EG+arCnRKle5epjeOzF/zAmLYqUIAinp3GKY6kZ7Z/V7Fj1mADdb2JL0gf9//eFQuDxdJlAR7NYygsbPpMvGjT9KPgECLckw+Ipz6oNXl1hPIr8TpNNNJNxXHr0X4vjzRYAi2WSMEt7QxpFBh8FwL1O6lJX7HX/NnQ129aIaGE61tkwLL93yvhcmxlluTOw3oVYrknRrOpFCPqpp1xGwuvJsUCEI5ejDWTQV0IMyGYnElDcJGX+zpU4UuKS1XwDlwKHjxsZ1Zn7iI1ppn/JHmKVeV/nqMioR9Xamha0moPPvEASkrHiOfEw5X6jg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(41300700001)(4326008)(8676002)(110136005)(107886003)(40480700001)(8936002)(316002)(70586007)(6666004)(70206006)(5660300002)(54906003)(83380400001)(36860700001)(36756003)(40460700003)(1076003)(26005)(2906002)(7696005)(478600001)(186003)(426003)(47076005)(336012)(86362001)(2616005)(356005)(82740400003)(82310400005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:04.2093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc87efe-14be-463c-255c-08db03b4d73b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add device-tree support for the Cypress CCG UCSI driver. The device-tree
binding for the Cypress CCG device uses the standard device-tree
'firmware-name' string property to indicate the firmware build that is
used.

The NVIDIA GPU I2C driver has been updated to use an ACPI string
property that is also named 'firmware-build' and given that this was the
only users of the 'ccgx,firmware-build' property, we can now remove
support for this legacy property.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
V9 -> V10: no changes
V8: Add Heikki's reviewed-by and fixed unnecessary line wrapping
V7: removed 'ccgx,firmware-build' property
V6: fixed compilation
V5: add support for 'firmware-name'
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..e0ed465bd518 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
 {
 	unsigned long flags = IRQF_ONESHOT;
 
-	if (!has_acpi_companion(uc->dev))
+	if (!dev_fwnode(uc->dev))
 		flags |= IRQF_TRIGGER_HIGH;
 
 	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
@@ -1342,6 +1342,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ucsi_ccg *uc;
+	const char *fw_name;
 	int status;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
@@ -1357,9 +1358,15 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
-					  &uc->fw_build);
-	if (status)
+	status = device_property_read_string(dev, "firmware-name", &fw_name);
+	if (!status) {
+		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+		else if (!strcmp(fw_name, "nvidia,gpu"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA;
+	}
+
+	if (!uc->fw_build)
 		dev_err(uc->dev, "failed to get FW build information\n");
 
 	/* reset ccg device and initialize ucsi */
@@ -1426,6 +1433,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 	free_irq(uc->irq, uc);
 }
 
+static const struct of_device_id ucsi_ccg_of_match_table[] = {
+		{ .compatible = "cypress,cypd4226", },
+		{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
+
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
 	{"ccgx-ucsi", 0},
 	{}
@@ -1480,6 +1493,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.34.1

