Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCB8C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 18:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AF8661073
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 18:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhETSN7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 May 2021 14:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbhETSN6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 May 2021 14:13:58 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBC7C061574;
        Thu, 20 May 2021 11:12:37 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v8so20878935lft.8;
        Thu, 20 May 2021 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NWQLbjqaSr16R/PNxaSSu+zkzXrzSBFweb42I5zYe8k=;
        b=PK+x0rqPqzeI9pAzqQe6aIc7BA0ICpwOcJCPGJa9IJXTgzUDi5ZfViSsXQLpKGIKsE
         37knsHsjMwqok3+9lVr+jhmSCbcUfufqtrfLMDacQpFon+xzGJxDPCQfKeDbQ/dGWn1V
         DuIWMHPFCOAjH0/MzCXTgq4UXq7aS2nRQ24u1vFcTx93yoAj8m62hhWyre92OgIHsNl7
         by8lVQEEynnWlvHnUL2XulPbGOjU1DP82cLPlZZXXV/FHL94wQz5UAqG2a3PHu548eqQ
         JddrFYFmIV54CPMCFD49uskRPZbimEypKDbA2wVQrrb007MvO0CcNhnzwzFlEcBcrYCc
         8j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NWQLbjqaSr16R/PNxaSSu+zkzXrzSBFweb42I5zYe8k=;
        b=gNYmtiXwXkWtTRgAL7y40v3um23jVvVa5Q9PHjoD7fS9kawndfs081ak57a1X/DRrr
         E2r3k74hQTp3AQiqreBIidvnDxr4YODWzMwRCO4VY0RqTYVOCAp05nxpuuVwj2yG18sp
         Hfo6cLvpVzxqzfIWiKs6YPaYfCSESZPM48V3m+4P2k4ERZKSK4QcKAs+ah92LxouO5Mq
         mCelk0ea4so7nL5sdRPzK8D9VaV6SvVHiNtHqxn90VmzJsxRUtF7ezEizsO//urYkOrB
         z3hFRkmxSpa89ur5fQmLMAvQDp8IVhhPOYGgTSqseTzbsFY85iFkF3gTOSRbq36g0W3x
         L2sg==
X-Gm-Message-State: AOAM530nm4Jy8wvcE5pcwX2k7BLV62yPFr4+RdvZejePJftdDEepk3Jy
        HpyephVKJK/2KEApNGklWrYeojE6sHg=
X-Google-Smtp-Source: ABdhPJyCypt5x2T6bL1CZz+kMGRD4Q6YHedxXO7wfpqWKweLlxHgJhSgqtj3X5qo/eGJvWtTNXuB8g==
X-Received: by 2002:a05:6512:3d0b:: with SMTP id d11mr3856695lfv.405.1621534355395;
        Thu, 20 May 2021 11:12:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-88.dynamic.spd-mgts.ru. [109.252.193.88])
        by smtp.googlemail.com with ESMTPSA id h16sm363670lfj.194.2021.05.20.11.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 11:12:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] ASoC: tegra: Set driver_name=tegra for all machine
 drivers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-2-digetx@gmail.com>
Message-ID: <c05c2cd0-726d-3f37-be0d-05d8b9122c69@gmail.com>
Date:   Thu, 20 May 2021 21:12:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520175054.28308-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.05.2021 20:50, Dmitry Osipenko пишет:
>  static struct snd_soc_dai_driver tegra20_ac97_dai = {
>  	.name = "tegra-ac97-pcm",
> +	.driver_name = "tegra",
>  	.probe = tegra20_ac97_probe,
>  	.playback = {

This is incorrect version of the patch, snd_soc_dai_driver doesn't have
driver_name. I missed to fix it properly on rebase of the patches. The
rest of the patches is okay. This will be fixed in v3 if we'll agree
that this is the correct approach, I'm waiting for the v2 feedback for now.
