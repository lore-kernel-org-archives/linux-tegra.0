Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFABC55179
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 049C420791
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3iZHgAD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgJ2Ac5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733169AbgJ1WXW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:23:22 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98299C0613D2
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 15:23:22 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id de3so579926qvb.5
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 15:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=q3HZdrGNxCI/rwL2bJs+sG1c4DmY7gX64VUv8zPGJp0=;
        b=w3iZHgADd5v9U6zAOB8D+M8MEqnphniRW2Jy/fJCVN1kcqPClAO4LvMLqXOn07ZoLx
         ghyYw4tbLkd4ZLpFJ5yYzeB2FBTJQOSqLMu+eu0MDJFJ1PQQMIkmn0b06suSVU6pNGV6
         uV39iGdCd3/RgcBjaecMILewDPwDqHInv8BvhYSJukEtH5w8pUdZPPy3QYGUUlq8TXYX
         hViJ47ZuJPB3vTAc/INXSEvHVjOHsgy8am405mFyVp6YQXoavgdc2s31XtRWYPbONypI
         78PXWgfQYCOgG1JQeffggPKb8W+MjeWpY6LcpiSzsV3ffNOzQEzvrZzoRDJygvKe4ngM
         kzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=q3HZdrGNxCI/rwL2bJs+sG1c4DmY7gX64VUv8zPGJp0=;
        b=INhliHcQqGp/5iM6UrPIARAnSQY+dmr8gdJ/4Iucgck2wcbUbosdO7lqKelW8srzlu
         eR5nKX374CgVn2R8Sv/Ct+pzdPSo5E2x3iZ0K8sQE0c9ZGPsOOgWeLkH6mKZqTIMmWYH
         F1bYGeDXHLFbzlh4xxEp+kaSyvUmGozXcM/1apUwynNcVGyDPy0ncFFCVCs3Z6dQEEbU
         vCHv45hDss0uBNYrfgx7helj6P5pqvspFkjSz3F020A0gulva0KAf5C71KUa1gncK0rD
         4vRYHfnk+l4UrX8/s8Bt6Y3395laOyrxH43b3gi27xpXefif5LJr3tDgALtSlog/JUNW
         KKvQ==
X-Gm-Message-State: AOAM530NRE+j/Wbq2zX2g4DQ4R+efLjTra8M7jo1dhoG/m71math7YA2
        QG+p8lJ102UPhZ3arp4u7sUdmgJCZ9czEg==
X-Google-Smtp-Source: ABdhPJx3bloTJFrm0fb9VkDA3VdvEPdnyGyj3MWhkAqG7wE90ovxnS/KcE9dbBFeor/v06ApPv/DnQ==
X-Received: by 2002:a05:6a00:2cf:b029:160:c0c:a95c with SMTP id b15-20020a056a0002cfb02901600c0ca95cmr5587882pft.76.1603857803605;
        Tue, 27 Oct 2020 21:03:23 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id kk14sm3187829pjb.47.2020.10.27.21.03.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 21:03:22 -0700 (PDT)
Date:   Wed, 28 Oct 2020 09:33:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 46/52] opp: Put interconnect paths outside of
 opp_table_lock
Message-ID: <20201028040320.4nobxzudy3fuwmms@vireshk-i7>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-47-digetx@gmail.com>
 <20201027051013.5gr4s3wuuwxsd7ax@vireshk-i7>
 <44169d24-4afc-5388-788f-d1e8263fc627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44169d24-4afc-5388-788f-d1e8263fc627@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-10-20, 23:26, Dmitry Osipenko wrote:
> 27.10.2020 08:10, Viresh Kumar пишет:
> > On 26-10-20, 01:17, Dmitry Osipenko wrote:
> >> This patch fixes lockup which happens when OPP table is released if
> >> interconnect provider uses OPP in the icc_provider->set() callback
> >> and bandwidth of the ICC path is set to 0 by the ICC core when path
> >> is released. The icc_put() doesn't need the opp_table_lock protection,
> >> hence let's move it outside of the lock in order to resolve the problem.
> >>
> >> In particular this fixes tegra-devfreq driver lockup on trying to unload
> >> the driver module. The devfreq driver uses OPP-bandwidth API and its ICC
> >> provider also uses OPP for DVFS, hence they both take same opp_table_lock
> >> when OPP table of the devfreq is released.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> ...
> > 
> > Never make such _fixes_ part of such a big patchset. Always send them
> > separately.
> 
> Perhaps it's not obvious from the commit description that this patch
> doesn't fix any known problems of the current mainline kernel and it's
> needed only for the new patches.

No, I understood that we started getting the warning now only after
some other patches of yours. Nevertheless, it should be considered as
a fix only as that generated lockdep because of locking placement. And
so sending such stuff separately is better as that allows people to
apply it fast.

> > Having said that, I already have a patch with me which shall fix it for you as
> > well:
> 
> I see that yours fix is already applied, thanks!

I hope it worked for you. Thanks.

-- 
viresh
