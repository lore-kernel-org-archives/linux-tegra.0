Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DFC43461
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 18:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 645BC20872
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 18:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Ft9IxLhr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgIOSji (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:39:38 -0400
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:15409
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728022AbgIOSjZ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 14:39:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RArpkZ/l/P0gBhyiVnFzlnK1+ltpu4x88FRuCdWtNwWkp98mExU2EARfU6VG5otrPM9YMztHQ/zNIMyLWyYeDSehv+5ddUu5QkXHHrPXqkcHNzmYi/ERU4FdoINvsO0vS4BwlbEdx7+wtX0wfgwsnyORrfNfHGuXiyS1GCBCOdPHP7YfyO9HbWENIeHr4NEhKRcC1qdLa1GgV9F9xiTcV35GTG9B98p17FI7Dcmdoy5O8kN2yk4QEPzW+msX7k0AmzfXVF4ub8AMUSXd/UHcD3pRDMGcul4U5uWl9czAi4Uclw9huD+9RW5oEjZtfYzlCedo3XonK4F5T9S6WNrTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIO+lhNFgioRkRyGhdB1I3Uj8gi/oxj23FCH5WSe8E=;
 b=R8H8SkAXciLhrprBnQK3SHbWsJcLCXqoT+g20E1/ybgGhxqZtPiDOGOmY/LrTSxcpGB73tZW5v1PNPMcgwEzSZMJdunPyGyb+IohPUaPR8BO2oj2GZkHVfq647GrY3z9KniynTif8AVTOztHi1kEtPjQOLSScdWMVRNUP4xQLbCzGB+Kfj9GTwzzxOTbf1K+UAkqii38ibdb+kBBQr49WLJLJh8RjphzYqjDNYKUdZZhOGHIvovYgMzNgpj8qUJI3LwCXulrTIIc9F1n4FS+99hApKJrfmt6b9+AGfaSps5cJLpvUeMu5jyKWPcKjQLuB7YD69qLPjzISQqhD+zOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIO+lhNFgioRkRyGhdB1I3Uj8gi/oxj23FCH5WSe8E=;
 b=Ft9IxLhrSyAZPH7YXskNwwHcjwsioZd1gYOVg7DJ49DbK3VXAIGTwQZq6Glqpt3+ujNcSgKehvmyZBDWmlOiekjX6vYBG7i/63A/aBX5gGzuEwyXfvt9wM1DbWvK0PScJ0JlBQD0msFJtI3bvUvSgDPCXYHOa2r5LaLrKnngICs=
Received: from SN4PR0501CA0139.namprd05.prod.outlook.com
 (2603:10b6:803:2c::17) by BL0PR02MB3843.namprd02.prod.outlook.com
 (2603:10b6:207:3e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 18:39:16 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2c:cafe::ab) by SN4PR0501CA0139.outlook.office365.com
 (2603:10b6:803:2c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend
 Transport; Tue, 15 Sep 2020 18:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 18:39:16
 +0000
Received: from [149.199.38.66] (port=33529 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1kIFrC-00079p-6M; Tue, 15 Sep 2020 11:39:10 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1kIFrI-0001lD-0V; Tue, 15 Sep 2020 11:39:16 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08FId9kc008886;
        Tue, 15 Sep 2020 11:39:09 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1kIFrB-0001kK-AQ; Tue, 15 Sep 2020 11:39:09 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
        id 491F2352CB5; Tue, 15 Sep 2020 11:39:09 -0700 (PDT)
Date:   Tue, 15 Sep 2020 11:39:09 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Michal Simek <michals@xilinx.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "emil.velikov@collabora.com" <emil.velikov@collabora.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
        "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
        "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "kgene@kernel.org" <kgene@kernel.org>,
        "bskeggs@redhat.com" <bskeggs@redhat.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "matthew.auld@intel.com" <matthew.auld@intel.com>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "andi.shyti@intel.com" <andi.shyti@intel.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "marek.olsak@amd.com" <marek.olsak@amd.com>,
        "tianci.yin@amd.com" <tianci.yin@amd.com>,
        "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "evan.quan@amd.com" <evan.quan@amd.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
        "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
        "aaron.liu@amd.com" <aaron.liu@amd.com>,
        "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
        "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
        "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
        "hjc@rock-chips.com" <hjc@rock-chips.com>,
        "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
        "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
        "nirmoy.das@amd.com" <nirmoy.das@amd.com>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH v2 20/21] drm/xlnx: Initialize DRM driver instance with
 CMA helper macro
Message-ID: <20200915183909.GA2471550@xilinx.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-21-tzimmermann@suse.de>
 <20200915155346.GA26029@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155346.GA26029@pendragon.ideasonboard.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a08eb784-7c2d-4b5d-737f-08d859a6a687
X-MS-TrafficTypeDiagnostic: BL0PR02MB3843:
X-Microsoft-Antispam-PRVS: <BL0PR02MB38435935F57FA757CF2846C9D6200@BL0PR02MB3843.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:157;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5bh9p8yPdraqnUk+xpYEA9i315rY+tyWwgDCieDtcnxN/f08b8LfgTIPR0GVDc5TRbMRXbHtIXk9bwONidsek5dZEXL+1y34WGM3WdbloNejuTXRi0u7TVejfJUu6BbouAoHtr7XSuNv/iPrCOZdzQkV2YIy+PArroWHUXic6Shn0pF4O80yuLM7tjzcp2iKGSrKvqYXw0TBXGOJg5JyFqV6kFN5VAMDTsLwzN7Hit4ODczPUGyZgtP4XT6nPUqqiitbhxAr1EuURtpmENziPCH4vQXR+nDXArcpQd4278wALBESD7chGXylksQ6s3YQyYjsKlYVatWB7uEKLed35BqRz3Gy46Mhnug4dwY7t+Rj2tVLG/yba9zNZG8kGqGOmxIOMyILOdQTgk+Ki6V7uCriWFAGUbxgsYixwbVMMx/uT4iwgSiPOdzqnhhrleSZ3KhArLnfwy/3ExD2W9jQg==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(396003)(376002)(39860400002)(346002)(46966005)(82310400003)(2906002)(36756003)(8676002)(54906003)(83380400001)(44832011)(70586007)(82740400003)(70206006)(356005)(5660300002)(1076003)(47076004)(81166007)(2616005)(450100002)(4326008)(478600001)(426003)(6266002)(336012)(316002)(26005)(186003)(42186006)(33656002)(6862004)(8936002)(966005)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 18:39:16.6223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a08eb784-7c2d-4b5d-737f-08d859a6a687
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3843
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Tomas,

Thanks for the patch.

On Tue, Sep 15, 2020 at 08:53:46AM -0700, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patch.
> 
> On Tue, Sep 15, 2020 at 04:59:57PM +0200, Thomas Zimmermann wrote:
> > The xlnx driver uses CMA helpers with default callback functions.
> > Initialize the driver structure with the rsp CMA helper macro. The
> > driver is being converted to use GEM object functions as part of
> > this change.
> > 
> > Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> > to their default implementations, so they are just kept empty now.
> > 
> > v2:
> > 	* initialize with DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE (Laurent)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > index 8e69303aad3f..f3ffc3703a0e 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
> >  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
> >  					  DRIVER_ATOMIC,
> >  
> > -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> > -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> > -	.gem_prime_export		= drm_gem_prime_export,
> > -	.gem_prime_import		= drm_gem_prime_import,
> > -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> > -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> > -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> > -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> > -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> > -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> > -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> > -	.dumb_create			= zynqmp_dpsub_dumb_create,
> > -	.dumb_destroy			= drm_gem_dumb_destroy,
> > +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
> >  
> >  	.fops				= &zynqmp_dpsub_drm_fops,
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
