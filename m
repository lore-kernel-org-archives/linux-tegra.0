Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06853E7F154
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjI2K2J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjI2K2G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:28:06 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C825C1B4;
        Fri, 29 Sep 2023 03:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I++zJtYK4IBW9x9Snw9iz+lfaLLPl6LDpw9RTH0Yuj66QvypjB+B6UqeBw4xLq5FzzWFJdCwbPMJy3DSpXLQJk3ZbZLthbqnFygrQeMzqTCsEhbrg5NrU53X1vkTpF38T0QylMHjwoSbjaLYoGKWwfS0wavun8vKK0W7p1xM7AOLVV+MT6xoa3clkSEfHWBKU/v3fc+Kr9vlOmSbmD8EsztRvtgjeXs+lW1SbMtN0aRgA129T3nL9c0mNRJX4ybMBzPdKgAfkSKubSYK82jJ0uJRdo8xEeupdrY+h6Lqhx/NBx70RWxMItKf3APUzfdBPV5ukAO5mvOTr3MtxRCwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74/nJgm1DUzuN0eOOY/xluCtvtQDd27o3MR3/EqiIHA=;
 b=ZhC98rXty9euv9S4n5u/d4aHPSmtV/aNi+pXwRAp04yuQTBxL8F8KI1bxBQUEcdX+uXqvph12csODKdi0WCGEhUr1888apDS1N8doRtQ9IZmxTFwn2AoL/EiWWuky7QIppDdP8G4PIJCo9ON/qHZUbr8v2rL87sXP0YULzv14TXOD34QVz60KWGDE6KZr2wKSMDNX4Lma2yOe/RTTjA/nkFaiPvwgUP/0s+8GZ9Un/nKUKHcY3FMVHOO9F0Psa01P5Uuf059LHXL3mPRAlABGd7g04abC7a8jUXqGAMS25+lxgtiHoAoam4iw9PiWOD/if9rdv0aOBZZW0V37aHasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74/nJgm1DUzuN0eOOY/xluCtvtQDd27o3MR3/EqiIHA=;
 b=tzx+NntJOg7fI/seHFXO2BpA0RzyAdDIQAht5bvV6ncHrRTrxyqDOCM1tmfJ6xfs4vQDCswbmvJfw0QUn4mbr9SEfLXsgO33JOS8v26NArBYAT754783uEoGc+WeTgWUotJBbsYaw/w/1SdbG6LYBbN2YImvr7r665Nw97XgvJ4J9FGqBW3cgwU3L34L8MfE5tWJF88fN4lJeKviDESPU3ySchT4u7vkfxjpbQmC/7nUPycb2aG5sJ4fRC4mowTPZfKGZ4OVij6C49A+7hyVWnLvnuy3M2JUVNNwxGJ3ueQzn3dZKQ8HiKFlslMFLMXA6LuEWzix4p4lUSFyIQL6yw==
Received: from MN2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:208:a8::41)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 29 Sep
 2023 10:28:00 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::47) by MN2PR12CA0028.outlook.office365.com
 (2603:10b6:208:a8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27 via Frontend
 Transport; Fri, 29 Sep 2023 10:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:27:59 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:27:57 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 29 Sep 2023 03:27:56 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:27:54 -0700
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
Subject: [PATCH V4 3/4] hwmon: ina3221: Add support for channel summation disable
Date:   Fri, 29 Sep 2023 11:27:43 +0100
Message-ID: <20230929102744.84989-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929102744.84989-1-jonathanh@nvidia.com>
References: <20230929102744.84989-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: b428d9f1-437c-471b-5b7b-08dbc0d6c107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcSq/xobJNBwQR3u1vHt2KYpiWzyXOTaqUgqJXxGOQ70FiOjUTUT5He+hXOeRCoWHQI7xZKb4J3QbQkE0m0sMKI8O+ovWtCnAXNE8yQfpA3OO/pjnnWQfwp9mzVUzbXGPDUu1HvI3A2Fhk4zg3eAPtWKI6WW2bQ9mfgqRw2XT/ieW3qneGd9SM6mIreEDL4sJGXtLs1AJHy4dnsBmhIMa6CteiMrDUnwWIOI5cOlel2/P2HLKB2C4K/YU3kMHQHz053vdeDFnbu7fkNt7ZuLKbwyfZXA/d7nr1e/dYs/OpulDQt3K4kr6PZ9irKzDUfyzIJrOjtB9JPIHALn5d5Hu9ScYH4xum45l8qmvPjn7drFvmjuV4Y46vAH8F5Qhk56zHBY6HfS/y/RBJLIohRyf1GNduPp2OyofUwSHaggBYOo6G/9ho1HAApNvaAEaISLw+xk4wTOy8C0LpxiEQA+9qGkV5uIyOLtaAV2g1W+mowhDsUJf+qXmTCxbzRe5PSB7+zN0ZeYNKCKjyu79/973vQMr563/C5an5Bm/87tDUUgahMaVWbYr90MUng6+Llp/dJJ5/gEzXsireplr4LoFquMYzQky9c+Kg/FxWdIozUXBHglERO7bCq/rurA7Qggs4sGiP/ZxTTm3N1fKJg0qhtwn7Yw6nDlTlMMTIGgzk4dqK1Gg5t3QsyC7HOBWTU2wjgDrKKcRmMTOvvzEdcACsc3OfGpF/WJkvghP39y5EY6RsfI5/uVdRc26+b+obQD
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(36840700001)(40470700004)(46966006)(7636003)(2616005)(356005)(82740400003)(40480700001)(26005)(1076003)(40460700003)(336012)(426003)(8936002)(70586007)(4326008)(5660300002)(8676002)(86362001)(70206006)(2906002)(316002)(41300700001)(110136005)(54906003)(36756003)(6666004)(478600001)(47076005)(36860700001)(83380400001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:27:59.5045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b428d9f1-437c-471b-5b7b-08dbc0d6c107
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
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
 drivers/hwmon/ina3221.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 5ab944056ec0..5ffdc94db436 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -6,6 +6,7 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
@@ -99,11 +100,13 @@ enum ina3221_channels {
  * @label: label of channel input source
  * @shunt_resistor: shunt resistor value of channel input source
  * @disconnected: connection status of channel input source
+ * @summation_disable: channel summation status of input source
  */
 struct ina3221_input {
 	const char *label;
 	int shunt_resistor;
 	bool disconnected;
+	bool summation_disable;
 };
 
 /**
@@ -113,8 +116,10 @@ struct ina3221_input {
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
  * @lock: mutex lock to serialize sysfs attribute accesses
+ * @debugfs: Pointer to debugfs entry for device
  * @reg_config: Register value of INA3221_CONFIG
  * @summation_shunt_resistor: equivalent shunt resistor value for summation
+ * @summation_channel_control: Value written to SCC field in INA3221_MASK_ENABLE
  * @single_shot: running in single-shot operating mode
  */
 struct ina3221_data {
@@ -123,8 +128,10 @@ struct ina3221_data {
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
 	struct mutex lock;
+	struct dentry *debugfs;
 	u32 reg_config;
 	int summation_shunt_resistor;
+	u32 summation_channel_control;
 
 	bool single_shot;
 };
@@ -154,7 +161,8 @@ static inline int ina3221_summation_shunt_resistor(struct ina3221_data *ina)
 	int i, shunt_resistor = 0;
 
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
-		if (input[i].disconnected || !input[i].shunt_resistor)
+		if (input[i].disconnected || !input[i].shunt_resistor ||
+		    input[i].summation_disable)
 			continue;
 		if (!shunt_resistor) {
 			/* Found the reference shunt resistor value */
@@ -786,6 +794,9 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	/* Save the connected input label if available */
 	of_property_read_string(child, "label", &input->label);
 
+	/* summation channel control */
+	input->summation_disable = of_property_read_bool(child, "ti,summation-disable");
+
 	/* Overwrite default shunt resistor value optionally */
 	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
 		if (val < 1 || val > INT_MAX) {
@@ -827,6 +838,7 @@ static int ina3221_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ina3221_data *ina;
 	struct device *hwmon_dev;
+	char name[32];
 	int i, ret;
 
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
@@ -873,6 +885,10 @@ static int ina3221_probe(struct i2c_client *client)
 
 	/* Initialize summation_shunt_resistor for summation channel control */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
+		if (!ina->inputs[i].summation_disable)
+			ina->summation_channel_control |= BIT(14 - i);
+	}
 
 	ina->pm_dev = dev;
 	mutex_init(&ina->lock);
@@ -900,6 +916,15 @@ static int ina3221_probe(struct i2c_client *client)
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
@@ -918,6 +943,8 @@ static void ina3221_remove(struct i2c_client *client)
 	struct ina3221_data *ina = dev_get_drvdata(&client->dev);
 	int i;
 
+	debugfs_remove_recursive(ina->debugfs);
+
 	pm_runtime_disable(ina->pm_dev);
 	pm_runtime_set_suspended(ina->pm_dev);
 
@@ -978,13 +1005,13 @@ static int ina3221_resume(struct device *dev)
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

