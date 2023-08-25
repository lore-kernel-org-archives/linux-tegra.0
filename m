Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE58EE49B3
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344061AbjHYQnx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344135AbjHYQnp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 12:43:45 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C801212E;
        Fri, 25 Aug 2023 09:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTfSwRclI37O6bFT5f6LhTpCSOaQ18KKZ58pzZLPyS9Y8H14A26EpW4kmSmENvmPddVh3akmefQIIepynS3+ak5tORwWz41pNErfm9aMlqr8dD2VSBmmMm+FF0C3qPf21V7mhcCJWvO8uKbqkYZuquxFV4A3FRmt18TI9epqenIfPSv0GVC/7v67L/MLy569K18Vtg4zionBtdxIQi9qfTAieTPxmwqR/rZkW4avuUsBjYGbrAi37csxagca+QKx/Y5lZd8v9PgDZCNgVeUIHmT2I5FokRjDtrFDOU2vEE0keBXq2UeewSk+PVQtH6xIlEr54SOxag3zpYlP+bOl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki4tdagOTrRBIXC4pe1zPlpWgKKFBU8yjVrGXG1MgfQ=;
 b=g8NK6zX2liI0h4Dlz/P6Nr453KqBopy/mQ2bNemVVoBZ1m+32urZheGizv96+aWlwtTpmwbDtr3F3WEdfcsgJkbjenXoyzMC80CT3pyS2mGIyxadjbq1JYMj8Isgom7ensCASW0B1sLIz8xpFrFnSBANx5skx2IMPnW4Ejy+ddGqL6nVjBQJDqfOvuJlF0zZJDzyfhdiVd8W5I+404t8b4M+rcNmEZ+IeIQO6ErMs6cuZsHywKr9AWaylxOl6/ebvoz+rqZ3S4oHwFm0O/rqq1oqFeTaNMq6cX2/xamucH3JyS0/edDWQs+izyO5hhLVCA1KjzaCq2GbEKYMrRFCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki4tdagOTrRBIXC4pe1zPlpWgKKFBU8yjVrGXG1MgfQ=;
 b=eVrhxTXnb8qokU+E/qpCxT2ap+pOFQXY05HISzh8RbS7hmwk2ktK6wFk5Tpq5RIIH+0kFzpcwuHrUYXkbDvClthexVP7uYXyklQJS7vpYGtAzfcK8xl773ydqLvGpWn4wv8KpyA3kRoSO0NDmFLsjlsVJraGh2+TnuePU4CCdPXuAqGjr2hv3V71oh7bFrtVo3cG1yuIPXlfqIaCvvJ8oR747JUKMVZN7T2wFwXUjmspPhjn80YKnWXXLmGYBD6uV5WosUwjshgHkRnyIpUG0lKFoR6VtqGHTkbgWxQ40DrPwndWVnH01nW9bVF9Jk5GUWWTgbYZgoaA7uuwABHtQg==
Received: from PH7PR13CA0023.namprd13.prod.outlook.com (2603:10b6:510:174::23)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 16:43:31 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::bb) by PH7PR13CA0023.outlook.office365.com
 (2603:10b6:510:174::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.20 via Frontend
 Transport; Fri, 25 Aug 2023 16:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 16:43:30 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 25 Aug 2023
 09:43:19 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 25 Aug
 2023 09:43:18 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 25 Aug 2023 09:43:16 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Ninad Malwade <nmalwade@nvidia.com>,
        Rajkumar Kasirajan <rkasirajan@nvidia.com>
Subject: [PATCH V2 3/4] hwmon: ina3221: add support for summation channel control
Date:   Sat, 26 Aug 2023 00:42:48 +0800
Message-ID: <20230825164249.22860-4-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825164249.22860-1-nmalwade@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 863fba2b-d68f-4fa6-303a-08dba58a6a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsGI2ebRWmxnkrcGc2bF9NLODkHgnDfKls/J0wzy+0fsTigCKD320cE/Qdcmz6WFBF8QS3LAuZreFgybXAJnlnjnPIvqdAjk+XX3zfOZMywB/uDUi1vzqj2VpDbsK8uV3c2VeDNPVe25peYWsQLYGRlpJvGZnkNBnSvVadYIuCGCsILy2X9iwsRT+iE55ImQD0ezXbwVQfDiJqCIahAS4AFBSWwj4wTLWfGT8gntDq2BjjMXwa2roDmPefwcU2rmVrNSggHGL7sryHboyc0Grm3DDCH/1+/+wj1U+LLb2VVhYg0l3hxuDPeHa/kJ+69Nf5zWi0J/0nYCVhU8KV4C+lxHbEnvnP56kkxzcA8sZpmS1jAsob4dPQ4mm/pAi8UFnflBwbSIrWEOBdZgw0hNSCpcJpljwK6Q9aB0W++WsPDUOZ+z1+Clwz0pk6euIrW75UIjrj3KPQ1HJdacbZN6Tl09wTr5VTbgfMKxtBtuzTsOwigccpoMYkupaUbLESdQ+mO3BP5CnafH6LDSKsXsjQ15POcQjlU8+5Nmlj9J1hn8oWj3EpJaB0NtYQfkhDon3W6d+WfZw1AEyzuU3CSvkA7Q8sJWkrxnM3Xq0+nsENU6DPantwNjI6Boa5bzhOEWxySBbHeMvz90kWBYckh+jqjSo3i17mrpHD/XXNNl3/N1RN2RbynbsjGwkmR9hgAOlSTjCe8Ggwxy5tPjTXJ3Nq0umEnKY/JQXL5T27LAxEUJJIv1GDAFOaOjGIb3Ww4k
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(7696005)(70586007)(316002)(70206006)(478600001)(110136005)(26005)(36860700001)(6666004)(7636003)(356005)(40480700001)(921005)(82740400003)(41300700001)(86362001)(2906002)(4326008)(8676002)(8936002)(1076003)(40460700003)(2616005)(107886003)(5660300002)(83380400001)(36756003)(336012)(47076005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:43:30.9597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 863fba2b-d68f-4fa6-303a-08dba58a6a56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The INA3221 allows the Critical alert pin to be controlled
by the summation control function. This function adds the
single shunt-voltage conversions for the desired channels
in order to compare the combined sum to the programmed limit.
The Shunt-Voltage Sum Limit register contains the programmed
value that is compared to the value in the Shunt-Voltage Sum
register in order to determine if the total summed limit is
exceeded. If the shunt-voltage sum limit value is exceeded,
the Critical alert pin pulls low.

For the summation limit to have a meaningful value,
we have to use the same shunt-resistor value on all included
channels. Unless equal shunt-resistor values are used for
each channel, we can't use summation control function to add
the individual conversion values directly together in the
Shunt-Voltage Sum register to report the total current.

To address this we add support to BYPASS channels
via kernel device tree property "summation-bypass".

The channel which has this property would be excluded from
the calculation of summation control function, so we can easily
exclude the one which uses different shunt-resistor value or
bus voltage.

For example, summation control function calculates
Shunt-Voltage Sum like
- input_shunt_voltage_summaion = input_shunt_voltage_channel1
                               + input_shunt_voltage_channel2
                               + input_shunt_voltage_channel3

But if we want the summation to consider only channel1
and channel3, we can add 'summation-bypass' property
in device tree node of channel2.

Then the calculation will skip channel2.
- input_shunt_voltage_summaion = input_shunt_voltage_channel1
                               + input_shunt_voltage_channel3

Please note that we only want the channel to be skipped
for summation control function rather than completely disabled.
Therefore, even if we add the device tree node, the functionality
of the single channel would still be retained.

The below sysfs nodes are added to check if the channel is included
or excluded from the summation control function.

in*_sum_bypass = 0 --> channel voltage is included for sum of
                       shunt voltages.

in*_sum_bypass = 1 --> channel voltage is excluded for sum
                       of shunt voltages.

Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 drivers/hwmon/ina3221.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 5ab944056ec0..093ebf9f1f8d 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -104,6 +104,7 @@ struct ina3221_input {
 	const char *label;
 	int shunt_resistor;
 	bool disconnected;
+	bool summation_bypass;
 };
 
 /**
@@ -125,6 +126,7 @@ struct ina3221_data {
 	struct mutex lock;
 	u32 reg_config;
 	int summation_shunt_resistor;
+	u32 summation_channel_control;
 
 	bool single_shot;
 };
@@ -154,7 +156,8 @@ static inline int ina3221_summation_shunt_resistor(struct ina3221_data *ina)
 	int i, shunt_resistor = 0;
 
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
-		if (input[i].disconnected || !input[i].shunt_resistor)
+		if (input[i].disconnected || !input[i].shunt_resistor ||
+		    input[i].summation_bypass)
 			continue;
 		if (!shunt_resistor) {
 			/* Found the reference shunt resistor value */
@@ -731,10 +734,29 @@ static SENSOR_DEVICE_ATTR_RW(shunt1_resistor, ina3221_shunt, INA3221_CHANNEL1);
 static SENSOR_DEVICE_ATTR_RW(shunt2_resistor, ina3221_shunt, INA3221_CHANNEL2);
 static SENSOR_DEVICE_ATTR_RW(shunt3_resistor, ina3221_shunt, INA3221_CHANNEL3);
 
+static ssize_t ina3221_summation_bypass_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	unsigned int channel = sd_attr->index;
+	struct ina3221_input *input = &ina->inputs[channel];
+
+	return sysfs_emit(buf, "%d\n", input->summation_bypass);
+}
+
+/* summation bypass */
+static SENSOR_DEVICE_ATTR_RO(in1_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL1);
+static SENSOR_DEVICE_ATTR_RO(in2_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL2);
+static SENSOR_DEVICE_ATTR_RO(in3_sum_bypass, ina3221_summation_bypass, INA3221_CHANNEL3);
+
 static struct attribute *ina3221_attrs[] = {
 	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
 	&sensor_dev_attr_shunt2_resistor.dev_attr.attr,
 	&sensor_dev_attr_shunt3_resistor.dev_attr.attr,
+	&sensor_dev_attr_in1_sum_bypass.dev_attr.attr,
+	&sensor_dev_attr_in2_sum_bypass.dev_attr.attr,
+	&sensor_dev_attr_in3_sum_bypass.dev_attr.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(ina3221);
@@ -786,6 +808,9 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 	/* Save the connected input label if available */
 	of_property_read_string(child, "label", &input->label);
 
+	/* summation channel control */
+	input->summation_bypass = of_property_read_bool(child, "summation-bypass");
+
 	/* Overwrite default shunt resistor value optionally */
 	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
 		if (val < 1 || val > INT_MAX) {
@@ -873,6 +898,10 @@ static int ina3221_probe(struct i2c_client *client)
 
 	/* Initialize summation_shunt_resistor for summation channel control */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
+		if (!ina->inputs[i].summation_bypass)
+			ina->summation_channel_control |= (BIT(14 - i));
+	}
 
 	ina->pm_dev = dev;
 	mutex_init(&ina->lock);
@@ -978,13 +1007,13 @@ static int ina3221_resume(struct device *dev)
 	/* Initialize summation channel control */
 	if (ina->summation_shunt_resistor) {
 		/*
-		 * Take all three channels into summation by default
-		 * Shunt measurements of disconnected channels should
-		 * be 0, so it does not matter for summation.
+		 * Sum only channels that are not 'bypassed' for summation
+		 * by default. Shunt measurements of disconnected channels
+		 * should be 0, so it does not matter for summation.
 		 */
 		ret = regmap_update_bits(ina->regmap, INA3221_MASK_ENABLE,
 					 INA3221_MASK_ENABLE_SCC_MASK,
-					 INA3221_MASK_ENABLE_SCC_MASK);
+					 ina->summation_channel_control);
 		if (ret) {
 			dev_err(dev, "Unable to control summation channel\n");
 			return ret;
-- 
2.17.1

