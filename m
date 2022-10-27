Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2ABFA3742
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 12:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbiJ0MOX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJ0MOW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 08:14:22 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02055F6C08;
        Thu, 27 Oct 2022 05:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccr0Qh8NagVO4C7VjPPmTgJtRO7vPo/ohm5z+yPYg5wbvzopjJUMXgHJ1UjZOmzvqtPATA4OR77iW7SvrTefQMT6Oj0G8wzP6YnQ5JwExXX2bUGdQ7V58xV1Yv3qsWv8RjMi+UEBdsicyygBNnhbOvchzknmCQxZ7c9o+vq61wSycYW9g5FFb13V7E349+mfLAcvTZbiJec+EhLPMrY5oa/BuRWxaZqLJa/q/eEMV+ZOci+P/ya79vMpMFpsMt3dFd8BbPmWJAzRlM1XuGc/JdlU4fcvmvouL5rYdt93TYNwsadIfRN1WaHe9Hn6RIEptd2URqxbOpJeEwHiOAhM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwgtGVG3Gy49xZVarQWGRj1qVHxe79YS3mo9Dn+iPzI=;
 b=ZhqqfhiPye2cNX7zStBkLZdO2h8/mGEs4HhVUKYm1DM89IXuigfnhWk8HparLB/PBv97otY23KGrEVukVj1Nfs9nNaLdZMRhuhnbqmc2WRkf0zRIszFXmUSYYmCwCO/xjF6JsOeuR3Aw3Zv3IpfY5kochoY7LMXuoSz9Lfis60q43J6CIb3z2b8b/IP9pNELabhEjnNn+FGgkSEV+8NF4MJQbdc0UV8SY0R5mgpYgRVQ7CuRBvM94UKayHBhoQHm9eto4JGqPEjkChlAv0g4+rq+FCO9SsubG6JdBi4T30WU/fVPKHMxlbXkya7Aqcu7nf0CXr0ThtnG7yWUdeK5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwgtGVG3Gy49xZVarQWGRj1qVHxe79YS3mo9Dn+iPzI=;
 b=WfGxRrUk1wSfF3OlyKdAOzC9A6bftmnqSVszS4S1xMi/mIOA/xxJrptH230eb745VKmPDdxrNrGtw/MTNTn5uEqJ5z/rpcSPnr5AN7P3kz+4dvuIWZUWn35OANlCpTL75uFK7hns1uENDsgymH1lk2psV0h6CMzmlBExR3hVmTTrBGdkf3DWVGgFrAwLe7k+njQj3hnHpcDd/q5TDffBmPP2uJPUKhEtlkj5ZjobZXlZ3LT6IEQYd3pAZJl9ycDgpOtFWGz4PAazw++lsqtGEjIlYcQjn3id6zYMhV2zjRVi7VUBeNymLegmz8hVFO8IbhCLTCpCiubdtsp8ELpqpQ==
Received: from BN0PR04CA0152.namprd04.prod.outlook.com (2603:10b6:408:eb::7)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 12:14:14 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::81) by BN0PR04CA0152.outlook.office365.com
 (2603:10b6:408:eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 12:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 12:14:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 27 Oct
 2022 05:13:59 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 27 Oct
 2022 05:13:58 -0700
Received: from 44189d9-lcedt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 27 Oct 2022 05:13:57 -0700
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v4 1/2] firmware: tegra: Update BPMP ABI
Date:   Thu, 27 Oct 2022 15:13:53 +0300
Message-ID: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 355ef49f-bf54-4794-5500-08dab814c352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTshWjszB8Cv0FoWP74T2EAnJmOYlvZNXzDAzDJmoMrbhdniIWDuFO4+7X+GIoCsJh0HrnmFq/gP8LyHJ5D+v3f4xlpKDSX1uOM+uFWQv0ozOHwgyUz5pd16L5p5JFCWclQ2+aLjHUZB3GkQzAk/6XozRb37axbh/0ah1fck79rD4Pym2lwnup5YYGWS1HJmyGXbil+eU5+U/+xVN7KJL1omAZN14gXBIuP8L0V92elQNnnm9BraYa71M86e28nxeVkGrs7dIsWidK2JJkM3AXFdI08BU5h2kLkdQZijAYhvjWiGLZnQXiSS29zbT7kxUb+ie57zpd01ynRaXiH+2cdvO9x0WLT2W8EQKUDNof3mkhOy+HuxNzhwy7O5cDxm8AyLbzaQAav9RILw9LRkKwTaUk7KHe2bGSgFLjDXhChdAm1UAPQekBjmiXhl5scB+G12tgTSB77cTa6dbpzUFmvzK03Dxr6vwkKMqKEb7XlhZ0meJCJSNZI82VuhJtAS/o39m6tzVCVXKq/YVKoW8D69pq8JNhI+hQOMWHjxo+pRCk62tYqzO/wgNg5DFQm1wgr8j7aJJcUMR3WWJ2NGs8JECJmCDFXqH/1V1HO+fQ3zxyzY1NT/hvIoe+LZU31VcfiYhuzp9DYz73zy+6SefC9mtGGQnJ5eD8t0bMe/LecWLiWe8+1N5dX/2MSPjk3aNue+oVj6zqcJQ30NOmYadnFr16hgHnQIyUTcFdKrHS+roe2xeV9PO0UDKoJls+Mh76pMz5DBEhCbO4R/LI8MTQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(110136005)(5660300002)(450100002)(8936002)(70586007)(41300700001)(54906003)(70206006)(316002)(36860700001)(82740400003)(47076005)(40480700001)(8676002)(4326008)(356005)(7636003)(7696005)(86362001)(6666004)(107886003)(478600001)(83380400001)(426003)(336012)(1076003)(186003)(40460700003)(2616005)(26005)(82310400005)(36756003)(30864003)(15650500001)(2906002)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 12:14:14.0124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355ef49f-bf54-4794-5500-08dab814c352
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Update the BPMP ABI to align with the the latest version.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 include/soc/tegra/bpmp-abi.h | 1802 +++++++++++++++++++++++++---------
 1 file changed, 1357 insertions(+), 445 deletions(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 53171e324d1c..ecefcaec7e66 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2022, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef ABI_BPMP_ABI_H
@@ -72,6 +72,32 @@
  * @}
  */
 
+/**
+ * @ingroup MRQ_Format
+ * Request an answer from the peer.
+ * This should be set in mrq_request::flags for all requests targetted
+ * at BPMP. For requests originating in BPMP, this flag is optional except
+ * for messages targeting MCE, for which the field must be set.
+ * When this flag is not set, the remote peer must not send a response
+ * back.
+ */
+#define BPMP_MAIL_DO_ACK	(1U << 0U)
+
+/**
+ * @ingroup MRQ_Format
+ * Ring the sender's doorbell when responding. This should be set unless
+ * the sender wants to poll the underlying communications layer directly.
+ *
+ * An optional direction that can be specified in mrq_request::flags.
+ */
+#define BPMP_MAIL_RING_DB	(1U << 1U)
+
+/**
+ * @ingroup MRQ_Format
+ * CRC present
+ */
+#define BPMP_MAIL_CRC_PRESENT	(1U << 2U)
+
 /**
  * @ingroup MRQ_Format
  * @brief Header for an MRQ message
@@ -85,12 +111,139 @@ struct mrq_request {
 	uint32_t mrq;
 
 	/**
-	 * @brief Flags providing follow up directions to the receiver
+	 * @brief 32bit word containing a number of fields as follows:
+	 *
+	 * 	struct {
+	 * 		uint8_t options:4;
+	 * 		uint8_t xid:4;
+	 * 		uint8_t payload_length;
+	 * 		uint16_t crc16;
+	 * 	};
+	 *
+	 * **options** directions to the receiver and indicates CRC presence.
+	 *
+	 * #BPMP_MAIL_DO_ACK and  #BPMP_MAIL_RING_DB see documentation of respective options.
+	 * #BPMP_MAIL_CRC_PRESENT is supported on T234 and later platforms. It indicates the
+	 * crc16, xid and length fields are present when set.
+	 * Some platform configurations, especially when targeted to applications requiring
+	 * functional safety, mandate this option being set or otherwise will respond with
+	 * -BPMP_EBADMSG and ignore the request.
 	 *
-	 * | Bit | Description                                |
-	 * |-----|--------------------------------------------|
-	 * | 1   | ring the sender's doorbell when responding |
-	 * | 0   | should be 1                                |
+	 * **xid** is a transaction ID.
+	 *
+	 * Only used when #BPMP_MAIL_CRC_PRESENT is set.
+	 *
+	 * **payload_length** of the message expressed in bytes without the size of this header.
+	 * See table below for minimum accepted payload lengths for each MRQ.
+	 * Note: For DMCE communication, this field expresses the length as a multiple of 4 bytes
+	 * rather than bytes.
+	 *
+	 * Only used when #BPMP_MAIL_CRC_PRESENT is set.
+	 *
+	 * | MRQ                  | CMD                                  | minimum payload length
+	 * | -------------------- | ------------------------------------ | ------------------------------------------ |
+	 * | MRQ_PING             |                                      | 4                                          |
+	 * | MRQ_THREADED_PING    |                                      | 4                                          |
+	 * | MRQ_RESET            | any                                  | 8                                          |
+	 * | MRQ_I2C              |                                      | 12 + cmd_i2c_xfer_request.data_size        |
+	 * | MRQ_CLK              | CMD_CLK_GET_RATE                     | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_SET_RATE                     | 16                                         |
+	 * | MRQ_CLK              | CMD_CLK_ROUND_RATE                   | 16                                         |
+	 * | MRQ_CLK              | CMD_CLK_GET_PARENT                   | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_SET_PARENT                   | 8                                          |
+	 * | MRQ_CLK              | CMD_CLK_ENABLE                       | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_DISABLE                      | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_IS_ENABLED                   | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_GET_ALL_INFO                 | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_GET_MAX_CLK_ID               | 4                                          |
+	 * | MRQ_CLK              | CMD_CLK_GET_FMAX_AT_VMIN             | 4                                          |
+	 * | MRQ_QUERY_ABI        |                                      | 4                                          |
+	 * | MRQ_PG               | CMD_PG_QUERY_ABI                     | 12                                         |
+	 * | MRQ_PG               | CMD_PG_SET_STATE                     | 12                                         |
+	 * | MRQ_PG               | CMD_PG_GET_STATE                     | 8                                          |
+	 * | MRQ_PG               | CMD_PG_GET_NAME                      | 8                                          |
+	 * | MRQ_PG               | CMD_PG_GET_MAX_ID                    | 8                                          |
+	 * | MRQ_THERMAL          | CMD_THERMAL_QUERY_ABI                | 8                                          |
+	 * | MRQ_THERMAL          | CMD_THERMAL_GET_TEMP                 | 8                                          |
+	 * | MRQ_THERMAL          | CMD_THERMAL_SET_TRIP                 | 20                                         |
+	 * | MRQ_THERMAL          | CMD_THERMAL_GET_NUM_ZONES            | 4                                          |
+	 * | MRQ_THERMAL          | CMD_THERMAL_GET_THERMTRIP            | 8                                          |
+	 * | MRQ_CPU_VHINT        |                                      | 8                                          |
+	 * | MRQ_ABI_RATCHET      |                                      | 2                                          |
+	 * | MRQ_EMC_DVFS_LATENCY |                                      | 8                                          |
+	 * | MRQ_EMC_DVFS_EMCHUB  |                                      | 8                                          |
+	 * | MRQ_EMC_DISP_RFL     |                                      | 4                                          |
+	 * | MRQ_BWMGR            | CMD_BWMGR_QUERY_ABI                  | 8                                          |
+	 * | MRQ_BWMGR            | CMD_BWMGR_CALC_RATE                  | 8 + 8 * bwmgr_rate_req.num_iso_clients     |
+	 * | MRQ_ISO_CLIENT       | CMD_ISO_CLIENT_QUERY_ABI             | 8                                          |
+	 * | MRQ_ISO_CLIENT       | CMD_ISO_CLIENT_CALCULATE_LA          | 16                                         |
+	 * | MRQ_ISO_CLIENT       | CMD_ISO_CLIENT_SET_LA                | 16                                         |
+	 * | MRQ_ISO_CLIENT       | CMD_ISO_CLIENT_GET_MAX_BW            | 8                                          |
+	 * | MRQ_CPU_NDIV_LIMITS  |                                      | 4                                          |
+	 * | MRQ_CPU_AUTO_CC3     |                                      | 4                                          |
+	 * | MRQ_RINGBUF_CONSOLE  | CMD_RINGBUF_CONSOLE_QUERY_ABI        | 8                                          |
+	 * | MRQ_RINGBUF_CONSOLE  | CMD_RINGBUF_CONSOLE_READ             | 5                                          |
+	 * | MRQ_RINGBUF_CONSOLE  | CMD_RINGBUF_CONSOLE_WRITE            | 5 + cmd_ringbuf_console_write_req.len      |
+	 * | MRQ_RINGBUF_CONSOLE  | CMD_RINGBUF_CONSOLE_GET_FIFO         | 4                                          |
+	 * | MRQ_STRAP            | STRAP_SET                            | 12                                         |
+	 * | MRQ_UPHY             | CMD_UPHY_PCIE_LANE_MARGIN_CONTROL    | 24                                         |
+	 * | MRQ_UPHY             | CMD_UPHY_PCIE_LANE_MARGIN_STATUS     | 4                                          |
+	 * | MRQ_UPHY             | CMD_UPHY_PCIE_EP_CONTROLLER_PLL_INIT | 5                                          |
+	 * | MRQ_UPHY             | CMD_UPHY_PCIE_CONTROLLER_STATE       | 6                                          |
+	 * | MRQ_UPHY             | CMD_UPHY_PCIE_EP_CONTROLLER_PLL_OFF  | 5                                          |
+	 * | MRQ_FMON             | CMD_FMON_GEAR_CLAMP                  | 16                                         |
+	 * | MRQ_FMON             | CMD_FMON_GEAR_FREE                   | 4                                          |
+	 * | MRQ_FMON             | CMD_FMON_GEAR_GET                    | 4                                          |
+	 * | MRQ_FMON             | CMD_FMON_FAULT_STS_GET               | 8                                          |
+	 * | MRQ_EC               | CMD_EC_STATUS_EX_GET                 | 12                                         |
+	 * | MRQ_QUERY_FW_TAG     |                                      | 0                                          |
+	 * | MRQ_DEBUG            | CMD_DEBUG_OPEN_RO                    | 4 + length of cmd_debug_fopen_request.name |
+	 * | MRQ_DEBUG            | CMD_DEBUG_OPEN_WO                    | 4 + length of cmd_debug_fopen_request.name |
+	 * | MRQ_DEBUG            | CMD_DEBUG_READ                       | 8                                          |
+	 * | MRQ_DEBUG            | CMD_DEBUG_WRITE                      | 12 + cmd_debug_fwrite_request.datalen      |
+	 * | MRQ_DEBUG            | CMD_DEBUG_CLOSE                      | 8                                          |
+	 * | MRQ_TELEMETRY        |                                      | 8                                          |
+	 * | MRQ_PWR_LIMIT        | CMD_PWR_LIMIT_QUERY_ABI              | 8                                          |
+	 * | MRQ_PWR_LIMIT        | CMD_PWR_LIMIT_SET                    | 20                                         |
+	 * | MRQ_PWR_LIMIT        | CMD_PWR_LIMIT_GET                    | 16                                         |
+	 * | MRQ_PWR_LIMIT        | CMD_PWR_LIMIT_CURR_CAP               | 8                                          |
+	 * | MRQ_GEARS            |                                      | 0                                          |
+	 * | MRQ_BWMGR_INT        | CMD_BWMGR_INT_QUERY_ABI              | 8                                          |
+	 * | MRQ_BWMGR_INT        | CMD_BWMGR_INT_CALC_AND_SET           | 16                                         |
+	 * | MRQ_BWMGR_INT        | CMD_BWMGR_INT_CAP_SET                | 8                                          |
+	 * | MRQ_OC_STATUS        |                                      | 0                                          |
+	 *
+	 * **crc16**
+	 *
+	 * CRC16 using polynomial x^16 + x^14 + x^12 + x^11 + x^8 + x^5 + x^4 + x^2 + 1
+	 * and initialization value 0x4657. The CRC is calculated over all bytes of the message
+	 * including this header. However the crc16 field is considered to be set to 0 when
+	 * calculating the CRC. Only used when #BPMP_MAIL_CRC_PRESENT is set. If
+	 * #BPMP_MAIL_CRC_PRESENT is set and this field does not match the CRC as
+	 * calculated by BPMP, -BPMP_EBADMSG will be returned and the request will
+	 * be ignored. See code snippet below on how to calculate the CRC.
+	 *
+	 * @code
+	 *	uint16_t calc_crc_digest(uint16_t crc, uint8_t *data, size_t size)
+	 *	{
+	 *		for (size_t i = 0; i < size; i++) {
+	 *			crc ^= data[i] << 8;
+	 *			for (size_t j = 0; j < 8; j++) {
+	 *				if ((crc & 0x8000) == 0x8000) {
+	 *					crc = (crc << 1) ^ 0xAC9A;
+	 *				} else {
+	 *					crc = (crc << 1);
+	 *				}
+	 *			}
+	 *		}
+	 *		return crc;
+	 *	}
+	 *
+	 *	uint16_t calc_crc(uint8_t *data, size_t size)
+	 *	{
+	 *		return calc_crc_digest(0x4657, data, size);
+	 *	}
+	 * @endcode
 	 */
 	uint32_t flags;
 } BPMP_ABI_PACKED;
@@ -107,7 +260,35 @@ struct mrq_request {
 struct mrq_response {
 	/** @brief Error code for the MRQ request itself */
 	int32_t err;
-	/** @brief Reserved for future use */
+
+	/**
+	 * @brief 32bit word containing a number of fields as follows:
+	 *
+	 * 	struct {
+	 * 		uint8_t options:4;
+	 * 		uint8_t xid:4;
+	 * 		uint8_t payload_length;
+	 * 		uint16_t crc16;
+	 * 	};
+	 *
+	 * **options** indicates CRC presence.
+	 *
+	 * #BPMP_MAIL_CRC_PRESENT is supported on T234 and later platforms and
+	 * indicates the crc16 related fields are present when set.
+	 *
+	 * **xid** is the transaction ID as sent by the requestor.
+	 *
+	 * **length** of the message expressed in bytes without the size of this header.
+	 * Note: For DMCE communication, this field expresses the length as a multiple of 4 bytes
+	 * rather than bytes.
+	 *
+	 * **crc16**
+	 *
+	 * CRC16 using polynomial x^16 + x^14 + x^12 + x^11 + x^8 + x^5 + x^4 + x^2 + 1
+	 * and initialization value 0x4657. The CRC is calculated over all bytes of the message
+	 * including this header. However the crc16 field is considered to be set to 0 when
+	 * calculating the CRC. Only used when #BPMP_MAIL_CRC_PRESENT is set.
+	 */
 	uint32_t flags;
 } BPMP_ABI_PACKED;
 
@@ -131,24 +312,16 @@ struct mrq_response {
 
 #define MRQ_PING		0U
 #define MRQ_QUERY_TAG		1U
-#define MRQ_MODULE_LOAD		4U
-#define MRQ_MODULE_UNLOAD	5U
-#define MRQ_TRACE_MODIFY	7U
-#define MRQ_WRITE_TRACE		8U
 #define MRQ_THREADED_PING	9U
-#define MRQ_MODULE_MAIL		11U
 #define MRQ_DEBUGFS		19U
 #define MRQ_RESET		20U
 #define MRQ_I2C			21U
 #define MRQ_CLK			22U
 #define MRQ_QUERY_ABI		23U
-#define MRQ_PG_READ_STATE	25U
-#define MRQ_PG_UPDATE_STATE	26U
 #define MRQ_THERMAL		27U
 #define MRQ_CPU_VHINT		28U
 #define MRQ_ABI_RATCHET		29U
 #define MRQ_EMC_DVFS_LATENCY	31U
-#define MRQ_TRACE_ITER		64U
 #define MRQ_RINGBUF_CONSOLE	65U
 #define MRQ_PG			66U
 #define MRQ_CPU_NDIV_LIMITS	67U
@@ -159,6 +332,40 @@ struct mrq_response {
 #define MRQ_FMON		72U
 #define MRQ_EC			73U
 #define MRQ_DEBUG		75U
+#define MRQ_EMC_DVFS_EMCHUB	76U
+#define MRQ_BWMGR		77U
+#define MRQ_ISO_CLIENT		78U
+#define MRQ_EMC_DISP_RFL	79U
+#define MRQ_TELEMETRY		80U
+#define MRQ_PWR_LIMIT		81U
+#define MRQ_GEARS		82U
+#define MRQ_BWMGR_INT		83U
+#define MRQ_OC_STATUS		84U
+
+/** @cond DEPRECATED */
+#define MRQ_RESERVED_2		2U
+#define MRQ_RESERVED_3		3U
+#define MRQ_RESERVED_4		4U
+#define MRQ_RESERVED_5   	5U
+#define MRQ_RESERVED_6		6U
+#define MRQ_RESERVED_7		7U
+#define MRQ_RESERVED_8		8U
+#define MRQ_RESERVED_10		10U
+#define MRQ_RESERVED_11		11U
+#define MRQ_RESERVED_12		12U
+#define MRQ_RESERVED_13		13U
+#define MRQ_RESERVED_14		14U
+#define MRQ_RESERVED_15		15U
+#define MRQ_RESERVED_16		16U
+#define MRQ_RESERVED_17		17U
+#define MRQ_RESERVED_18		18U
+#define MRQ_RESERVED_24		24U
+#define MRQ_RESERVED_25		25U
+#define MRQ_RESERVED_26		26U
+#define MRQ_RESERVED_30		30U
+#define MRQ_RESERVED_64		64U
+#define MRQ_RESERVED_74		74U
+/** @endcond DEPRECATED */
 
 /** @} */
 
@@ -167,7 +374,7 @@ struct mrq_response {
  * @brief Maximum MRQ code to be sent by CPU software to
  * BPMP. Subject to change in future
  */
-#define MAX_CPU_MRQ_ID		75U
+#define MAX_CPU_MRQ_ID		84U
 
 /**
  * @addtogroup MRQ_Payloads
@@ -183,8 +390,11 @@ struct mrq_response {
  *   @defgroup ABI_info ABI Info
  *   @defgroup Powergating Power Gating
  *   @defgroup Thermal Thermal
+ *   @defgroup OC_status OC status
  *   @defgroup Vhint CPU Voltage hint
  *   @defgroup EMC EMC
+ *   @defgroup BWMGR BWMGR
+ *   @defgroup ISO_CLIENT ISO_CLIENT
  *   @defgroup CPU NDIV Limits
  *   @defgroup RingbufConsole Ring Buffer Console
  *   @defgroup Strap Straps
@@ -192,8 +402,11 @@ struct mrq_response {
  *   @defgroup CC3 Auto-CC3
  *   @defgroup FMON FMON
  *   @defgroup EC EC
- *   @defgroup Fbvolt_status Fuse Burn Voltage Status
- * @}
+ *   @defgroup Telemetry Telemetry
+ *   @defgroup Pwrlimit PWR_LIMIT
+ *   @defgroup Gears Gears
+ *   @defgroup BWMGR_INT Bandwidth Manager Integrated
+ * @} MRQ_Payloads
  */
 
 /**
@@ -304,190 +517,6 @@ struct mrq_query_fw_tag_response {
 	uint8_t tag[32];
 } BPMP_ABI_PACKED;
 
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_MODULE_LOAD
- * @brief Dynamically load a BPMP code module
- *
- * * Platforms: T210, T210B01, T186
- * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
- * * Initiators: CCPLEX
- * * Targets: BPMP
- * * Request Payload: @ref mrq_module_load_request
- * * Response Payload: @ref mrq_module_load_response
- *
- * @note This MRQ is disabled on production systems
- *
- */
-
-/**
- * @ingroup Module
- * @brief Request with #MRQ_MODULE_LOAD
- *
- * Used by #MRQ_MODULE_LOAD calls to ask the recipient to dynamically
- * load the code located at #phys_addr and having size #size
- * bytes. #phys_addr is treated as a void pointer.
- *
- * The recipient copies the code from #phys_addr to locally allocated
- * memory prior to responding to this message.
- *
- * @todo document the module header format
- *
- * The sender is responsible for ensuring that the code is mapped in
- * the recipient's address map.
- *
- */
-struct mrq_module_load_request {
-	/** @brief Base address of the code to load */
-	uint32_t phys_addr;
-	/** @brief Size in bytes of code to load */
-	uint32_t size;
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup Module
- * @brief Response to #MRQ_MODULE_LOAD
- *
- * @todo document mrq_response::err
- */
-struct mrq_module_load_response {
-	/** @brief Handle to the loaded module */
-	uint32_t base;
-} BPMP_ABI_PACKED;
-/** @endcond*/
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_MODULE_UNLOAD
- * @brief Unload a previously loaded code module
- *
- * * Platforms: T210, T210B01, T186
- * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
- * * Initiators: CCPLEX
- * * Targets: BPMP
- * * Request Payload: @ref mrq_module_unload_request
- * * Response Payload: N/A
- *
- * @note This MRQ is disabled on production systems
- */
-
-/**
- * @ingroup Module
- * @brief Request with #MRQ_MODULE_UNLOAD
- *
- * Used by #MRQ_MODULE_UNLOAD calls to request that a previously loaded
- * module be unloaded.
- */
-struct mrq_module_unload_request {
-	/** @brief Handle of the module to unload */
-	uint32_t base;
-} BPMP_ABI_PACKED;
-/** @endcond*/
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_TRACE_MODIFY
- * @brief Modify the set of enabled trace events
- *
- * @deprecated
- *
- * * Platforms: All
- * * Initiators: CCPLEX
- * * Targets: BPMP
- * * Request Payload: @ref mrq_trace_modify_request
- * * Response Payload: @ref mrq_trace_modify_response
- *
- * @note This MRQ is disabled on production systems
- */
-
-/**
- * @ingroup Trace
- * @brief Request with #MRQ_TRACE_MODIFY
- *
- * Used by %MRQ_TRACE_MODIFY calls to enable or disable specify trace
- * events.  #set takes precedence for any bit set in both #set and
- * #clr.
- */
-struct mrq_trace_modify_request {
-	/** @brief Bit mask of trace events to disable */
-	uint32_t clr;
-	/** @brief Bit mask of trace events to enable */
-	uint32_t set;
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup Trace
- * @brief Response to #MRQ_TRACE_MODIFY
- *
- * Sent in repsonse to an #MRQ_TRACE_MODIFY message. #mask reflects the
- * state of which events are enabled after the recipient acted on the
- * message.
- *
- */
-struct mrq_trace_modify_response {
-	/** @brief Bit mask of trace event enable states */
-	uint32_t mask;
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_WRITE_TRACE
- * @brief Write trace data to a buffer
- *
- * @deprecated
- *
- * * Platforms: All
- * * Initiators: CCPLEX
- * * Targets: BPMP
- * * Request Payload: @ref mrq_write_trace_request
- * * Response Payload: @ref mrq_write_trace_response
- *
- * mrq_response::err depends on the @ref mrq_write_trace_request field
- * values. err is -#BPMP_EINVAL if size is zero or area is NULL or
- * area is in an illegal range. A positive value for err indicates the
- * number of bytes written to area.
- *
- * @note This MRQ is disabled on production systems
- */
-
-/**
- * @ingroup Trace
- * @brief Request with #MRQ_WRITE_TRACE
- *
- * Used by MRQ_WRITE_TRACE calls to ask the recipient to copy trace
- * data from the recipient's local buffer to the output buffer. #area
- * is treated as a byte-aligned pointer in the recipient's address
- * space.
- *
- * The sender is responsible for ensuring that the output
- * buffer is mapped in the recipient's address map. The recipient is
- * responsible for protecting its own code and data from accidental
- * overwrites.
- */
-struct mrq_write_trace_request {
-	/** @brief Base address of output buffer */
-	uint32_t area;
-	/** @brief Size in bytes of the output buffer */
-	uint32_t size;
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup Trace
- * @brief Response to #MRQ_WRITE_TRACE
- *
- * Once this response is sent, the respondent will not access the
- * output buffer further.
- */
-struct mrq_write_trace_response {
-	/**
-	 * @brief Flag whether more data remains in local buffer
-	 *
-	 * Value is 1 if the entire local trace buffer has been
-	 * drained to the outputbuffer. Value is 0 otherwise.
-	 */
-	uint32_t eof;
-} BPMP_ABI_PACKED;
-
 /** @private */
 struct mrq_threaded_ping_request {
 	uint32_t challenge;
@@ -498,50 +527,6 @@ struct mrq_threaded_ping_response {
 	uint32_t reply;
 } BPMP_ABI_PACKED;
 
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_MODULE_MAIL
- * @brief Send a message to a loadable module
- *
- * * Platforms: T210, T210B01, T186
- * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
- * * Initiators: Any
- * * Targets: BPMP
- * * Request Payload: @ref mrq_module_mail_request
- * * Response Payload: @ref mrq_module_mail_response
- *
- * @note This MRQ is disabled on production systems
- */
-
-/**
- * @ingroup Module
- * @brief Request with #MRQ_MODULE_MAIL
- */
-struct mrq_module_mail_request {
-	/** @brief Handle to the previously loaded module */
-	uint32_t base;
-	/** @brief Module-specific mail payload
-	 *
-	 * The length of data[ ] is unknown to the BPMP core firmware
-	 * but it is limited to the size of an IPC message.
-	 */
-	uint8_t data[BPMP_ABI_EMPTY_ARRAY];
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup Module
- * @brief Response to #MRQ_MODULE_MAIL
- */
-struct mrq_module_mail_response {
-	/** @brief Module-specific mail payload
-	 *
-	 * The length of data[ ] is unknown to the BPMP core firmware
-	 * but it is limited to the size of an IPC message.
-	 */
-	uint8_t data[BPMP_ABI_EMPTY_ARRAY];
-} BPMP_ABI_PACKED;
-/** @endcond */
-
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_DEBUGFS
@@ -686,7 +671,7 @@ struct mrq_debugfs_response {
 #define DEBUGFS_S_ISDIR	(1 << 9)
 #define DEBUGFS_S_IRUSR	(1 << 8)
 #define DEBUGFS_S_IWUSR	(1 << 7)
-/** @} */
+/** @} Debugfs */
 
 /**
  * @ingroup MRQ_Codes
@@ -931,7 +916,7 @@ enum mrq_reset_commands {
  * @brief Request with MRQ_RESET
  *
  * Used by the sender of an #MRQ_RESET message to request BPMP to
- * assert or deassert a given reset line.
+ * assert or or deassert a given reset line.
  */
 struct mrq_reset_request {
 	/** @brief Reset action to perform (@ref mrq_reset_commands) */
@@ -970,7 +955,7 @@ struct mrq_reset_response {
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
+/** @} Reset */
 
 /**
  * @ingroup MRQ_Codes
@@ -1032,7 +1017,17 @@ struct serial_i2c_request {
  * @brief Trigger one or more i2c transactions
  */
 struct cmd_i2c_xfer_request {
-	/** @brief Valid bus number from @ref bpmp_i2c_ids*/
+	/**
+	 * @brief Tegra PWR_I2C bus identifier
+	 *
+	 * @cond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * Must be set to 5.
+	 * @endcond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * @cond bpmp_th500
+	 * Must be set to 1.
+	 * @endcond bpmp_th500
+	 *
+	 */
 	uint32_t bus_id;
 
 	/** @brief Count of valid bytes in #data_buf*/
@@ -1084,7 +1079,7 @@ struct mrq_i2c_response {
 	struct cmd_i2c_xfer_response xfer;
 } BPMP_ABI_PACKED;
 
-/** @} */
+/** @} I2C */
 
 /**
  * @ingroup MRQ_Codes
@@ -1109,6 +1104,13 @@ enum {
 	CMD_CLK_IS_ENABLED = 6,
 	CMD_CLK_ENABLE = 7,
 	CMD_CLK_DISABLE = 8,
+/** @cond DEPRECATED */
+	CMD_CLK_PROPERTIES = 9,
+	CMD_CLK_POSSIBLE_PARENTS = 10,
+	CMD_CLK_NUM_POSSIBLE_PARENTS = 11,
+	CMD_CLK_GET_POSSIBLE_PARENT = 12,
+	CMD_CLK_RESET_REFCOUNTS = 13,
+/** @endcond DEPRECATED */
 	CMD_CLK_GET_ALL_INFO = 14,
 	CMD_CLK_GET_MAX_CLK_ID = 15,
 	CMD_CLK_GET_FMAX_AT_VMIN = 16,
@@ -1119,6 +1121,21 @@ enum {
 #define BPMP_CLK_HAS_SET_RATE	(1U << 1U)
 #define BPMP_CLK_IS_ROOT	(1U << 2U)
 #define BPMP_CLK_IS_VAR_ROOT	(1U << 3U)
+/**
+ * @brief Protection against rate and parent changes
+ *
+ * #MRQ_CLK command #CMD_CLK_SET_RATE or #MRQ_CLK command #CMD_CLK_SET_PARENT will return
+ * -#BPMP_EACCES.
+ */
+#define BPMP_CLK_RATE_PARENT_CHANGE_DENIED (1U << 30)
+
+/**
+ * @brief Protection against state changes
+ *
+ * #MRQ_CLK command #CMD_CLK_ENABLE or #MRQ_CLK command #CMD_CLK_DISABLE will return
+ * -#BPMP_EACCES.
+ */
+#define BPMP_CLK_STATE_CHANGE_DENIED (1U << 31)
 
 #define MRQ_CLK_NAME_MAXLEN	40U
 #define MRQ_CLK_MAX_PARENTS	16U
@@ -1210,6 +1227,46 @@ struct cmd_clk_disable_response {
 	BPMP_ABI_EMPTY
 } BPMP_ABI_PACKED;
 
+/** @cond DEPRECATED */
+/** @private */
+struct cmd_clk_properties_request {
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
+
+/** @todo flags need to be spelled out here */
+struct cmd_clk_properties_response {
+	uint32_t flags;
+} BPMP_ABI_PACKED;
+
+/** @private */
+struct cmd_clk_possible_parents_request {
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
+
+struct cmd_clk_possible_parents_response {
+	uint8_t num_parents;
+	uint8_t reserved[3];
+	uint32_t parent_id[MRQ_CLK_MAX_PARENTS];
+} BPMP_ABI_PACKED;
+
+/** @private */
+struct cmd_clk_num_possible_parents_request {
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
+
+struct cmd_clk_num_possible_parents_response {
+	uint8_t num_parents;
+} BPMP_ABI_PACKED;
+
+struct cmd_clk_get_possible_parent_request {
+	uint8_t parent_idx;
+} BPMP_ABI_PACKED;
+
+struct cmd_clk_get_possible_parent_response {
+	uint32_t parent_id;
+} BPMP_ABI_PACKED;
+/** @endcond DEPRECATED */
+
 /** @private */
 struct cmd_clk_get_all_info_request {
 	BPMP_ABI_EMPTY
@@ -1241,6 +1298,7 @@ struct cmd_clk_get_fmax_at_vmin_response {
 	int64_t rate;
 } BPMP_ABI_PACKED;
 
+
 /**
  * @ingroup Clocks
  * @brief Request with #MRQ_CLK
@@ -1267,6 +1325,17 @@ struct cmd_clk_get_fmax_at_vmin_response {
  *
  */
 
+/** @cond DEPRECATED
+ *
+ * Older versions of firmware also supported following sub-commands:
+ * |CMD_CLK_PROPERTIES          |-                      |
+ * |CMD_CLK_POSSIBLE_PARENTS    |-                      |
+ * |CMD_CLK_NUM_POSSIBLE_PARENTS|-                      |
+ * |CMD_CLK_GET_POSSIBLE_PARENT |clk_get_possible_parent|
+ * |CMD_CLK_RESET_REFCOUNTS     |-                      |
+ *
+ * @endcond DEPRECATED */
+
 struct mrq_clk_request {
 	/** @brief Sub-command and clock id concatenated to 32-bit word.
 	 * - bits[31..24] is the sub-cmd.
@@ -1288,6 +1357,15 @@ struct mrq_clk_request {
 		struct cmd_clk_disable_request clk_disable;
 		/** @private */
 		struct cmd_clk_is_enabled_request clk_is_enabled;
+		/** @cond DEPRECATED */
+		/** @private */
+		struct cmd_clk_properties_request clk_properties;
+		/** @private */
+		struct cmd_clk_possible_parents_request clk_possible_parents;
+		/** @private */
+		struct cmd_clk_num_possible_parents_request clk_num_possible_parents;
+		struct cmd_clk_get_possible_parent_request clk_get_possible_parent;
+		/** @endcond DEPRECATED */
 		/** @private */
 		struct cmd_clk_get_all_info_request clk_get_all_info;
 		/** @private */
@@ -1321,6 +1399,17 @@ struct mrq_clk_request {
  *
  */
 
+/** @cond DEPRECATED
+ *
+ * Older versions of firmware also supported following sub-commands:
+ * |CMD_CLK_PROPERTIES          |clk_properties          |
+ * |CMD_CLK_POSSIBLE_PARENTS    |clk_possible_parents    |
+ * |CMD_CLK_NUM_POSSIBLE_PARENTS|clk_num_possible_parents|
+ * |CMD_CLK_GET_POSSIBLE_PARENT |clk_get_possible_parents|
+ * |CMD_CLK_RESET_REFCOUNTS     |-                       |
+ *
+ * @endcond DEPRECATED */
+
 struct mrq_clk_response {
 	union {
 		struct cmd_clk_get_rate_response clk_get_rate;
@@ -1333,13 +1422,19 @@ struct mrq_clk_response {
 		/** @private */
 		struct cmd_clk_disable_response clk_disable;
 		struct cmd_clk_is_enabled_response clk_is_enabled;
+		/** @cond DEPRECATED */
+		struct cmd_clk_properties_response clk_properties;
+		struct cmd_clk_possible_parents_response clk_possible_parents;
+		struct cmd_clk_num_possible_parents_response clk_num_possible_parents;
+		struct cmd_clk_get_possible_parent_response clk_get_possible_parent;
+		/** @endcond DEPRECATED */
 		struct cmd_clk_get_all_info_response clk_get_all_info;
 		struct cmd_clk_get_max_clk_id_response clk_get_max_clk_id;
 		struct cmd_clk_get_fmax_at_vmin_response clk_get_fmax_at_vmin;
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
+/** @} Clocks */
 
 /**
  * @ingroup MRQ_Codes
@@ -1378,107 +1473,20 @@ struct mrq_query_abi_response {
 } BPMP_ABI_PACKED;
 
 /**
- * @ingroup MRQ_Codes
- * @def MRQ_PG_READ_STATE
- * @brief Read the power-gating state of a partition
- *
- * * Platforms: T186
- * @cond bpmp_t186
- * * Initiators: Any
- * * Targets: BPMP
- * * Request Payload: @ref mrq_pg_read_state_request
- * * Response Payload: @ref mrq_pg_read_state_response
- */
-
-/**
- * @ingroup Powergating
- * @brief Request with #MRQ_PG_READ_STATE
- *
- * Used by MRQ_PG_READ_STATE call to read the current state of a
- * partition.
- */
-struct mrq_pg_read_state_request {
-	/** @brief ID of partition */
-	uint32_t partition_id;
-} BPMP_ABI_PACKED;
-
-/**
- * @ingroup Powergating
- * @brief Response to MRQ_PG_READ_STATE
- * @todo define possible errors.
- */
-struct mrq_pg_read_state_response {
-	/** @brief Read as don't care */
-	uint32_t sram_state;
-	/** @brief State of power partition
-	 * * 0 : off
-	 * * 1 : on
-	 */
-	uint32_t logic_state;
-} BPMP_ABI_PACKED;
-/** @endcond*/
-/** @} */
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_PG_UPDATE_STATE
- * @brief Modify the power-gating state of a partition. In contrast to
- * MRQ_PG calls, the operations that change state (on/off) of power
- * partition are reference counted.
- *
- * * Platforms: T186
- * @cond bpmp_t186
- * * Initiators: Any
- * * Targets: BPMP
- * * Request Payload: @ref mrq_pg_update_state_request
- * * Response Payload: N/A
- */
-
-/**
- * @ingroup Powergating
- * @brief Request with mrq_pg_update_state_request
  *
- * Used by #MRQ_PG_UPDATE_STATE call to request BPMP to change the
- * state of a power partition #partition_id.
- */
-struct mrq_pg_update_state_request {
-	/** @brief ID of partition */
-	uint32_t partition_id;
-	/** @brief Secondary control of power partition
-	 *  @details Ignored by many versions of the BPMP
-	 *  firmware. For maximum compatibility, set the value
-	 *  according to @ref logic_state
-	 * *  0x1: power ON partition (@ref logic_state == 0x3)
-	 * *  0x3: power OFF partition (@ref logic_state == 0x1)
-	 */
-	uint32_t sram_state;
-	/** @brief Controls state of power partition, legal values are
-	 * *  0x1 : power OFF partition
-	 * *  0x3 : power ON partition
-	 */
-	uint32_t logic_state;
-	/** @brief Change state of clocks of the power partition, legal values
-	 * *  0x0 : do not change clock state
-	 * *  0x1 : disable partition clocks (only applicable when
-	 *          @ref logic_state == 0x1)
-	 * *  0x3 : enable partition clocks (only applicable when
-	 *          @ref logic_state == 0x3)
-	 */
-	uint32_t clock_state;
-} BPMP_ABI_PACKED;
-/** @endcond*/
-
-/**
  * @ingroup MRQ_Codes
  * @def MRQ_PG
  * @brief Control power-gating state of a partition. In contrast to
  * MRQ_PG_UPDATE_STATE, operations that change the power partition
  * state are NOT reference counted
  *
- * @note BPMP-FW forcefully turns off some partitions as part of SC7 entry
- * because their state cannot be adequately restored on exit. Therefore,
- * it is recommended to power off all domains via MRQ_PG prior to SC7 entry.
+ * @cond (bpmp_t194 || bpmp_t186)
+ * @note On T194 and earlier BPMP-FW forcefully turns off some partitions as
+ * part of SC7 entry because their state cannot be adequately restored on exit.
+ * Therefore, it is recommended to power off all domains via MRQ_PG prior to SC7
+ * entry.
  * See @ref bpmp_pdomain_ids for further detail.
+ * @endcond (bpmp_t194 || bpmp_t186)
  *
  * * Platforms: T186, T194
  * * Initiators: Any
@@ -1643,7 +1651,7 @@ struct mrq_pg_response {
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
+/** @} Powergating */
 
 /**
  * @ingroup MRQ_Codes
@@ -1889,7 +1897,44 @@ union mrq_thermal_bpmp_to_host_response {
 	struct cmd_thermal_get_thermtrip_response get_thermtrip;
 	struct cmd_thermal_get_num_zones_response get_num_zones;
 } BPMP_ABI_PACKED;
-/** @} */
+
+/** @} Thermal */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_OC_STATUS
+ * @brief Query over current status
+ *
+ * * Platforms: T234
+ * @cond bpmp_t234
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: N/A
+ * * Response Payload: @ref mrq_oc_status_response
+ *
+ * @addtogroup OC_status
+ * @{
+ */
+
+#define OC_STATUS_MAX_SIZE	24U
+
+/*
+ * @brief Response to #MRQ_OC_STATUS
+ *
+ * throt_en: Value for each OC alarm where zero signifies throttle is
+ *           disabled, and non-zero throttle is enabled.
+ * event_cnt: Total number of OC events for each OC alarm.
+ *
+ * mrq_response::err is 0 if the operation was successful and
+ * -#BPMP_ENODEV otherwise.
+ */
+struct mrq_oc_status_response {
+	uint8_t throt_en[OC_STATUS_MAX_SIZE];
+	uint32_t event_cnt[OC_STATUS_MAX_SIZE];
+} BPMP_ABI_PACKED;
+
+/** @} OC_status */
+/** @endcond bpmp_t234 */
 
 /**
  * @ingroup MRQ_Codes
@@ -1948,8 +1993,9 @@ struct cpu_vhint_data {
 	/** reserved for future use */
 	uint16_t reserved[328];
 } BPMP_ABI_PACKED;
-/** @endcond */
-/** @} */
+
+/** @} Vhint */
+/** @endcond bpmp_t186 */
 
 /**
  * @ingroup MRQ_Codes
@@ -2016,14 +2062,15 @@ struct mrq_abi_ratchet_response {
 	/** @brief BPMP's ratchet value */
 	uint16_t ratchet;
 };
-/** @} */
+
+/** @} ABI_info */
 
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_EMC_DVFS_LATENCY
  * @brief Query frequency dependent EMC DVFS latency
  *
- * * Platforms: T186, T194
+ * * Platforms: T186, T194, T234
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: N/A
@@ -2053,15 +2100,551 @@ struct mrq_emc_dvfs_latency_response {
 	struct emc_dvfs_latency pairs[EMC_DVFS_LATENCY_MAX_SIZE];
 } BPMP_ABI_PACKED;
 
-/** @} */
+/** @} EMC */
 
 /**
  * @ingroup MRQ_Codes
- * @def MRQ_CPU_NDIV_LIMITS
- * @brief CPU freq. limits in ndiv
+ * @def MRQ_EMC_DVFS_EMCHUB
+ * @brief Query EMC HUB frequencies
  *
- * * Platforms: T194 onwards
- * @cond bpmp_t194
+ * * Platforms: T234 onwards
+ * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: N/A
+ * * Response Payload: @ref mrq_emc_dvfs_emchub_response
+ * @addtogroup EMC
+ * @{
+ */
+
+/**
+ * @brief Used by @ref mrq_emc_dvfs_emchub_response
+ */
+struct emc_dvfs_emchub {
+	/** @brief EMC DVFS node frequency in kHz */
+	uint32_t freq;
+	/** @brief EMC HUB frequency in kHz */
+	uint32_t hub_freq;
+} BPMP_ABI_PACKED;
+
+#define EMC_DVFS_EMCHUB_MAX_SIZE	EMC_DVFS_LATENCY_MAX_SIZE
+/**
+ * @brief Response to #MRQ_EMC_DVFS_EMCHUB
+ */
+struct mrq_emc_dvfs_emchub_response {
+	/** @brief The number valid entries in #pairs */
+	uint32_t num_pairs;
+	/** @brief EMC DVFS node <frequency, hub frequency> information */
+	struct emc_dvfs_emchub pairs[EMC_DVFS_EMCHUB_MAX_SIZE];
+} BPMP_ABI_PACKED;
+
+/** @} EMC */
+/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_EMC_DISP_RFL
+ * @brief Set EMC display RFL handshake mode of operations
+ *
+ * * Platforms: T234 onwards
+ * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_emc_disp_rfl_request
+ * * Response Payload: N/A
+ *
+ * @addtogroup EMC
+ * @{
+ */
+
+enum mrq_emc_disp_rfl_mode {
+	/** @brief EMC display RFL handshake disabled  */
+	EMC_DISP_RFL_MODE_DISABLED = 0,
+	/** @brief EMC display RFL handshake enabled  */
+	EMC_DISP_RFL_MODE_ENABLED = 1,
+};
+
+/**
+ * @ingroup EMC
+ * @brief Request with #MRQ_EMC_DISP_RFL
+ *
+ * Used by the sender of an #MRQ_EMC_DISP_RFL message to
+ * request the mode of EMC display RFL handshake.
+ *
+ * mrq_response::err is
+ * * 0: RFL mode is set successfully
+ * * -#BPMP_EINVAL: invalid mode requested
+ * * -#BPMP_ENOSYS: RFL handshake is not supported
+ * * -#BPMP_EACCES: Permission denied
+ * * -#BPMP_ENODEV: if disp rfl mrq is not supported by BPMP-FW
+ */
+struct mrq_emc_disp_rfl_request {
+	/** @brief EMC display RFL mode (@ref mrq_emc_disp_rfl_mode) */
+	uint32_t mode;
+} BPMP_ABI_PACKED;
+
+/** @} EMC */
+/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_BWMGR
+ * @brief bwmgr requests
+ *
+ * * Platforms: T234 onwards
+ * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_bwmgr_request
+ * * Response Payload: @ref mrq_bwmgr_response
+ *
+ * @addtogroup BWMGR
+ *
+ * @{
+ */
+
+enum mrq_bwmgr_cmd {
+	/**
+	 * @brief Check whether the BPMP driver supports the specified
+	 * request type
+	 *
+	 * mrq_response::err is 0 if the specified request is
+	 * supported and -#BPMP_ENODEV otherwise.
+	 */
+	CMD_BWMGR_QUERY_ABI = 0,
+
+	/**
+	 * @brief Determine dram rate to satisfy iso/niso bw requests
+	 *
+	 * mrq_response::err is
+	 * *  0: calc_rate succeeded.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 * *  -#BPMP_ENOTSUP: Requested bw is not available.
+	 */
+	CMD_BWMGR_CALC_RATE = 1
+};
+
+/*
+ * request data for request type CMD_BWMGR_QUERY_ABI
+ *
+ * type: Request type for which to check existence.
+ */
+struct cmd_bwmgr_query_abi_request {
+	uint32_t type;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Used by @ref cmd_bwmgr_calc_rate_request
+ */
+struct iso_req {
+	/* @brief bwmgr client ID @ref bpmp_bwmgr_ids */
+	uint32_t id;
+	/* @brief bw in kBps requested by client */
+	uint32_t iso_bw;
+} BPMP_ABI_PACKED;
+
+#define MAX_ISO_CLIENTS		13U
+/*
+ * request data for request type CMD_BWMGR_CALC_RATE
+ */
+struct cmd_bwmgr_calc_rate_request {
+	/* @brief total bw in kBps requested by all niso clients */
+	uint32_t sum_niso_bw;
+	/* @brief The number of iso clients */
+	uint32_t num_iso_clients;
+	/* @brief iso_req <id, iso_bw> information */
+	struct iso_req isobw_reqs[MAX_ISO_CLIENTS];
+} BPMP_ABI_PACKED;
+
+/*
+ * response data for request type CMD_BWMGR_CALC_RATE
+ *
+ * iso_rate_min: min dram data clk rate in kHz to satisfy all iso bw reqs
+ * total_rate_min: min dram data clk rate in kHz to satisfy all bw reqs
+ */
+struct cmd_bwmgr_calc_rate_response {
+	uint32_t iso_rate_min;
+	uint32_t total_rate_min;
+} BPMP_ABI_PACKED;
+
+/*
+ * @brief Request with #MRQ_BWMGR
+ *
+ *
+ * |sub-command                 |payload                       |
+ * |----------------------------|------------------------------|
+ * |CMD_BWMGR_QUERY_ABI         | cmd_bwmgr_query_abi_request  |
+ * |CMD_BWMGR_CALC_RATE         | cmd_bwmgr_calc_rate_request  |
+ *
+ */
+struct mrq_bwmgr_request {
+	uint32_t cmd;
+	union {
+		struct cmd_bwmgr_query_abi_request query_abi;
+		struct cmd_bwmgr_calc_rate_request bwmgr_rate_req;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/*
+ * @brief Response to MRQ_BWMGR
+ *
+ * |sub-command                 |payload                       |
+ * |----------------------------|------------------------------|
+ * |CMD_BWMGR_CALC_RATE         | cmd_bwmgr_calc_rate_response |
+ */
+struct mrq_bwmgr_response {
+	union {
+		struct cmd_bwmgr_calc_rate_response bwmgr_rate_resp;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/** @} BWMGR */
+/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_BWMGR_INT
+ * @brief bpmp-integrated bwmgr requests
+ *
+ * * Platforms: T234 onwards
+ * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_bwmgr_int_request
+ * * Response Payload: @ref mrq_bwmgr_int_response
+ *
+ * @addtogroup BWMGR_INT
+ * @{
+ */
+
+enum mrq_bwmgr_int_cmd {
+	/**
+	 * @brief Check whether the BPMP-FW supports the specified
+	 * request type
+	 *
+	 * mrq_response::err is 0 if the specified request is
+	 * supported and -#BPMP_ENODEV otherwise.
+	 */
+	CMD_BWMGR_INT_QUERY_ABI = 1,
+
+	/**
+	 * @brief Determine and set dram rate to satisfy iso/niso bw request
+	 *
+	 * mrq_response::err is
+	 * *  0: request succeeded.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 *          set_frequency in @ref cmd_bwmgr_int_calc_and_set_response
+	 *          will not be set.
+	 * *  -#BPMP_ENOTSUP: Requested bw is not available.
+	 *          set_frequency in @ref cmd_bwmgr_int_calc_and_set_response
+	 *          will be current dram-clk rate.
+	 */
+	CMD_BWMGR_INT_CALC_AND_SET = 2,
+
+	/**
+	 * @brief Set a max DRAM frequency for the bandwidth-manager
+	 *
+	 * mrq_response::err is
+	 * *  0: request succeeded.
+	 * *  -#BPMP_ENOTSUP: Requested cap frequency is not possible.
+	 */
+	CMD_BWMGR_INT_CAP_SET = 3
+};
+
+/*
+ * request structure for request type CMD_BWMGR_QUERY_ABI
+ *
+ * type: Request type for which to check existence.
+ */
+struct cmd_bwmgr_int_query_abi_request {
+	/* @brief request type determined by @ref mrq_bwmgr_int_cmd */
+	uint32_t type;
+} BPMP_ABI_PACKED;
+
+/**
+ * @defgroup bwmgr_int_unit_type BWMGR_INT floor unit-types
+ * @addtogroup bwmgr_int_unit_type
+ * @{
+ */
+/** @brief kilobytes per second unit-type */
+#define BWMGR_INT_UNIT_KBPS  0U
+/** @brief kilohertz unit-type */
+#define BWMGR_INT_UNIT_KHZ   1U
+
+/** @} bwmgr_int_unit_type */
+
+/*
+ * request data for request type CMD_BWMGR_INT_CALC_AND_SET
+ */
+struct cmd_bwmgr_int_calc_and_set_request {
+	/* @brief bwmgr client ID @ref bpmp_bwmgr_ids */
+	uint32_t client_id;
+	/* @brief average niso bw usage in kBps requested by client. */
+	uint32_t niso_bw;
+	/*
+	 * @brief average iso bw usage in kBps requested by client.
+	 *  Value is ignored if client is niso. Determined by client_id.
+	 */
+	uint32_t iso_bw;
+	/*
+	 * @brief memory clock floor requested by client.
+	 *  Unit determined by floor_unit.
+	 */
+	uint32_t mc_floor;
+	/*
+	 * @brief toggle to determine the unit-type of floor value.
+	 *  See @ref bwmgr_int_unit_type definitions for unit-type mappings.
+	 */
+	uint8_t floor_unit;
+} BPMP_ABI_PACKED;
+
+struct cmd_bwmgr_int_cap_set_request {
+	/* @brief requested cap frequency in Hz. */
+	uint64_t rate;
+} BPMP_ABI_PACKED;
+
+/*
+ * response data for request type CMD_BWMGR_CALC_AND_SET
+ */
+struct cmd_bwmgr_int_calc_and_set_response {
+	/* @brief current set memory clock frequency in Hz */
+	uint64_t rate;
+} BPMP_ABI_PACKED;
+
+/*
+ * @brief Request with #MRQ_BWMGR_INT
+ *
+ *
+ * |sub-command                 |payload                            |
+ * |----------------------------|-----------------------------------|
+ * |CMD_BWMGR_INT_QUERY_ABI     | cmd_bwmgr_int_query_abi_request   |
+ * |CMD_BWMGR_INT_CALC_AND_SET  | cmd_bwmgr_int_calc_and_set_request|
+ * |CMD_BWMGR_INT_CAP_SET       | cmd_bwmgr_int_cap_set_request     |
+ *
+ */
+struct mrq_bwmgr_int_request {
+	uint32_t cmd;
+	union {
+		struct cmd_bwmgr_int_query_abi_request query_abi;
+		struct cmd_bwmgr_int_calc_and_set_request bwmgr_calc_set_req;
+		struct cmd_bwmgr_int_cap_set_request bwmgr_cap_set_req;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/*
+ * @brief Response to MRQ_BWMGR_INT
+ *
+ * |sub-command                 |payload                                |
+ * |----------------------------|---------------------------------------|
+ * |CMD_BWMGR_INT_CALC_AND_SET  | cmd_bwmgr_int_calc_and_set_response   |
+ */
+struct mrq_bwmgr_int_response {
+	union {
+		struct cmd_bwmgr_int_calc_and_set_response bwmgr_calc_set_resp;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/** @} BWMGR_INT */
+/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_ISO_CLIENT
+ * @brief ISO client requests
+ *
+ * * Platforms: T234 onwards
+ * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_iso_client_request
+ * * Response Payload: @ref mrq_iso_client_response
+ *
+ * @addtogroup ISO_CLIENT
+ * @{
+ */
+
+enum mrq_iso_client_cmd {
+	/**
+	 * @brief Check whether the BPMP driver supports the specified
+	 * request type
+	 *
+	 * mrq_response::err is 0 if the specified request is
+	 * supported and -#BPMP_ENODEV otherwise.
+	 */
+	CMD_ISO_CLIENT_QUERY_ABI = 0,
+
+	/*
+	 * @brief check for legal LA for the iso client. Without programming
+	 * LA MC registers, calculate and ensure that legal LA is possible for
+	 * iso bw requested by the ISO client.
+	 *
+	 * mrq_response::err is
+	 * *  0: check la succeeded.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 * *  -#BPMP_EFAULT: Legal LA is not possible for client requested iso_bw
+	 */
+	CMD_ISO_CLIENT_CALCULATE_LA = 1,
+
+	/*
+	 * @brief set LA for the iso client. Calculate and program the LA/PTSA
+	 * MC registers corresponding to the client making bw request
+	 *
+	 * mrq_response::err is
+	 * *  0: set la succeeded.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 * *  -#BPMP_EFAULT: Failed to calculate or program MC registers.
+	 */
+	CMD_ISO_CLIENT_SET_LA = 2,
+
+	/*
+	 * @brief Get max possible bw for iso client
+	 *
+	 * mrq_response::err is
+	 * *  0: get_max_bw succeeded.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 */
+	CMD_ISO_CLIENT_GET_MAX_BW = 3
+};
+
+/*
+ * request data for request type CMD_ISO_CLIENT_QUERY_ABI
+ *
+ * type: Request type for which to check existence.
+ */
+struct cmd_iso_client_query_abi_request {
+	uint32_t type;
+} BPMP_ABI_PACKED;
+
+/*
+ * request data for request type CMD_ISO_CLIENT_CALCULATE_LA
+ *
+ * id: client ID in @ref bpmp_bwmgr_ids
+ * bw: bw requested in kBps by client ID.
+ * init_bw_floor: initial dram_bw_floor in kBps passed by client ID.
+ * ISO client will perform mempool allocation and DVFS buffering based
+ * on this dram_bw_floor.
+ */
+struct cmd_iso_client_calculate_la_request {
+	uint32_t id;
+	uint32_t bw;
+	uint32_t init_bw_floor;
+} BPMP_ABI_PACKED;
+
+/*
+ * request data for request type CMD_ISO_CLIENT_SET_LA
+ *
+ * id: client ID in @ref bpmp_bwmgr_ids
+ * bw: bw requested in kBps by client ID.
+ * final_bw_floor: final dram_bw_floor in kBps.
+ * Sometimes the initial dram_bw_floor passed by ISO client may need to be
+ * updated by considering higher dram freq's. This is the final dram_bw_floor
+ * used to calculate and program MC registers.
+ */
+struct cmd_iso_client_set_la_request {
+	uint32_t id;
+	uint32_t bw;
+	uint32_t final_bw_floor;
+} BPMP_ABI_PACKED;
+
+/*
+ * request data for request type CMD_ISO_CLIENT_GET_MAX_BW
+ *
+ * id: client ID in @ref bpmp_bwmgr_ids
+ */
+struct cmd_iso_client_get_max_bw_request {
+	uint32_t id;
+} BPMP_ABI_PACKED;
+
+/*
+ * response data for request type CMD_ISO_CLIENT_CALCULATE_LA
+ *
+ * la_rate_floor: minimum dram_rate_floor in kHz at which a legal la is possible
+ * iso_client_only_rate: Minimum dram freq in kHz required to satisfy this clients
+ * iso bw request, assuming all other iso clients are inactive
+ */
+struct cmd_iso_client_calculate_la_response {
+	uint32_t la_rate_floor;
+	uint32_t iso_client_only_rate;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Used by @ref cmd_iso_client_get_max_bw_response
+ */
+struct iso_max_bw {
+	/* @brief dram frequency in kHz */
+	uint32_t freq;
+	/* @brief max possible iso-bw in kBps */
+	uint32_t iso_bw;
+} BPMP_ABI_PACKED;
+
+#define ISO_MAX_BW_MAX_SIZE	14U
+/*
+ * response data for request type CMD_ISO_CLIENT_GET_MAX_BW
+ */
+struct cmd_iso_client_get_max_bw_response {
+	/* @brief The number valid entries in iso_max_bw pairs */
+	uint32_t num_pairs;
+	/* @brief max ISOBW <dram freq, max bw> information */
+	struct iso_max_bw pairs[ISO_MAX_BW_MAX_SIZE];
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request with #MRQ_ISO_CLIENT
+ *
+ * Used by the sender of an #MRQ_ISO_CLIENT message.
+ *
+ * |sub-command                          |payload                                 |
+ * |------------------------------------ |----------------------------------------|
+ * |CMD_ISO_CLIENT_QUERY_ABI		 |cmd_iso_client_query_abi_request        |
+ * |CMD_ISO_CLIENT_CALCULATE_LA		 |cmd_iso_client_calculate_la_request     |
+ * |CMD_ISO_CLIENT_SET_LA		 |cmd_iso_client_set_la_request           |
+ * |CMD_ISO_CLIENT_GET_MAX_BW		 |cmd_iso_client_get_max_bw_request       |
+ *
+ */
+
+struct mrq_iso_client_request {
+	/* Type of request. Values listed in enum mrq_iso_client_cmd */
+	uint32_t cmd;
+	union {
+		struct cmd_iso_client_query_abi_request query_abi;
+		struct cmd_iso_client_calculate_la_request calculate_la_req;
+		struct cmd_iso_client_set_la_request set_la_req;
+		struct cmd_iso_client_get_max_bw_request max_isobw_req;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response to MRQ_ISO_CLIENT
+ *
+ * Each sub-command supported by @ref mrq_iso_client_request may return
+ * sub-command-specific data. Some do and some do not as indicated in
+ * the following table
+ *
+ * |sub-command                  |payload                             |
+ * |---------------------------- |------------------------------------|
+ * |CMD_ISO_CLIENT_CALCULATE_LA  |cmd_iso_client_calculate_la_response|
+ * |CMD_ISO_CLIENT_SET_LA        |N/A                                 |
+ * |CMD_ISO_CLIENT_GET_MAX_BW    |cmd_iso_client_get_max_bw_response  |
+ *
+ */
+
+struct mrq_iso_client_response {
+	union {
+		struct cmd_iso_client_calculate_la_response calculate_la_resp;
+		struct cmd_iso_client_get_max_bw_response max_isobw_resp;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/** @} ISO_CLIENT */
+/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_CPU_NDIV_LIMITS
+ * @brief CPU freq. limits in ndiv
+ *
+ * * Platforms: T194 onwards
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_cpu_ndiv_limits_request
@@ -2094,15 +2677,15 @@ struct mrq_cpu_ndiv_limits_response {
 	uint16_t ndiv_min;
 } BPMP_ABI_PACKED;
 
-/** @} */
-/** @endcond */
+/** @} CPU */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_CPU_AUTO_CC3
  * @brief Query CPU cluster auto-CC3 configuration
  *
- * * Platforms: T194 onwards
+ * * Platforms: T194
  * @cond bpmp_t194
  * * Initiators: CCPLEX
  * * Targets: BPMP
@@ -2140,40 +2723,8 @@ struct mrq_cpu_auto_cc3_response {
 	uint32_t auto_cc3_config;
 } BPMP_ABI_PACKED;
 
-/** @} */
-/** @endcond */
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_TRACE_ITER
- * @brief Manage the trace iterator
- *
- * @deprecated
- *
- * * Platforms: All
- * * Initiators: CCPLEX
- * * Targets: BPMP
- * * Request Payload: N/A
- * * Response Payload: @ref mrq_trace_iter_request
- * @addtogroup Trace
- * @{
- */
-enum {
-	/** @brief (re)start the tracing now. Ignore older events */
-	TRACE_ITER_INIT = 0,
-	/** @brief Clobber all events in the trace buffer */
-	TRACE_ITER_CLEAN = 1
-};
-
-/**
- * @brief Request with #MRQ_TRACE_ITER
- */
-struct mrq_trace_iter_request {
-	/** @brief TRACE_ITER_INIT or TRACE_ITER_CLEAN */
-	uint32_t cmd;
-} BPMP_ABI_PACKED;
-
-/** @} */
+/** @} CC3 */
+/** @endcond bpmp_t194 */
 
 /**
  * @ingroup MRQ_Codes
@@ -2351,7 +2902,8 @@ union mrq_ringbuf_console_bpmp_to_host_response {
 	struct cmd_ringbuf_console_write_resp write;
 	struct cmd_ringbuf_console_get_fifo_resp get_fifo;
 } BPMP_ABI_PACKED;
-/** @} */
+
+/** @} RingbufConsole */
 
 /**
  * @ingroup MRQ_Codes
@@ -2359,7 +2911,7 @@ union mrq_ringbuf_console_bpmp_to_host_response {
  * @brief Set a strap value controlled by BPMP
  *
  * * Platforms: T194 onwards
- * @cond bpmp_t194
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_strap_request
@@ -2390,17 +2942,14 @@ enum mrq_strap_cmd {
 struct mrq_strap_request {
 	/** @brief @ref mrq_strap_cmd */
 	uint32_t cmd;
-	/** @brief Strap ID from @ref Strap_Ids */
+	/** @brief Strap ID from @ref Strap_Identifiers */
 	uint32_t id;
 	/** @brief Desired value for strap (if cmd is #STRAP_SET) */
 	uint32_t value;
 } BPMP_ABI_PACKED;
 
-/**
- * @defgroup Strap_Ids Strap Identifiers
- * @}
- */
-/** @endcond */
+/** @} Strap */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2408,7 +2957,7 @@ struct mrq_strap_request {
  * @brief Perform a UPHY operation
  *
  * * Platforms: T194 onwards
- * @cond bpmp_t194
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_uphy_request
@@ -2423,6 +2972,9 @@ enum {
 	CMD_UPHY_PCIE_EP_CONTROLLER_PLL_INIT = 3,
 	CMD_UPHY_PCIE_CONTROLLER_STATE = 4,
 	CMD_UPHY_PCIE_EP_CONTROLLER_PLL_OFF = 5,
+	CMD_UPHY_DISPLAY_PORT_INIT = 6,
+	CMD_UPHY_DISPLAY_PORT_OFF = 7,
+	CMD_UPHY_XUSB_DYN_LANES_RESTORE = 8,
 	CMD_UPHY_MAX,
 };
 
@@ -2445,28 +2997,41 @@ struct cmd_uphy_margin_status_response {
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_init_request {
-	/** @brief EP controller number, valid: 0, 4, 5 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_pcie_controller_state_request {
-	/** @brief PCIE controller number, valid: 0, 1, 2, 3, 4 */
+	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T239 valid: 0-3 */
 	uint8_t pcie_controller;
 	uint8_t enable;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_off_request {
-	/** @brief EP controller number, valid: 0, 4, 5 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
+struct cmd_uphy_display_port_init_request {
+	/** @brief DisplayPort link rate, T239 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
+	uint16_t link_rate;
+	/** @brief 1: lane 0; 2: lane 1; 3: lane 0 and 1 */
+	uint16_t lanes_bitmap;
+} BPMP_ABI_PACKED;
+
+struct cmd_uphy_xusb_dyn_lanes_restore_request {
+	/** @brief 1: lane 0; 2: lane 1; 3: lane 0 and 1 */
+	uint16_t lanes_bitmap;
+} BPMP_ABI_PACKED;
+
 /**
  * @ingroup UPHY
  * @brief Request with #MRQ_UPHY
  *
- * Used by the sender of an #MRQ_UPHY message to control UPHY Lane RX margining.
- * The uphy_request is split into several sub-commands. Some sub-commands
- * require no additional data. Others have a sub-command specific payload
+ * Used by the sender of an #MRQ_UPHY message to control UPHY.
+ * The uphy_request is split into several sub-commands. CMD_UPHY_PCIE_LANE_MARGIN_STATUS
+ * requires no additional data. Others have a sub-command specific payload. Below table
+ * shows sub-commands with their corresponding payload data.
  *
  * |sub-command                          |payload                                 |
  * |------------------------------------ |----------------------------------------|
@@ -2475,6 +3040,9 @@ struct cmd_uphy_ep_controller_pll_off_request {
  * |CMD_UPHY_PCIE_EP_CONTROLLER_PLL_INIT |cmd_uphy_ep_controller_pll_init_request |
  * |CMD_UPHY_PCIE_CONTROLLER_STATE       |cmd_uphy_pcie_controller_state_request  |
  * |CMD_UPHY_PCIE_EP_CONTROLLER_PLL_OFF  |cmd_uphy_ep_controller_pll_off_request  |
+ * |CMD_UPHY_PCIE_DISPLAY_PORT_INIT      |cmd_uphy_display_port_init_request      |
+ * |CMD_UPHY_PCIE_DISPLAY_PORT_OFF       |                                        |
+ * |CMD_UPHY_XUSB_DYN_LANES_RESTORE      |cmd_uphy_xusb_dyn_lanes_restore_request |
  *
  */
 
@@ -2489,6 +3057,8 @@ struct mrq_uphy_request {
 		struct cmd_uphy_ep_controller_pll_init_request ep_ctrlr_pll_init;
 		struct cmd_uphy_pcie_controller_state_request controller_state;
 		struct cmd_uphy_ep_controller_pll_off_request ep_ctrlr_pll_off;
+		struct cmd_uphy_display_port_init_request display_port_init;
+		struct cmd_uphy_xusb_dyn_lanes_restore_request xusb_dyn_lanes_restore;
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
@@ -2513,8 +3083,8 @@ struct mrq_uphy_response {
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
-/** @endcond */
+/** @} UPHY */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2522,14 +3092,16 @@ struct mrq_uphy_response {
  * @brief Perform a frequency monitor configuration operations
  *
  * * Platforms: T194 onwards
- * @cond bpmp_t194
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_fmon_request
  * * Response Payload: @ref mrq_fmon_response
+ * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
  *
  * @addtogroup FMON
  * @{
+ * @cond (bpmp_t194 || bpmp_t234)
  */
 enum {
 	/**
@@ -2538,6 +3110,20 @@ enum {
 	 * The monitored clock must be running for clamp to succeed. If
 	 * clamped, FMON configuration is preserved when clock rate
 	 * and/or state is changed.
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EACCES: FMON access error @n
+	 * -#BPMP_EBADCMD if subcommand is not supported @n
+	 * -#BPMP_EBADSLT: clamp FMON on cluster with auto-CC3 enabled @n
+	 * -#BPMP_EBUSY: fmon is already clamped at different rate @n
+	 * -#BPMP_EFAULT: self-diagnostic error @n
+	 * -#BPMP_EINVAL: invalid FMON configuration @n
+	 * -#BPMP_EOPNOTSUPP: not in production mode @n
+	 * -#BPMP_ENODEV: invalid clk_id @n
+	 * -#BPMP_ENOENT: no calibration data, uninitialized @n
+	 * -#BPMP_ENOTSUP: avfs config not set @n
+	 * -#BPMP_ENOSYS: clamp FMON on cluster clock w/ no NAFLL @n
+	 * -#BPMP_ETIMEDOUT: operation timed out @n
 	 */
 	CMD_FMON_GEAR_CLAMP = 1,
 	/**
@@ -2545,6 +3131,13 @@ enum {
 	 *
 	 * Allow FMON configuration to follow monitored clock rate
 	 * and/or state changes.
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EBADCMD if subcommand is not supported @n
+	 * -#BPMP_ENODEV: invalid clk_id @n
+	 * -#BPMP_ENOENT: no calibration data, uninitialized @n
+	 * -#BPMP_ENOTSUP: avfs config not set @n
+	 * -#BPMP_EOPNOTSUPP: not in production mode @n
 	 */
 	CMD_FMON_GEAR_FREE = 2,
 	/**
@@ -2553,11 +3146,54 @@ enum {
 	 *
 	 * Inherently racy, since clamp state can be changed
 	 * concurrently. Useful for testing.
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EBADCMD if subcommand is not supported @n
+	 * -#BPMP_ENODEV: invalid clk_id @n
+	 * -#BPMP_ENOENT: no calibration data, uninitialized @n
+	 * -#BPMP_ENOTSUP: avfs config not set @n
+	 * -#BPMP_EOPNOTSUPP: not in production mode @n
 	 */
 	CMD_FMON_GEAR_GET = 3,
-	CMD_FMON_NUM,
+	/**
+	 * @brief Return current status of FMON faults detected by FMON
+	 *         h/w or s/w since last invocation of this command.
+	 *         Clears fault status.
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EBADCMD if subcommand is not supported @n
+	 * -#BPMP_EINVAL: invalid fault type @n
+	 * -#BPMP_ENODEV: invalid clk_id @n
+	 * -#BPMP_ENOENT: no calibration data, uninitialized @n
+	 * -#BPMP_ENOTSUP: avfs config not set @n
+	 * -#BPMP_EOPNOTSUPP: not in production mode @n
+	 */
+	CMD_FMON_FAULT_STS_GET = 4,
 };
 
+/**
+ * @cond DEPRECATED
+ * Kept for backward compatibility
+ */
+#define CMD_FMON_NUM		4
+
+/** @endcond DEPRECATED */
+
+/**
+ * @defgroup fmon_fault_type FMON fault type
+ * @addtogroup fmon_fault_type
+ * @{
+ */
+/** @brief All detected FMON faults (h/w or s/w) */
+#define FMON_FAULT_TYPE_ALL		0U
+/** @brief FMON faults detected by h/w */
+#define FMON_FAULT_TYPE_HW		1U
+/** @brief FMON faults detected by s/w */
+#define FMON_FAULT_TYPE_SW		2U
+
+/** @} fmon_fault_type */
+
+
 struct cmd_fmon_gear_clamp_request {
 	int32_t unused;
 	int64_t rate;
@@ -2587,6 +3223,14 @@ struct cmd_fmon_gear_get_response {
 	int64_t rate;
 } BPMP_ABI_PACKED;
 
+struct cmd_fmon_fault_sts_get_request {
+	uint32_t fault_type;	/**< @ref fmon_fault_type */
+} BPMP_ABI_PACKED;
+
+struct cmd_fmon_fault_sts_get_response {
+	uint32_t fault_sts;
+} BPMP_ABI_PACKED;
+
 /**
  * @ingroup FMON
  * @brief Request with #MRQ_FMON
@@ -2601,9 +3245,9 @@ struct cmd_fmon_gear_get_response {
  * |CMD_FMON_GEAR_CLAMP         |fmon_gear_clamp        |
  * |CMD_FMON_GEAR_FREE          |-                      |
  * |CMD_FMON_GEAR_GET           |-                      |
+ * |CMD_FMON_FAULT_STS_GET      |fmon_fault_sts_get     |
  *
  */
-
 struct mrq_fmon_request {
 	/** @brief Sub-command and clock id concatenated to 32-bit word.
 	 * - bits[31..24] is the sub-cmd.
@@ -2618,6 +3262,7 @@ struct mrq_fmon_request {
 		struct cmd_fmon_gear_free_request fmon_gear_free;
 		/** @private */
 		struct cmd_fmon_gear_get_request fmon_gear_get;
+		struct cmd_fmon_fault_sts_get_request fmon_fault_sts_get;
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
@@ -2633,6 +3278,7 @@ struct mrq_fmon_request {
  * |CMD_FMON_GEAR_CLAMP         |-                       |
  * |CMD_FMON_GEAR_FREE          |-                       |
  * |CMD_FMON_GEAR_GET           |fmon_gear_get           |
+ * |CMD_FMON_FAULT_STS_GET      |fmon_fault_sts_get      |
  *
  */
 
@@ -2643,11 +3289,12 @@ struct mrq_fmon_response {
 		/** @private */
 		struct cmd_fmon_gear_free_response fmon_gear_free;
 		struct cmd_fmon_gear_get_response fmon_gear_get;
+		struct cmd_fmon_fault_sts_get_response fmon_fault_sts_get;
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
-/** @endcond */
+/** @endcond (bpmp_t194 || bpmp_t234) */
+/** @} FMON */
 
 /**
  * @ingroup MRQ_Codes
@@ -2655,7 +3302,7 @@ struct mrq_fmon_response {
  * @brief Provide status information on faults reported by Error
  *        Collator (EC) to HSM.
  *
- * * Platforms: T194 onwards
+ * * Platforms: T194
  * @cond bpmp_t194
  * * Initiators: CCPLEX
  * * Targets: BPMP
@@ -2664,8 +3311,10 @@ struct mrq_fmon_response {
  *
  * @note This MRQ ABI is under construction, and subject to change
  *
+ * @endcond bpmp_t194
  * @addtogroup EC
  * @{
+ * @cond bpmp_t194
  */
 enum {
 	/**
@@ -2676,7 +3325,7 @@ enum {
 	 * -#BPMP_ENODEV if target EC is not owned by BPMP @n
 	 * -#BPMP_EACCES if target EC power domain is turned off @n
 	 * -#BPMP_EBADCMD if subcommand is not supported
-	 * @endcond
+	 * @endcond DEPRECATED
 	 */
 	CMD_EC_STATUS_GET = 1,	/* deprecated */
 
@@ -2787,7 +3436,8 @@ enum ec_registers_group {
 #define EC_STATUS_FLAG_LAST_ERROR	0x0002U
 /** @brief EC latent error flag */
 #define EC_STATUS_FLAG_LATENT_ERROR	0x0004U
-/** @} */
+
+/** @} bpmp_ec_status_flags */
 
 /**
  * @defgroup bpmp_ec_desc_flags EC Descriptor Flags
@@ -2798,7 +3448,8 @@ enum ec_registers_group {
 #define EC_DESC_FLAG_RESOLVED		0x0001U
 /** @brief EC descriptor failed to retrieve id flag */
 #define EC_DESC_FLAG_NO_ID		0x0002U
-/** @} */
+
+/** @} bpmp_ec_desc_flags */
 
 /**
  * |error type                       | fmon_clk_id values        |
@@ -2810,14 +3461,18 @@ struct ec_err_fmon_desc {
 	uint16_t desc_flags;
 	/** @brief FMON monitored clock id */
 	uint16_t fmon_clk_id;
-	/** @brief Bitmask of @ref bpmp_fmon_faults_flags */
+	/**
+	 * @brief Bitmask of fault flags
+	 *
+	 * @ref bpmp_fmon_faults_flags
+	 */
 	uint32_t fmon_faults;
 	/** @brief FMON faults access error */
 	int32_t fmon_access_error;
 } BPMP_ABI_PACKED;
 
 /**
- * |error type                       | vmon_adc_id values        |
+ * | error type                      | vmon_adc_id values        |
  * |---------------------------------|---------------------------|
  * |@ref EC_ERR_TYPE_VOLTAGE_MONITOR |@ref bpmp_adc_ids          |
  */
@@ -2826,16 +3481,16 @@ struct ec_err_vmon_desc {
 	uint16_t desc_flags;
 	/** @brief VMON rail adc id */
 	uint16_t vmon_adc_id;
-	/** @brief Bitmask of @ref bpmp_vmon_faults_flags */
+	/** @brief Bitmask of bpmp_vmon_faults_flags */
 	uint32_t vmon_faults;
 	/** @brief VMON faults access error */
 	int32_t vmon_access_error;
 } BPMP_ABI_PACKED;
 
 /**
- * |error type                       | reg_id values             |
- * |---------------------------------|---------------------------|
- * |@ref EC_ERR_TYPE_REGISTER_PARITY |@ref bpmp_ec_registers_ids |
+ * |error type                       | reg_id values         |
+ * |---------------------------------|-----------------------|
+ * |@ref EC_ERR_TYPE_REGISTER_PARITY | bpmp_ec_registers_ids |
  */
 struct ec_err_reg_parity_desc {
 	/** @brief Bitmask of @ref bpmp_ec_desc_flags  */
@@ -2847,10 +3502,10 @@ struct ec_err_reg_parity_desc {
 } BPMP_ABI_PACKED;
 
 /**
- * |error type                        | err_source_id values     |
- * |--------------------------------- |--------------------------|
- * |@ref EC_ERR_TYPE_SW_CORRECTABLE   | @ref bpmp_ec_ce_swd_ids  |
- * |@ref EC_ERR_TYPE_SW_UNCORRECTABLE | @ref bpmp_ec_ue_swd_ids  |
+ * |error type                        | err_source_id values |
+ * |--------------------------------- |----------------------|
+ * |@ref EC_ERR_TYPE_SW_CORRECTABLE   | bpmp_ec_ce_swd_ids   |
+ * |@ref EC_ERR_TYPE_SW_UNCORRECTABLE | bpmp_ec_ue_swd_ids   |
  */
 struct ec_err_sw_error_desc {
 	/** @brief Bitmask of @ref bpmp_ec_desc_flags  */
@@ -2862,15 +3517,15 @@ struct ec_err_sw_error_desc {
 } BPMP_ABI_PACKED;
 
 /**
- * |error type                              | err_source_id values      |
- * |----------------------------------------|---------------------------|
- * |@ref EC_ERR_TYPE_PARITY_INTERNAL        |@ref bpmp_ec_ipath_ids     |
- * |@ref EC_ERR_TYPE_ECC_SEC_INTERNAL       |@ref bpmp_ec_ipath_ids     |
- * |@ref EC_ERR_TYPE_ECC_DED_INTERNAL       |@ref bpmp_ec_ipath_ids     |
- * |@ref EC_ERR_TYPE_COMPARATOR             |@ref bpmp_ec_comparator_ids|
- * |@ref EC_ERR_TYPE_PARITY_SRAM            |@ref bpmp_clock_ids        |
- * |@ref EC_ERR_TYPE_OTHER_HW_CORRECTABLE   |@ref bpmp_ec_misc_hwd_ids  |
- * |@ref EC_ERR_TYPE_OTHER_HW_UNCORRECTABLE |@ref bpmp_ec_misc_hwd_ids  |
+ * |error type                              | err_source_id values   |
+ * |----------------------------------------|------------------------|
+ * |@ref EC_ERR_TYPE_PARITY_INTERNAL        |  bpmp_ec_ipath_ids     |
+ * |@ref EC_ERR_TYPE_ECC_SEC_INTERNAL       |  bpmp_ec_ipath_ids     |
+ * |@ref EC_ERR_TYPE_ECC_DED_INTERNAL       |  bpmp_ec_ipath_ids     |
+ * |@ref EC_ERR_TYPE_COMPARATOR             |  bpmp_ec_comparator_ids|
+ * |@ref EC_ERR_TYPE_OTHER_HW_CORRECTABLE   |  bpmp_ec_misc_hwd_ids  |
+ * |@ref EC_ERR_TYPE_OTHER_HW_UNCORRECTABLE |  bpmp_ec_misc_hwd_ids  |
+ * |@ref EC_ERR_TYPE_PARITY_SRAM            |  bpmp_clock_ids        |
  */
 struct ec_err_simple_desc {
 	/** @brief Bitmask of @ref bpmp_ec_desc_flags  */
@@ -2917,7 +3572,7 @@ struct cmd_ec_status_get_response {
 	/** @brief  EC error descriptors */
 	union ec_err_desc error_descs[EC_ERR_STATUS_DESC_MAX_NUM];
 } BPMP_ABI_PACKED;
-/** @endcond */
+/** @endcond DEPRECATED */
 
 struct cmd_ec_status_ex_get_response {
 	/** @brief Target EC id (the same id received with request). */
@@ -2955,7 +3610,7 @@ struct cmd_ec_status_ex_get_response {
  * |sub-command                 |payload                |
  * |----------------------------|-----------------------|
  * |@ref CMD_EC_STATUS_GET      |ec_status_get          |
- * @endcond
+ * @endcond DEPRECATED
  *
  * |sub-command                 |payload                |
  * |----------------------------|-----------------------|
@@ -2983,7 +3638,7 @@ struct mrq_ec_request {
  * |sub-command                 |payload                 |
  * |----------------------------|------------------------|
  * |@ref CMD_EC_STATUS_GET      |ec_status_get           |
- * @endcond
+ * @endcond DEPRECATED
  *
  * |sub-command                 |payload                 |
  * |----------------------------|------------------------|
@@ -2997,13 +3652,264 @@ struct mrq_ec_response {
 		 * @cond DEPRECATED
 		 */
 		struct cmd_ec_status_get_response ec_status_get;
-		/** @endcond */
+		/** @endcond DEPRECATED */
 		struct cmd_ec_status_ex_get_response ec_status_ex_get;
 	} BPMP_UNION_ANON;
 } BPMP_ABI_PACKED;
 
-/** @} */
-/** @endcond */
+/** @endcond bpmp_t194 */
+/** @} EC */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_TELEMETRY
+ * @brief Get address of memory buffer refreshed with recently sampled
+ *        telemetry data
+ *
+ * * Platforms: TH500 onwards
+ * @cond bpmp_th500
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: N/A
+ * * Response Payload: @ref mrq_telemetry_response
+ * @addtogroup Telemetry
+ * @{
+ */
+
+/**
+ * @brief Response to #MRQ_TELEMETRY
+ *
+ * mrq_response::err is
+ * * 0: Telemetry data is available at returned address
+ * * -#BPMP_EACCES: MRQ master is not allowed to request buffer refresh
+ * * -#BPMP_ENAVAIL: Telemetry buffer cannot be refreshed via this MRQ channel
+ * * -#BPMP_ENOTSUP: Telemetry buffer is not supported by BPMP-FW
+ * * -#BPMP_ENODEV: Telemetry mrq is not supported by BPMP-FW
+ */
+struct mrq_telemetry_response {
+	/** @brief Physical address of telemetry data buffer */
+	uint64_t data_buf_addr;	/**< see @ref bpmp_telemetry_layout */
+} BPMP_ABI_PACKED;
+
+/** @} Telemetry */
+/** @endcond bpmp_th500 */
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_PWR_LIMIT
+ * @brief Control power limits.
+ *
+ * * Platforms: TH500 onwards
+ * @cond bpmp_th500
+ * * Initiators: Any
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_pwr_limit_request
+ * * Response Payload: @ref mrq_pwr_limit_response
+ *
+ * @addtogroup Pwrlimit
+ * @{
+ */
+enum mrq_pwr_limit_cmd {
+	/**
+	 * @brief Check whether the BPMP-FW supports the specified
+	 * command
+	 *
+	 * mrq_response::err is 0 if the specified request is
+	 * supported and -#BPMP_ENODEV otherwise.
+	 */
+	CMD_PWR_LIMIT_QUERY_ABI = 0,
+
+	/**
+	 * @brief Set power limit
+	 *
+	 * mrq_response:err is
+	 * * 0: Success
+	 * * -#BPMP_ENODEV: Pwr limit mrq is not supported by BPMP-FW
+	 * * -#BPMP_ENAVAIL: Invalid request parameters
+	 * * -#BPMP_EACCES: Request is not accepted
+	 */
+	CMD_PWR_LIMIT_SET = 1,
+
+	/**
+	 * @brief Get power limit setting
+	 *
+	 * mrq_response:err is
+	 * * 0: Success
+	 * * -#BPMP_ENODEV: Pwr limit mrq is not supported by BPMP-FW
+	 * * -#BPMP_ENAVAIL: Invalid request parameters
+	 */
+	CMD_PWR_LIMIT_GET = 2,
+
+	/**
+	 * @brief Get current power cap
+	 *
+	 * mrq_response:err is
+	 * * 0: Success
+	 * * -#BPMP_ENODEV: Pwr limit mrq is not supported by BPMP-FW
+	 * * -#BPMP_ENAVAIL: Invalid request parameters
+	 */
+	CMD_PWR_LIMIT_CURR_CAP = 3,
+};
+
+/**
+ * @defgroup bpmp_pwr_limit_type PWR_LIMIT TYPEs
+ * @{
+ */
+/** @brief Limit value specifies traget cap */
+#define PWR_LIMIT_TYPE_TARGET_CAP		0U
+/** @brief Limit value specifies maximum possible target cap */
+#define PWR_LIMIT_TYPE_BOUND_MAX		1U
+/** @brief Limit value specifies minimum possible target cap */
+#define PWR_LIMIT_TYPE_BOUND_MIN		2U
+/** @brief Number of limit types supported by mrq interface */
+#define PWR_LIMIT_TYPE_NUM			3U
+
+/** @} bpmp_pwr_limit_type */
+
+/**
+ * @brief Request data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_QUERY_ABI
+ */
+struct cmd_pwr_limit_query_abi_request {
+	uint32_t cmd_code; /**< @ref mrq_pwr_limit_cmd */
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_SET
+ *
+ * Set specified limit of specified type from specified source. The success of
+ * the request means that specified value is accepted as input to arbitration
+ * with other sources settings for the same limit of the same type. Zero limit
+ * is ignored by the arbitration (i.e., indicates "no limit set").
+ */
+struct cmd_pwr_limit_set_request {
+	uint32_t limit_id;   /**< @ref bpmp_pwr_limit_id */
+	uint32_t limit_src;  /**< @ref bpmp_pwr_limit_src */
+	uint32_t limit_type; /**< @ref bpmp_pwr_limit_type */
+	uint32_t limit_setting;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_GET
+ *
+ * Get previously set from specified source specified limit value of specified
+ * type.
+ */
+struct cmd_pwr_limit_get_request {
+	uint32_t limit_id;   /**< @ref bpmp_pwr_limit_id */
+	uint32_t limit_src;  /**< @ref bpmp_pwr_limit_src */
+	uint32_t limit_type; /**< @ref bpmp_pwr_limit_type */
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_GET
+ */
+struct cmd_pwr_limit_get_response {
+	uint32_t limit_setting;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_CURR_CAP
+ *
+ * For specified limit get current power cap aggregated from all sources.
+ */
+struct cmd_pwr_limit_curr_cap_request {
+	uint32_t limit_id;   /**< @ref bpmp_pwr_limit_id */
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response data for #MRQ_PWR_LIMIT command CMD_PWR_LIMIT_CURR_CAP
+ */
+struct cmd_pwr_limit_curr_cap_response {
+	uint32_t curr_cap;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request with #MRQ_PWR_LIMIT
+ *
+ * |sub-command                 |payload                          |
+ * |----------------------------|---------------------------------|
+ * |CMD_PWR_LIMIT_QUERY_ABI     | cmd_pwr_limit_query_abi_request |
+ * |CMD_PWR_LIMIT_SET           | cmd_pwr_limit_set_request       |
+ * |CMD_PWR_LIMIT_GET           | cmd_pwr_limit_get_request       |
+ * |CMD_PWR_LIMIT_CURR_CAP      | cmd_pwr_limit_curr_cap_request  |
+ */
+struct mrq_pwr_limit_request {
+	uint32_t cmd;
+	union {
+		struct cmd_pwr_limit_query_abi_request pwr_limit_query_abi_req;
+		struct cmd_pwr_limit_set_request pwr_limit_set_req;
+		struct cmd_pwr_limit_get_request pwr_limit_get_req;
+		struct cmd_pwr_limit_curr_cap_request pwr_limit_curr_cap_req;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response to MRQ_PWR_LIMIT
+ *
+ * |sub-command                 |payload                          |
+ * |----------------------------|---------------------------------|
+ * |CMD_PWR_LIMIT_QUERY_ABI     | -                               |
+ * |CMD_PWR_LIMIT_SET           | -                               |
+ * |CMD_PWR_LIMIT_GET           | cmd_pwr_limit_get_response      |
+ * |CMD_PWR_LIMIT_CURR_CAP      | cmd_pwr_limit_curr_cap_response |
+ */
+struct mrq_pwr_limit_response {
+	union {
+		struct cmd_pwr_limit_get_response pwr_limit_get_rsp;
+		struct cmd_pwr_limit_curr_cap_response pwr_limit_curr_cap_rsp;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/** @} PwrLimit */
+/** @endcond bpmp_th500 */
+
+
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_GEARS
+ * @brief Get thresholds for NDIV offset switching
+ *
+ * * Platforms: TH500 onwards
+ * @cond bpmp_th500
+ * * Initiators: CCPLEX
+ * * Targets: BPMP
+ * * Request Payload: N/A
+ * * Response Payload: @ref mrq_gears_response
+ * @addtogroup Gears
+ * @{
+ */
+
+/**
+ * @brief Response to #MRQ_GEARS
+ *
+ * Used by the sender of an #MRQ_GEARS message to request thresholds
+ * for NDIV offset switching.
+ *
+ * The mrq_gears_response::ncpu array defines four thresholds in units
+ * of number of online CPUS to be used for choosing between five different
+ * NDIV offset settings for CCPLEX cluster NAFLLs
+ *
+ * 1. If number of online CPUs < ncpu[0] use offset0
+ * 2. If number of online CPUs < ncpu[1] use offset1
+ * 3. If number of online CPUs < ncpu[2] use offset2
+ * 4. If number of online CPUs < ncpu[3] use offset3
+ * 5. If number of online CPUs >= ncpu[3] disable offsetting
+ *
+ * For TH500 mrq_gears_response::ncpu array has four valid entries.
+ *
+ * mrq_response::err is
+ * * 0: gears defined and response data valid
+ * * -#BPMP_ENODEV: MRQ is not supported by BPMP-FW
+ * * -#BPMP_EACCES: Operation not permitted for the MRQ master
+ * * -#BPMP_ENAVAIL: NDIV offsetting is disabled
+ */
+struct mrq_gears_response {
+	/** @brief number of online CPUs for each gear */
+	uint32_t ncpu[16];
+} BPMP_ABI_PACKED;
+
+/** @} Gears */
+/** @endcond bpmp_th500 */
 
 /**
  * @addtogroup Error_Codes
@@ -3047,12 +3953,18 @@ struct mrq_ec_response {
 #define BPMP_ENOSYS	38
 /** @brief Invalid slot */
 #define BPMP_EBADSLT	57
+/** @brief Invalid message */
+#define BPMP_EBADMSG	77
+/** @brief Operation not supported */
+#define BPMP_EOPNOTSUPP 95
+/** @brief Targeted resource not available */
+#define BPMP_ENAVAIL	119
 /** @brief Not supported */
 #define BPMP_ENOTSUP	134
 /** @brief No such device or address */
 #define BPMP_ENXIO	140
 
-/** @} */
+/** @} Error_Codes */
 
 #if defined(BPMP_ABI_CHECKS)
 #include "bpmp_abi_checks.h"
-- 
2.34.1

