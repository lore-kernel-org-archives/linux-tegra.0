Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A245C0015E
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 06:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGZGdy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 02:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjGZGdx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 02:33:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E88F1FEB
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 23:33:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5222bc916acso4062065a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 23:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690353230; x=1690958030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZgSHgs+DaEu5YKeJ7xYroSTsKzuw+qbovR9q1BksYk=;
        b=NaBZnXsxeuQzuczGqtwCBX1JMo5/AIwWPrRzlQV8QJaimiIAHSQsOIuaYcJjRxy1Z5
         Q1UWMcH8xX5l22eNgWA/GbI+x3joki79DVJBtDuNur0X8xfbhlhbqeIgWxI0grb/JA2M
         C24RvYntdb5GQliZBLWZDreB5mFr0eJtLAr0+YUIxnroqi9XLSOrmgh/JX2kGFtgkiRw
         VxWo5BbGMVGiPFxS6O3eFR7+ZMESRuUDjOlJOCc4z2Co2cqR0UQLB+eMlw3cqEZZSMfX
         TSK5V+jxjrsLvD1tVaRfO5oxGhLWk03ll+e1lulIhT8+GiPpwGKLv8pTRptqC81fck/7
         1Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690353230; x=1690958030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZgSHgs+DaEu5YKeJ7xYroSTsKzuw+qbovR9q1BksYk=;
        b=ll1fGhmaH1WtKQgCDK4EG3w7pvf5GYpU8fkj75XrGCNhS5tWV9g5/0fAZPA6OccWwZ
         kc5cJ1HQwbViduCRS8feaHWLsot1eWCFzkf/t7qVykUXAhzU/NAZZw1RdkFV7jQWAg5K
         0ckRYiD7Aef/MTrhnX5lSI1HCmeU7+X6vve1bRzus5YfNwMblZFW5juTyyl8NBIIFDn5
         i5r1lsLGtlcEByx59EgCkWYQqsh5OCA6FF58Cf9OFI0wjlv5meUzmEV+sHfnCE9B6JKf
         FpVFTal+/jv1iBTzWnjceLc0TehEwcwS/gxPCXhhK3p4VCAApyMVOe8FXMKGin6acaYK
         /x8g==
X-Gm-Message-State: ABy/qLaaI+X5txunIDHjpAClgsHTV+gy8XUIbmLbAUiBHQYr4Bor0mSf
        DRRyJJ/jLcDPRA9PAtwwTzlrkw==
X-Google-Smtp-Source: APBJJlEqrM14tJfMA+TcQHw7fvQjjF0gb0G1lKIEdzmcSA/W2bZSmpfQbJgqHftRJIIo5i2M02/PaQ==
X-Received: by 2002:aa7:d958:0:b0:522:3ebc:84b9 with SMTP id l24-20020aa7d958000000b005223ebc84b9mr776848eds.24.1690353230229;
        Tue, 25 Jul 2023 23:33:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q2-20020a056402032200b0051d9de03516sm8450368edw.52.2023.07.25.23.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 23:33:49 -0700 (PDT)
Message-ID: <30d0689f-5a6a-c593-2a30-1ef2dc37f1af@linaro.org>
Date:   Wed, 26 Jul 2023 08:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: dt-bindings: drop unneeded status from examples
Content-Language: en-US
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230725101625.75162-1-krzysztof.kozlowski@linaro.org>
 <e8138fd1-5d1f-8fc3-e29a-547902c2ab18@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e8138fd1-5d1f-8fc3-e29a-547902c2ab18@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/2023 12:55, Benjamin Mugnier wrote:
> Hi Krzysztof,
> 
> Thank you for your patch.
> 
> For the st-mipid02 :
> Reviewed-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

I don't think we have half-reviews. There are half-acks, but not reviews.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L542

Best regards,
Krzysztof

