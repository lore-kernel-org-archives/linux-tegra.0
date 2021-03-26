Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17285C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 15:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DACF061A28
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 15:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhCZP3y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 11:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhCZP3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 11:29:36 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B903C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 08:29:32 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u20so7782503lja.13
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CDqE9vrcj1hVYR1Qio+oAMmx5oB7eUaXUDsWFAo0YM8=;
        b=X7gp95Wks2FrUQ6QSGjc2hklU15PkIfdha4o+jsBqFPPLz0an8++kk3Z2D4J898frx
         vzPDrWigAhPuBQZmmbkyEOJXdy7sUsxPprO6dvZ3psb9zUyBs0WlHhYn6sND00GexVZv
         F7jM9KTL1zstL+Az/8FYthcty5KPeUcGLX4dFJioW9BzaEpJXAn1LiQnYwyrrhFSraVB
         evNuiDbgT4Ynk138Gwg/HTVgZEATt+Zuo60LA6CxIvLdK6zB179+wWend+NvjsV1+Heh
         AzmtQAz+/WUqwtToa27vTVKQTaSRsTA34ce3t8Hn9HXcNSKpoeAyQaDaDUqViQnAyXOQ
         XVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CDqE9vrcj1hVYR1Qio+oAMmx5oB7eUaXUDsWFAo0YM8=;
        b=ZAMgWEDy5aQ7uNJynAz2RQhoJPb/BkQLCXKuchVYdXeEv8k9sCejfbJelwIyDHFi5C
         zckryQOPXVj+89K5kWpTnrSIg0DbEdEr2OUvyXo8LhlGMvewWp5coDo5H2xJ06RU79yr
         S37fPvRVYv8dFj6J9y5oO0Xs8MIx11lCQeVegQgUZL5v9hlZdfC+bwwyI94szmnz/kmM
         8lTZD3xOXFfFXO4jzLw99U1tEUYkDcbCFMJExNimI03eqUGh9SwID7gvh3EffPe3t/J2
         /HbzuFrOINis491dMLYxR9kE378mq+Pv/IuTyHMfnPNkox01ZRyCh/wMTZPx1QqaxHpu
         2E0Q==
X-Gm-Message-State: AOAM533HdQET7/105UNFp27920h7/b0Cg4Pm6JCpEQEtIyz01EV74Uha
        x+69r2Jctswb+WnhPuAlXS8=
X-Google-Smtp-Source: ABdhPJx12U15GGk4a78IpgYE5ICDEt05Z8yf0tkg++6YgErTCwvtCZlbNc9cL0oC/9HMtpu2PmUXUA==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr9468864ljj.20.1616772570513;
        Fri, 26 Mar 2021 08:29:30 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id h11sm901491lfc.191.2021.03.26.08.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 08:29:30 -0700 (PDT)
Subject: Re: [PATCH 0/9] arm64: tegra: Prevent early SMMU faults
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <197876d1-0046-f673-5d3e-818d1002542b@gmail.com>
Date:   Fri, 26 Mar 2021 18:29:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 16:03, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this is a set of patches that is the result of earlier discussions
> regarding early identity mappings that are needed to avoid SMMU faults
> during early boot.
> 
> The goal here is to avoid early identity mappings altogether and instead
> postpone the need for the identity mappings to when devices are attached
> to the SMMU. This works by making the SMMU driver coordinate with the
> memory controller driver on when to start enforcing SMMU translations.
> This makes Tegra behave in a more standard way and pushes the code to
> deal with the Tegra-specific programming into the NVIDIA SMMU
> implementation.

It is an interesting idea which inspired me to try to apply a somewhat similar thing to Tegra SMMU driver by holding the SMMU ASID enable-bit until display driver allows to toggle it. This means that we will need an extra small tegra-specific SMMU API function, but it should be okay.

I typed a patch and seems it's working good, I'll prepare a proper patch if you like it.

What do you think about this:

diff --git a/drivers/gpu/drm/grate/dc.c b/drivers/gpu/drm/grate/dc.c
index 45a41586f153..8874cfba40a1 100644
--- a/drivers/gpu/drm/grate/dc.c
+++ b/drivers/gpu/drm/grate/dc.c
@@ -17,6 +17,7 @@
 #include <linux/reset.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/mc.h>
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic.h>
@@ -2640,6 +2641,11 @@ static int tegra_dc_init(struct host1x_client *client)
 		return err;
 	}
 
+	if (dc->soc->sync_smmu) {
+		struct iommu_domain *domain = iommu_get_domain_for_dev(dc->dev);
+		tegra_smmu_sync_domain(domain, dc->dev);
+	}
+
 	if (dc->soc->wgrps)
 		primary = tegra_dc_add_shared_planes(drm, dc);
 	else
@@ -2824,6 +2830,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = true,
 	.has_win_c_without_vert_filter = true,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.sync_smmu = false,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -2846,6 +2853,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = true,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = true,
+	.sync_smmu = true,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -2868,6 +2876,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = true,
+	.sync_smmu = true,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -2890,6 +2899,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.sync_smmu = true,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -2912,6 +2922,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.sync_smmu = true,
 };
 
 static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] = {
@@ -2961,6 +2972,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.sync_smmu = false,
 };
 
 static const struct tegra_windowgroup_soc tegra194_dc_wgrps[] = {
@@ -3010,6 +3022,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.wgrps = tegra194_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra194_dc_wgrps),
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.sync_smmu = false,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
diff --git a/drivers/gpu/drm/grate/dc.h b/drivers/gpu/drm/grate/dc.h
index 316a56131cf1..e0057bf7be99 100644
--- a/drivers/gpu/drm/grate/dc.h
+++ b/drivers/gpu/drm/grate/dc.h
@@ -91,6 +91,7 @@ struct tegra_dc_soc_info {
 	bool has_win_b_vfilter_mem_client;
 	bool has_win_c_without_vert_filter;
 	bool plane_tiled_memory_bandwidth_x2;
+	bool sync_smmu;
 };
 
 struct tegra_dc {
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 602aab98c079..e750b1844a88 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -47,6 +47,9 @@ struct tegra_smmu {
 	struct dentry *debugfs;
 
 	struct iommu_device iommu;	/* IOMMU Core code handle */
+
+	bool display_synced[2];
+	bool display_enabled[2];
 };
 
 struct tegra_smmu_as {
@@ -78,6 +81,10 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
 	return readl(smmu->regs + offset);
 }
 
+/* all Tegra SoCs use the same group IDs for displays */
+#define SMMU_SWGROUP_DC		1
+#define SMMU_SWGROUP_DCB	2
+
 #define SMMU_CONFIG 0x010
 #define  SMMU_CONFIG_ENABLE (1 << 0)
 
@@ -253,6 +260,20 @@ static inline void smmu_flush(struct tegra_smmu *smmu)
 	smmu_readl(smmu, SMMU_PTB_ASID);
 }
 
+static int smmu_swgroup_to_display_id(unsigned int swgroup)
+{
+	switch (swgroup) {
+	case SMMU_SWGROUP_DC:
+		return 0;
+
+	case SMMU_SWGROUP_DCB:
+		return 1;
+
+	default:
+		return -1;
+	}
+}
+
 static int tegra_smmu_alloc_asid(struct tegra_smmu *smmu, unsigned int *idp)
 {
 	unsigned long id;
@@ -352,10 +373,21 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
 static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 			      unsigned int asid)
 {
+	const int disp_id = smmu_swgroup_to_display_id(swgroup);
 	const struct tegra_smmu_swgroup *group;
 	unsigned int i;
 	u32 value;
 
+	if (disp_id >= 0) {
+		smmu->display_enabled[disp_id] = true;
+
+		if (!smmu->display_synced[disp_id]) {
+			pr_debug("%s deferred for swgroup %u\n",
+				 __func__, swgroup);
+			return;
+		}
+	}
+
 	group = tegra_smmu_find_swgroup(smmu, swgroup);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
@@ -385,10 +417,14 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 			       unsigned int asid)
 {
+	const int disp_id = smmu_swgroup_to_display_id(swgroup);
 	const struct tegra_smmu_swgroup *group;
 	unsigned int i;
 	u32 value;
 
+	if (disp_id >= 0)
+		smmu->display_enabled[disp_id] = false;
+
 	group = tegra_smmu_find_swgroup(smmu, swgroup);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
@@ -410,6 +446,32 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 	}
 }
 
+void tegra_smmu_sync_domain(struct iommu_domain *domain, struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
+	unsigned int index;
+
+	if (!fwspec || !domain)
+		return;
+
+	for (index = 0; index < fwspec->num_ids; index++) {
+		const unsigned int swgroup = fwspec->ids[index];
+		const int disp_id = smmu_swgroup_to_display_id(swgroup);
+
+		if (disp_id < 0 || smmu->display_synced[disp_id])
+			continue;
+
+		smmu->display_synced[disp_id] = true;
+
+		if (!smmu->display_enabled[disp_id])
+			continue;
+
+		tegra_smmu_enable(smmu, swgroup, to_smmu_as(domain)->id);
+	}
+}
+EXPORT_SYMBOL_GPL(tegra_smmu_sync_domain);
+
 static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 				 struct tegra_smmu_as *as)
 {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index cfd3b35e23e5..ac1f3226b2ac 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -15,6 +15,7 @@
 
 struct clk;
 struct device;
+struct iommu_domain;
 struct page;
 
 struct tegra_smmu_enable {
@@ -88,6 +89,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 				    const struct tegra_smmu_soc *soc,
 				    struct tegra_mc *mc);
 void tegra_smmu_remove(struct tegra_smmu *smmu);
+void tegra_smmu_sync_domain(struct iommu_domain *domain, struct device *dev);
 #else
 static inline struct tegra_smmu *
 tegra_smmu_probe(struct device *dev, const struct tegra_smmu_soc *soc,
@@ -99,6 +101,11 @@ tegra_smmu_probe(struct device *dev, const struct tegra_smmu_soc *soc,
 static inline void tegra_smmu_remove(struct tegra_smmu *smmu)
 {
 }
+
+static inline void tegra_smmu_sync_domain(struct iommu_domain *domain,
+					  struct device *dev)
+{
+}
 #endif
 
 #ifdef CONFIG_TEGRA_IOMMU_GART
