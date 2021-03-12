Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1B0C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 01:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0CB464F92
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 01:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhCLBLt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 20:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhCLBLt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 20:11:49 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DA1C061574;
        Thu, 11 Mar 2021 17:11:48 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso10242947pjb.4;
        Thu, 11 Mar 2021 17:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=16+EGqIhvzNXbdawWsI24XgIQiUgZzzrwVqWt5tsI6Q=;
        b=k9/V8e9h7lxJGy3+MvDbuIN+ZYqSyUG2tRF5AcbhR75EaTsDgVFbTPeXzQFoCt5Y0z
         maWum4fpgZCnxzMCM1UnW6bV7Mc2dki6/0AEPh09DM69U4ozafluPUirqWTSkR3qG5ZL
         TSs0o2z4duN4aAcf3R0oLBDNGwGZ6IBeAhMoS8/4GEYwtyNOWYRgduR3Ucky7rCRJaQS
         Xd54+6SIcYHnOWuWSRZt5t6f4pxRxV0n12IFfwY3Or+u6tch+nNOSe8ZrKzL38zFBgs5
         F6esRhGL1FrhBS8hrao32eJDPriSrnDFQBn2dPFJML18s58L0JOwcbt0p9QzSH/54iOD
         y+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=16+EGqIhvzNXbdawWsI24XgIQiUgZzzrwVqWt5tsI6Q=;
        b=AHmNyGG106SHGQVAbRjYufYD3KR7/w6MBJi8+1Wu5kTy+I9M8c7I+avYKyDcz90WbQ
         EdiHcyV4CjMclX9zoT5XQU6yAYONs8NmdwGZP7orgHsroW3z6w3Wo4pvq50PPQq3l18M
         5USafL0C3cUFULQmZmaagh5pFjBNUlZE8tgOXht/sxgqzIDTiebUQzA3fS0w8q8Hh5D8
         WYwAvzcYANCwgoyOU3L+XimGDKHmTxP+9TDz9Z6lxKYaalxYRfB06tkSyfF27HsZFaCL
         pJ5Jm2eOFdAgQnS7d0aB3DexQ2DaowvVbHymEX9Feqdk87E9RPIRS4LgDcsdL5tf6puK
         +PSw==
X-Gm-Message-State: AOAM531oiDhfngZCyEugyZTc62uD0xLr7V7kCS4f/BF1TGxVjckR/wXP
        cFJbvoqBYIQHp/Vfr4sTS8A=
X-Google-Smtp-Source: ABdhPJzra0SHtLriT5uJdvG596fUt/NZvuBX6OT9xr5DxY7UWyuTAm+swZOTYPYO+BHr8ri+MLVl2Q==
X-Received: by 2002:a17:90a:f82:: with SMTP id 2mr11837097pjz.196.1615511508531;
        Thu, 11 Mar 2021 17:11:48 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y7sm268087pja.25.2021.03.11.17.11.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 17:11:48 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:09:33 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20210312010932.GB29926@Asurada-Nvidia>
References: <20210310033614.16772-1-nicoleotsuka@gmail.com>
 <abcedfa6-fbad-b34d-fba1-d3a778fbf5b4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abcedfa6-fbad-b34d-fba1-d3a778fbf5b4@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 11, 2021 at 05:04:06PM +0300, Dmitry Osipenko wrote:
> 10.03.2021 06:36, Nicolin Chen пишет:
> ...
> > +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> > +{
> > +	struct tegra_smmu_group_debug *group_debug = s->private;
> > +	const struct tegra_smmu_swgroup *group;
> > +	struct tegra_smmu_as *as;
> > +	struct tegra_smmu *smmu;
> > +	int pd_index, pt_index;
> 
> > +DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
> > +
> >  static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
> >  {
> > +	const struct tegra_smmu_soc *soc = smmu->soc;
> > +	struct tegra_smmu_group_debug *group_debug;
> > +	struct device *dev = smmu->dev;
> > +	struct dentry *d;
> > +	int i;
> 
> You should use unsigned types for everything that isn't signed.

Okay. Will fix. Thanks!
