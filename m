Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45111C4332D
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Feb 2021 12:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F8A64E2F
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Feb 2021 12:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhBRMRj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Feb 2021 07:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbhBRKfE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Feb 2021 05:35:04 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C93C06178A;
        Thu, 18 Feb 2021 02:34:21 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id q20so989267pfu.8;
        Thu, 18 Feb 2021 02:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AUARRZLqJ9XX8bbBrOxnTHaZfiYVN+5L37UZ27Nk4KU=;
        b=mayISz4WKe2Rx7yL5mg7G0ZzdNFWb6mETyRGChJZ9jbpeMtmicOgSpqVpWxGzoU2qk
         aygH2VGwtkykIq92ohyB24cuOYy7mnMoR5ZBUkQxOUABFaXTOYfczbWy0QwxxOi07wah
         qiqFsbEvEnsbaIDWd9WjC6O3NpapJF3+/6i2D2jI0b7nQ28mz0jNM6ig66AR2mFwc4KN
         gjlrFcqz+uof7caPpuzFd+cysFMPcbIfpKqM/Pe2dXREQd4HFGBwO5xHV9tTZrObk+Ke
         ZH/xgFmnruNIduUnZeTUK98yMgODQYT7Kq75KxZph7kop5swSauAqcbc/knOL38MPgfS
         0hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AUARRZLqJ9XX8bbBrOxnTHaZfiYVN+5L37UZ27Nk4KU=;
        b=oih7UfU5JdTCu+pgfdzlw7gCdMzCfOy7bdV4fT/c1F3mBbSbikhs8KPnvPK1T8pAUp
         z4YI579p/DCue6YpfSV1z4LhHuL2RkD+u94k35rjIlW3s1hFXuAbm6Q8zjoxvKT/doeW
         fCiTh9gHbhpi2cMON0F4qxfOvSTJXiWyoGQ8XEX7eYLGmKsjqiN5MvvDr9VpffKUE5oL
         QTZIyak0O3RU5QowWxYJ/j3KigGOcpAfCQXYSryCIJxdbjDdOjLXC///sTzLHQgydOoO
         pI5kFGmVdJcgBW7F3h6LhBee9YN9Rv459qdt2T6CKunDbSfkQu+JMJH9jZKhuYiHYXgt
         RpjQ==
X-Gm-Message-State: AOAM532LZFNC5Ig9GNFbbYs+gAGCJnTRyJx/EU3TXYjEhQfL4OHbREEv
        wpsbASA8+tAdwuO88VQyPqw=
X-Google-Smtp-Source: ABdhPJw8sqq3/6ytTP2sJodQe38x8kS2JSRqOgJ+91HjsndJUWjQUFczaDbwaUFyNFdoqeHAW5ph7w==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id l7-20020a056a0016c7b02901b668a6985amr3818246pfc.44.1613644460501;
        Thu, 18 Feb 2021 02:34:20 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n10sm5449006pgk.91.2021.02.18.02.34.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 02:34:20 -0800 (PST)
Date:   Thu, 18 Feb 2021 02:35:11 -0800
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
Message-ID: <20210218103510.GA13060@Asurada-Nvidia>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
 <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
 <20210210082052.GA11455@Asurada-Nvidia>
 <df170d15-f5b5-4238-f998-5b8f8e45849a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <df170d15-f5b5-4238-f998-5b8f8e45849a@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guillaume,

Thank you for the test results! And sorry for my belated reply.

On Thu, Feb 11, 2021 at 03:50:05PM +0000, Guillaume Tucker wrote:
> > On Sat, Feb 06, 2021 at 01:40:13PM +0000, Guillaume Tucker wrote:
> >>> It'd be nicer if I can get both logs of the vanilla kernel (failing)
> >>> and the commit-reverted version (passing), each applying this patch.
> >>
> >> Sure, I've run 3 jobs:
> >>
> >> * v5.11-rc6 as a reference, to see the original issue:
> >>   https://lava.collabora.co.uk/scheduler/job/3187848
> >>
> >> * + your debug patch:
> >>   https://lava.collabora.co.uk/scheduler/job/3187849
> >>
> >> * + the "breaking" commit reverted, passing the tests:
> >>   https://lava.collabora.co.uk/scheduler/job/3187851
> > 
> > Thanks for the help!
> > 
> > I am able to figure out what's probably wrong, yet not so sure
> > about the best solution at this point.
> > 
> > Would it be possible for you to run one more time with another
> > debugging patch? I'd like to see the same logs as previous:
> > 1. Vanilla kernel + debug patch
> > 2. Vanilla kernel + Reverted + debug patch
> 
> As it turns out, next-20210210 is passing all the tests again so
> it looks like this got fixed in the meantime:
> 
>   https://lava.collabora.co.uk/scheduler/job/3210192

I checked this passing log, however, found that the regression is
still there though test passed, as the prints below aren't normal:
  tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
	 EMEM address decode error (SMMU translation error [--S])
  tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
	 Page fault (SMMU translation error [--S])

I was trying to think of a simpler solution than a revert. However,
given the fact that the callback sequence could change -- guessing
likely a recent change in iommu core, I feel it safer to revert my
previous change, not necessarily being a complete revert though.

I attached my partial reverting change in this email. Would it be
possible for you to run one more test for me to confirm it? It'd
keep the tests passing while eliminating all error prints above.

If the fix works, I'll re-send it to mail list by adding a commit
message.

Thanks!
Nicolin

--/04w6evG8XlLl3ft
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-iommu-tegra-smmu-Fix-mc-errors-on-tegra124-nyan.patch"

From a9950b6e76e279f19d2c9d06aef1e222b020a9e2 Mon Sep 17 00:00:00 2001
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Thu, 18 Feb 2021 01:11:59 -0800
Subject: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan

  tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
	 EMEM address decode error (SMMU translation error [--S])
  tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
	 Page fault (SMMU translation error [--S])

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 72 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 4a3f095a1c26..97eb62f667d2 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -798,10 +798,70 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
+static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
+{
+	struct platform_device *pdev;
+	struct tegra_mc *mc;
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		return NULL;
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return NULL;
+
+	return mc->smmu;
+}
+
+static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
+				struct of_phandle_args *args)
+{
+	const struct iommu_ops *ops = smmu->iommu.ops;
+	int err;
+
+	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
+	if (err < 0) {
+		dev_err(dev, "failed to initialize fwspec: %d\n", err);
+		return err;
+	}
+
+	err = ops->of_xlate(dev, args);
+	if (err < 0) {
+		dev_err(dev, "failed to parse SW group ID: %d\n", err);
+		iommu_fwspec_free(dev);
+		return err;
+	}
+
+	return 0;
+}
+
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
-	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
+	struct device_node *np = dev->of_node;
+	struct tegra_smmu *smmu = NULL;
+	struct of_phandle_args args;
+	unsigned int index = 0;
+	int err;
+
+	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
+					  &args) == 0) {
+		smmu = tegra_smmu_find(args.np);
+		if (smmu) {
+			err = tegra_smmu_configure(smmu, dev, &args);
+			of_node_put(args.np);
 
+			if (err < 0)
+				return ERR_PTR(err);
+
+			break;
+		}
+
+		of_node_put(args.np);
+		index++;
+	}
+
+	smmu = dev_iommu_priv_get(dev);
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
 
@@ -1028,6 +1088,16 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	if (!smmu)
 		return ERR_PTR(-ENOMEM);
 
+	/*
+	 * This is a bit of a hack. Ideally we'd want to simply return this
+	 * value. However the IOMMU registration process will attempt to add
+	 * all devices to the IOMMU when bus_set_iommu() is called. In order
+	 * not to rely on global variables to track the IOMMU instance, we
+	 * set it here so that it can be looked up from the .probe_device()
+	 * callback via the IOMMU device's .drvdata field.
+	 */
+	mc->smmu = smmu;
+
 	size = BITS_TO_LONGS(soc->num_asids) * sizeof(long);
 
 	smmu->asids = devm_kzalloc(dev, size, GFP_KERNEL);
-- 
2.17.1


--/04w6evG8XlLl3ft--
