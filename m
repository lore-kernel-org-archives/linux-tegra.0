Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2BCC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 17:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36EF5613DB
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 17:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238036AbhJDRHH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 13:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbhJDRHH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 13:07:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC52C061745;
        Mon,  4 Oct 2021 10:05:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y15so8800584lfk.7;
        Mon, 04 Oct 2021 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hjjZdeUEp0/4fUr63QkE2TTYbTpb7SXPyJvyoceinIg=;
        b=AnMkcDTsrywKhl4y+oppPWcYZcIKQ63v3gS35gx0/IvVoLEprhHDnA4uvm95SaYYhA
         W5VXBFqElv/CKGKZS+FUuJdiR3+96LkR7BxPjhNva3Kh9AVfrIOXmfCAln9++FD9crKO
         mBLaM5mpfYJ9+djgbhbxgT3irK7tFMBEiEo5FYI2+8hVhQDK5E14AjWHCCrJaxPZPfJh
         mCFvXbb/JsE0VVAZsRRKL5IubO5tcUzS5gzmlwHcH/f+yRoqTZcYHegiKRPl0l11GrrI
         yOu3gITcCuQUnQlKH+TnifKIj3altWR+Kv0e1zVHOCfjjzqy0Cfel/JQpNHCKW8M2K0H
         iNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hjjZdeUEp0/4fUr63QkE2TTYbTpb7SXPyJvyoceinIg=;
        b=ohUPi/VrV+oLFnUdULY5aW06fkGIVCtMMdLRMwyRe8Ny4dCqUtKinBKFQ5L44jLsRx
         u4+4yjp8dB7nZaG3NwNB0CObx+mDpArp0udWQHIxgQZ6Spiou89kbSIrMtv3sm6W1EYR
         ES/fXreSmJ2VYM2rwxPPpZtJe3D35J1aSUPHEV6fkXF9CiyaUEDGUpKu60DRMt88dWyV
         9d1vMPWi7kuLoIHUIK6LwjK2lNHQgbq93QS8dsF7lJyYTnsDFvfyYjVjRHKunYMthMID
         0t2Gq1aZdbLWy+b/8Jv87UxOx705kFIY6NJmWLL/YNvCdb8wPfv/vmPgZ714xcl6BmkH
         szKA==
X-Gm-Message-State: AOAM530VighfvqdVIujMNq85EK8hfJr1+L1MR/INUm+4HfsjQn/LcAZv
        osxPcrTF06HzxkWg1XFYj35+1DG5Hck=
X-Google-Smtp-Source: ABdhPJxKoUyZO6u3SJQhLjYW/+mnS1pgFUV5IK5hg0dLyXSHlpeXAAVlxm4bUXQ7O0iQyC6gIRP8Fg==
X-Received: by 2002:a2e:814d:: with SMTP id t13mr17592208ljg.237.1633367115986;
        Mon, 04 Oct 2021 10:05:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id j20sm1481798lfu.304.2021.10.04.10.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 10:05:15 -0700 (PDT)
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
Message-ID: <e41c944e-1b01-ef09-78a9-8dab7f97b054@gmail.com>
Date:   Mon, 4 Oct 2021 20:05:15 +0300
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
>>  static int emc_setup_hw(struct tegra_emc *emc)
>>  {
>> +	u32 emc_cfg, emc_dbg, emc_fbio, emc_adr_cfg;
>>  	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
>> -	u32 emc_cfg, emc_dbg, emc_fbio;
>> +	static bool print_sdram_info_once;
> How about moving print_sdram_info_once to emc_read_lpddr_sdram_info()?
> Less code here.
> 

The SDRAM info is printed out for each attached SDRAM chip. There are
two prints if two chips are attached to memory controller. Hence this
print_once flag should cover both prints.
