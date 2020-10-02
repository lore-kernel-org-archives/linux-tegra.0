Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E43C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C5B20795
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPDScr82"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBTE1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBTE1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 15:04:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8B1C0613D0;
        Fri,  2 Oct 2020 12:04:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g9so886214pgh.8;
        Fri, 02 Oct 2020 12:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=P+YN1+j9AcMeYdrHjvyUyp0Y8mUcp4uTDvnGR4jOXXw=;
        b=kPDScr82ObdoVpL06WIvb/UVXmtzy8RRtcrUgaVoE/9qZTd68X9234Ax+7LMQ4rZwV
         3ItQ30Q3UFoBXHEBfKGf9pyM6iW9/O2sifFRMSM7Bar85mu6BZw9FhUwdigDGst3N121
         qRUDA7ETxRvive11BH9AnnsdecfieCXSVEv7KoQ8psUk8V3yVJnIFY3Pa1WFSQB9z/v4
         aFQS16r99S68qmdQHfZ6BZPZjc8EWI1CRE6qt2qB+MvyqfB2WgUyENIzTETZjvLnL0D5
         jFkzVc155c7/A3tyWJEB3PlcEbqgB5nGUUbqeR+papC7N89JUfgFb2HF6+v+GQbVpQMG
         mLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=P+YN1+j9AcMeYdrHjvyUyp0Y8mUcp4uTDvnGR4jOXXw=;
        b=c8BRUar65YxfI9p8OlBdlcsHOOyuldrDqDyNCdCnnDx6RcXeaXvlyrU9LEOFFzgr7E
         sg51tlIIQziFr4WTD8288Qd7SuQPpze0iRWZ7FId6y5U95zWdhbTf4/v5oIqoxhRkVM/
         3U95sHQ0+b8cOfjYa/IpiIU6xEQYglK/8hMPbVt07TDYYJjTfVYFtekzhBR31gQ1v5Fk
         vrTwzQreBbMe7sKbAO8BM195oIDLKZkr+2uf6BF8PI/hvn3X3NWj7XX4/zi+T1CwloO2
         Uo+y90oyUdbkj/UAUCy4tWaTLqS9OaL6MDJlIKB1pE0RL3TMcVfVgY/y/9YFVTMQidJw
         E+Uw==
X-Gm-Message-State: AOAM533ZKlyITSoEqiRG2g1ACk6qWvxBnpYUdNMkThDtLjRYitm/ls6i
        6M52auFkv26AvR6iMAVd5to=
X-Google-Smtp-Source: ABdhPJylX4Gzl/ZMkPa0axOcv1L7yEJWJKIfmZPUt1XuvTIlkh4ZFxrBch9Z32g1BupPmhQeds5owA==
X-Received: by 2002:a63:1e5a:: with SMTP id p26mr2094494pgm.85.1601665467025;
        Fri, 02 Oct 2020 12:04:27 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id t3sm2370181pgm.42.2020.10.02.12.04.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 12:04:26 -0700 (PDT)
Date:   Fri, 2 Oct 2020 11:58:29 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201002185828.GC29706@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 09:08, Nicolin Chen пишет:
> >  static int tegra_smmu_of_xlate(struct device *dev,
> >  			       struct of_phandle_args *args)
> >  {
> > +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> > +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
> >  	u32 id = args->args[0];
> >  
> > +	of_node_put(args->np);
> 
> of_find_device_by_node() takes device reference and not the np
> reference. This is a bug, please remove of_node_put().

Looks like so. Replacing it with put_device(&iommu_pdev->dev);

Thanks
