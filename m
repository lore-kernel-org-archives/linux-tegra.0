Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10D1C43334
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 14:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbiFVOH3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 10:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240028AbiFVOH2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 10:07:28 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969C138784
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 07:07:27 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m2so8240449plx.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=e9oD0W0ylRYnkIlTyiKZwIapNVPUeC7hKoZrwz+0k8Y=;
        b=rc8s6ZIwt9RUA9gTUANp/tC0i4E9+YxpvS4tpGBDrQNBgjZ0eTnPSoj5FBbFcaxiWT
         0sH3ckRQNBBTBzaa6Xyb4MLHztJGB3DX4RnZrlNEl+dohrhjX42bNi60gasOnADB6E+v
         9lydJ6EKoFifKzMstT3ABLjNsuumcURA0fzgZzbD+7BmO9GYWVB990JViJcY+gaNXUnq
         jTQ6hNdIZ9CaCOnsTEs6YMlbZFVXbYT2lA9/6D/+U8G5fnBL9YCmSMxtSlCxfUQHT65Z
         dHOCQgXeFPw/LYlcme2wHVwPTOsVh7M7AcGFUFNbWnI6mM2dIRTztCnvJ/zM6wYAX4gg
         TkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=e9oD0W0ylRYnkIlTyiKZwIapNVPUeC7hKoZrwz+0k8Y=;
        b=GcUopEzvHET5BYiO4fBtEsptxNPjJJjWjieaYAOoqllTuUlggy5GrN2T0+kLs4dwqY
         EU+J82s5VzzL5lnfseZ3iKcBrwIF8u/b4+CqKnwZXq5jV7UeldTI46WqWrM0MH1RBPPS
         pei/0vL3IbjIVdhPvAQLwe+YmjGp6fhiL/+9tbNX+VDfVOcAEedjaLmuFFiR8vBoECEl
         kcXkQ5MpZQqSxZhqZbzkTR5t+bM/TDdYzup7GsvJQz6YGqCA1cQyZZ+/CWM2WsOOFg5Y
         Qt9ueFxN0WEhb0Qm8zqDqM7iLcqI8tDQ1hnCPBzMFW3v5dN4Z69pC/fYWtRZQdY/BeFC
         6pxg==
X-Gm-Message-State: AJIora9+10SWsGF50Ns/qb0RE8illgHTZKuITacgrYwMd7SAP7gcACZg
        dmFuG0EWvlY7eCrvpAnBV8wJXg==
X-Google-Smtp-Source: AGRyM1tNiYBj57sFkmJtXiMiuQlgRK9d7swr7qhm/sS8KIyogJ13HhMpOsZ4wLTWDH7PPHj4ALFQBw==
X-Received: by 2002:a17:902:e74b:b0:166:4d34:3be3 with SMTP id p11-20020a170902e74b00b001664d343be3mr34821376plf.102.1655906846962;
        Wed, 22 Jun 2022 07:07:26 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id mp15-20020a17090b190f00b001ec92c52285sm7633207pjb.21.2022.06.22.07.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 07:07:26 -0700 (PDT)
Date:   Wed, 22 Jun 2022 19:37:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 3/8] OPP: Reuse _opp_compare_key() in _opp_add_static_v2()
Message-ID: <20220622140723.msm3sxsuvtshotld@vireshk-i7>
References: <cover.1654849214.git.viresh.kumar@linaro.org>
 <2e335a6c263704a8d465bd02896fc5fff0533fdc.1654849214.git.viresh.kumar@linaro.org>
 <eb9558fd-4f2d-4e83-f9a3-86ff5dd51784@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb9558fd-4f2d-4e83-f9a3-86ff5dd51784@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-06-22, 14:58, Jon Hunter wrote:
> FYI ... if I checkout commit 00d776d33da9 ("OPP: Reuse
> _opp_compare_key() in _opp_add_static_v2()") from next-20220622
> it does not compile ...
> 
> drivers/opp/of.c: In function ‘_opp_add_static_v2’:
> drivers/opp/of.c:933:25: error: passing argument 1 of ‘_opp_compare_key’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>     if (_opp_compare_key(opp_table, new_opp, opp_table->suspend_opp) == 1) {
>                          ^~~~~~~~~
> In file included from drivers/opp/of.c:22:0:
> drivers/opp/opp.h:228:5: note: expected ‘struct dev_pm_opp *’ but argument is of type ‘struct opp_table *’
>  int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2);
>      ^~~~~~~~~~~~~~~~
> drivers/opp/of.c:933:8: error: too many arguments to function ‘_opp_compare_key’
>     if (_opp_compare_key(opp_table, new_opp, opp_table->suspend_opp) == 1) {
>         ^~~~~~~~~~~~~~~~
> In file included from drivers/opp/of.c:22:0:
> drivers/opp/opp.h:228:5: note: declared here
>  int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2);
>      ^~~~~~~~~~~~~~~~
> 
> This breaks bisecting -next and so would be good to fix this.

Yeah, this was reported yesterday and is already fixed in my branch, along with
few more fixes.

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

It hasn't landed into linux-next/master yet though.

-- 
viresh
