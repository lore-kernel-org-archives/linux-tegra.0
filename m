Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB9FC4741F
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BFC2087D
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="iGG32dca"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbgKEKYt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:24:49 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5881 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbgKEKYr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 05:24:47 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa3d2ed0000>; Thu, 05 Nov 2020 02:24:45 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 10:24:46 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 5 Nov 2020 10:24:43 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <maz@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/4] Convert few Tegra docs to json-schema
Date:   Thu, 5 Nov 2020 15:54:02 +0530
Message-ID: <1604571846-14037-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604571885; bh=Mz88rgJiAM8warC9rJqbKLXNRMKQw4aydqvOqWr7W5w=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=iGG32dcaL0h8qSKjazs3ZV2XOKZOiyIMM3qKIh5SN/CaC5wPM2YwcBpzoKaof+3+r
         YNX9T9RsDa9fK4BtXsPynO48qNH+eAmI4QKDjy2bCezObwWFpP70USwYbfCh44pqLr
         MkQCBrsYMXXU0T06A4mdNYkTSnRXnbrIv6OS9J5gOkWRm3Cox56vG6tkvt73SVdzci
         10DBoOtkIJzDljflpUN5qN0wG+UeJI4VOQI61TlbfAPiag6/EY83g/ARiD51FUVpsQ
         1gUR9RNBLmMG/CF3ys6AIbJmsbyymPJkPIezryiyeC6MluKeLsWsTYaBcscpjHUxst
         I2IOR91gwEOyQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following are the summary of changes.
* Update ADMA device node names for some of Tegra210 DT files.
* Convert ADMA, AGIC and ACONNECT docs to YAML.

Sameer Pujar (4):
  arm64: tegra: Rename ADMA device nodes for Tegra210
  dt-bindings: dma: Convert ADMA doc to json-schema
  dt-bindings: interrupt-controller: arm,gic: Update Tegra compatibles
  dt-bindings: bus: Convert ACONNECT doc to json-schema

 .../bindings/bus/nvidia,tegra210-aconnect.txt      | 44 ----------
 .../bindings/bus/nvidia,tegra210-aconnect.yaml     | 86 ++++++++++++++++++++
 .../bindings/dma/nvidia,tegra210-adma.txt          | 56 -------------
 .../bindings/dma/nvidia,tegra210-adma.yaml         | 95 ++++++++++++++++++++++
 .../bindings/interrupt-controller/arm,gic.yaml     |  9 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  2 +-
 9 files changed, 193 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml

-- 
2.7.4

