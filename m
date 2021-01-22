Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21488C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 07:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E43232376F
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 07:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbhAVHf0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 02:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbhAVHfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 02:35:24 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08068C0613D6
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 23:34:43 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id q7so3169101pgm.5
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m4wnAXhlfjJBWJNmbaSJ7Cl4CoNWSqMxCn3MzV4rG1c=;
        b=K6+s2/k9aBt85dRhwCJnrKvowSbu1kUeq14PcOQBLsXD0mrvcABsrVgyUoBLw4kO74
         T61LHFlMUCItc0DK4qdjl3H0aFirt9POMw/etpLiYycEQwHZF1PJK/vyva0e4X3QYH0T
         sRQeqxuoKR8GJ4qNtbzP6Tt09jw3nsjHMhAU76cnXqCjpOIfp3rYVdDD6v+w0cdod/jP
         8R2TFK/9+xvgjS8dGnF6Oh0WTI42OFGDIZE0CvgvS5MrluxrfMdZyaI40CKr3NG4pQb4
         GsqlkohGri3qQkLsVz9REu9FoVdHZYmn8I2CwX+168SfZ/rSBTG8By1/+OaBmCBvy9c2
         BCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m4wnAXhlfjJBWJNmbaSJ7Cl4CoNWSqMxCn3MzV4rG1c=;
        b=qU3TM8VdPouj2tJaGGIHXm3L9FqnwL9F51LGZqa4nG7ymI6TjwPO3tCk/FCm4jtj/Q
         /wM0Gs3/Z9jZiuowas8mjveePpSru5LSssUK04GD9ZvQO1wgOjvg9ofwfG8e5phBN12z
         mOEi59mO11MeDQx+G0lJXs0dg2UlKgFv5YiraEykEM6l9YAxBSw36K4e06PddZ2pFTa3
         /x7WmpwF08P4NxsuliImhj1AVHTnOy1QNaZrY98kDwfrWMESKGCoxDVxn9DXKaJlYceN
         aGw0HNs2Cb/O6j/ZsRn3BAnFUGrRslGYJzxaiiuaM3rkFcZskNjaws2kplTgoDCjMJV+
         uS0Q==
X-Gm-Message-State: AOAM5316ma9ZmZmGe2rnA3MSf3xW67zgUj0KY2/o51msh39eo+QnQPhD
        6SLCHpbjgv69xg5Dvoo0vUoTHA==
X-Google-Smtp-Source: ABdhPJwrZov901RmnoRYxt1gRsC0FzQGi+lpa84GXlgP2dFI5radIUoqWU1dy94vZk5WuWGyOsENvQ==
X-Received: by 2002:a63:7748:: with SMTP id s69mr3473901pgc.81.1611300882434;
        Thu, 21 Jan 2021 23:34:42 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id f22sm7959177pfk.179.2021.01.21.23.34.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 23:34:41 -0800 (PST)
Date:   Fri, 22 Jan 2021 13:04:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 0/4] OPP API fixes and improvements
Message-ID: <20210122073439.yadzqwodsyscl2ac@vireshk-i7>
References: <20210120222649.28149-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120222649.28149-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-01-21, 01:26, Dmitry Osipenko wrote:
> Dmitry Osipenko (4):
>   opp: Export devm_pm_opp_attach_genpd()
>   opp: Add dev_pm_opp_sync_regulators()
>   opp: Add dev_pm_opp_set_voltage()
>   opp: Make _set_opp_custom() work without regulators

Patch 1 and 3 aren't required anymore, I have applied 4th already.
Patch 2 can be applied only after the dependency patch for the stub
definition gets merge in Linus's tree. I see that Mark has already
queued that up in his for-5.11 branch, so it might be part of next
-rc. I will apply 2nd patch then.

-- 
viresh
