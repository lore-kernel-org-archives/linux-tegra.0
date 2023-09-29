Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D478FE81815
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjI2Khe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbjI2KhU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:37:20 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5806A1BD;
        Fri, 29 Sep 2023 03:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6CsoAKTghstwDc5ID8zd8Lu2GNvwgX6yDZs/OZF90mKKoR733k9AccgPtfy5ILKpnQKvlpyWOSmaZrJQDanVOne+JITYlQgZqLzoOroU0xoiuPggRS1aRzUFswpRept4JAQot4F/r38rayTA37v5C10P5BvaTuvOGvzkcTefZ1eUnQ89YT01vrHC3lX+W+d+zTsCe6CCDIAlTWM1APRUh6j76jRgg3AZarjF+SOgHSLrMLfzSJj8twyB6NiVPvtWhZoJjVPvX1SygEwxeeXSYWNphJXukM/+tnxRpFYVTmlBeiAasDkMXjNxKwRXVc3i4ihbOgezQGpkmVFiJQ4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74/nJgm1DUzuN0eOOY/xluCtvtQDd27o3MR3/EqiIHA=;
 b=YXn1ySa6F20ptu41sJL3w+RM6M4GhQC2QAqEKTlZtmQD8CKX3bbIwvZh05jc6mkvMi+NNZuq0yNHCwwzeKpo4P4u2xk4AXJK7KnaXdNAlL96X1obsZlpYmfQNR+4el6Q5bLdXSMIp1KssAtkGjVGDxSjWciFP1n5NouA3ZfueDRgeooCTlPN8FNzWDjn03Ikv7EOa0xb9sjzwmuqPZOfGlwpnN5MMO5y9x9EGTiBegy1ksAxWC8Wo0uvVTcgj4Evl6IquAvIiG6jM+t4RMvkd9rkZh5VI2PaHcmKWsea+N0uTTfuA+3BcpgArqANxWVB858KJMH3WwXZdNnJ+u9fNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74/nJgm1DUzuN0eOOY/xluCtvtQDd27o3MR3/EqiIHA=;
 b=iprxxo41Ak+Mtmomm3h+GAELLeG119R7mOKFN4YM3C+FKzwy/cL6giemyGh4Ka50awwVnxy0HnnbVhCfdDWepQOdzC5GLQokahm2zlxQqmL9YqhMh5D6UPOwFN6acOH9rK1RQXU7a0irMQ02woTZvYouS6z1BYpbx99U51w+eKuxhwhaze7y/gllci15SyBziEdSvzgltH7c8+19YaItTXMQWKXO7hcnd5guiYtTDoDAUgATzfRuBPy8ErxqRzLxPvS73sgxRgmqXTKh3NyAhe1xzwr/tRrvqbEis6gTeZFEnCuULMW0ceDDh4aG6cUxshFPjIIz1qhiHlc2yx0z4A==
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 10:37:15 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::f9) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:37:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:37:15 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:04 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:03 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:37:00 -0700
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
Subject: [PATCH V5 3/4] hwmon: ina3221: Add support for channel summation disable
Date:   Fri, 29 Sep 2023 11:36:49 +0100
Message-ID: <20230929103650.86074-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929103650.86074-1-jonathanh@nvidia.com>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: a20c6846-3292-4550-faab-08dbc0d80c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOhcztgOiPkJxQ0zNoTY8I7GxwRtI25jCuZuw3UCXGnpwoUBdz/VJROU++hdSBFEy6DfoMOf4RbNIQRtwz1wE1truDWdkELGqPH8nbT6tvd49E34q18DjkweHvSb5E2O/dDebKTIhxMW867BHAabcd3xYR6/EriMrLGISPbLPztrYcmnt7YhotHK4Pu0lqOdcxj1+wjWo/Z+2nhvs04Y5XDa/nfbVTEJVf2gBGiRlU6OCdA8gJqP/58IMDJf/kf7L54VNEnnXZDtYb/O9dJ4Q7cUm9PsvMqy45iV9OrHjAGPLETYybb1YYEZcSN2HQRPgNMzwCqjk9IIZgdCbsMKAX9ltE/rN2Iw/i4t5UM0cQAIC5vGqgwvgvBQyNDAxeORDDJ5cXLz+2tSSreW2Q4LAwWgX1fo4RTr/Ei8hFdUjRuVYKm2RpYNPc8/3b7jHXn8MAG3P4+IbwqOOW2e5OjJUfwlG0yQdsfFEZYcE5ZDWuGV1UaRwdNntu3dykmIGycsr3HbhvbOtmkWbpmPzXjkcxPfbhbnWPBM4x5czbdwZ9RF3jmTysOQ8OZputfh35+jBIVF1ebasV54ZPSUhuITrJx3ja8y0fZKdSyVzJ6Z+wDHcmrGxgNcFso+MqsHbSuI6ZsCTuf8JtVFI4hChPuC57+dcJVCsTGNaxOfG0o+gUfMUh4eb9/Dz/27FBD1GtTyxb2z+1mhjIK8djTOHONq5WMGpNE24JELW5bon5V8myzRGSEz89iEBZ3OIrQfcr2n
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(316002)(54906003)(8676002)(4326008)(8936002)(41300700001)(107886003)(26005)(40480700001)(36756003)(2616005)(1076003)(83380400001)(426003)(336012)(70586007)(478600001)(6666004)(356005)(82740400003)(86362001)(7636003)(47076005)(36860700001)(70206006)(40460700003)(110136005)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:37:15.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20c6846-3292-4550-faab-08dbc0d80c50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225
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

