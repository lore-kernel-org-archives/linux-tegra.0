Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF120C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 09:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72AD364FBF
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 09:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbhBEJxq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 04:53:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhBEJqc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 04:46:32 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11421C0617AB;
        Fri,  5 Feb 2021 01:45:17 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q131so3955135pfq.10;
        Fri, 05 Feb 2021 01:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ij/h85oXJKLKfOyNytBFaR/zwWNpKnRCXwdnAmKNlzA=;
        b=FyF9PPnS5DuNfyg1/r5SwuLubGJE9DhIHqi0HstEy7Q26ja32WJclNimxmWBKfmYZe
         OOS0VirmPcRQJZU4SX+vYFm6FQ6cL3L86h8N40BvZTUq/RW5IJFLczEX4nb1ROXlkCX/
         SZlLoOw627cl6PEB4XZXoq/eI+kicCRu9MxLL11TIB5WzAiqf0QQ2OUXKtvSrnnlJXR6
         57DY7CMEtOGpSE0pIPa+dE20xIwHVwVoPf/H5vXWAmshPQ+iVZeFxwXu14hwIO2Hxlie
         9IRF8WCdIqXysd7CwKv/Vbh4xkiKlFozWKfFCF8WsdFwpopJg2LNecPa9UrO9VoCEn7H
         D4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ij/h85oXJKLKfOyNytBFaR/zwWNpKnRCXwdnAmKNlzA=;
        b=BF3YQ55j9b+Irb9z7hGdc99irXOaQrj9Rm790L2W2aI9uNTJJvdSIuBz40EOsZkzbg
         FpY/wV8WGfkssftEXT7/Ijbu7l4MNtQAAMUAwivIKLLriBkrEywOLwBtbod9A7id/bYr
         zz03iy+bhIS7z5slD94rbG3/Ri/xchFz+bRHEzHHQPeZ81mNSWJ6TfXF6m97ERvdBZi3
         GTo0EF43ze+9qA+13ZbQ301WmQnNrQTchlJREi1lhSDqi18XSaLibL/7VSqsE/dEoH2g
         F3OnvK2GqrS4A5gE4z6XKl/ky1Cwx/hnhOw8Cd0lzrJPhs2fHBcBpagv8clpC70fPT3U
         /Lxg==
X-Gm-Message-State: AOAM531nONRK34RjaQbWIG6onKkDyS7g6Up7zOWEdVRF5eKCNhsWps75
        MWks+HS/CnmwBa79wzEW5PY=
X-Google-Smtp-Source: ABdhPJxRaDYB7eWp5Jmy7gQItXlnWORYO0/RGgu2LTC/6884HlnPqyeaxMfAGGLIhv5B45MiK/JptQ==
X-Received: by 2002:a62:1a06:0:b029:1bc:21e:ed47 with SMTP id a6-20020a621a060000b02901bc021eed47mr3598773pfa.40.1612518316620;
        Fri, 05 Feb 2021 01:45:16 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id c5sm8805679pfi.5.2021.02.05.01.45.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 01:45:16 -0800 (PST)
Date:   Fri, 5 Feb 2021 01:45:57 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     will@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com,
        joro@8bytes.org, kernel@collabora.com,
        Dmitry Osipenko <digetx@gmail.com>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
Message-ID: <20210205094556.GA32677@Asurada-Nvidia>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20210205052422.GA11329@Asurada-Nvidia>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guillaume,

On Thu, Feb 04, 2021 at 09:24:23PM -0800, Nicolin Chen wrote:
> > Please let us know if you need any help debugging this issue or
> > to try a fix on this platform.
> 
> Yes, I don't have any Tegra124 platform to run. It'd be very nice
> if you can run some debugging patch (I can provide you) and a fix
> after I root cause the issue.

Would it be possible for you to run with the given debugging patch?

It'd be nicer if I can get both logs of the vanilla kernel (failing)
and the commit-reverted version (passing), each applying this patch.

Thanks in advance!
Nicolin

--EVF5PPMfhYS0aIcm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-iommu-debug-tegra-smmu.patch"

From 80f288d7101101fca0412c5c200cea7e203a675d Mon Sep 17 00:00:00 2001
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Fri, 5 Feb 2021 01:41:07 -0800
Subject: [PATCH] iommu: debug tegra-smmu

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 4a3f095a1c26..796b7df54b8f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -363,6 +363,7 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value |= SMMU_ASID_VALUE(asid);
 		value |= SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		pr_alert("--------%s, swgroup %d: writing %x to reg1 %x\n", __func__, swgroup, value, group->reg);
 	} else {
 		pr_warn("%s group from swgroup %u not found\n", __func__,
 				swgroup);
@@ -379,6 +380,7 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value = smmu_readl(smmu, client->smmu.reg);
 		value |= BIT(client->smmu.bit);
 		smmu_writel(smmu, value, client->smmu.reg);
+		pr_alert("--------%s, swgroup %d: writing %x to reg2 %x\n", __func__, swgroup, value, client->smmu.reg);
 	}
 }
 
@@ -491,13 +493,19 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	unsigned int index;
 	int err;
 
+	dev_alert(dev, "-------%s: smmu %s\n", __func__, smmu ? "valid" : "NULL");
+	dump_stack();
 	if (!fwspec)
 		return -ENOENT;
 
+	dev_alert(dev, "-------%s: fwspec->num_ids %d\n", __func__, fwspec->num_ids);
 	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
-		if (err)
+		if (err) {
+			dev_err(dev, "failed to prepare as(%d) for fwspec %d",
+				as->id, fwspec->ids[index]);
 			goto disable;
+		}
 
 		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
@@ -805,6 +813,8 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
 
+	dev_alert(dev, "--------%s, %d\n", __func__, __LINE__);
+	dump_stack();
 	return &smmu->iommu;
 }
 
@@ -904,6 +914,8 @@ static int tegra_smmu_of_xlate(struct device *dev,
 
 	dev_iommu_priv_set(dev, mc->smmu);
 
+	dev_alert(dev, "-------%s: id %d", __func__, id);
+	dump_stack();
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
-- 
2.17.1


--EVF5PPMfhYS0aIcm--
