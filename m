Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACCAC4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75BAB20BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5d9C8QP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgI2GS4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 02:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI2GS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 02:18:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0FDC0613D0;
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d13so3011520pgl.6;
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7/FgS/Bu4Sm/fvo7Kw9FiL37U/scbZL5l1h7O/ec2LY=;
        b=u5d9C8QP7pX6TR4cjb2BXigfMhHFBN/IE37xTN/FotpT2LDHCf7xdI/v5ncgR/Qio7
         ijuWo0LqrkynH1CZLhUvG8MLopNAWs4rIXBluF84oqMpicliVKqQw6fjNseSjlOhruwM
         yvIntkub8J8LKMMVQq0f4pl6iQx5tinvDvq5y7HdXBmrvnNqIyFCCn2TvEg/Ig+ua7Q3
         KOwBSlB/seahfVqeo0NbYgaXTovchyVFTiR5PEhQt4dSfFS2sxxv57VH5YNYWJoYDq0u
         ESe4wN3RxKxFgWBsNakhLy4jnUaP2hO/kBx3VUI05XCXIUBQIBVxFy/TeU2Hjrnpiu4A
         /4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7/FgS/Bu4Sm/fvo7Kw9FiL37U/scbZL5l1h7O/ec2LY=;
        b=m5pMxGMmK4DDqywuHDUrNskmOCPSIX6GVEyvWq71dlVW/3vjbD/rDbQ42egj3Ml2fN
         +YAayexs8PPq/hDWHvwKoN34inQU+GmyQiGat5W2l0sGdVCCZcb4n02wMsQJqnqfLOYq
         DHNXVKadvjpX+Dr7AnsG54LcPcLqtMlp2iAek5znc2apezCgmuwX+vC6HjSeQAFxuop2
         S0IQS0SM6BFuxw2Cy8WMKKZYVaEK8ZW2oJxDddm6U3yQgtFKEAuNYijlr5RwuBaxOjQR
         bHbLBiw04ZeCfayBazocoaVHonfpUY2HZ57p4VvFjiCYl9IFTj+SxJB8muXod7ZNarT8
         IjXg==
X-Gm-Message-State: AOAM532Dguf3Q9mkSfxPL1rvCb4oMcAD/yJ94wnYNJV5pcHV5xfbgkGV
        nCItuIPdqiHmhVX58K+jXNs=
X-Google-Smtp-Source: ABdhPJxGI4JOU4vSr3MJXdzYNl+0jiOTY4oc4TF9Hm7jf+DDZR02RKXue3xKWNYtOdHYTa75l60wiw==
X-Received: by 2002:a63:f70e:: with SMTP id x14mr2039284pgh.407.1601360335436;
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id cf7sm3280562pjb.52.2020.09.28.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
Subject: [PATCH v4 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Mon, 28 Sep 2020 23:13:24 -0700
Message-Id: <20200929061325.10197-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929061325.10197-1-nicoleotsuka@gmail.com>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_smmu_group_get was added to group devices in different
SWGROUPs and it'd return a NULL group pointer upon a mismatch at
tegra_smmu_find_group(), so for most of clients/devices, it very
likely would mismatch and need a fallback generic_device_group().

But now tegra_smmu_group_get handles devices in same SWGROUP too,
which means that it would allocate a group for every new SWGROUP
or would directly return an existing one upon matching a SWGROUP,
i.e. any device will go through this function.

So possibility of having a NULL group pointer in device_group()
is upon failure of either devm_kzalloc() or iommu_group_alloc().
In either case, calling generic_device_group() no longer makes a
sense. Especially for devm_kzalloc() failing case, it'd cause a
problem if it fails at devm_kzalloc() yet succeeds at a fallback
generic_device_group(), because it does not create a group->list
for other devices to match.

This patch simply unwraps the function to clean it up.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v2->v4:
 * N/A
v1->v2:
 * Changed type of swgroup to "unsigned int", following Thierry's
   commnets.

 drivers/iommu/tegra-smmu.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0becdbfea306..ec4c9dafff95 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -903,10 +903,12 @@ static void tegra_smmu_group_release(void *iommu_data)
 	mutex_unlock(&smmu->lock);
 }
 
-static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
-						unsigned int swgroup)
+static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *soc;
+	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
@@ -950,19 +952,6 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 	return group->group;
 }
 
-static struct iommu_group *tegra_smmu_device_group(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
-	struct iommu_group *group;
-
-	group = tegra_smmu_group_get(smmu, fwspec->ids[0]);
-	if (!group)
-		group = generic_device_group(dev);
-
-	return group;
-}
-
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
-- 
2.17.1

