Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8537AC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 16:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ACED22EBE
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 16:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbhAVQBn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 11:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729326AbhAVQBh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 11:01:37 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7683FC061794;
        Fri, 22 Jan 2021 08:00:35 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id p13so7097895ljg.2;
        Fri, 22 Jan 2021 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WKOacFjtIl0I2fdJD2/SwxXGKdu15MP5vVZ1ZKeXK24=;
        b=DvfDRJCOS2tEYUyCRUsTb195aILJ2j5S/XTqCR+Iwm8sb/Ip4S6VkmzNXZ5FRok4cz
         M2umZ+ACI2u4dS48ummRMtGZxCh1eScekynREChTu7U/3xyJ9Rf7LUYOnsF2tELGahyy
         iezkqhUPaV/1CZjs4l0DneU9CIp+ylcXGF1fqQoLlDg8/OpfBddOC7cJzt65B8gDcq75
         R5VuU4+r9EK9/k1RAFPWR5sj5m0+fliITd+xrPmSY1wJR6gs5xhvxQ1vjafKKQKw+uNb
         QuPoY/q5bq/TmzQxqTQ1Zr/kldiALzEqOXFYipoWoCt888U67qeOeTd2ZM6HG5yRhrqJ
         6CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WKOacFjtIl0I2fdJD2/SwxXGKdu15MP5vVZ1ZKeXK24=;
        b=PkUQkRRZtgRtsX0u5R2HqqGtza2NBNoViamz1BZmCMwJT07B3pEePWkJCQSuRMt4TL
         Our1dIKpUL8Ik2KUFAcwL0WqqKxKFGtOXls//iM0AntdkmnaBRyPn6GWtuIQUWXXi8wD
         RMISV6Dga7sGscTQbYpW2cDNQaiaN3LhX+rgCGCLsbF1zY5CRHZmvZILrplis6xxsOZD
         +EAvqX/BeHvnY/uMWCLDKd/kuoaW84DiCVBU4yV+XueclNZjNbY2E3Ge4VOpS68040uL
         WuVi8PeNSZr+mBGf3TlmEnLp3aq9hWlfyTlwNYRTZc81iXhx+SirRettu14AluJoR0FG
         GLlg==
X-Gm-Message-State: AOAM532wBtslIIHQYLlxSNNMzuhJyKHYET3FMu1ji5XDoLrOBUAsE4HL
        ykPPz1wqw3dHdQYFn5dyln918zdY+wM=
X-Google-Smtp-Source: ABdhPJxQirgmrd8HStvvWr25mtQzxEvo/zfpPWaKr7n873zpfLttMd9rwGScqmyLUMDPwk6iM+8PcA==
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr83794ljr.255.1611331233519;
        Fri, 22 Jan 2021 08:00:33 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id r201sm928493lff.268.2021.01.22.08.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 08:00:32 -0800 (PST)
Subject: Re: [PATCH v3] regulator: Make regulator_sync_voltage() usable by
 coupled regulators
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210121221649.23155-1-digetx@gmail.com>
 <20210122134045.GD6391@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <36d0dad5-d5dd-a089-b65b-0d476e639a98@gmail.com>
Date:   Fri, 22 Jan 2021 19:00:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210122134045.GD6391@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.01.2021 16:40, Mark Brown пишет:
> On Fri, Jan 22, 2021 at 01:16:49AM +0300, Dmitry Osipenko wrote:
> 
>> +	/* balance only if there are regulators coupled */
>> +	if (rdev->coupling_desc.n_coupled > 1) {
>> +		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
>> +		goto out;
>> +	}
>> +
>>  	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
>>  
>>  out:
> 
> This would be clearer written as an if/else rather than using the goto.
> 

I'll make v4, thanks.
