Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BED0C388F7
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38B7C20790
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2UvMKa6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732299AbgJ1WTI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731994AbgJ1WS0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:18:26 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B508C0613CF
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 15:18:24 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id ev17so581227qvb.3
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ga41Dk2QacbKUO1YmiFrIf/2peZltx835W/Ep/5bjyc=;
        b=V2UvMKa69Dkdlem1AtciSVKbnKgZHxoLYKyM36cS8g454HVB1sZ2g1cONlPQFsqPWd
         z4dzoaVMins4+W+OLP2sCd/V8WupCpMR1oov3g/8gnfraEWGLTQZ+63o7xZ+1DTNzbTB
         BYBDyl8vB4h9zuEu9OUiyIQpUsIxhmv59Kflz4+hHFVAaJeXAqBrcOmrKqfeUMEKU1wa
         aJlDM+UmUeY/MXZuBjEnCRXvwmbONVnHqJiC5dlyPAasqETggbN5h8pb9cY6TsWhAxVD
         ct1owktyl9qc1+OV/TQYndakKL/j5WX+ppLaLkqhQJEhax3X3IYq1xxA6yTQUv1Tu4bU
         PJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ga41Dk2QacbKUO1YmiFrIf/2peZltx835W/Ep/5bjyc=;
        b=BX4gb9A9UCzw9WWn98BulYGSayRWJhuQVHXQ0pPlEzLYWUitxflIG6zzUvGKNhPRZk
         PNU7tWZ94g66lNhEd/SskDvk1Q8oDpaQrBiXxJY6Y0ElcRqzUS6FGQJhllatSbi3nMAI
         QS3fTfjojgwhXdKHbzp2S0ujRhorlABazno9O8/eaayYOc0rio1z0GdODRjnAb8rfWWl
         5Eck9ALupBUhPprb5xEyDJyL19C1Gl++gO5KXGroCgliNtbTE18vYnWky6x3fYfsCXIm
         DEiKsJRneKasdFwRQU5gcxzkFbtU+nPNRxNS1TV/ppNxQqPsWbHBzMJNsaOmz6r5Mec8
         JF2A==
X-Gm-Message-State: AOAM532YE1BgI5nciSeYoafKlQlqY6RrPXm3Cm0XJ0D1wYPheZcKmRw6
        VtASDwIwVWQmHL/gg5iIrwnyldH3jsht9A==
X-Google-Smtp-Source: ABdhPJzOkofgCy3dGatAOxX6/apbFXN+EiNmpdS3vtsh9nYwED3wGgQeA+C+6AltBhq+k97WRPD4LA==
X-Received: by 2002:a17:902:be06:b029:d3:e6c5:52a0 with SMTP id r6-20020a170902be06b02900d3e6c552a0mr7560107pls.77.1603896749260;
        Wed, 28 Oct 2020 07:52:29 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id a3sm4561471pfa.126.2020.10.28.07.52.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 07:52:28 -0700 (PDT)
Date:   Wed, 28 Oct 2020 20:22:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20201028145226.5fzl6ryxbkwyxdmz@vireshk-i7>
References: <20200824145907.331899-1-jonathanh@nvidia.com>
 <20200825055003.qfsuktsv7cyouxei@vireshk-i7>
 <09ac354e-a55b-5300-12ae-3f24c8f8b193@nvidia.com>
 <20201016040700.wzfegk7hmabxgpff@vireshk-i7>
 <9c37db70-9406-8005-3478-dc4a5e94c566@nvidia.com>
 <c6ab92fe-e5ea-4568-6457-7a28c8496114@nvidia.com>
 <20201028041152.733tkghz4vnqz2io@vireshk-i7>
 <382ba642-dbea-c36a-0c71-6e91ccb7b775@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382ba642-dbea-c36a-0c71-6e91ccb7b775@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-10-20, 12:31, Jon Hunter wrote:
> On 28/10/2020 04:11, Viresh Kumar wrote:
> > When do we fail if the frequency isn't known ? That's the case where
> > we try to set it to one from the table.
> 
> Currently, if the frequency is not known, we fail right before we do the
> initial frequency check [0].

Right, so the frequency returned there is 0. By unknown I assumed that
you are talking about the case where the frequency isn't found in the
table.

> > But (looking at your change), ->get() can't really return 0. We depend
> > on it to get us the exact frequency the hardware is programmed at
> > instead of reading a cached value in the software.
> 
> Actually it can and it does currently. Note in tegra186_cpufreq_get()
> the variable 'freq' is initialised to 0, and if no match is found, then
> it returns 0. This is what happens currently on some Tegra186 boards.

Then there is a problem with the implementation of this helper in your
case. This shouldn't try to go compare the value read from the
register with the table, rather convert that directly to a meaningful
frequency. Its like reading registers and then doing some computations
with the values read with the parent PLLs frequency. Something like
what you will normally do in the implementation of clk_get_rate().

-- 
viresh
