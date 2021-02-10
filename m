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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F83C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 08:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24C1764E4B
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 08:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhBJIU7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Feb 2021 03:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhBJIUy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 03:20:54 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9FAC061574;
        Wed, 10 Feb 2021 00:20:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id r38so724021pgk.13;
        Wed, 10 Feb 2021 00:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bN8+LfiNtzngdUBYXSpApBthbikVX06+ix6BW2b4aWg=;
        b=qDYB15gK8JX6ZDeswwoEwGJ2xufVymnYMBA3VTOZumhUwZy/0JJtATKD6lwbkL3q6t
         6yYWPhAsFcQX+9RkHBnAPARTikLC4SU+oyIk2DpUI4v+2PSSwhT4vEHsuXswDEfOqemV
         3LaaVXt4IT7/ks2tAmPUZZIreabqJ0OqQ1X26n9lbWOBDyOUif0hDX+bqstWHJDUpCdw
         HZ5jHDiQag1uFfFzI4ZjlV74GMIjmeqSuybjU08MYfHvY9YY603Ukg/VirC/8huxBWb5
         7ir11NhiXLa0Zvq/Zhyz+1LF777vYR2V6N32AEB6qMG8kIfeiyeSbyRxUbX21OR3GidG
         LRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bN8+LfiNtzngdUBYXSpApBthbikVX06+ix6BW2b4aWg=;
        b=gIG0eqrryrxC33t4KUkfTQTImNDfjyUi02BYIZg4ehVcNP374AwZQbWZcjYHCx9K0K
         megP8Dq7cThR1KgzaNN11+hUn7+7Jt5iNlR46tqI8lYEHNog8s/xufA1hGRiAYZ6/VkB
         P3ld7y/AN3tmly0UM6ZQ5k/GCd/ZVrSDbyhCSUOVYjYwjNrzr7XZapn5/Wrt4PUKv4zd
         Js0sy/wrXq1gf2xA2wliUalQLSrwZgnM0RXeUl50l0lf6YvmHInH5OrwrZqa6vXZqI5O
         Mr95ubB2+pYEnfdjv5g0fv1wLADbpmHt10TelOw6BVQgbHLTl88oM67uwrCbC5/QtLrj
         R5ww==
X-Gm-Message-State: AOAM530iffMMwvwt7CWgfGCulbRun7ww4x6Vi5DT50tCcTJq4x65xxk9
        dZKUSfKJEjsgrJ1t9gmO2UUYwoDvF8AA8Q==
X-Google-Smtp-Source: ABdhPJyuQnDmm6LwJMY3H7IP4ztnWgrF6vb/qwMY+bZaAjJ6hnrtfL4F4D0NWf/fh+kiUh1oVeBtLA==
X-Received: by 2002:a65:6392:: with SMTP id h18mr2063066pgv.165.1612945210688;
        Wed, 10 Feb 2021 00:20:10 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y8sm1528098pfe.36.2021.02.10.00.20.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:20:10 -0800 (PST)
Date:   Wed, 10 Feb 2021 00:20:53 -0800
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
Message-ID: <20210210082052.GA11455@Asurada-Nvidia>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
 <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guillaume,

On Sat, Feb 06, 2021 at 01:40:13PM +0000, Guillaume Tucker wrote:
> > It'd be nicer if I can get both logs of the vanilla kernel (failing)
> > and the commit-reverted version (passing), each applying this patch.
> 
> Sure, I've run 3 jobs:
> 
> * v5.11-rc6 as a reference, to see the original issue:
>   https://lava.collabora.co.uk/scheduler/job/3187848
> 
> * + your debug patch:
>   https://lava.collabora.co.uk/scheduler/job/3187849
> 
> * + the "breaking" commit reverted, passing the tests:
>   https://lava.collabora.co.uk/scheduler/job/3187851

Thanks for the help!

I am able to figure out what's probably wrong, yet not so sure
about the best solution at this point.

Would it be possible for you to run one more time with another
debugging patch? I'd like to see the same logs as previous:
1. Vanilla kernel + debug patch
2. Vanilla kernel + Reverted + debug patch

Thank you
Nicolin

--qDbXVdCdHGoSgWSk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-iommu-debug-tegra-smmu-v2.patch"

From dce84731e12900b0e98dffc0ff981638a0bb3405 Mon Sep 17 00:00:00 2001
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Fri, 5 Feb 2021 01:41:07 -0800
Subject: [PATCH] iommu: debug tegra-smmu v2

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 arch/arm/mm/dma-mapping.c       |  6 +++--
 drivers/gpu/drm/tegra/dc.c      |  1 +
 drivers/gpu/drm/tegra/drm.c     |  4 +++
 drivers/iommu/iommu.c           | 47 +++++++++++++++++++++++++++------
 drivers/iommu/tegra-smmu.c      | 31 +++++++++++++++++++++-
 drivers/memory/tegra/tegra124.c |  2 ++
 6 files changed, 80 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index c4b8df2ad328..6a6715817707 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2136,13 +2136,15 @@ static int __arm_iommu_attach_device(struct device *dev,
 	int err;
 
 	err = iommu_attach_device(mapping->domain, dev);
-	if (err)
+	if (err) {
+		dev_alert(dev, "------%s failed with err: %d", __func__, err);
 		return err;
+	}
 
 	kref_get(&mapping->kref);
 	to_dma_iommu_mapping(dev) = mapping;
 
-	pr_debug("Attached IOMMU controller to %s device.\n", dev_name(dev));
+	pr_alert("Attached IOMMU controller to %s device.\n", dev_name(dev));
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0ae3a025efe9..96af9186e81a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2033,6 +2033,7 @@ static int tegra_dc_init(struct host1x_client *client)
 	struct drm_plane *cursor = NULL;
 	int err;
 
+	dev_alert(dc->dev, "-----------%s, %d\n", __func__, __LINE__);
 	/*
 	 * XXX do not register DCs with no window groups because we cannot
 	 * assign a primary plane to them, which in turn will cause KMS to
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e9ce7d6992d2..ea6bf26f4df3 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -906,6 +906,7 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 	struct iommu_group *group = NULL;
 	int err;
 
+	dev_alert(client->dev, "-----------%s, %d\n", __func__, __LINE__);
 	/*
 	 * If the host1x client is already attached to an IOMMU domain that is
 	 * not the shared IOMMU domain, don't try to attach it to a different
@@ -914,7 +915,9 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 	if (domain && domain != tegra->domain)
 		return 0;
 
+	dev_alert(client->dev, "-----------%s, %d\n", __func__, __LINE__);
 	if (tegra->domain) {
+	dev_alert(client->dev, "-----------%s, %d\n", __func__, __LINE__);
 		group = iommu_group_get(client->dev);
 		if (!group)
 			return -ENODEV;
@@ -932,6 +935,7 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 
 	client->group = group;
 
+	dev_alert(client->dev, "-----------%s, %d\n", __func__, __LINE__);
 	return 0;
 }
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d0b0a15dba84..890c7c7ecf94 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -220,6 +220,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 
 	group = iommu_group_get_for_dev(dev);
 	if (IS_ERR(group)) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		ret = PTR_ERR(group);
 		goto out_release;
 	}
@@ -268,7 +269,9 @@ int iommu_probe_device(struct device *dev)
 	 */
 	iommu_alloc_default_domain(group, dev);
 
+	dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 	if (group->default_domain) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		ret = __iommu_attach_device(group->default_domain, dev);
 		if (ret) {
 			iommu_group_put(group);
@@ -852,8 +855,11 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
-	if (group->domain  && !iommu_is_attach_deferred(group->domain, dev))
+	dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
+	if (group->domain  && !iommu_is_attach_deferred(group->domain, dev)) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		ret = __iommu_attach_device(group->domain, dev);
+	}
 	mutex_unlock(&group->mutex);
 	if (ret)
 		goto err_put_group;
@@ -1497,6 +1503,7 @@ static int iommu_group_alloc_default_domain(struct bus_type *bus,
 {
 	struct iommu_domain *dom;
 
+	pr_alert("------%s: %s, %s, %s\n", __func__, bus->name, bus->dev_name, group->name);
 	dom = __iommu_domain_alloc(bus, type);
 	if (!dom && type != IOMMU_DOMAIN_DMA) {
 		dom = __iommu_domain_alloc(bus, IOMMU_DOMAIN_DMA);
@@ -1508,6 +1515,7 @@ static int iommu_group_alloc_default_domain(struct bus_type *bus,
 	if (!dom)
 		return -ENOMEM;
 
+	pr_alert("------%s: %s: changing default_domain: type %u\n", __func__, group->name, type);
 	group->default_domain = dom;
 	if (!group->domain)
 		group->domain = dom;
@@ -1532,6 +1540,7 @@ static int iommu_alloc_default_domain(struct iommu_group *group,
 
 	type = iommu_get_def_domain_type(dev) ? : iommu_def_domain_type;
 
+	dev_alert(dev, "---------%s, %d: type %u\n", __func__, __LINE__, type);
 	return iommu_group_alloc_default_domain(dev->bus, group, type);
 }
 
@@ -1552,22 +1561,30 @@ static struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 	int ret;
 
 	group = iommu_group_get(dev);
-	if (group)
+	if (group) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		return group;
+	}
 
 	if (!ops)
 		return ERR_PTR(-EINVAL);
 
+	dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 	group = ops->device_group(dev);
+	dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 	if (WARN_ON_ONCE(group == NULL))
 		return ERR_PTR(-EINVAL);
 
-	if (IS_ERR(group))
+	if (IS_ERR(group)) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		return group;
+	}
 
 	ret = iommu_group_add_device(group, dev);
-	if (ret)
+	if (ret) {
+		dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 		goto out_put_group;
+	}
 
 	return group;
 
@@ -1928,6 +1945,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 
 struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
 {
+	pr_alert("------%s: %s, %s\n", __func__, bus->name, bus->dev_name);
 	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
@@ -1943,12 +1961,17 @@ static int __iommu_attach_device(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (unlikely(domain->ops->attach_dev == NULL))
+	if (unlikely(domain->ops->attach_dev == NULL)) {
+		dev_alert(dev, "-------%s: no attach_dev\n", __func__);
 		return -ENODEV;
+	}
 
 	ret = domain->ops->attach_dev(domain, dev);
 	if (!ret)
 		trace_attach_device_to_domain(dev);
+	else
+		dev_alert(dev, "-------%s: failed to attach_dev: %d\n", __func__, ret);
+
 	return ret;
 }
 
@@ -1958,8 +1981,10 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 	int ret;
 
 	group = iommu_group_get(dev);
-	if (!group)
+	if (!group) {
+		dev_alert(dev, "-------%s: failed to get group\n", __func__);
 		return -ENODEV;
+	}
 
 	/*
 	 * Lock the group to make sure the device-count doesn't
@@ -1967,8 +1992,10 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 	 */
 	mutex_lock(&group->mutex);
 	ret = -EINVAL;
-	if (iommu_group_device_count(group) != 1)
+	if (iommu_group_device_count(group) != 1) {
+		dev_alert(dev, "-------%s: bypassing attach_group\n", __func__);
 		goto out_unlock;
+	}
 
 	ret = __iommu_attach_group(domain, group);
 
@@ -2283,13 +2310,17 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (group->default_domain && group->domain != group->default_domain)
+	if (group->default_domain && group->domain != group->default_domain) {
+		pr_alert("------------%s, domain mismatched\n", __func__);
 		return -EBUSY;
+	}
 
 	ret = __iommu_group_for_each_dev(group, domain,
 					 iommu_group_do_attach_device);
 	if (ret == 0)
 		group->domain = domain;
+	else
+		pr_alert("------------%s, failed: %d\n", __func__, ret);
 
 	return ret;
 }
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 4a3f095a1c26..2363a9978674 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -281,6 +281,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
+	pr_alert("---------%s, %d: type %u\n", __func__, __LINE__, type);
+	dump_stack();
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
@@ -318,6 +320,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->domain.geometry.aperture_end = 0xffffffff;
 	as->domain.geometry.force_aperture = true;
 
+	pr_alert("---------%s, %d: type %u\n", __func__, __LINE__, type);
 	return &as->domain;
 }
 
@@ -363,6 +366,7 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value |= SMMU_ASID_VALUE(asid);
 		value |= SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		pr_alert("--------%s, swgroup %d: writing %x to reg1 %x\n", __func__, swgroup, value, group->reg);
 	} else {
 		pr_warn("%s group from swgroup %u not found\n", __func__,
 				swgroup);
@@ -379,6 +383,7 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value = smmu_readl(smmu, client->smmu.reg);
 		value |= BIT(client->smmu.bit);
 		smmu_writel(smmu, value, client->smmu.reg);
+		pr_alert("--------%s, swgroup %d: writing %x to reg2 %x\n", __func__, swgroup, value, client->smmu.reg);
 	}
 }
 
@@ -491,13 +496,22 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	unsigned int index;
 	int err;
 
+	dev_alert(dev, "-------%s\n", __func__);
+	if (strstr(dev_name(dev), "dc"))
+		dump_stack();
 	if (!fwspec)
 		return -ENOENT;
 
+	if (iommu_get_domain_for_dev(dev) != domain)
+		dev_alert(dev, "-------%s: domain not matched\n", __func__);
+
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
@@ -805,6 +819,9 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
 
+	dev_alert(dev, "--------%s, %d\n", __func__, __LINE__);
+	if (strstr(dev_name(dev), "dc"))
+		dump_stack();
 	return &smmu->iommu;
 }
 
@@ -842,6 +859,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
+	dev_alert(dev, "---------%s, %d\n", __func__, __LINE__);
 	/* Find group_soc associating with swgroup */
 	soc = tegra_smmu_find_group(smmu, swgroup);
 
@@ -852,6 +870,10 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 		if ((group->swgroup == swgroup) || (soc && group->soc == soc)) {
 			grp = iommu_group_ref_get(group->group);
 			mutex_unlock(&smmu->lock);
+			if (soc && group->soc == soc)
+				dev_alert(dev, "---------%s, %d: %u: %s\n", __func__, __LINE__, swgroup, soc->name);
+			else
+				dev_alert(dev, "---------%s, %d, %u\n", __func__, __LINE__, swgroup);
 			return grp;
 		}
 
@@ -883,6 +905,10 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
 
+	if (soc)
+		dev_alert(dev, "---------%s, %d: %u: %s\n", __func__, __LINE__, swgroup, soc->name);
+	else
+		dev_alert(dev, "---------%s, %d: %u\n", __func__, __LINE__, swgroup);
 	return group->group;
 }
 
@@ -904,6 +930,9 @@ static int tegra_smmu_of_xlate(struct device *dev,
 
 	dev_iommu_priv_set(dev, mc->smmu);
 
+	dev_alert(dev, "-------%s: id %d", __func__, id);
+	if (strstr(dev_name(dev), "dc"))
+		dump_stack();
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 459211f50c08..faa4f4c53ac3 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1062,6 +1062,8 @@ tegra124_mc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
 		case TEGRA_SWGROUP_VI:
 			/* these clients are isochronous by default */
 			ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+			dev_alert(mc->dev, "-----%s, setting ISO for swgroup %d\n", __func__, client->swgroup);
+			dump_stack();
 			break;
 
 		default:
-- 
2.17.1


--qDbXVdCdHGoSgWSk--
