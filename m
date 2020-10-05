Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EF3C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8B0420776
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo7miRmO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJEOcN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgJEOcM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:32:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F9AC0613CE;
        Mon,  5 Oct 2020 07:32:11 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h20so686331lji.9;
        Mon, 05 Oct 2020 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xVnmPbE/rqcB+pAcWmyPmrjxEQuPQzT1FzRcPGWWoLk=;
        b=fo7miRmOixdC5jw9TnGWy9aXsWbHOKEzF10iOkZ+BdvyhtfIF7VX9aCmxebMJYIHx3
         ye8w6uneRWisUJspcvjcOZF7FNZ9gUWxIynBKkfpkhgHUpr9dbQ7cad+qD97PyXukiyR
         SPDM8d3ZsbzJmGTdh2gb7snYenOlpq3e5EGlZjRYsZ77eIgI8pzh1SnYVsnNCaddzmY5
         INJfDW6X4h0a5q0qbfdFtff9wT667SCRMhNsxaaG4uT758xTbvwGt1cXH8AxZue5gNd5
         3axLJkbZvJcsEqo4V58HiFfJ5nyIYSj1VFyjM+d20khw+p4ZqOxg5auUpmTlTbFuZcIO
         XNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xVnmPbE/rqcB+pAcWmyPmrjxEQuPQzT1FzRcPGWWoLk=;
        b=eDPhTWlaX+4S5joHqtUsBZdlPDbmYJawEWGC+sd5CWu1//HOW7wWr2nUfWm1g8JkAk
         jvmFsYxm1+SyyTIor+7AAGjTSO47n6V/SpBfQEoFOJ3V+okui7NEatOYuAlu+I09qoQp
         WYPpThOlaIO9TT1jDlt6YhzA+NNmLnpkGOg6ioSHj8OWz211H+guceCDkiagYz4qPNVV
         kIucfcNHBW32phf/3YIoHwUB7u8cGOKKiR1lDq5i2KE4aivVE2+Q3LxFT1cjZGzKNCI2
         yH9SK/bf1uOS4WyP5ia0A5Jfk6wwsYn0GuqZ+q+aA4eK65O9EYEoqdim3JVHbgZuze7F
         kluQ==
X-Gm-Message-State: AOAM53072YkzZknEtusOXNzAlMiWw4j2i9I51p1Ta90ashkLgJpM46cu
        GJcoZN8cQHUAxCMdiOhpzYo=
X-Google-Smtp-Source: ABdhPJy79M0n3h6yKbZzSDkv0hXwaNMwCRiHXmL7YJym18KallJlj1WvZREDzMPnMIRhugJMm5IFYQ==
X-Received: by 2002:a2e:99c1:: with SMTP id l1mr4360467ljj.95.1601908329479;
        Mon, 05 Oct 2020 07:32:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id c19sm2801125lfc.222.2020.10.05.07.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:32:08 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] dt-bindings: Add vendor prefix for Ouya Inc.
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <20201004133114.845230-3-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0e6cca03-d881-d8e4-a05d-2850dc5339bb@gmail.com>
Date:   Mon, 5 Oct 2020 17:32:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004133114.845230-3-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2020 16:31, Peter Geis пишет:
> Ouya is a defunct company from 2012 to 2015.
> They produced a single device, the Ouya game console.
> In 2015 they were purchased by Razer Inc. and the Ouya was discontinued.
> All Ouya services were shuttered in 2019.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Please note that your s-b tag always should be the last line of the
commit message. This is not important, so no need to make v4 because of
that.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9a5ab7b94789..367dd79c95f6 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -786,6 +786,8 @@ patternProperties:
>      description: Ortus Technology Co., Ltd.
>    "^osddisplays,.*":
>      description: OSD Displays
> +  "^ouya,.*":
> +    description: Ouya Inc.
>    "^overkiz,.*":
>      description: Overkiz SAS
>    "^ovti,.*":
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
