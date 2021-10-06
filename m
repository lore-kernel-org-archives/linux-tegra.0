Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8039C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFAF6610E6
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbhJFPqt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 11:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhJFPqs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 11:46:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58510C061746;
        Wed,  6 Oct 2021 08:44:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x27so12231048lfa.9;
        Wed, 06 Oct 2021 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=99MWTeT38qwRLIuXKDVRIiA39mldC4P4+Z58f4c6Oxo=;
        b=JstCZ/Blylc8fozBwwuE60wyxINFp25Rons9sFMwCxhvd2M/WtUs60sR6oesEhgERy
         rAVEy2uXawhbFCMrSKMhYXiayGzOYeftEkmik/gkBgl+efKuhiEoIyVTZ7zuFF783ml+
         sP+haaqtLVmwCKhgF5trgxyk6WQRZPC9jnG3bVkXkOtHTuHPDtv+5O0yozNGsY4S3xZL
         aF3BjeHI5PdxV6qJEM5NH0wbJ8tXXT1xnr3QrwLipOFsz3DASY6/MxED3gI8+cFl/bV9
         3pXOtjaQScfKQMiEVo8TjK9q6kUddT2X21XpG2f9Rrc6tNj6nQEcV5ifdisj0XWnMTbP
         TX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=99MWTeT38qwRLIuXKDVRIiA39mldC4P4+Z58f4c6Oxo=;
        b=3/dYE1N5CM6ISYMeyLbB7bNAiZJr335uzUdAvSvPQRKbrFZYmjPTvFY6B07o4Zdy4a
         eUElWkFh6HNhLVXw033xUBWyQTqyQKePVKzuQKBZNcZdLqGsCyLSO2n/BW96NSJOvKaE
         7LuIEcD+pRkMLgs7RBAwdBlg61pOP+1E/HAXc7yjezYAOCyRIQnEauDXRhMnX83qPMh7
         1EurIJlN3YxNmuDI9A/3xLYtRnFQcB0jCq/nWx7j17iGh/vih432e2Gjk+K0cvLKdiD1
         hsXSYgBNCo0yAa5NfvD9cJFwQ2JtDukCQFNa6PrRfk330erxF0mRNvSlKzuWCUA+sx2X
         +9/A==
X-Gm-Message-State: AOAM531kiQbPdX07NjTHd8GY3bZMK6n1tsHxoycFMzKZoH8py9o0UQLJ
        xlHda1XyZ5r02k5LcMsAdFC5Gly/zLE=
X-Google-Smtp-Source: ABdhPJw7a9UDTlS1otJ7Lud3ywJJxvOGNL9g0UDd+8bMT+kLuXJgksg1Y9VKBa9IZt2VtDIhI02bNA==
X-Received: by 2002:a2e:8915:: with SMTP id d21mr30149653lji.45.1633535094414;
        Wed, 06 Oct 2021 08:44:54 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id t81sm1114224lff.228.2021.10.06.08.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 08:44:54 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] dt-bindings: memory: lpddr2: Convert to schema
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-3-digetx@gmail.com>
 <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
 <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
Message-ID: <481f4d90-638f-b64f-83a2-b882d9bf194a@gmail.com>
Date:   Wed, 6 Oct 2021 18:44:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 18:41, Dmitry Osipenko пишет:
> 06.10.2021 13:57, Krzysztof Kozlowski пишет:
>>> +  density:
>>> +    description: |
>>> +      Density in megabits of SDRAM chip. Obtained from device datasheet.
>> You need here a type/ref, so uint32.
>>
> 
> The type is uint32 by default. I can add it, but it's not really necessary.
> 

You may grep bindings for 'enum: [' to see that nobody is specifying the
type.
