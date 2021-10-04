Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35160C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 11:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154D7613A3
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 11:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbhJDLGP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 07:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232693AbhJDLGN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 07:06:13 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1303C061746
        for <linux-tegra@vger.kernel.org>; Mon,  4 Oct 2021 04:04:24 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id l6so10810981plh.9
        for <linux-tegra@vger.kernel.org>; Mon, 04 Oct 2021 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W6tAA9CoM9zuCb38gqLGQ5EYxEkpOOFtNgaoMFePfIc=;
        b=P3iol4ylol3dQ5/O7YHGTNVdjm547GdmVZ9GpJiYE8i2zJLQ7TSUTFZjdMt6cwCeol
         ICqhSHobqEAecgZvA45L0fKNhflU7So+ibNhGmXvdAPZpeoQ7M3L3NBnu8REMeblbOiR
         2bSqJuSEDRdXFTORC5qNoos4AJbDf51mAB3aFqgyR++Fz29BOsSsDKsQhkvRXjp+18kH
         Z1L+oOgDZ4dAXZt0VeJNGkoQUDgeA6t9G3CFlXCb7clotEXyNUbDaeoVXdOsXQ397nb7
         izw1f4cPTGlfKZ401Ra57c55nGdxzTrv3vAh7W2+xDEUm/+ROm6lahh/J22VZoxb9mDl
         3E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W6tAA9CoM9zuCb38gqLGQ5EYxEkpOOFtNgaoMFePfIc=;
        b=JE3HkO3249mvKA0hiZnkED6VOj4tc0Ar/9qbufEa5i7tnlUWBIgPNht+FsDU8ShVyy
         wmFbwWvJ2p7tyIEAvbydhKhEqJc5rVBJBoPYmnC58JhRlcZIAa1uNk/Ja0M/NsfbS+DV
         JVxEJxXL2EqwBZSNDRGCycE4LjnrrbI6rzndt8ENJEfbhAOkRexyMNk6ViKgA7vhekRN
         vycs5uiPq9xzu1ZtS8kZDxb9jPs0LIV/CYewg4j+/8TfyPtdh2b4U2pv5o8K3vSl07di
         +MJnBjxfxzUPRL9VXxbTi+J4utdxJeWhmQL71XDrAwo0l0PZ34+EI3liZfTtu1vSIO/D
         EMNQ==
X-Gm-Message-State: AOAM531Fmia4nUO4yQsh7rr9Z55eiXQsJ4dG1PSGJ8sI87zAx/RnKhFr
        Guju98cXC3bsXOQmVxNfJ44NXg==
X-Google-Smtp-Source: ABdhPJzYi/GepZQnZ+GCGDR1bKwnD72fTfCpo4YwvAfXPP2IqUq/muGXABomQIFUKyvX+GUiXYe8Dw==
X-Received: by 2002:a17:90b:3852:: with SMTP id nl18mr20660564pjb.74.1633345464201;
        Mon, 04 Oct 2021 04:04:24 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id w13sm15222561pjc.29.2021.10.04.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 04:04:23 -0700 (PDT)
Date:   Mon, 4 Oct 2021 16:34:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] opp: Add more resource-managed variants of
 dev_pm_opp_of_add_table()
Message-ID: <20211004110421.agep6hxoa6qo7wy2@vireshk-i7>
References: <20210920172249.28206-1-digetx@gmail.com>
 <20210920172249.28206-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920172249.28206-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-09-21, 20:22, Dmitry Osipenko wrote:
> Add resource-managed variants of dev_pm_opp_of_add_table_indexed() and
> dev_pm_opp_of_add_table_noclk(), allowing drivers to remove boilerplate
> code.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/of.c       | 46 +++++++++++++++++++++++++++++++++++-------
>  include/linux/pm_opp.h | 12 +++++++++++
>  2 files changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 2a97c6535c4c..bd01ecb1d85c 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -1081,6 +1081,17 @@ static void devm_pm_opp_of_table_release(void *data)
>  	dev_pm_opp_of_remove_table(data);
>  }
>  
> +static int devm_of_add_table_indexed(struct device *dev, int index, bool getclk)

Made this _devm_of_add_table_indexed() and applied this patch. Thanks.

What about rest of the series ?

-- 
viresh
