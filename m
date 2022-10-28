Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797BCFA3740
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 21:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ1VsY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 17:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiJ1VsX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 17:48:23 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B59D24C11A
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 14:48:21 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id j6so4920510qvn.12
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBJznIFzWZyEQbZ4eSSNW6gDtZq5LgNV4oKX/YjGZaU=;
        b=S1rpEcjOVlvANLl0lKIzyQw2/HKiR+gzWh/C1KxmlLUp0TymDAoBBY8Ul+cVdpkdD1
         Qb+bWUawxtnOwh0PeIYsVu+AtzModJPMUMpySwO18TKpURRJCEaWD2UxXDZtkCbTj80K
         kxoqBKC7J3qx9FOP4/N+MzwlGjX2xZocCYVImbCiIPJZBz59J33i7tRXHqlwImhCpS6r
         Xc3omikSPEMPvz741LYlnWLNrU5bPK6HMts1n1I4APzrtQdgsB2sd7z89KuD+OsuRFfE
         Inht9Swb9s7xcvFyzVUOdCUuv8xTNyBBJ9mqwMZKr6At2fkJN5SJC231U7AP+YGuxVuG
         0JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBJznIFzWZyEQbZ4eSSNW6gDtZq5LgNV4oKX/YjGZaU=;
        b=FB074fQPzZcLHGD2wgwpyxiUy+Nc1S3Q73/ROyKAaRWVhvJJ0aSi/+dfAF5nPOjfa1
         W4NNjAbB29GmCCU1hldPrGEKAGa8K9U+5uPReKMdeFzhGmR79+myLCrCrk5Y9KgByqCP
         VQDrsOfL23Bbf1SslqaW3a0z35y482UbcRbpQy/mkZ2txhBv+5j5svMa9bgMeaa159/Z
         ENE0IAp0pMYWE2QzYGDT5KYoxckOtcCpzuh5B6y5HYW6yVBDh3faWOvdvItlRJepu2iw
         xmvvBUqRrA3sxwQHlvXIihOUVXd3RCmRlysgfGKxC3tOPmPMNfKNXFeWMAyUzUXSq/IS
         Dj6w==
X-Gm-Message-State: ACrzQf3cp6DtcM+kpECX99sEtrSW7B9/2RY+OQpsgnJhgrUwqsZiDzBQ
        fG1TDD0SV17YAcOPt4WtNJ0/8Q==
X-Google-Smtp-Source: AMsMyM7RVnXDhVMel24hc/A2lGTULvxRB93QAfaenSC9hzmYAcuI1qSvsj4Kp1lV+hm1ywpWSMbBPw==
X-Received: by 2002:a05:6214:29c9:b0:4bb:b957:cd4a with SMTP id gh9-20020a05621429c900b004bbb957cd4amr1364459qvb.108.1666993700285;
        Fri, 28 Oct 2022 14:48:20 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m22-20020a05620a291600b006f926a0572asm3847258qkp.27.2022.10.28.14.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:48:19 -0700 (PDT)
Message-ID: <5392d0d9-ab8c-8945-169f-264114017c1f@linaro.org>
Date:   Fri, 28 Oct 2022 17:48:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 04/11] arm64: tegra: Enable XUSB host and device on Jetson
 AGX Orin
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-5-waynec@nvidia.com>
 <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
 <b803bcf9-fc47-5239-ffe9-707925f324de@nvidia.com>
 <5676bcd2-14fc-4e1d-643e-89e575d190c3@linaro.org> <Y1vNU1KeUH8LvG0r@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1vNU1KeUH8LvG0r@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28/10/2022 08:38, Thierry Reding wrote:
>>>
>>> I understand you may not like this approach, however, this comment is 
>>> not really relevant to just this patch, but a general comment. But yes 
>>> we will ensure that this is correct.
>>>
>>
>> Just to clarify - this status looks redundant, but I have no way to tell
>> for sure...
> 
> But that's independent of whether we specify this using the full path or
> reference the node by label, isn't it? The only way to make sure that a
> status = "okay" is not redundant is by manual inspection. I don't know
> of an automated way to do that. Perhaps it's something that could be
> added as a check to DTC?

With overrides/extends pattern it is easy to spot one case of mistakes -
you see override, then status might be needed might not. You see new
node (like here!) - then status=okay is redundant.

Best regards,
Krzysztof

