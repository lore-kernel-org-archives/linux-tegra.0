Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666C5C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22CD2206A5
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+rSaFzK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgI3GTZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3GTZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:19:25 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D55FC061755;
        Tue, 29 Sep 2020 23:19:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t18so377239plo.1;
        Tue, 29 Sep 2020 23:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HGwliGdnOsvbFNk+ILVrrA6wWvnB3mx6++Vzoqu61bk=;
        b=m+rSaFzK3MX0An+UuLThLPSMN2e3pp1A3HkBG1Xi/+3l41Ax48PGeRUpvIjIgMZfbc
         j9iNHBqumdJngqmUpcron/qJZstDOh5dg9PQR0+eZK3hris7o7mIYSd6VRce+gTkHWi2
         o9GYsDLYH1+IYLb7aihaxZD5nDAWR288tiW0YYwJW/lktXvQAEhgSo+evVkWbtYo0a6A
         2n6gSqgHNg8y8iszxoRVTAdTEK71669BPnqUcjqYQFXPTptfSGZZRq+IkNm2eW3P669a
         O8qaXsbUMdoQXha229tmCWBGsPbeRfJvDPXIvdvAZUgo5SZVrMJZfmVs4+3fISDwz0Q9
         1lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HGwliGdnOsvbFNk+ILVrrA6wWvnB3mx6++Vzoqu61bk=;
        b=n5rbz8jiGQFKNNa6Lf5jhosIk/p4IAZ+qfPa53597mqVBlLl3B1a/WuPS/G+v3ZpoR
         MzIvwrZv5/4lZNEbKhGS5O6nvc1iyzxZYFuJcPiT82ZzZH9p8/GjhUeG7AodBAiz9XyV
         a4FSiupQFVBqE0IlHko6U2UD4qs+Urj2MGC9ZE3mU9kUt+ut0ajbaJArkcBj7beqxZ0Y
         rMpNSLZ1pVMZ3d/qnmGKXp1ACGst6sxRoRvPssGx0UxgxOvSVyLsIpZIc8h60R4Tv9p8
         E40rBQYDbwBpQgCUHVkNcK6ktbZKUStWkGqNJcro+RCCEkbIV+CymmRsNITHxQJ/1g2m
         jHKw==
X-Gm-Message-State: AOAM532Dv03iumTfE/fu+uyz6MkcNiQjMxqffSn4kokyCabR3dtodNpD
        f49xkvW1mddhATxZ29GCp8k=
X-Google-Smtp-Source: ABdhPJwEt9ZQYItIyIuKN4n6x9OjE+XcTkQKL8Bs9Yejup2yt8SsrqVgrOzpCQiAQu0cBLYAjAFWBg==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr1165283pjp.197.1601446765072;
        Tue, 29 Sep 2020 23:19:25 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n9sm822737pgi.2.2020.09.29.23.19.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 23:19:24 -0700 (PDT)
Date:   Tue, 29 Sep 2020 23:13:52 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930061351.GA16460@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
 <20200930054900.GG31821@Asurada-Nvidia>
 <b74f96cf-0edc-c7f2-3a0e-2a4fe51e3b2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b74f96cf-0edc-c7f2-3a0e-2a4fe51e3b2e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 09:10:38AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 08:49, Nicolin Chen пишет:
> > On Wed, Sep 30, 2020 at 08:11:52AM +0300, Dmitry Osipenko wrote:
> >> 30.09.2020 03:30, Nicolin Chen пишет:
> >>> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> >>> +	if (IS_ERR_OR_NULL(mc))
> >>
> >> tegra_get_memory_controller() doesn't return NULL.
> > 
> > Well, I don't want to assume that it'd do that forever, and the
> > NULL check of IS_ERR_OR_NULL is marked "unlikely" so it doesn't
> > hurt to have.
> > 
> 
> I don't see any reasons why it won't do that forever.
> 
> Secondly, public function can't be changed randomly without updating all
> the callers.
> 
> Hence there is no need to handle cases that can't ever happen and it
> hurts readability of the code + original error code is missed.

I don't quite understand why an extra "_OR_NULL" would hurt
readability....but I'd take a step back and use IS_ERR().
