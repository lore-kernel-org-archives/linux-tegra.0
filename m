Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAE8C47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 16:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED9B5613E1
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 16:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhFJQ0N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 12:26:13 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:33718 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhFJQ0N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 12:26:13 -0400
Received: by mail-lj1-f169.google.com with SMTP id r16so5807541ljc.0;
        Thu, 10 Jun 2021 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=49Em53Qp0i9p8s4NNydlqGaiite7jvBK4Qjm2fUho3k=;
        b=UaV2EP6/AxlMiR0ihJlFX/smK7ygUX95wsSj0eNiDOmSF6W0lmWYdcC1rPaTB0t3t1
         gO0yiXfayyecKkpMZRDukJ107y4hAc0UXNPhyOPcgHJ8krp8KF/iOoELZS53BkcWU5Nu
         hQKW7CBoOJslIiA1234hj4WdFQPF0M1pFINRjd4uST7Y0IP9PHjEbpOAvaTf8Kf/jFOE
         07F7H+ePUh665rFBWlfFF4evGKNZEvQZlnjRzKQopIRXeyvm6FzZ2wKtZktEa107jAPD
         8Ji9BV7ftxPe2nehVhJxq4lOpcKf8S8w1iviYG1/WGt1m0/qniX/KIn1Sn+YSvd0Pr7r
         qhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=49Em53Qp0i9p8s4NNydlqGaiite7jvBK4Qjm2fUho3k=;
        b=LW97Tq6dbGR9Gd1ou5kuq9hPY6ZcdbRzo24LD/b/kHPdrcsL/BFYhWGKcyXg1ryY53
         DGPC3iTzVC8wd+is895cUXLZKPe+m5GNJgLNqzNf+k51XfcBPUx1IAANLVWoNPgpTexq
         UR8TwPmqWElz6PziV405Zs5M5F2YojV+RVm0Dho1ZmKt5TUMvV5JjuLDICFwLChVtbVL
         sGXND4txm2cvihLx9M0n4xKEk01IuIxAKXgk7N4kL/bIxZy7PODrlY3c6kxlkD/QlAMp
         8e8doBHJzgBwhK5ZLSjBRlcLiuWr+h6tc3qEVlHVr5gTMjF6/Kt9pjcOWRrjNwKagsqI
         Wt1w==
X-Gm-Message-State: AOAM532KPeAv7Oq7/G8OqDvTIRdM6hRYaoGmvPhS60t6/0QELFR3P2Z/
        OZirLRXQ4hCZ7X19JBkHt+l2iIz88Lk=
X-Google-Smtp-Source: ABdhPJyDVUmbVlcBsX0oHSJKbf0lViThre+DA7c7P9sufda3iOsoNEEh+vhQrmISm5VnbdwOw5rCxg==
X-Received: by 2002:a2e:a268:: with SMTP id k8mr2916647ljm.54.1623342181617;
        Thu, 10 Jun 2021 09:23:01 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id h19sm341097lfj.256.2021.06.10.09.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 09:23:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
 <a3110fbd-c4af-0317-5a6d-1f780f1dac91@gmail.com>
 <1400979c-c7a7-9618-1168-70185ed10546@canonical.com>
 <8d8d019a-34c1-50bd-5eba-ce361c263d35@gmail.com>
Message-ID: <57f8e55d-d708-f304-cf35-3036ec2e64f5@gmail.com>
Date:   Thu, 10 Jun 2021 19:23:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8d8d019a-34c1-50bd-5eba-ce361c263d35@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2021 18:50, Dmitry Osipenko пишет:
> 10.06.2021 09:43, Krzysztof Kozlowski пишет:
>> The stubs might be good idea anyway, but the driver explicitly needs for
>> runtime working reservedmem, so it should select it.
> 
> The OF and reservedmem are both selected by the ARCH for the runtime
> use. They may not be selected in the case of compile-testing.
> 
> Both OF core and reservedmem provide stubs needed for compile-testing,
> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Adding
> the missing stub should be a more appropriate solution than adding extra
> Kconfig dependencies, IMO.
> 

I will send the patch. If OF maintainers will have objections, then
adding the dependency may become a more reasonable option.
