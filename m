Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC462C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B621D619D3
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhC3Pez (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbhC3Peh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:34:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9A9C061574;
        Tue, 30 Mar 2021 08:34:36 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g8so24426838lfv.12;
        Tue, 30 Mar 2021 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HFLwaiOgQLpK8rrr7G51VeVnB2pCW8jbr+A64UfDOYA=;
        b=mdgVBGCIFrjFQ5b4sdMvDzz6NLUcivciUb5fCHUb0YjaYS4/UsbCQeGN0CJCPb574l
         qK57SxGAjUHkzA3bn3VGMFvd5mcja8nYyamGoejZP0yGaPRWuO5WJpsbtpPhCrQhmobl
         CgqW2GVMNLEkhA/40VTno/U+8K7SkmR851KQqeEZD+N4qrv8thd5r3lOBQO+e52zjS0c
         xz8OPV8PNY/tYgnGFI7dcHUdmfWyoldieRGwg2VLJMwg3KKQ1SdrqRIJyXtjmNrAt2nO
         nRU+ZY1C+DYaKvv0xyDkiUcUdulEU9r9bqI7s0R62kEgymmWvqx8Cb5darKN4oxWGr8+
         uEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFLwaiOgQLpK8rrr7G51VeVnB2pCW8jbr+A64UfDOYA=;
        b=TaPb6u7kx+qmbG3PKogE7QpTZp8A6YypP6TF8X2P9JRDABkCzvN2UTJMS1pqFPLDUj
         8S6b7uvfHAFRyEb8KF/G6deit0LbMLwVn2eFPvHHqxnB9NFr4ygE8u7oluG1dp9DIJ2u
         BOoh/dwCdi/N77s2ZN2dhmW9dqcfxjENvkJLuuOJx1zspgZWJbSoA+Wa1UqK0HeUeeNU
         hx4zNPl6q9edjmAMzaLFaE/5szzNDUjQvc5BOAAc4sFE+cmWhkjV7C1VVFtvCXJFm2I5
         xK+P9TjVqzo3V5p/nrFI4CzfBSXpHwU/95Pftv0HdYcHvTItsnfptGBuG026byQ1UDwM
         QGOQ==
X-Gm-Message-State: AOAM533w5NPIGAl/h08sY2AWFKchkYBSSb7yeJrGzSoHtw4NQkNJ6Pkf
        eQqu9loIdKtO7wihHo5Wv8ABVEZxAQE=
X-Google-Smtp-Source: ABdhPJzJZFASBY0/ZDb07qhZM4lUCtVB/fXKnZGx3SnTpI3DVGjRfjGD7OJph0cAT/L2sV4SLXYZ7Q==
X-Received: by 2002:ac2:43d0:: with SMTP id u16mr19897999lfl.263.1617118474960;
        Tue, 30 Mar 2021 08:34:34 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id z6sm2208762lfr.34.2021.03.30.08.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:34:34 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-6-digetx@gmail.com>
 <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15e4566a-6e05-0ec4-6103-7b169c326699@gmail.com>
Date:   Tue, 30 Mar 2021 18:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 11:48, Krzysztof Kozlowski пишет:
>> +  "^emc-tables@[a-z0-9\\-]+$":
> Why \ and - in the pattern?

Good catch, I thought that '-' needs to be escaped, but then forgot to
remove the unnecessary slashes.
