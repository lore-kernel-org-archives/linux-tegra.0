Return-Path: <SRS0=3r2u=BO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A4BC433E0
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 16:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C433B20722
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 16:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="aT9PPvii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgHDQsR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Aug 2020 12:48:17 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:6981 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgHDQsO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 4 Aug 2020 12:48:14 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f29913c0001>; Wed, 05 Aug 2020 00:47:56 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Aug 2020 09:47:56 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Tue, 04 Aug 2020 09:47:56 -0700
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Aug
 2020 16:47:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 4 Aug 2020 16:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn+VvQjjawlknpqF3rTeubQ2iDCezHGfNtX54EnDY/lS5sTzJKwLepqEsjOyf4KfONRO1RbmhY2uQgZtyMVJtHZamrjMFKQhORPuGu4vCqplyleCj5n7q6CkBzD3xolfiWX2tjozrUCPFVoMXKBzin+sHCP98I8key9uckjehWnHGCgFZthCW9D6WYEsjDm7dg4ZPftdQ4a2B/YfhA4J8S6GKAQkYY/BwWDMREH3FJ9PMF+HG0kV7JQjhfEgf4kUq7xoTl7Z6B63a4UyosLNHAlAHgNyD0dZgTgOGLTw7YPKUjeTWZ+GZ7IjGGMqO7BuFTyyGz6//vOSEJdrT0jiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW71pblZvV3Du6P7iIE89Fy59MZlMtw6UKsSrED9DAk=;
 b=NSjbNv2Oa4kXfg/qfwGENCdOT9FbcG3TvMQyn9ePZBHUMYLKRKHGeRd0ajX+ETLyxuTsg0Lbc7d8pN4wFwblVkv7Rc/mspJrMQ8jAJfVkzTLNYDUwjvBuvdgk2P4oiN7j2kUq3mfIuCte4Sfb3IOASxWkeGyuojGd4itAwBjvNswrlstZk17butt/JrV5dsY73GiH40tky4PQEZLNbTRHslzaEKQUl1g+wnJFfrx7YT4K9WSu4hk/pOoF/puhu4szzWDExNeXqIh351HM4HXLvZf9UV+v1lavc3HQhrFOkXfzSJMS47uZwHW085Can2BcWzgmgpTRzn77fBIkPZBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BYAPR12MB2839.namprd12.prod.outlook.com (2603:10b6:a03:72::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 16:47:53 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::29bb:d297:d2f6:3c9d]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::29bb:d297:d2f6:3c9d%3]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 16:47:53 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Ashish Mhetre <amhetre@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@nvidia.com>,
        Sachin Nikam <Snikam@nvidia.com>
CC:     SW-Mobile-Linux-Upstreaming 
        <SW-Mobile-Linux-Upstreaming@exchange.nvidia.com>,
        SW-Mobile-Memory-Core <SW-Mobile-Memory-Core@exchange.nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH] iommu/dma: Add support for mapping memory as device
 memory
Thread-Topic: [PATCH] iommu/dma: Add support for mapping memory as device
 memory
Thread-Index: AQHWajRRBFSQPTc29UeIgsd35SD93KkoKAJQ
Date:   Tue, 4 Aug 2020 16:47:52 +0000
Message-ID: <BYAPR12MB2822CC35CFA8F6B15E7514E8B34A0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <1596527558-22566-1-git-send-email-amhetre@nvidia.com>
In-Reply-To: <1596527558-22566-1-git-send-email-amhetre@nvidia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-08-04T16:47:51.4900532Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=9a8de47b-a003-49f5-84df-c20fcacdc34d;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef72e2c6-97d9-47e1-a826-08d838962180
x-ms-traffictypediagnostic: BYAPR12MB2839:
x-ld-processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28399FB18A3ABDD03100AFBFB34A0@BYAPR12MB2839.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pOI6xWT/SkAHsv8iA3J5MJJKHOI4qTwL5LkJicem2aoS8hFLtkbO7Wlub+0ILYdieUr7yKTe15adWTDnura3zj6+F3KQkj8zM2GYEaO9QCi4dJ628szvk4MsBYVwXfSWIGixpxi1umbi5dMiNUw5jTRH6TanJHnIZFOCParwayPsCA9JHHmt83roDX5lpz9sn28MDwngWZUctvay7KER95btxkOsr1/5pwSP+l+4GJKrk1o5kIvY5abFZBz+aQjJJBPyCW7Xoo9xn0c5FgOaRdK26XyH6VIltlWlijV3S/8IToJQOWbeqRc0PVbquYvB2jrKKYd1DrzSBqopRCohGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(4326008)(54906003)(6506007)(66446008)(64756008)(66556008)(5660300002)(83380400001)(55016002)(8676002)(6636002)(76116006)(9686003)(2906002)(186003)(66946007)(53546011)(86362001)(110136005)(7696005)(52536014)(71200400001)(33656002)(316002)(8936002)(26005)(66476007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EuRLJaeJvnlzx7Z9mdY7KeX3ZL20Vgn3kwg87J9/O71leOBcBYH4X+t/naoNbzlECFxcpRG0qKvrfLOmougvQ3rrrFiqjzcdqeroV6pZT+QD3IcEWwga8f3mWrpr4CIVmK+Ri+ylIjksu+m0pCzaB0PoVuruJaOWACZSmXzECapysDRLA9ZvGC2EBz2R4kNHEtqayRJ6HYvH3C7e60OHPEN2eQaxMNrohhRlMdz8d13zgpVnf4nviOSa3HeEBkMxu+a5yTSNl+o71rx1N9pFzycXXXN3Dc4xJlzUC088nkMNZiKV/EN7sEjqqGyvVI4k5BvTbDENbVPkHYRVyE+w/bSqB9rregEhTkCCsqLVPohLzR8YF9wCT633c7KrejJtxg58eBj1PuttnrEWOCZcb1oD5qpqCg7YZ3Hl/gBpS+hDFjDX6Zw+t4cYQJswHDs65dWeaVGSH2MYOYpXY6a6yoeXwvFX+TmKtr5Wm2QBBEcrql9IBtuZsTv+DAwf5sAIgT4lyJlHiPve+mwz1TiCO7m3l8b9Z5slRxO7GOE411KYWtaqqVBtSMvTufnNWrRwb0BW75qGie/AYPRQ5hNZKEzgA9Un9vZPRRPlrmgR95m0VeR4DNoVDicpeJrNVULrBEVS2b/vjQhR5389oisJNA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef72e2c6-97d9-47e1-a826-08d838962180
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 16:47:52.9825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vh8KobhrQkX/QePSQ6/GtX9zJLcc8PBMv3OIhbDjfwA2cOP6FJ7vRFX32ZWU/fOG5uC2bez/gozeYyosTcZqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2839
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596559676; bh=IW71pblZvV3Du6P7iIE89Fy59MZlMtw6UKsSrED9DAk=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-ld-processed:x-ms-exchange-transport-forked:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=aT9PPvii1VlIR0RPG4db4EhUQ1O20V+yHf2cNIM2JDILz0YLkVfUpy3/IZMoQkW2p
         yYb4EKb33IejpKnss31QQYAmI4vRWaUmbWNHz7QevRUuFEmfX6XAN0S2oi8A5A3CcF
         yuo6/VkR58y510IxM1XWSNDkQkiG76nz0hF9ATo8mr7Hey4pFjGpdaO5rFcQB8br5l
         Q26ZtOpWIvUna4LQjH1qWW5H7NCYS1gPbMivHDWBXwKRzcrkmqH6bCtOD2qpcEhbWm
         o8688l/auPocUDcI5G6+hsMF6macCmjG/XNXn74gcag+Fw+dmiIvzTkyLhdH4Dx6yI
         bKzz3gCNrPitw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Can you explain why it is necessary? Can you also include a client driver p=
atches that uses this new attribute?=20
Including the patches that uses this attribute would make it easy to upstre=
am.

-KR

-----Original Message-----
From: Ashish Mhetre <amhetre@nvidia.com>=20
Sent: Tuesday, August 4, 2020 12:53 AM
To: Krishna Reddy <vdumpa@nvidia.com>; Thierry Reding <treding@nvidia.com>;=
 Jonathan Hunter <jonathanh@nvidia.com>; Stephen Warren <swarren@nvidia.com=
>; Sachin Nikam <Snikam@nvidia.com>
Cc: SW-Mobile-Linux-Upstreaming <SW-Mobile-Linux-Upstreaming@exchange.nvidi=
a.com>; SW-Mobile-Memory-Core <SW-Mobile-Memory-Core@exchange.nvidia.com>; =
linux-tegra@vger.kernel.org; Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH] iommu/dma: Add support for mapping memory as device memory

Add DMA_ATTRS_DEVICE_MAP attribute to support mapping memory as device memo=
ry.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/dma-iommu.c   | 3 +++
 include/linux/dma-mapping.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c index 65=
ac889..0e411ef 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -388,6 +388,9 @@ static int dma_info_to_prot(enum dma_data_direction dir=
, bool coherent,
 	if (attrs & DMA_ATTR_PRIVILEGED)
 		prot |=3D IOMMU_PRIV;
=20
+	if (attrs & DMA_ATTR_DEVICE_MAP)
+		prot |=3D IOMMU_MMIO;
+
 	switch (dir) {
 	case DMA_BIDIRECTIONAL:
 		return prot | IOMMU_READ | IOMMU_WRITE; diff --git a/include/linux/dma-m=
apping.h b/include/linux/dma-mapping.h index 330ad58..b0cb1b3 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -68,6 +68,12 @@
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
=20
 /*
+ * DMA_ATTR_DEVICE_MAP: This specifies DMA-mapping subsystem to map=20
+memory
+ * as device memory.
+ */
+#define DMA_ATTR_DEVICE_MAP		(1UL << 10)
+
+/*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.
  * It can be given to a device to use as a DMA source or target.  A CPU ca=
nnot
  * reference a dma_addr_t directly because there may be translation betwee=
n
--
2.7.4

