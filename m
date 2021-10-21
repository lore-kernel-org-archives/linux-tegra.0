Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745A9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C40E6112D
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhJUN5k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 09:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhJUN5j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 09:57:39 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFBDC0613B9;
        Thu, 21 Oct 2021 06:55:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p16so2358210lfa.2;
        Thu, 21 Oct 2021 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGzsdgOP3mEMXdYYRKzRlewhKUtA5l+09+UDCu2XiKc=;
        b=eE6FnNMvDWj5b1rfd/y1ChxNxz1QdQi/OedZPCob7NpyN5BSpy7amew57hRhhdccns
         XA9FlQhqpxLBQvpM5oTpD0qiI5LBm8l3Bxur3nAzsj/pwJdfbTsjItuLt8BY7H6l3H2z
         p7yogUMJmMyCmK+Z/Ij9+fCkzN0vXew0itB2LORUrrrAkB6OVTKXmDobIngX7b91X0QA
         Qq69TL6SZfpN/4z2rpobqhUkvDoJs/dieCdRL91WIo15FR70ezhBgWHvqa3KREmGUudf
         SRO6ynLudLqxTV2+nviy65AtIYI8CXbFt+KQ6jwExUmwIfJQJ5Vm00oqiQKDGg7r81g3
         r1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGzsdgOP3mEMXdYYRKzRlewhKUtA5l+09+UDCu2XiKc=;
        b=c3pG2y6IfYMwAbvosDtz+WfvF4tyEUHi/nWtCBBGyIc8AKg7mYrWyeOvMpcQ68Reba
         uI7J7h0q0dTfnkh2osvHCJtLMnYbl8HJoNG/JDSm/93Dk8Y0K+9LGTqAXax0QPU1nCSz
         dsKbZUNeTzp/PdmyTAH4uRX/GFkbYRJcC1EnA5pptXJSCzF/xSR2XSOZxv0u2FEF7Q7D
         /CN/Q6MVJxGfSXpZ1U0OB0SQFP23Jn9Mtg1eHjl6TaKOSLax8S5zepV1UjBtYNX4+rpE
         hxsSFAufE7JUzvN+92x0CV7wEKjKVXv7LtYUCgvJLpxBXOj8HBn9k2W7muRHZdzOd/0N
         0prQ==
X-Gm-Message-State: AOAM533QBbewqquYWKx1MWpua5hG5xHU+7h9V7V9BuLV7hJOYTee8dZy
        WFpiHYml/uoQqv4R+i365rUC5ziD0/s=
X-Google-Smtp-Source: ABdhPJyRpHls8VRaUEmUQG+sBd94jpYvetZemkiWdOgUsOigapmHfz1QsqkJGpX+/D+EXtlqIuZlVw==
X-Received: by 2002:a19:c10a:: with SMTP id r10mr5401797lff.95.1634824518342;
        Thu, 21 Oct 2021 06:55:18 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id m18sm117998lfg.199.2021.10.21.06.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 06:55:17 -0700 (PDT)
Subject: Re: [PATCH v1] regulator: Don't error out fixed regulator in
 regulator_sync_voltage()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211021110707.20416-1-digetx@gmail.com>
 <YXFnIPXwPuNWM4XG@sirena.org.uk>
 <7ee0ccd7-8ac5-8a9e-7f55-31fac944a5d2@gmail.com>
Message-ID: <89d99367-1f69-a9b8-90ea-7f794c85d5a5@gmail.com>
Date:   Thu, 21 Oct 2021 16:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7ee0ccd7-8ac5-8a9e-7f55-31fac944a5d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 16:46, Dmitry Osipenko пишет:
> 21.10.2021 16:12, Mark Brown пишет:
>> On Thu, Oct 21, 2021 at 02:07:07PM +0300, Dmitry Osipenko wrote:
>>
>>> Fixed regulator can't change voltage and regulator_sync_voltage() returns
>>> -EINVAL in this case. Make regulator_sync_voltage() to succeed for a fixed
>>> regulator.
>>
>>> +++ b/drivers/regulator/core.c
>>> @@ -4249,6 +4249,9 @@ int regulator_sync_voltage(struct regulator *regulator)
>>>  	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
>>>  	int ret, min_uV, max_uV;
>>>  
>>> +	if (rdev->desc->fixed_uV && rdev->desc->n_voltages == 1)
>>> +		return 0;
>>> +
>>>  	regulator_lock(rdev);
>>
>> It's unclear why this is checking both fixed_uV and n_voltages.
> 
> It's unclear to me either. I borrowed this variant from the  preexisting
> code [1][2].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L3075
> 
> [2]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L4319

The alternative could be to check regulator's capabilities:

if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE))
	return 0;

This looks like a better variant, actually.

>>  TBH
>> this feels like a higher level issue - with normal voltage configuration
>> we would have noticed that our constraints prevent the voltage changing
>> and not go as far as trying to actually apply a new configuration.  I
>> would expect a similar thing to be happening here.
>>
> 
> This works for a normal regulator_set_voltage() because it checks
> whether current voltage equals to the requested and then succeeds [3].
> The higher level code relies on this behaviour of the regulator core, in
> particular OPP core won't work without it and that's why voltage changes
> work for a fixed regulator.
> 
> [3]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L3619
> 
> This doesn't work for the regulator_sync_voltage() because it uses a
> different code path and the whole point is to re-apply the current
> voltage. Hence the extra check is actually needed for the fixed
> regulators in order to be consistent with the behaviour of
> regulator_set_voltage().
> 

