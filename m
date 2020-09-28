Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E536C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 23:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7E8823A5B
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 23:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw/yuW8w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgI1XNm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 19:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgI1XNm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 19:13:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A94C0613A9;
        Mon, 28 Sep 2020 15:36:34 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h23so411212pjv.5;
        Mon, 28 Sep 2020 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6VTtpf0GOcmVXtgSMfPaTRHueLjXIvDxPhjzc/PdAkg=;
        b=gw/yuW8w3S9Bqz49rkSLpd0r4ay4B+eMFsWiZ0IzmbaF2ogdNKuuLcfrwmIFtSVhLq
         wmwfRBMhw3z8Mp26zzmLnxUjimNAPhX8fuWMP8PtwVjXn3kfZCftZ+GJACFvoYhzzq8E
         Vd0xIKfdYrwaN/Jv+ff0fyxmY8dWR0z7YxK2lnXMeUbuSMnXi2EHUeCEXj01fmrnXi3H
         giucjV1rCRiwXqXcKgTbYlz3UiQOB4CuUBUpaDH4SjGALymaCOmvUSnrohA9iKykv93e
         eylBH/03Cxp0DRKm0+l8yuTZlcKbUNwgLt0ySvqvt9o5J7Sh4gQg3fZ/p9/Bi3neatyf
         U4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6VTtpf0GOcmVXtgSMfPaTRHueLjXIvDxPhjzc/PdAkg=;
        b=lK4jxyZU8WShzTpHWjiJdFp9VBRUFx56tDWv6/h2rUFMo4Sxy5kEEGyoZhOif0lYQ0
         Hpl4Qu7K5zDKe7u9YNLeE5bev8b6/1QD/qvBlQZ0HeetqPGVhj3137ENjH/uHW0auD4p
         ult/bDfiMpW8cfoi7KVZc4z4QD8vFYylzOyDgNy8rN7+xGr7PRLR0J4fzsW1gSAGsNIX
         IQAlkQmiRGk0t0ZnrzcRC0oE2Yc3113OpVT0DjlNCLXQEmtTS3BAFlK9MzzxmRVPQI6J
         yuRavqnY78hIhWKUFgpRtPmvq5X4+6/6TbT4Zk7XqjmZfqPGMriU6KmozCxD9eqFgCIi
         Qpng==
X-Gm-Message-State: AOAM531Ur/R5w+b9jMFhsec9LHOUQV0IcQ2fwA2t8hNu9UO1uR1YOjks
        5ZPInjKCT3s0cHy7Gbmsezc=
X-Google-Smtp-Source: ABdhPJxEB21pc/IzM51H1ZIwi+20mLY4wZP51SX9dQ3cfquh4GSqAy3OjkJt5SXGb/l2OBcOb/h61w==
X-Received: by 2002:a17:90b:2345:: with SMTP id ms5mr1164167pjb.202.1601332593920;
        Mon, 28 Sep 2020 15:36:33 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a2sm2583492pfk.201.2020.09.28.15.36.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 15:36:33 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:31:15 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH 4/5] iommu/tegra-smmu: Add PCI support
Message-ID: <20200928223114.GA4816@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-5-nicoleotsuka@gmail.com>
 <b95b69fb-8570-f5dc-c486-b94958f2a791@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b95b69fb-8570-f5dc-c486-b94958f2a791@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Sep 27, 2020 at 01:18:15AM +0300, Dmitry Osipenko wrote:
> 26.09.2020 11:07, Nicolin Chen пишет:
> ...
> > +#ifdef CONFIG_PCI
> > +	if (!iommu_present(&pci_bus_type)) {
> 
> Is this iommu_present() check really needed?
> 
> > +		pci_request_acs();
> 
> Shouldn't pci_request_acs() be invoked *after* bus_set_iommu() succeeds?

Will move it after that. Thanks!
