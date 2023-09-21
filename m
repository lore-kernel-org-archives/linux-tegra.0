Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB8C04AAB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 17:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjIURCQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjIURCE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 13:02:04 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EED19BE;
        Thu, 21 Sep 2023 09:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZAYgm82ntBfO+UUHZtnsZxysUtEZZmRWjx8Aqx0aZO84j/vNre7luLw/gexksNf4JCBvYMMrryfrIZMTEw1ZoDdZeZvZJZ5xEtkz5thUn3zdF9Ved98EzPptY7e42aCbSXXY6foQwWzBOyv/C/mSHPTGpZFKtyFxyHkN47XlaneopXWgY2KaRHccgrgYhoz6Ec6pltWt5/BeJJ4UbaBdymWfDyoQGjbUI2wtOwr77mZM9rSrQ+FrH9yyZdfpxAyfoN8BSQIZpRF333XEoveq6EWEpj/g3lI8JI6jRIqenZtJm8LiKJhpq3OFepKVBZOm+ahXeo4HSylpAnOqyCsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UkB9s5xBccRKqPVNLpA4gXzkA9jD0OZbiBOWe052aI=;
 b=CY55o5U9SGiMea63HfADC/V2w1Xc0WiefU+7HSRkOPtoKPr9Kby0x7H2fuWUqYH/Uu/kO5k+im2/VQE6Bmu/peo0wsQhbjl6pn6TeJO9KHHU+UPhb1xAVtN/eyOfneNEZ8X5ASWajep7pRdVjZNiM+7yWnZc5hGeoNSAaw8DBVZVZY9QRxLJTilgAJuu/EsmFLXUoazDzLzJ261EwNibRqpF9sF4sV1qSL1OkAUiz31hVxUHZ8l775mGhB2DVfStxexo8ukJk/EMpr9F8vryo7HFwj+3Duh2oOv5usuP/bVY/aOi8X0duY3UkC5TWG+yoa/nA1WhJ8so4PlVvS1brA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UkB9s5xBccRKqPVNLpA4gXzkA9jD0OZbiBOWe052aI=;
 b=e2vq3VYUhBSmqR8y9WrNnV8Ex0pxVBMWyq2FD5HdW1xDHPAnS70sTkfNT8trkdfHMLQ11EGG599ju1vCkaewl1eoXfPGzy8crkugE5FrW0ujA/8tUY5MsLg4rbA4H84h4hN9wrTSJGjr0zGGJiHYCsYz6KezugvyvGFOK0OsobFyvLwrOXebwj5JX0H8z/jrqGkuI+6WiXWSEO+zcgvs3hacE4tc4lyyPaDj2jdMwSCqwnv3+xVdU9B34v0qhhVPF81In3DFG0uOh3MLiucRxYoC+hgG+pF2GADtxnU00EM4sy0pPGAMTzWPB5NAiI5pKeP/9Vsb5D3i6XpJpdFI+Q==
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 13:11:56 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::86) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Thu, 21 Sep 2023 13:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 13:11:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:41 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:40 -0700
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 21 Sep 2023 06:11:38 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Ninad Malwade <nmalwade@nvidia.com>,
        "Rajkumar Kasirajan" <rkasirajan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 3/4] hwmon: ina3221: Add support for channel summation disable
Date:   Thu, 21 Sep 2023 14:08:17 +0100
Message-ID: <20230921130818.21247-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921130818.21247-1-jonathanh@nvidia.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb73dff-8491-4347-391c-08dbbaa453fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeMoSaBE7k4MnBjgx1X6QmBOihfrvIeEoZvObuOsUyzEk7CMVVAWR0rl0eRCGaSQM85irE9YZP6K9LKSfXRh6U0grlss1x0K4nCiNMj8UUc9GE2yfUmU18rhybVycU8ndCC2nQvmrccArxYNwVoFYIOTWCnyYNBwDjlQ1jzWqVHczHSEl59DXsev9DqJ174v1+z6PuuRzxv3mt73SrM6WslrC8RlnSaPxvbW2MEvvdBPLpAQqiJ08f4EHerTnfbUOTvhcZQRlMSQCrmA9DbZotPrzqz+EixKH4fScggrxGqa/xfs9kwilpn4Hl4Ym1W53Lmyf9UFJs3GNSx7+lFa3mPneQXEIaBWf+OWDNne5Ix9eLohD3Bx9+o7PUBLNDHjCe5xXw2JZn1YbVdp5jperL28viBfdEKHJ9S7xyoitGrcMFo5KPVYfy3/KGXItlsw1Y+DZeTh74PFNpYK5YsbQnamue6PQlVh+mGpkt5ba1xlgd2OYnE32zYU8ppHYlAFzTgKsPTU6URMeD+dhSBn1oKDzCbyb7pmn6box69Y9Q1wg5jYGJ0FOPWkSZNCVmS2zh4N/C/jJaoX+sLdYCh0OVOJeVI83Xwu/bruY+E+XInpD/xWANfZOXw+x3nOtZKFaUfD+icZOQ/mKLa5G7v/U1tlbP984N5BPPhUYGYBuB8ko81DWTv2Dl+KWARef+oDPLUKNreqJfTP4w3+ShYRTAlNW2lNscNZBYC3NOTnm0u4nWZ+4CkuL2reZsrpO/vN
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(7696005)(478600001)(6666004)(8936002)(8676002)(83380400001)(70206006)(70586007)(54906003)(110136005)(316002)(40460700003)(5660300002)(107886003)(2616005)(36860700001)(36756003)(4326008)(86362001)(82740400003)(40480700001)(26005)(47076005)(336012)(2906002)(426003)(1076003)(41300700001)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:11:54.8223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb73dff-8491-4347-391c-08dbbaa453fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Ninad Malwade <nmalwade@nvidia.com>

The INA3221 allows the Critical alert pin to be controlled by the
summation control function. This function adds the single
shunt-voltage conversions for the desired channels in order to compare
the combined sum to the programmed limit. The Shunt-Voltage Sum Limit
register contains the programmed value that is compared to the value in
the Shunt-Voltage Sum register in order to determine if the total summed
limit is exceeded. If the shunt-voltage sum limit value is exceeded, the
Critical alert pin pulls low.

For the summation limit to have a meaningful value, we have to use the
same shunt-resistor value on all included channels. Unless equal
shunt-resistor values are used for each channel, the summation control
function cannot be used and it is not enabled by the driver.

To address this, add support to disable the summation of specific
channels via device tree property "ti,summation-disable". The channel
which has this property would be excluded from the calculation of
summation control function.

For example, summation control function calculates Shunt-Voltage Sum as:

- input_shunt_voltage_summation = input_shunt_voltage_channel1
                                + input_shunt_voltage_channel2
                                + input_shunt_voltage_channel3

If we want the summation to only use channel1 and channel3, we can add
'ti,summation-disable' property in device tree node for channel2. Then
the calculation will skip channel2.

- input_shunt_voltage_summation = input_shunt_voltage_channel1
                                + input_shunt_voltage_channel3

Note that we only want the channel to be skipped for summation control
function rather than completely disabled. Therefore, even if we add the
property 'ti,summation-disable', the channel is still enabled and
functional.

Finally, create debugfs entries that display if summation is disabled
for each of the channels.

Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/hwmon/ina3221.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 5ab944056ec0..359b758e9f03 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -6,6 +6,7 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
@@ -104,6 +105,7 @@ struct ina3221_input {
 	const char *label;
 	int shunt_resistor;
 	bool disconnected;
+	bool summation_disable;
 };
 
 /**
@@ -123,8 +125,10 @@ struct ina3221_data {
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
 	struct mutex lock;
+	struct dentry *debugfs;
 	u32 reg_config;
 	int summation_shunt_resistor;
+	u32 summation_channel_control;
 
 	bool single_shot;
 };
@@ -154,7 +158,8 @@ static inline int ina3221_summation_shunt_resistor(struct ina3221_data *ina)
 	int i, shunt_resistor = 0;
 
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
-		if (input[i].disconnected || !input[i].shunt_resistor)
+		if (input[i].disconnected || !input[i].shunt_resistor ||
+		    input[i].summation_disable)
 			continue;
 		if (!shunt_resistor) {
 			/* Found the reference shunt resistor value */
@@ -786,6 +791,9 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	/* Save the connected input label if available */
 	of_property_read_string(child, "label", &input->label);
 
+	/* summation channel control */
+	input->summation_disable = of_property_read_bool(child, "ti,summation-disable");
+
 	/* Overwrite default shunt resistor value optionally */
 	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
 		if (val < 1 || val > INT_MAX) {
@@ -827,6 +835,7 @@ static int ina3221_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ina3221_data *ina;
 	struct device *hwmon_dev;
+	char name[32];
 	int i, ret;
 
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
@@ -873,6 +882,10 @@ static int ina3221_probe(struct i2c_client *client)
 
 	/* Initialize summation_shunt_resistor for summation channel control */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
+		if (!ina->inputs[i].summation_disable)
+			ina->summation_channel_control |= BIT(14 - i);
+	}
 
 	ina->pm_dev = dev;
 	mutex_init(&ina->lock);
@@ -900,6 +913,15 @@ static int ina3221_probe(struct i2c_client *client)
 		goto fail;
 	}
 
+	scnprintf(name, sizeof(name), "%s-%s", INA3221_DRIVER_NAME, dev_name(dev));
+	ina->debugfs = debugfs_create_dir(name, NULL);
+
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
+		scnprintf(name, sizeof(name), "in%d_summation_disable", i);
+		debugfs_create_bool(name, 0400, ina->debugfs,
+				    &ina->inputs[i].summation_disable);
+	}
+
 	return 0;
 
 fail:
@@ -918,6 +940,8 @@ static void ina3221_remove(struct i2c_client *client)
 	struct ina3221_data *ina = dev_get_drvdata(&client->dev);
 	int i;
 
+	debugfs_remove_recursive(ina->debugfs);
+
 	pm_runtime_disable(ina->pm_dev);
 	pm_runtime_set_suspended(ina->pm_dev);
 
@@ -978,13 +1002,13 @@ static int ina3221_resume(struct device *dev)
 	/* Initialize summation channel control */
 	if (ina->summation_shunt_resistor) {
 		/*
-		 * Take all three channels into summation by default
+		 * Sum only channels that are not disabled for summation.
 		 * Shunt measurements of disconnected channels should
 		 * be 0, so it does not matter for summation.
 		 */
 		ret = regmap_update_bits(ina->regmap, INA3221_MASK_ENABLE,
 					 INA3221_MASK_ENABLE_SCC_MASK,
-					 INA3221_MASK_ENABLE_SCC_MASK);
+					 ina->summation_channel_control);
 		if (ret) {
 			dev_err(dev, "Unable to control summation channel\n");
 			return ret;
-- 
2.34.1

