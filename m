Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21537C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D477320C09
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUgGRg0F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgI2GIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 02:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727442AbgI2GIB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 02:08:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259B9C061755;
        Mon, 28 Sep 2020 23:08:01 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so3476095pff.6;
        Mon, 28 Sep 2020 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/P/yp1OEyu3c80ckdO9uP2rdLAyI1tAzR48P50ZSsbs=;
        b=dUgGRg0F2EiJq8j/GyKL53Xz23EA1+tlZEGuIOLEyoyK0Oa4zv5h0k42ekp8k+mJjn
         BrqMixaMhi3j+s8nXSTUiUcP67JR6+3iwPEO2lCIGIAsypGuhC4s8KDHtMV6hD2pogXh
         NPSsqnMZNKaamvYLQLoYBCihXSV4jqvRYz8rsclO8EMqjKONGtcmyWp/zVi0Uw+Iim2x
         pYe0nTIa8nz4IxuvOGg5szLwY4JIfjVfdWIU5eL8qa+SLmcwTD8o/5Qsl/b9l0/iFqsF
         8d1CIKUrsAouOiiLr3fgMYfn/IoPVVVtK5xfYZMGADBcy7r377Ve1IgUGPg22ft5U5oe
         Djlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/P/yp1OEyu3c80ckdO9uP2rdLAyI1tAzR48P50ZSsbs=;
        b=bvnBAdwIGI6NDDutrZAd5/xEf/uWXv1uG3dOlZn49b8TLxo1TgrYzgBmPKgQC/Pm0X
         IDNxNKchZtTbRLDpSPmwx2xjy8KMbxem+HXEu+4hBskDf8WNMuHIabyJOS2ciXwgTz6b
         kYjigMISZwDW6iQROG9l6WWEp23B20UfNLEfz8GhTofz/7/+wyOrxzG8qU/qPsG5cTCg
         0XSrWZoS/KQ7syzXucMPPSOQ98BCkxnTpibFpSs15ukuKhB48gSl73YPI6o60ntusc6h
         aV1ZzS6XaoXf8bKXgxuyiZ6hTjavf4nCBvyirqN2m/Xq/+DjOH247SUBnecrPSKjZPkz
         Xjug==
X-Gm-Message-State: AOAM5310CkEbK/SNOzYRc79PPiKt0PLLExH065QO/ox07qG5ciQ6ST39
        yGUp96Qc7rwXESmDqFrcH84=
X-Google-Smtp-Source: ABdhPJxKFuyXyknFTFHwvRCgLnO4Ta05aP10J7TScmLJ9+Xxb5PcC5Pm/eXa3mu9/709Qa8qyXh9bA==
X-Received: by 2002:a17:902:d695:b029:d2:89b9:f4a0 with SMTP id v21-20020a170902d695b02900d289b9f4a0mr3101170ply.10.1601359680524;
        Mon, 28 Sep 2020 23:08:00 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i17sm3718854pfa.2.2020.09.28.23.08.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 23:08:00 -0700 (PDT)
Date:   Mon, 28 Sep 2020 23:02:38 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     thierry.reding@gmail.com, joro@8bytes.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
Subject: Re: [PATCH v3 2/2] iommu/tegra-smmu: Expend mutex protection range
Message-ID: <20200929060238.GA26785@Asurada-Nvidia>
References: <20200929045247.15596-1-nicoleotsuka@gmail.com>
 <20200929045247.15596-3-nicoleotsuka@gmail.com>
 <20200929060336.GB6564@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929060336.GB6564@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2020 at 07:03:36AM +0100, Christoph Hellwig wrote:
> On Mon, Sep 28, 2020 at 09:52:47PM -0700, Nicolin Chen wrote:
> > This is used to protect potential race condition at use_count.
> > since probes of client drivers, calling attach_dev(), may run
> > concurrently.
> 
> Shouldn't this read "expand" instead of "expend"?

Oops...my poor English :)

Fixing....

Thanks!
