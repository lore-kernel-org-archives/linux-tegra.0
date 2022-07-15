Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9CECCA47F
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jul 2022 22:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbiGOWjY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jul 2022 18:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbiGOWjX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jul 2022 18:39:23 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03F9248CF
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jul 2022 15:39:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b26so8577488wrc.2
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jul 2022 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HKeRLYmaiyT0QsZN/+8k9YJ8hsv5aCHl1ye2RpuX0Rs=;
        b=WLbZVQbcn/Z4IL593ZAkHola/vlG7OV8nJTCeQDosjrQiYP5vBdw2mbpaRyDYQOl2G
         qP2r0VjAI1VaQvJVYWNf/wI4qNcFiW+TiKgDwwVbwRZK56/4PCQGEnghWwUOlEQnSMlh
         JHURe6dV4E87xo/4pTASuObsH5g5D1Fb2WJT1nTkZaew6OWwsjosDirUPdVZWuwTu70z
         5NiID/1AfjSp6CYcJXhgj+OZC+ZHBJoOpZ4vcq+Xz0j0bQ6ymvPko2KOapw3F0HINg27
         U/f/jmMkrFcwp8aGefLwhXQQMt7cLuApqUpWNB0qrBDtkRQ2m5k1+GeFS+ixGA4Bi53v
         YY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HKeRLYmaiyT0QsZN/+8k9YJ8hsv5aCHl1ye2RpuX0Rs=;
        b=TjnBpvbSoOh9wzhWYYuJt+HO9th2WNNhZgkG3KYX7Qu4DjwabxUPIJ0o4/Te5Floe8
         7ERl+/EIh680oFecJlW2jlM5qH1hjoIOObg59t46CpJ8sb2pyZ3PlS0N6nnZY0lDHcEU
         ysZPSoRRJDjfDDEGWoDnT2FSX9oivMp8ey+y8NKP+v/5oUuVq5rE2X/B5WOXgZOHIpn9
         Wkzqk2y/zQ4JdxA36rdDdwpg3o/c62hArlkiLrKbGn130PbvfTUEeBs8tdDCz4t//zZM
         pPgu5yOMhNsHptwxmMBVWr/7bJoRLMZeb4PROzklem0KyjTZgzdny6uCp83+9QvU9/5i
         c9Hg==
X-Gm-Message-State: AJIora/6NrFhGBKBYE08fk/3aubyVOpwL6JizQRLSN3xg9387ARGseFp
        G+VNMUZij0GbWBmlMslXFGX2WQ==
X-Google-Smtp-Source: AGRyM1vXQ8gvwtOOnPJdbUDyuoLyV70NJeblMrk1sKt5gbV6jwaZRFs4/gJY+FxUqi5uTp52DedCRw==
X-Received: by 2002:a5d:5847:0:b0:21d:b75e:12d0 with SMTP id i7-20020a5d5847000000b0021db75e12d0mr13850978wrf.208.1657924760237;
        Fri, 15 Jul 2022 15:39:20 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a223:f4b3:40c9:43fa? ([2a05:6e02:1041:c10:a223:f4b3:40c9:43fa])
        by smtp.googlemail.com with ESMTPSA id n15-20020a05600c3b8f00b003a3080eacb9sm5525243wms.24.2022.07.15.15.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 15:39:19 -0700 (PDT)
Message-ID: <c22f08d9-d55a-70e2-3413-b6cc279f6166@linaro.org>
Date:   Sat, 16 Jul 2022 00:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/6] clocksource: Add Tegra186 timers support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kartik <kkartik@nvidia.com>, tglx@linutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, spujar@nvidia.com, mperttunen@nvidia.com,
        rgumasta@nvidia.com, amhetre@nvidia.com, akhilrajeev@nvidia.com,
        pshete@nvidia.com, vidyas@nvidia.com, sumitg@nvidia.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <1656922422-25823-1-git-send-email-kkartik@nvidia.com>
 <1656922422-25823-3-git-send-email-kkartik@nvidia.com>
 <YshDgwTIUKanczPJ@orome>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <YshDgwTIUKanczPJ@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/07/2022 16:47, Thierry Reding wrote:
> On Mon, Jul 04, 2022 at 01:43:38PM +0530, Kartik wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Currently this only supports a single watchdog, which uses a timer in
>> the background for countdown. Eventually the timers could be used for
>> various time-keeping tasks, but by default the architected timer will
>> already provide that functionality.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Kartik <kkartik@nvidia.com>
>> ---
>>   drivers/clocksource/Kconfig          |   8 +
>>   drivers/clocksource/Makefile         |   1 +
>>   drivers/clocksource/timer-tegra186.c | 508 +++++++++++++++++++++++++++
>>   3 files changed, 517 insertions(+)
>>   create mode 100644 drivers/clocksource/timer-tegra186.c
> 
> Daniel, any more work needed on this? Looks good to me, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> I've picked up patches 1 and 4-6 into the Tegra tree, so you only need
> to take patches 2 and 3.

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
