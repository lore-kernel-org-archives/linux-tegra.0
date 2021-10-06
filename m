Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2C0C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 10:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2AB1610E5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 10:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238121AbhJFLBP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 07:01:15 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45014
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238143AbhJFLBP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 Oct 2021 07:01:15 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF1B33FFE5
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633517962;
        bh=DwnLqhbs1ojkMd5U1zKgWTtac7rTxmeVLSmcoF2I0FY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=qlSyX3YXkfnraeJ7PowsYBuu8gqmBa+fyfZcZg5JQEIgxb9/A8ajK0Wk5uI/s72g/
         o7ndx0JEUMAtlsu9rN04orTUXxHz9xCD6rv3vfpDk2n1OgE4AgHxepct1Oe/Y9wID3
         WvlRwakq1f8GKUWfd4secX+j/+G+SBOyYbndiBJGBf15XJRl+VCBlZCnGh+IZZ2qWw
         Sm4jfgexIrES3gQ+dYLJeSFdILQHh5l7vK7iIylhIVjJgoAPqeCXjTrkb982vB2j/x
         /2RLEbTtQhfaBIRJWjaZLSIQdr+P+RcH4SBeVjW3+0EhfsSSL+0wD/aBhYCLGtTbUy
         T77Aj/D6tssrA==
Received: by mail-lf1-f72.google.com with SMTP id x33-20020a0565123fa100b003fcfd99073dso1692744lfa.6
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 03:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DwnLqhbs1ojkMd5U1zKgWTtac7rTxmeVLSmcoF2I0FY=;
        b=xrnd+nJT9A462pTJGTldSDZGl7wb/x8rghmdhcT+yKw2ijZ7xRqbuydxBDS209+RSW
         c5Uc1DueEcJ8CTf3m1aY9TvYgSDZ2ecS+Uc6wtRjltdbUvW6CwGEBskkOwp9QiVYq0iw
         K8b0JwEZL/LjwPXT+ccK82F6hl+s3ZNbCQIiKM8hs2VWiBhl7sj4xdQA6tYDg3roV3t3
         AGUxBhrRY9rkQpkNg9tOzGxdshlDMECPRln89IMaXXko6ZDTPtUsDgLntAAngLlcu3Tx
         lKjA95wgsPGqbbEUJjJeI39W8uRlSlMBa7U2MXosBVM1wbTK6GzK+HYjhrs0LaFOV8+D
         gbmQ==
X-Gm-Message-State: AOAM531uKpbcqvjDGUglAoEoOWP8K9k8S8UUT7u5C7RRFqOWR6c2ntjq
        WphyEvsSKKjFrUTpJNvOEl5D5BuScOqpVuTX7PvV/ae41IB7H560zlMwUTfaL12/P/TvK54cJpm
        ZJoyeVgh/ttMVuxwQLcU+Y9mjvgMXDKr9XMoyc+ZU
X-Received: by 2002:a05:651c:544:: with SMTP id q4mr27900696ljp.320.1633517962004;
        Wed, 06 Oct 2021 03:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvku7QbChsEuzS2GP3nxsK0deI5VnUcpYmRH1PLfYhlmv+GHif4vDVEjw0oA6fSlumv490+A==
X-Received: by 2002:a05:651c:544:: with SMTP id q4mr27900674ljp.320.1633517961814;
        Wed, 06 Oct 2021 03:59:21 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f24sm2263663ljj.30.2021.10.06.03.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 03:59:21 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] dt-bindings: memory: lpddr2: Add revision-id
 properties
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-4-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <545e4036-a9fe-a0f1-dd8c-f5948fee6c4e@canonical.com>
Date:   Wed, 6 Oct 2021 12:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005230009.3635-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/10/2021 01:00, Dmitry Osipenko wrote:
> Add optional revision-id standard LPDDR2 properties which will help to
> identify memory chip.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,lpddr2.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
> index d99ccad54938..01efb43c3425 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
> @@ -24,6 +24,16 @@ properties:
>            - enum:
>                - jedec,lpddr2-nvm
>  
> +  revision-id1:
> +    maximum: 255
> +    description: |
> +      Revision 1 value of SDRAM chip. Obtained from device datasheet.
> +

Also type/ref for uint32 needed.


Best regards,
Krzysztof
