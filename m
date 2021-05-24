Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A078C04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 14:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F8A76108E
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 14:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhEXOX2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 10:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbhEXOX2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 10:23:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2BDC061574
        for <linux-tegra@vger.kernel.org>; Mon, 24 May 2021 07:21:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f30so3898051lfj.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 May 2021 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WvxUCc4ZAD7JYmOhdqHj+SdkI9uXTGsko5jiNtvAqJY=;
        b=o6fgqnwr/iJTavwVswhSV4k99P8BafEWqYYIfXXbwUtA4v60ZhFBYMCjHizLrbq+TX
         ++xPzdtG7C28hAOIPeCnIuNKQ4B5/WeEQKPyn+1PyauS2DaWhKb+Hi4oVeCq5byDTD+1
         CyRJ7XA8zUmuJzfHzdxwR5nqjPkVkptx9djQP+LypIKIkotsMNii8kfqgUjm2KgX3NBN
         NaNVJNKCd7zCBpaMBULzRuQK0acqq6tkta5q0n/AkVYdG1pwNwkhscwFGmgxy/ifJhBi
         FwI4kyX4SpaN8HTSKAOEdIHH4e+WH8B9cIdslznOyYOrKjvwhy4q0uppKB3mMSY9ggLL
         eSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WvxUCc4ZAD7JYmOhdqHj+SdkI9uXTGsko5jiNtvAqJY=;
        b=htnZNJu4QydKMDICwHcULG8CZO6mE4qSoo2Pb1IE1dt6yiqmY50FulfgqkH4TFtfKq
         tTdaxY7TF11zbT7VOUA6UJ2KNLJmYROIbkDvR9CJgSkj4P+xTiJZGNHCiaVQul772MoZ
         NRwjuZ3Hni5dNqCck/9dYwsWEzh+6g8MOQQZgtPDU9Drb3MsXTaxw7fBPz9wlMGmEMJt
         eWMCn4DSX5TvARDE9TsKZ6m8yVjB/0Atb4gPZVCWnuzKAyE9fDLzkNjVx5LHx1QfKNAy
         3f0oiAtE7TbQZHbx4kNde+DC138dFHfAZexFr+l3nX7OCBkSU90IVIbPualOaCRU6XeC
         rHnA==
X-Gm-Message-State: AOAM532IoFud102lXAikY+l3064wAkAla41BQrH2XAWzpiUHE83cDKFM
        rie63T1S3GN+LhgOAg/0PKjlgYSrulw=
X-Google-Smtp-Source: ABdhPJzFat9+xw6z6xb6vabA7m52F4NNlfFIXDqG7AykgsV5FYW7+YO6F4mWHEKuyGSkYVObuXic4Q==
X-Received: by 2002:a05:6512:1027:: with SMTP id r7mr10988589lfr.153.1621866117028;
        Mon, 24 May 2021 07:21:57 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id v25sm1492344lfe.60.2021.05.24.07.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 07:21:56 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] ASoC: tegra: Unify ASoC machine drivers
To:     kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
References: <20210523234437.25077-3-digetx@gmail.com>
 <202105241048.gypbTx2I-lkp@intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97f88bb4-2dcf-4905-ac07-f08adf2f6582@gmail.com>
Date:   Mon, 24 May 2021 17:21:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202105241048.gypbTx2I-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.05.2021 05:34, kernel test robot пишет:
>     66	
>     67	static int tegra_machine_event(struct snd_soc_dapm_widget *w,
>     68				       struct snd_kcontrol *k, int event)
>     69	{
>     70		struct snd_soc_dapm_context *dapm = w->dapm;
>     71		struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
>     72	
>   > 73		if (machine->asoc->dapm_event) {
>     74			int ret = machine->asoc->dapm_event(w, k, event);
>     75			if (ret <= 0)
>     76				return ret;
>     77		}

That dapm_event hook indeed shouldn't belong to this patch. I changed my
build scripts to compile-test sound drivers. This will be fixed in v4.
