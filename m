Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F6BC433E9
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 14:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EE0A64F23
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 14:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241917AbhCDOXP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Mar 2021 09:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240416AbhCDOWy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Mar 2021 09:22:54 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E23AC061574
        for <linux-tegra@vger.kernel.org>; Thu,  4 Mar 2021 06:22:14 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id o2so9360790wme.5
        for <linux-tegra@vger.kernel.org>; Thu, 04 Mar 2021 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DXnsbnWFOqtizEGNVzz0O9y/t7Y86TdU8DtG5CSinK0=;
        b=EEyj+/YytSZwGzpXDR0jJeDVT9TQtKwdJVX8CaQE9Z5YD9zkW7RvrptBgDYZVui5vr
         iydBa8Nnn0YGEvEMO019ctaMB1kKxH0RoKV1q0XmoLkNIy8CFJ3Qy+QoRJHMgd/ujSsU
         dh4Za+F4AVgvW1Va2n1PAw6rRlF83YTkuMyMl4OymXV68di0tuX+NnrkK3TJttascnIQ
         BdBOanNXG4g2kcIV7Kb1Q5IiZaMjA4BdeMrQ4INuCVMNqPIU9PyH+h40MGksqGkQfs40
         BrqBC9EoVQN5cLDomshVV6yHsKUq4yNy3zBYxWUpw48pal72x8fUMzXIQ5Eudm8EXH96
         5jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DXnsbnWFOqtizEGNVzz0O9y/t7Y86TdU8DtG5CSinK0=;
        b=elOXo2kTTnEvgnCxSIOyLkTrzc+JmrBWG6yIKye+ztUW1AaN23lX6TCKUSH3UbL7J5
         0mvhPcfV3oGeCXi4Aw5Zao8l7gy3AybUvLBVhq3bTr73AcHqP4P1q5Y1SXvbmL3ZiOKG
         0aMTijrM3vcATcETvTbsBUOVNlLIjVjlh6Bg4nBBcU09z04cdvwbfzyx+4Q+Nu+A/eIs
         3v4CHBS7mPDx0uCqii7DxC/3UsxRRywko88fEjo+WAEzSXgrEJqYevVDlLGlyF3VLvz4
         fEZp1Bjd6RDZ8tyl8IWrCPVUHlMqTNsbmo2kYgiq7j1UG0xVnz1R9e/k6IT/8kG5np35
         Q1RQ==
X-Gm-Message-State: AOAM533oDVtd59qDcQebVjcd7Z2LiVOhYYdodVYKnuGK6AVpKEKkaYus
        /eOSr+7nuoV9AjgzQnNo0ufrrs/QH3036Q==
X-Google-Smtp-Source: ABdhPJxA2gGfnsfgogpMkW3Rwf/yIOt+WFMXxGAlxB8j6kCyeIhYtCYZqAcDXQjWxrhuOHW931qWtg==
X-Received: by 2002:a05:600c:4292:: with SMTP id v18mr4182021wmc.23.1614867732804;
        Thu, 04 Mar 2021 06:22:12 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net. [82.252.144.192])
        by smtp.googlemail.com with ESMTPSA id c3sm35870214wrr.29.2021.03.04.06.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:22:12 -0800 (PST)
Subject: Re: [PATCH RESEND v2 2/2] cpuidle: tegra: Remove do_idle firmware
 call
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Anton Bambura <jenneron@protonmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210302095405.28453-1-digetx@gmail.com>
 <20210302095405.28453-2-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c5a45dbf-9cb6-f213-6a78-411fa1823f57@linaro.org>
Date:   Thu, 4 Mar 2021 15:22:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302095405.28453-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/03/2021 10:54, Dmitry Osipenko wrote:
> The do_idle firmware call is unused by all Tegra SoCs, hence remove it in
> order to keep driver's code clean.
> 
> Tested-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
