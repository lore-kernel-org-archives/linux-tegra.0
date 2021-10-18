Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5384AC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 18:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BEF761263
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 18:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhJRSMR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Oct 2021 14:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhJRSMR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Oct 2021 14:12:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CE3C06161C;
        Mon, 18 Oct 2021 11:10:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o26so1334667ljj.2;
        Mon, 18 Oct 2021 11:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=834VzpUa4ETbOpHgtiItKvZoG1eRSt1ZgxMSpJlgjv8=;
        b=GuAYKt1cfUqAO7Pc7r5JZ1Hed9ChkJW1MmrCaL4IV+zuNMUh68Bnoa+iBZZzVG3/V3
         AXtCRQuEF5w3FZFxlKRdHam9TJ6TvQbPlHKkecp18LEtneOKpu05RADp39GGCm5shqa0
         Aa7lcum0niO8hab/6gUREZjrvt4Vz8oT3x6WXMNpgiDBapZNgOJtfNh4CAGrOhgJPazB
         ZVCIjL3mnbbWuBp62lAwS/kErWswixIoO7dOGmdR5b1KezsBJRe0Vy+v7b52qk28pXZb
         Cz1U7PTOL8NWfGPTiVq1fXGCMT9Y9cyvcusfEk924gD7uD8OKSefSkRTuNwx5Q1h9qso
         QiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=834VzpUa4ETbOpHgtiItKvZoG1eRSt1ZgxMSpJlgjv8=;
        b=hrgvpWM9cxBYXbRJblihm8W1sXvKoNXPzYyJRjb+jhoLNXmxJ0FX9GegfLl9hUKWsU
         0IAq3aXMOWSs0jF+nXDmKzVHouIbSfTCxaJc0jeIqLGaCshZwHFhXDBWiIhlW1aIujAJ
         FogOU+k5D+na5Mx0EqppJjcMDgTOD5QPCHzbMgNdzorLjTs3mYZfncgSkWXZwf2L4tMH
         4DGeZZUSIojgGluOnFDDD+Q0G0R9FYMgcIbu7DETzYGy/vMCeNjK3REyMrdjL6r1LzVb
         VrooOzxSa8DfPOtEN5/ATg/PQHn5IkX1gp12q4bXMz3ouCUCM14pLjXLMWN5Xvel4JkR
         yaOg==
X-Gm-Message-State: AOAM5305OcIoE1cDtpDJh9+M/v7ay5ZwWaOxxM/KAlOqhkRNQPwNrPIC
        pBoLmML8I/6rfC2w7zHJbdSm69ZxQnE=
X-Google-Smtp-Source: ABdhPJytTWpP0dQjevcqwRq7EUPGp3I1YBvpVsOPqGL/Qi6PO7VYkWGsppgv7WLVg8gInv4kAyDcyA==
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr1280610ljb.467.1634580603791;
        Mon, 18 Oct 2021 11:10:03 -0700 (PDT)
Received: from [192.168.2.145] (46-138-48-94.dynamic.spd-mgts.ru. [46.138.48.94])
        by smtp.googlemail.com with ESMTPSA id q189sm1677995ljb.8.2021.10.18.11.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 11:10:03 -0700 (PDT)
Subject: Re: [PATCH v5 0/9] tegra20-emc: Identify memory chip by LPDDR
 configuration
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211006224659.21434-1-digetx@gmail.com>
 <163428239295.5772.13742394976706710476.b4-ty@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9b621a44-6a20-2df0-b451-929adecc02f8@gmail.com>
Date:   Mon, 18 Oct 2021 21:10:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163428239295.5772.13742394976706710476.b4-ty@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.10.2021 10:20, Krzysztof Kozlowski пишет:
> On Thu, 7 Oct 2021 01:46:50 +0300, Dmitry Osipenko wrote:
>> Support memory chip identification by LPDDR2 configuration, which is
>> needed by ASUS Transformer TF101 tablet device that doesn't store RAMCODE
>> in Tegra's NVMEM.
>>
>> Changelog:
>>
>> v5: - Added new patch which adds vendor prefix for Elpida Inc.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/9] dt-bindings: Relocate DDR bindings
>       (no commit info)
> [2/9] dt-bindings: memory: lpddr2: Convert to schema
>       commit: 8a3294b74ac621ab03ef88cb964c13089ffdf015
> [3/9] dt-bindings: memory: lpddr2: Add revision-id properties
>       commit: 3c1a1b4b191978559cae5c626da012ef897c1139
> [4/9] dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
>       commit: 624f42157b99d253e6a52a7f93123eb0dbe1b26c
> [5/9] dt-bindings: Add vendor prefix for Elpida Memory
>       commit: 8712faaf12106bc70fcaef2cb89f7958faddbe59
> [7/9] dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
>       commit: ab4dd82cf5f8dd1943acf9243058262bc33c5af6
> [8/9] memory: Add LPDDR2-info helpers
>       commit: 5c767f684651e74f81c4d6a363e3779af3a77cc0
> [9/9] memory: tegra20-emc: Support matching timings by LPDDR2 configuration
>       commit: 4964b3e5c9ad4ad85b44f826a12c008af826545c
> 
> 
> (dts patch not applied)

I'll try to send that dts patch to OMAP people, thanks.
