Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D6C46467
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238458AbjAKLGB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238184AbjAKLFl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:41 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2821573C;
        Wed, 11 Jan 2023 03:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1njL87ByRUALDclIWRYjai9HtEnco7ThBIHiZSmv/BSncmfj6tm/cocvBtCKGEMlrkOaOAUAfaQvLTG4igvdErOOHLhOxwfL3uuRI8qTNz64yWH7S3jPZSbK9vj63Tm9RmmZRDCPNoMoNhiyEWBbNRNAKvWe+pJFwvflCPxQKYPK01r3dZokPiZqPXdL6l3Foy9GCrhySMtiub5woodgpX5HTFwzvjVIkJ6sodN4krmWX5IPyWM4eq7SC15GXs4NqXD+8Bb7bp4/VGn4HQlG48rq3DxrEmDqGjSP/NEM6pA7iGj+1oOYmc1m/19KCv8RLo45pH6L6GyzRntMxsnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+cx0AdopsZnqHkoCbeQ5j24Nvpc6A1kGvi6RNiOm2k=;
 b=k2qdDKldfv40XDBBPIT2nkLOuUe6Iz6jiF14dNCeZFz9tvpFSrjAhOFso3xpSCD9Yg/l/ofvK7bdFnVi6s874UrQw2ovWZRNqHePrZ6jGeD7tUCKo2S22+/6BKz6TDIADBnRivgrL2oFZtnfq5uuyPRTB6Mgwxj2zs61poLpwhOOaqnY8Ub4i4w1f+vrKkYcOJABK9Z0vnGJwONdH71SNzamHc6up91AzRe1mhUPOaKpdpwLxtJDCt566lNRHs7/Hmwn0TLAm12+Mj+hARhvLMgaq+U/5nvd/BWevAASd3yvQojxrLMNdXVXrtdxluXqu0oslKDQaHPYbjywrO+xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+cx0AdopsZnqHkoCbeQ5j24Nvpc6A1kGvi6RNiOm2k=;
 b=NdlPiFuLyI0BqpLVgBb3tIQkDvA0j7NEbBqUsHc3c26SavvJlebN/gPSyPUnDmBaxV/T11uGONmqRXGuislojohQKtqi5qPMT97kUHm74gFEi2vs5f+GRXO1d5UcaCbbxurDggKTilZq4uhKPR9hj/YgE0YCoKD53RLoEwbyUIUkXKvr00TD4uK7b25ittv2Yr3YHx3lbX9gEiIExMYIwFIDYxCMjoh2eVzn+0S+X+AkRYC6OlLLEhvLK6qi4MiQJM8S/S5e8qKG0k9nbQcr92iLzox+OxOuKWwDEBhSPQtsetpprLNj4h2RlxUoj7W/hE7Pn86x5xqRJ1RhoHfrFg==
Received: from DM6PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:333::27)
 by CH2PR12MB4923.namprd12.prod.outlook.com (2603:10b6:610:6a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:05:33 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::b1) by DM6PR03CA0094.outlook.office365.com
 (2603:10b6:5:333::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 11:05:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:23 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:22 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:20 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Sing-Han Chen <singhanc@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 6/6] usb: host: xhci-tegra: Add Tegra234 XHCI support
Date:   Wed, 11 Jan 2023 11:04:50 +0000
Message-ID: <20230111110450.24617-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111110450.24617-1-jonathanh@nvidia.com>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|CH2PR12MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd593c1-f032-443c-75ab-08daf3c3c2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9PPfgFAKUZgG2d5vFdt8N6N/YBjsT7zsnreuPo/L9LF3RuRbfeBHNVXaZK4OJLVHTG0Fn8bz+WH6/XBgzQVG0AK4sGRUIE+GEpo54NFZWbUa3TsyUKrqSLAWZUft0yWFPSkAZ14ghqdVH1O+Yh55kku1UeZIhEBc4zZuLIVARzEonVaHoA0FNVlhwnwNKUWCwZv/ZWCSUC2cxE/Vc0CMhXPYhlPhSegnYn32nfTYWXHyIew5UfyGeFynPBGgUmrjQpZ72blVr436noSWM7e/39kc+ASi6s7xRj8CWWEByTWkpP7fojmJ0rEwajOOGuk4gDQEYXmZ4FBEc+j7Lyxa0QdXPw4kbkgLCZedHZp0zkP8uQvVdAn5UksqbKm+iEYjPstFfwV9w1hQtYqqcH65f3hQzpJV8qrPLZt1NUqQ3AYqR0rCrT+KCeMuw56ubcxTj/Kmg2xIMUiQBQ/9kSMgqYeDmahAKG618PrkAtr4q4Tk14BrMrNh9hXZNld+CcPPy1i1tJDmil9xgoOrAqj1yvUx3K/JMAnoKdfzcpL82vMhBhDLzAXUdQ38B0HJnnSy1e1QOWo63lYbDGnlrH0QkNrcahUS4pC5GOPrCKjAA4jopPAZKxf44MHJkTybKKptUzIU2NolAuwRrdkvvQKdtxzlIynusYEBRbYME0adx+JnyCw7oari1MCy5xzEqH9jbVFd8DQGO4m5XlczPgCQA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(70206006)(40480700001)(47076005)(41300700001)(4326008)(426003)(2616005)(1076003)(70586007)(8676002)(83380400001)(110136005)(336012)(36756003)(316002)(54906003)(82310400005)(86362001)(36860700001)(7636003)(356005)(8936002)(5660300002)(30864003)(82740400003)(2906002)(478600001)(186003)(6666004)(107886003)(26005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:33.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd593c1-f032-443c-75ab-08daf3c3c2a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4923
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

This change adds Tegra234 XUSB host mode controller support.

In Tegra234, some of the registers have moved to bar2 space.
The new soc variable has_bar2 indicates the chip with bar2
area. This patch adds new reg helper to let the driver reuse
the same code for those chips with bar2 support.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Co-developed-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4 -> V6: no changes
V3 -> V4: fixed checkpatch warnings
V2 -> V3: nothing has changed
V1 -> V2: fix some issues on coding style

 drivers/usb/host/xhci-tegra.c | 267 +++++++++++++++++++++++++++++-----
 1 file changed, 228 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 41fb33833890..1ff22f675930 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -44,6 +44,9 @@
 #define XUSB_CFG_4				0x010
 #define  XUSB_BASE_ADDR_SHIFT			15
 #define  XUSB_BASE_ADDR_MASK			0x1ffff
+#define XUSB_CFG_7				0x01c
+#define  XUSB_BASE2_ADDR_SHIFT			16
+#define  XUSB_BASE2_ADDR_MASK			0xffff
 #define XUSB_CFG_16				0x040
 #define XUSB_CFG_24				0x060
 #define XUSB_CFG_AXI_CFG			0x0f8
@@ -75,6 +78,20 @@
 #define  MBOX_SMI_INTR_FW_HANG			BIT(1)
 #define  MBOX_SMI_INTR_EN			BIT(3)
 
+/* BAR2 registers */
+#define XUSB_BAR2_ARU_MBOX_CMD			0x004
+#define XUSB_BAR2_ARU_MBOX_DATA_IN		0x008
+#define XUSB_BAR2_ARU_MBOX_DATA_OUT		0x00c
+#define XUSB_BAR2_ARU_MBOX_OWNER		0x010
+#define XUSB_BAR2_ARU_SMI_INTR			0x014
+#define XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0	0x01c
+#define XUSB_BAR2_ARU_IFRDMA_CFG0		0x0e0
+#define XUSB_BAR2_ARU_IFRDMA_CFG1		0x0e4
+#define XUSB_BAR2_ARU_IFRDMA_STREAMID_FIELD	0x0e8
+#define XUSB_BAR2_ARU_C11_CSBRANGE		0x9c
+#define XUSB_BAR2_ARU_FW_SCRATCH		0x1000
+#define XUSB_BAR2_CSB_BASE_ADDR			0x2000
+
 /* IPFS registers */
 #define IPFS_XUSB_HOST_MSI_BAR_SZ_0		0x0c0
 #define IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
@@ -111,6 +128,9 @@
 #define  IMFILLRNG1_TAG_HI_SHIFT		16
 #define XUSB_FALC_IMFILLCTL			0x158
 
+/* CSB ARU registers */
+#define XUSB_CSB_ARU_SCRATCH0			0x100100
+
 /* MP CSB registers */
 #define XUSB_CSB_MP_ILOAD_ATTR			0x101a00
 #define XUSB_CSB_MP_ILOAD_BASE_LO		0x101a04
@@ -131,6 +151,9 @@
 
 #define IMEM_BLOCK_SIZE				256
 
+#define FW_IOCTL_TYPE_SHIFT			24
+#define FW_IOCTL_CFGTBL_READ		17
+
 struct tegra_xusb_fw_header {
 	__le32 boot_loadaddr_in_imem;
 	__le32 boot_codedfi_offset;
@@ -175,6 +198,7 @@ struct tegra_xusb_mbox_regs {
 	u16 data_in;
 	u16 data_out;
 	u16 owner;
+	u16 smi_intr;
 };
 
 struct tegra_xusb_context_soc {
@@ -189,6 +213,14 @@ struct tegra_xusb_context_soc {
 	} fpci;
 };
 
+struct tegra_xusb;
+struct tegra_xusb_soc_ops {
+	u32 (*mbox_reg_readl)(struct tegra_xusb *tegra, unsigned int offset);
+	void (*mbox_reg_writel)(struct tegra_xusb *tegra, u32 value, unsigned int offset);
+	u32 (*csb_reg_readl)(struct tegra_xusb *tegra, unsigned int offset);
+	void (*csb_reg_writel)(struct tegra_xusb *tegra, u32 value, unsigned int offset);
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -205,11 +237,14 @@ struct tegra_xusb_soc {
 	} ports;
 
 	struct tegra_xusb_mbox_regs mbox;
+	const struct tegra_xusb_soc_ops *ops;
 
 	bool scale_ss_clock;
 	bool has_ipfs;
 	bool lpm_support;
 	bool otg_reset_sspi;
+
+	bool has_bar2;
 };
 
 struct tegra_xusb_context {
@@ -230,6 +265,8 @@ struct tegra_xusb {
 
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
+	void __iomem *bar2_base;
+	struct resource *bar2;
 
 	const struct tegra_xusb_soc *soc;
 
@@ -301,7 +338,33 @@ static inline void ipfs_writel(struct tegra_xusb *tegra, u32 value,
 	writel(value, tegra->ipfs_base + offset);
 }
 
+static inline u32 bar2_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	return readl(tegra->bar2_base + offset);
+}
+
+static inline void bar2_writel(struct tegra_xusb *tegra, u32 value,
+			       unsigned int offset)
+{
+	writel(value, tegra->bar2_base + offset);
+}
+
 static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	return ops->csb_reg_readl(tegra, offset);
+}
+
+static void csb_writel(struct tegra_xusb *tegra, u32 value,
+		       unsigned int offset)
+{
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	ops->csb_reg_writel(tegra, value, offset);
+}
+
+static u32 fpci_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
 	u32 ofs = CSB_PAGE_OFFSET(offset);
@@ -311,8 +374,8 @@ static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 	return fpci_readl(tegra, XUSB_CFG_CSB_BASE_ADDR + ofs);
 }
 
-static void csb_writel(struct tegra_xusb *tegra, u32 value,
-		       unsigned int offset)
+static void fpci_csb_writel(struct tegra_xusb *tegra, u32 value,
+			    unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
 	u32 ofs = CSB_PAGE_OFFSET(offset);
@@ -321,6 +384,26 @@ static void csb_writel(struct tegra_xusb *tegra, u32 value,
 	fpci_writel(tegra, value, XUSB_CFG_CSB_BASE_ADDR + ofs);
 }
 
+static u32 bar2_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	u32 page = CSB_PAGE_SELECT(offset);
+	u32 ofs = CSB_PAGE_OFFSET(offset);
+
+	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
+
+	return bar2_readl(tegra, XUSB_BAR2_CSB_BASE_ADDR + ofs);
+}
+
+static void bar2_csb_writel(struct tegra_xusb *tegra, u32 value,
+			    unsigned int offset)
+{
+	u32 page = CSB_PAGE_SELECT(offset);
+	u32 ofs = CSB_PAGE_OFFSET(offset);
+
+	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
+	bar2_writel(tegra, value, XUSB_BAR2_CSB_BASE_ADDR + ofs);
+}
+
 static int tegra_xusb_set_ss_clk(struct tegra_xusb *tegra,
 				 unsigned long rate)
 {
@@ -452,6 +535,7 @@ static bool tegra_xusb_mbox_cmd_requires_ack(enum tegra_xusb_mbox_cmd cmd)
 static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 				const struct tegra_xusb_mbox_msg *msg)
 {
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	bool wait_for_idle = false;
 	u32 value;
 
@@ -460,15 +544,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	 * ACK/NAK messages.
 	 */
 	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
-		value = fpci_readl(tegra, tegra->soc->mbox.owner);
+		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_NONE) {
 			dev_err(tegra->dev, "mailbox is busy\n");
 			return -EBUSY;
 		}
 
-		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
+		ops->mbox_reg_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
 
-		value = fpci_readl(tegra, tegra->soc->mbox.owner);
+		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_SW) {
 			dev_err(tegra->dev, "failed to acquire mailbox\n");
 			return -EBUSY;
@@ -478,17 +562,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	}
 
 	value = tegra_xusb_mbox_pack(msg);
-	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.data_in);
 
-	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
 	value |= MBOX_INT_EN | MBOX_DEST_FALC;
-	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	if (wait_for_idle) {
 		unsigned long timeout = jiffies + msecs_to_jiffies(250);
 
 		while (time_before(jiffies, timeout)) {
-			value = fpci_readl(tegra, tegra->soc->mbox.owner);
+			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 			if (value == MBOX_OWNER_NONE)
 				break;
 
@@ -496,7 +580,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 		}
 
 		if (time_after(jiffies, timeout))
-			value = fpci_readl(tegra, tegra->soc->mbox.owner);
+			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 
 		if (value != MBOX_OWNER_NONE)
 			return -ETIMEDOUT;
@@ -508,11 +592,12 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_irq(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	u32 value;
 
 	/* clear mailbox interrupts */
-	value = fpci_readl(tegra, XUSB_CFG_ARU_SMI_INTR);
-	fpci_writel(tegra, value, XUSB_CFG_ARU_SMI_INTR);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.smi_intr);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.smi_intr);
 
 	if (value & MBOX_SMI_INTR_FW_HANG)
 		dev_err(tegra->dev, "controller firmware hang\n");
@@ -665,6 +750,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	struct tegra_xusb_mbox_msg msg;
 	u32 value;
 
@@ -673,16 +759,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
 		goto out;
 
-	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.data_out);
 	tegra_xusb_mbox_unpack(&msg, value);
 
-	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
 	value &= ~MBOX_DEST_SMI;
-	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	/* clear mailbox owner if no ACK/NAK is required */
 	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
-		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
+		ops->mbox_reg_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
 
 	tegra_xusb_mbox_handle(tegra, &msg);
 
@@ -710,6 +796,15 @@ static void tegra_xusb_config(struct tegra_xusb *tegra)
 	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
 	fpci_writel(tegra, value, XUSB_CFG_4);
 
+	/* Program BAR2 space */
+	if (tegra->bar2) {
+		value = fpci_readl(tegra, XUSB_CFG_7);
+		value &= ~(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		value |= tegra->bar2->start &
+			(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		fpci_writel(tegra, value, XUSB_CFG_7);
+	}
+
 	usleep_range(100, 200);
 
 	/* Enable bus master */
@@ -882,21 +977,36 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 	return 0;
 }
 
-static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
+{
+	struct xhci_cap_regs __iomem *cap_regs;
+	struct xhci_op_regs __iomem *op_regs;
+	int ret;
+	u32 value;
+
+	cap_regs = tegra->regs;
+	op_regs = tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
+
+	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
+
+	if (ret)
+		dev_err(tegra->dev, "XHCI Controller not ready. Falcon state: 0x%x\n",
+			csb_readl(tegra, XUSB_FALC_CPUCTL));
+
+	return ret;
+}
+
+static int tegra_xusb_load_firmware_rom(struct tegra_xusb *tegra)
 {
 	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
-	struct xhci_cap_regs __iomem *cap = tegra->regs;
 	struct tegra_xusb_fw_header *header;
 	struct device *dev = tegra->dev;
-	struct xhci_op_regs __iomem *op;
-	unsigned long timeout;
 	time64_t timestamp;
 	u64 address;
 	u32 value;
 	int err;
 
 	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
-	op = tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
 
 	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
 		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
@@ -969,30 +1079,54 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
 	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
 
-	timeout = jiffies + msecs_to_jiffies(200);
+	if (tegra_xusb_wait_for_falcon(tegra))
+		return -EIO;
+
+	timestamp = le32_to_cpu(header->fwimg_created_time);
 
-	do {
-		value = readl(&op->status);
-		if ((value & STS_CNR) == 0)
-			break;
+	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
+
+	return 0;
+}
+
+static u32 tegra_xusb_read_firmware_header(struct tegra_xusb *tegra, u32 offset)
+{
+	/*
+	 * We only accept reading the firmware config table
+	 * The offset should not exceed the fw header structure
+	 */
+	if (offset >= sizeof(struct tegra_xusb_fw_header))
+		return 0;
 
-		usleep_range(1000, 2000);
-	} while (time_is_after_jiffies(timeout));
+	bar2_writel(tegra, (FW_IOCTL_CFGTBL_READ << FW_IOCTL_TYPE_SHIFT) | offset,
+		    XUSB_BAR2_ARU_FW_SCRATCH);
+	return bar2_readl(tegra, XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0);
+}
+
+static int tegra_xusb_init_ifr_firmware(struct tegra_xusb *tegra)
+{
+	time64_t timestamp;
 
-	value = readl(&op->status);
-	if (value & STS_CNR) {
-		value = csb_readl(tegra, XUSB_FALC_CPUCTL);
-		dev_err(dev, "XHCI controller not read: %#010x\n", value);
+	if (tegra_xusb_wait_for_falcon(tegra))
 		return -EIO;
-	}
 
-	timestamp = le32_to_cpu(header->fwimg_created_time);
+#define offsetof_32(X, Y) ((u8)(offsetof(X, Y) / sizeof(__le32)))
+	timestamp = tegra_xusb_read_firmware_header(tegra, offsetof_32(struct tegra_xusb_fw_header,
+								       fwimg_created_time) << 2);
 
-	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
+	dev_info(tegra->dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
 
 	return 0;
 }
 
+static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+{
+	if (!tegra->soc->firmware)
+		return tegra_xusb_init_ifr_firmware(tegra);
+	else
+		return tegra_xusb_load_firmware_rom(tegra);
+}
+
 static void tegra_xusb_powerdomain_remove(struct device *dev,
 					  struct tegra_xusb *tegra)
 {
@@ -1436,6 +1570,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		tegra->ipfs_base = devm_platform_ioremap_resource(pdev, 2);
 		if (IS_ERR(tegra->ipfs_base))
 			return PTR_ERR(tegra->ipfs_base);
+	} else if (tegra->soc->has_bar2) {
+		tegra->bar2_base = devm_platform_get_and_ioremap_resource(pdev, 2, &tegra->bar2);
+		if (IS_ERR(tegra->bar2_base))
+			return PTR_ERR(tegra->bar2_base);
 	}
 
 	tegra->xhci_irq = platform_get_irq(pdev, 0);
@@ -1652,10 +1790,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	err = tegra_xusb_request_firmware(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
-		goto disable_phy;
+	if (tegra->soc->firmware) {
+		err = tegra_xusb_request_firmware(tegra);
+		if (err < 0) {
+			dev_err(&pdev->dev,
+				"failed to request firmware: %d\n", err);
+			goto disable_phy;
+		}
 	}
 
 	err = tegra_xusb_unpowergate_partitions(tegra);
@@ -2320,6 +2461,13 @@ static const struct tegra_xusb_context_soc tegra124_xusb_context = {
 	},
 };
 
+static const struct tegra_xusb_soc_ops tegra124_ops = {
+	.mbox_reg_readl = &fpci_readl,
+	.mbox_reg_writel = &fpci_writel,
+	.csb_reg_readl = &fpci_csb_readl,
+	.csb_reg_writel = &fpci_csb_writel,
+};
+
 static const struct tegra_xusb_soc tegra124_soc = {
 	.firmware = "nvidia/tegra124/xusb.bin",
 	.supply_names = tegra124_supply_names,
@@ -2335,11 +2483,13 @@ static const struct tegra_xusb_soc tegra124_soc = {
 	.scale_ss_clock = true,
 	.has_ipfs = true,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
@@ -2371,11 +2521,13 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = true,
 	.otg_reset_sspi = true,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
@@ -2412,11 +2564,13 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
 };
@@ -2443,21 +2597,56 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0x68,
 		.data_in = 0x6c,
 		.data_out = 0x70,
 		.owner = 0x74,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
 };
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
 
+static const struct tegra_xusb_soc_ops tegra234_ops = {
+	.mbox_reg_readl = &bar2_readl,
+	.mbox_reg_writel = &bar2_writel,
+	.csb_reg_readl = &bar2_csb_readl,
+	.csb_reg_writel = &bar2_csb_writel,
+};
+
+static const struct tegra_xusb_soc tegra234_soc = {
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra194_phy_types,
+	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.context = &tegra186_xusb_context,
+	.ports = {
+		.usb3 = { .offset = 0, .count = 4, },
+		.usb2 = { .offset = 4, .count = 4, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+	.otg_reset_sspi = false,
+	.ops = &tegra234_ops,
+	.mbox = {
+		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
+		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
+		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
+	},
+	.lpm_support = true,
+	.has_bar2 = true,
+};
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
 	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
+	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.25.1

