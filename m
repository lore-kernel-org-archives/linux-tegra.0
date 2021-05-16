Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DCBC433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 506FA61151
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbhEPVdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 17:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhEPVde (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 17:33:34 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AEAC061573;
        Sun, 16 May 2021 14:32:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a2so5842248lfc.9;
        Sun, 16 May 2021 14:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qVxlDDMwfVQojHS8zLyG8W4OehHVhD+swLOmEmLIWIM=;
        b=di6gvGCm6hP9aguUGgg03PKOpJHMsrWHZ85KkLBbE9ODuGM3gaRyIP2+aUgB2gvoCt
         Ijos4JFZbFOdJQycV6dFV3W7VY1xyX0isBC/aehopd/HjM5IUDSw5DhKvRgHsjg+te2W
         SgV9K+AaPS4oEX/18bOMzACtl0zA7fOuKNbKU91VDKBYZu/qBfqdauJoaiHbA4KUiDDv
         Mr3E8wNvf71GkHFkUmmHqF6XrTBYfPwWZnpwt3QIW9uwt3WBdZQdS6UJ+naauUPfAnDp
         /6mdG3QNRgwwRvI+R5QM5QYGg4qqB/jZ/5A1wGI3XPFNHia7SY+PO7LI5OTHRcT7fxfQ
         McFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qVxlDDMwfVQojHS8zLyG8W4OehHVhD+swLOmEmLIWIM=;
        b=Yuqx9tivQfmS23uDaRHSwgCBVf9TAYlEwKr7orz9A0TYpntjUsnwrfPN31Cvw2k0L/
         1RCaK19RPyYsOQsWwuCFz9eFOoJDeGxv7zzhjQXM7OXSrgIrmrxJdSOWy6L74EGM7+z1
         vPhTHlQnbOc4jhcLoThL1nqHjN0u9ZGABxyGtO9O93bZzTuff1Gdwr76djuLBpPv1D29
         Sc3fvxpDfr1CCn7FX/KvSG8qOU+LkbA8XU/1VNavBQx2ITKMJaV+lVwzdqNL7Mzm3A8O
         yZxmuNOZEkC3xi4yOik7Pdi3avVSSawjojePe7qY3RXFre2l8/tCW+uxo0FpwtURkj/q
         bzWw==
X-Gm-Message-State: AOAM531Yqf+y8AiUJVjD7hXHbqPB6BrNy3FZF7N8pFlS8W5avV0M+053
        j6bf+ZpFO6m2pOqQLDjpQaLDyAuLUfM=
X-Google-Smtp-Source: ABdhPJyjyzjbPM8KgyvkU+6XZJiE0VuqEVP8TQGPg8ppka3ZJ2R87MzQs6GvxA90HDVvQi8YLLUyww==
X-Received: by 2002:ac2:51c3:: with SMTP id u3mr40226351lfm.196.1621200736455;
        Sun, 16 May 2021 14:32:16 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id v20sm1752104lfd.92.2021.05.16.14.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 14:32:16 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Restore voltages before rebooting of NVIDIA Tegra
 SoCs
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?Q?Nikola_Milosavljevi=c4=87?= <mnidza@outlook.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510220526.11113-1-digetx@gmail.com>
 <20210514213251.GB1969@qmqm.qmqm.pl>
 <5047e49e-fa86-1e9d-a114-cbaf31f5b86b@gmail.com>
Message-ID: <e0d5fb63-ad3a-2e1d-52f0-9458598d6364@gmail.com>
Date:   Mon, 17 May 2021 00:32:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5047e49e-fa86-1e9d-a114-cbaf31f5b86b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.05.2021 01:18, Dmitry Osipenko пишет:
> 15.05.2021 00:32, Michał Mirosław пишет:
>> On Tue, May 11, 2021 at 01:05:24AM +0300, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> Nikola Milosavljević reported that rebooting wasn't working properly on
>>> Asus Transformer TF101, which is Tegra20-based tablet device.  We found
>>> that TF101 and some other devices have bootloader which doesn't re-initialize
>>> voltages properly on a reboot.  The problem is resolved by ensuring that
>>> SoC voltages are at a levels that are suitable for the rebooting of the
>>> SoC before reboot happens. This series adds reboot handler to the Tegra
>>> regulator couplers, it bumps voltages on the reboot event.
>>
>> Which tree does this series apply to?
> 
> It was made on top of linux-next, but it should apply to 5.13 as well.
> What conflict do you get?
> 

I see where the problem is, there is no
tegra_soc_core_domain_state_synced() in upstream yet. I haven't rebased
patches properly, will be fixed in v2.
