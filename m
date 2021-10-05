Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CF4C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 15:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A93C611CA
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 15:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbhJEPxd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 11:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbhJEPxd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 11:53:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EAEC061749;
        Tue,  5 Oct 2021 08:51:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g41so87870245lfv.1;
        Tue, 05 Oct 2021 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=exd7cB2eRheopuzqHRQfFwH00Rjr9jsRGEU+VKQb+OU=;
        b=YGNSNFgWHko3MSQM349fQ1TclyPzlMTwzkG8qW0+rC8w064y2W5vjW3PiFpaAMfeMx
         CC5ZNTt8rhljZdzN6fxZ5HbJsiqYY7bPdQXdyH9gCyrqNvhO8cYw2ElAcyD5HBPEfH6U
         A16ZZesBpj5Vnz9o7XjZBaZlqMU3P1WNLfCB3w85aqVPcr4lu42gVfPTsn071YzW3zy/
         Y2Xr9uk9d6HkYMOACBwVbQHdSSz/kUUhRFbR+zilHbZBUp33IKdRLxVlUofU4dslatfR
         NBIURTr7Q+gA1+3sTJqp3vRkKNnMVBxqA59n0s4rnvcc5Jdcz3iFsXfKNxKAdkGev53S
         2qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=exd7cB2eRheopuzqHRQfFwH00Rjr9jsRGEU+VKQb+OU=;
        b=hidsey8Xg8QoFpD0kbWMTUOelyVpU2E0UHrUq6M9+oVyUjghwX6X4nG1PpaybQZmEQ
         nc4k13JH/9sE9ihVysMtyzOGVM3xawEQZOaOE8GfbHbkrfIRZcrRkW3SB85Z4FZb7pNJ
         biuCCbJWJTLkSqKtuoQ09k4QexZyC7stasmcNldavcHdiD+MTvsKbY8BEaD12YYZ5rYD
         iGqWvlhj1Ol9wKh7nyOWdH1jsO/oFaK8BYsNqxR0zmChOBKcpncI7k9jZvYRZInUoFVC
         zod/+kpJfSGoxb0ERLWAXCfOak60OFjSc0tGVAlJ5tYsgtNcJHgjwFDqG3O4OFeTallx
         2MFw==
X-Gm-Message-State: AOAM5322zIITCEpPayr+ZGAESImd1hJjoXJ1HwuXLhJ2DfrX3/WlsLOq
        U007Dt7dIx8ooD9CYWAdd1bMOnzDG1s=
X-Google-Smtp-Source: ABdhPJzBiEVmlzJPY5GRtGkvRmKB7fT9JdDE2faKoCdfuHCYL73UPh4luaMu94FdiTftNaSY6mwgiw==
X-Received: by 2002:a05:651c:1067:: with SMTP id y7mr24234481ljm.481.1633449099938;
        Tue, 05 Oct 2021 08:51:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id n9sm903128lfq.100.2021.10.05.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 08:51:39 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] memory: tegra20-emc: Support matching timings by
 LPDDR2 configuration
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003013235.2357-1-digetx@gmail.com>
 <20211003013235.2357-5-digetx@gmail.com>
 <636b147b-0a71-8c40-7038-1227918986e5@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc730748-04a5-f5bd-727c-a8b7d67b2a26@gmail.com>
Date:   Tue, 5 Oct 2021 18:51:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <636b147b-0a71-8c40-7038-1227918986e5@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2021 12:09, Krzysztof Kozlowski пишет:
>> +static void emc_read_lpddr_sdram_info(struct tegra_emc *emc,
>> +				      unsigned int emem_dev,
>> +				      bool print_out)
>> +{
>> +	/* these registers are standard for all LPDDR JEDEC memory chips */
>> +	emc_read_lpddr_mode_register(emc, emem_dev, 5, &emc->manufacturer_id);
>> +	emc_read_lpddr_mode_register(emc, emem_dev, 6, &emc->revision_id1);
>> +	emc_read_lpddr_mode_register(emc, emem_dev, 7, &emc->revision_id2);
>> +	emc_read_lpddr_mode_register(emc, emem_dev, 8, &emc->basic_conf4.value);
> You ignore the return codes but you should not try to load timings in
> such case. The DT could (by mistake or on purpose) have values '0' for
> the fields you compare.
> 

Good suggestion. I'll add a flag that will prevent loading timings if
there was MRR error, thanks.
