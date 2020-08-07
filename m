Return-Path: <SRS0=/ZgJ=BR=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5EBC433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Aug 2020 15:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C59582075D
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Aug 2020 15:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="N8G/NmH2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHGPwB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Aug 2020 11:52:01 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11782 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGPwB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Aug 2020 11:52:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2d783b0001>; Fri, 07 Aug 2020 08:50:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Aug 2020 08:52:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Aug 2020 08:52:00 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 15:52:00 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 6A24E40BDB; Fri,  7 Aug 2020 18:51:58 +0300 (EEST)
Date:   Fri, 7 Aug 2020 18:51:58 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: Bindings for reserved memory for BPMP mail
Message-ID: <20200807155158.GA16581@pdeschrijver-desktop.Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596815419; bh=ht4vgUQO1RJqhWnPQymkGp4AS5aK1a3hGCJaokIICPI=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:MIME-Version:
         Content-Type:Content-Disposition:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy;
        b=N8G/NmH2nRQWuGfTVCHQfaXyrZGv+zJuKRgUTOrQhKmTj4esZ1lcqRu5VvZjoGd3T
         P7h3b8rSiV1n1M7IZV9Dp2meUS2XBAd0RKzaMDkndf0KjlwDD2/FRLp5JVoDOaoks+
         vdRmEbpfTzS8Rbr8NqHMNgH7PctWQfqvCpo4XQEMGDpddz0r3zlSJ4LnnOr/PJS7Ds
         XMXnV6LVcriqL1Ja16RCEyYwGMOc1l2YJ0yW8Uh1UjTEwb+zpeU6EfZy0LiuLyYDWM
         AS8Sx7WB7s5111ZN3vgJGSLio+LPQKi+ZQGnfKv5b8T01VQuxkPS6/c+TOFhR2G/qt
         GqrdsWGtyyeJg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra234 will use DRAM to store the messages exchanged between Linux and
BPMP firmware rather than sysram as used in Tegra186 and Tegra194. The
kernel will be informed about the size and location of the DRAM area to
be used using the DT reserved memory bindings.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.txt         | 38 ++++++++++++++++++-
 .../reserved-memory/tegra234-bpmp-shmem.txt   | 33 ++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
index ff380dadb5f9..ff8fc4b6816d 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
@@ -13,12 +13,18 @@ Required properties:
     One of:
     - "nvidia,tegra186-bpmp"
 - mboxes : The phandle of mailbox controller and the mailbox specifier.
-- shmem : List of the phandle of the TX and RX shared memory area that
-	  the IPC between CPU and BPMP is based on.
 - #clock-cells : Should be 1.
 - #power-domain-cells : Should be 1.
 - #reset-cells : Should be 1.
 
+Optinal properties:
+- shmem : List of the phandle of the TX and RX shared memory area that
+	  the IPC between CPU and BPMP is based on.
+- memory-region : phandle to reserved memory region used for IPC between
+	  CPU-NS and BPMP.
+One 1 of the above 2 properties must be present. In case both are present
+memory-region will take precedence and shmem will be ignored.
+
 This node is a mailbox consumer. See the following files for details of
 the mailbox subsystem, and the specifiers implemented by the relevant
 provider(s):
@@ -105,3 +111,31 @@ bpmp {
 		...
 	};
 };
+
+memory-region binding for BPMP
+------------------------------
+
+The shared memory area for the IPC TX and RX between CPU-NS and BPMP
+resides in normal SDRAM and is defined using a sub-node of the reserved-memory
+node. See ../reserved-memory/nvidia,tegra234-bpmp-shmem.txt for binding.
+
+Example:
+
+hsp_top: hsp@3c00000 {
+	...
+	#mbox-cells = <2>;
+};
+
+bpmp: bpmp {
+	compatible = "nvidia,tegra234-bpmp", "nvidia,tegra186-bpmp";
+	mboxes = <&hsp_top TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
+	memory-region = <&dram_cpu_bpmp_mail>;
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+	#power-domain-cells = <1>;
+
+	i2c {
+		compatible = "...";
+		...
+	};
+};
diff --git a/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt b/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
new file mode 100644
index 000000000000..44338184d94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
@@ -0,0 +1,33 @@
+* Tegra CPU-NS - BPMP IPC reserved memory binding
+
+Define a memory region used for communication between CPU-NS and BPMP.
+Typically this node is created by the bootloader as the physical address
+has to be known to both CPU-NS and BPMP for correct IPC operation.
+
+The memory region is defined using a child node under /reserved-memory.
+The sub-node is named shmem@<address> and has the following properties:
+
+- compatible:
+	compatible = "nvidia,tegra234-bpmp-shmem";
+
+- reg:
+	The physical address and size of the shared SDRAM region
+
+- no-map:
+	To prevent the OS from creating a virtual mapping for this region.
+	(See reserved-memory.txt for deatils on the no-map property)
+
+Example:
+
+/ {
+	reserved-memory {
+		...
+		dram_cpu_bpmp_mail: shmem@0xf1be0000  {
+			compatible = "nvidia,tegra234-bpmp-shmem";
+			reg = <0x0 0xf1be0000 0x0 0x2000>;
+			no-map;
+		};
+
+		...
+	};
+};
-- 
2.17.1


