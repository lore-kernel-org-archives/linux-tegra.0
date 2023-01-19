Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEC5C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjASMRI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjASMRG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:06 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8A659B6E;
        Thu, 19 Jan 2023 04:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5VGzxFxExyrW2VOG1JCzKXD/lSdAvZuaifPid/N0gK3g0XwDb3TSvoevhZl+s8ehr7w/vNAJN0l8kk/XJ2dEsmNs5+ETqyfq6mI0WoRJiY38YTpXtrt86tnTjqA5ybq8HlwlwS9tEXKixU6WtArTLlMUhMfh8Jbxp/OOopoashjsA8bpn+Teio/D6l7Bjd/ahRrw1u9IuUE1Lw7GG3NyRP1UA/kngIwacaLz6lpPu/ZFY1VOkQQgas/ems1/e3LXE8pz2QFeoRDqGwVR7eA4Zz+noOXu4VylhVhoYOB9pWKiu1p72pANgEdw0X3VmOf5uhDqDgc868k31qZX2mSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgjqfldTnaVGw8G0YJdVz5UHQnN4iwn7TGs6yY9oqP0=;
 b=knaYvQvCr9J3oZJ8VCh8g0wtohEIVU98wtgVpfjYanxeXecJNimhukVhOOtNxfky4z/+KKCS+QC1aeqgggDr/uE9bHK9vPsdc22BiLBUw4s7biNX+DY/F4slQ0Y1AbXNNaZibVTKn7VxT49hrYbpUpQwM6MpE4oMgKQKmS92SWO9mO9uo8eaFLKSWywS0z4vs2QYkp6gDq6CJOWjetDdZ2Ybs+ij8C2RZp9z1L0P9hjBGq+HZBryDWh/Kr96C+u0qd+3oSYoAQnvZ+S5QTG6uHkch/06sgdqvarXr/O2m/9QjQ5j7sh7mmorM5arq4c77eoCHvTqq2am9/oA+SaoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgjqfldTnaVGw8G0YJdVz5UHQnN4iwn7TGs6yY9oqP0=;
 b=aViM9I0T0WFDFpTiWod54vOkFWA0Zg/iOmrk0e6mSKIig4WUIzpnCVl3CKiul5I5LKmBlPKWUh9uJb3b08vruGUK9kh6L9kuAo4e0pCyqwXF27FC6J90reJYeSbtaGBpRqNEgCSVXVjix5Sp7wySGMfIk8FjgnWDeanBY4d05aHGASWHH8EkiJw4uThIwG0p9cGm3sVqnioW9d94SOiXA057A+/Lgy8A4KVqeIve1uOkKGMrOlzEpcs4dDREByOcq9yywtzLiDCzCRoljhjjBSYDhPvHgU9aDbJCOn2o+UpkRcQKWxgVnt2u0YgSToWRQeDYp1wLJxTSJ+jDYY/SBg==
Received: from MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::6)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 12:17:02 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::73) by MW4P222CA0001.outlook.office365.com
 (2603:10b6:303:114::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 19 Jan 2023 12:17:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:16:55 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:16:54 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:16:52 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 0/6] Add device-tree support for Cypress CYPD4226
Date:   Thu, 19 Jan 2023 12:16:33 +0000
Message-ID: <20230119121639.226729-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT060:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddb5f83-dffd-48a6-4caf-08dafa17123c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qp/NDFczjl+ycMWquYvLt9le9vF4Od3qVhHvtovtcp061gYtUBReB3JEIXmjZJVZcudflW8n2Dh6QYyNIMVrdh/btAEoOgsVL/FHL5gGs5NRKyVaKAoSKX+Qr7x+7lQgn8GFc44xUsY00L/bLnVyrJb/tmGoFu/rJvzcCoIEwI7PTdGnteGw9iMnPJlyYUDsRLj2epBIoXXb/0C4FNqZ3LdM5Zpi1sxMXZiONNNromDPdHHT2GLJaAVBzRuaSs/ViqGkgvpxmLyjaf3Ia6iWhwaYFFc8ht/vSz33LwEMjGXDGRRmtrHAbwmwHtofY7BUX+MRhF67u7Z7dhaIlIToYTPuDYZUZI0HlHtdC8Mat0QGJ5w2qNLNtqdUihh9j3Wt7qATDySkKMktXbYZPUO9KM/lhkVfYoQ+g0FNNtnVeH/Oi/YIJb03ZPQKkzDx91ocDFn6ZiXtowlR365FhQrVHVGnC9CH2Xgvi+JHRk+rgMHc6IdgfeRnPJX41VWTItuT3eUeMAfItd6GXKlg/N0De23eJXQDq8WOriibN5pQZfvkgk1Sk01xxLBuekaDTBzacgx2kfThtyiAKvuH/CTvqrlsEzK93RbJkzS6wGebYpa3FiTAgfziUPw/qI9H3Kx/vNrZGfab/pYREdZNeryBYeMRL4zK7jjXT49gHwJJyEnkEPyrz7Zp5rnt2u2N6uVrrkz3QqqOUDaqPfASA0u9T5LlAvPm+MESrE7ghhFOJBivyOnXS+A+JuHqCZq5ndCXm6/boRsm32S9nql2m4vxl4mtDUS9sIe0HTW/+4+lefs=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(110136005)(54906003)(316002)(7636003)(2616005)(82740400003)(4326008)(5660300002)(1076003)(8936002)(426003)(41300700001)(186003)(8676002)(36756003)(26005)(83380400001)(47076005)(70206006)(70586007)(40460700003)(107886003)(6666004)(40480700001)(82310400005)(356005)(336012)(86362001)(2906002)(966005)(36860700001)(478600001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:02.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb5f83-dffd-48a6-4caf-08dafa17123c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree support for Cypress CYPD4226 Type-C controller and
enable for the Jetson AGX Orin board. This series is derived from the
series to enable USB host and device support for Jetson AGX Orin [0].
I have split this out from that series because it was getting quite
big.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (1):
  arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin

Wayne Chang (5):
  dt-bindings: usb: Add Cypress cypd4226 Type-C controller
  i2c: nvidia-gpu: Add ACPI property to align with device-tree
  usb: typec: ucsi_ccg: Add OF support
  i2c: nvidia-gpu: Remove ccgx,firmware-build property
  usb: typec: ucsi_ccg: Remove ccgx,firmware-build property

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 23 ++++-
 4 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

