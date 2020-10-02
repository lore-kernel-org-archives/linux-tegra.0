Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1786EC35257
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:07:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6A3D2085B
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq+gq5On"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388457AbgJBSHe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388434AbgJBSHT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 14:07:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2110C0613D0;
        Fri,  2 Oct 2020 11:07:18 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d6so1798602pfn.9;
        Fri, 02 Oct 2020 11:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cHB2ONyPEQ+hUFSnX/RB0VzFUTqL11Ck81Mmlx+r/fY=;
        b=Tq+gq5OnXvNMUAl2zf6HnNrtA1GLxIi1XebvYnfd0sMr7QvZGaiJ7Sy+shakp9ukxb
         249fbNJzmfkkMcKh+/0AfTYGMGcZ24dFmyAs/6f7NvvSTpmHD13DzxWLAU4XyflMUutZ
         dAjlyvgTQhKyZj1fOfFRQ6aFtaiBRnbAU/F1Fxm2VNoyQEeAT5j3Z+R+6/kAiYtvtXmY
         fjJpl6ivQVi6X5ZpdKVMJXwZxEJwOqrg+wXG4KVN3iIt49FfU+RDUDTebdha0KB1wv59
         8Fhleur1VBPauW5vQND30B02L7N2xCg4BMxgOarAl59jmL5F6PDkUFMiijKqVYW10Ir9
         Dk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cHB2ONyPEQ+hUFSnX/RB0VzFUTqL11Ck81Mmlx+r/fY=;
        b=WMpz8zLVWGw1mlgXBkg2oeK+euMkZagAPXdMSWoRizZoCwiraWPhOYk6lyKF2N/8/F
         oQny585YBjMADWkmy4YCiTU2RN/7NJuX/o77P5s8e1lNhyZFH+vIa5I7/+esLgwgsSn2
         Lo2KdbNBRiQhwDhaJOvDIPVipqGzp64MFSe9mQgkk3dNgZdcl8yIefNwrLRUYlH8WuZ1
         6SwOlRqUxiVxtgCip9ZgtyM3uapDb1NOAMa/9SOVJ8ax/mHZsHGIKFOEEAew+r+Y9p81
         aovsgL/ITK0iM9hD8NIQ14jITI3WI8JaASQfdZuYdMPQ/DM3u6ipCBrmIZdRvjZDAeDa
         8hFA==
X-Gm-Message-State: AOAM532sI9xH6i641XZPbmpB6RT82YYAoDFd/3B5NsKZ9/bnfZZWKyic
        YNcswib/VQYXdI/dSl22USaimCnXKNA=
X-Google-Smtp-Source: ABdhPJxhwDTHQiAIBv0FymF3yt7MLVFij1pPJlTvaKlkRricxll4p3ShOfVY68QWxxDdNnThmi93Rw==
X-Received: by 2002:a63:474b:: with SMTP id w11mr3313390pgk.376.1601662038313;
        Fri, 02 Oct 2020 11:07:18 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f18sm2818497pfe.153.2020.10.02.11.07.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 11:07:17 -0700 (PDT)
Date:   Fri, 2 Oct 2020 11:01:21 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201002180120.GB29706@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <070a13b2-cde2-ab9e-7ee0-8fb71fb64d5d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <070a13b2-cde2-ab9e-7ee0-8fb71fb64d5d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 05:23:14PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 09:08, Nicolin Chen пишет:
> >  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
> >  {
> > -	struct device_node *np = dev->of_node;
> > -	struct tegra_smmu *smmu = NULL;
> > -	struct of_phandle_args args;
> > -	unsigned int index = 0;
> > -	int err;
> > -
> > -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> > -					  &args) == 0) {
> > -		smmu = tegra_smmu_find(args.np);
> > -		if (smmu) {
> > -			err = tegra_smmu_configure(smmu, dev, &args);
> > -			of_node_put(args.np);
> > -
> > -			if (err < 0)
> > -				return ERR_PTR(err);
> > -
> > -			/*
> > -			 * Only a single IOMMU master interface is currently
> > -			 * supported by the Linux kernel, so abort after the
> > -			 * first match.
> > -			 */
> > -			dev_iommu_priv_set(dev, smmu);
> > -
> > -			break;
> > -		}
> > -
> > -		of_node_put(args.np);
> > -		index++;
> > -	}
> > +	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
> >  
> >  	if (!smmu)
> >  		return ERR_PTR(-ENODEV);
> 
> The !smmu can't ever be true now, isn't it? Then please remove it.

How can you be so sure? Have you read my commit message? The whole
point of removing the hack in tegra_smmu_probe() is to return the
ERR_PTR(-ENODEV) here. The bus_set_iommu() will call this function
when mc->smmu is not assigned it, as it's assigned after we return
tegra_smmu_probe() while bus_set_iommu() is still in the middle of
the tegra_smmu_probe().
