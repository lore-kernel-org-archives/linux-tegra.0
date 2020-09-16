Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFBAC43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAC70206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgsNrmcA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgIPTHX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgIPRpB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:45:01 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656A1C06174A;
        Wed, 16 Sep 2020 10:44:00 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id h1so3971416qvo.9;
        Wed, 16 Sep 2020 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=WjZIQyFm/bdNFiFtlV7F9mpAxBw8jkN8jZIWEoZOzek=;
        b=IgsNrmcACBSAr9DJgdjmkIdfULOlDjm9F2PjOtvzl9/y247mdn/bAXlGzcV1fUdnLv
         2YoEZEZ/0SRe4PzOLDGYJJzeo8Q50joQk+/I1Pfsmoa/3Pzol9wS6XHriwFI792789um
         KCnwgiJh9IYKrlctZLn6H8JvgfuMjyfeRZlYq2ngnExRQmYhqkBlfKjxoBEVjsbj9rJC
         OxxxbrlaoPw04FXqFlfYT17RFPPOOj0qrE2/UNA5Ex7moCkBtdcA4wvChej2FKbPrxqQ
         y80InTkj1d5yQ5hnEfktAhn7xzD9lEgDENpoyCL7cDfzJuU0ADC2eK/ERNkw+y7w0vXF
         CqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=WjZIQyFm/bdNFiFtlV7F9mpAxBw8jkN8jZIWEoZOzek=;
        b=jhVosiI/yaiGJfp0PCYhqZyRODaHwvq5V/2bgzJO/ZCZDREGVXR0tXb8X6UoiVNSCf
         Dnnx/cf41Cr64Wd1gZmD37ucYArnlNoZm0kmVz3Dy87SB8NaibzNDRJdYaWimbKu72+V
         AojPiG7Y4zRqTIfn4ihDn8Vq8YNKNm1TEsHJHNoPCMUS6VC2nqqXYkR0YzNbmq1Tt+ZW
         NXatC6F5yIUvzSEdFpCicyw4tlZGj3R293RFqTMeEMnGTyx2dj7X+9DpFmKdF7jbzRNp
         CeOi2LTBgt7RVGyf+hd6nqgjtOcbLe89AhKhQ7jgmKH5/YtpIKt2zVmtZAxoI1ugeigA
         L1Jw==
X-Gm-Message-State: AOAM533eUbtDiYncKUwPt9D1KibX3JUY15CMocw2kuwIFPrFw2dwY9ni
        fWdjB40+TGk0m0HTyldN73A=
X-Google-Smtp-Source: ABdhPJy8S70n+F5ryntDkUxM5smK3ft2bg7NOIv2ZcWIOyx/Zt2ifgdvkjRI0otmPI+XZ3rXv2IGTw==
X-Received: by 2002:a0c:abc5:: with SMTP id k5mr8055657qvb.40.1600278239558;
        Wed, 16 Sep 2020 10:43:59 -0700 (PDT)
Received: from LeoBras (179-125-140-217.dynamic.desktop.com.br. [179.125.140.217])
        by smtp.gmail.com with ESMTPSA id k23sm19864197qki.98.2020.09.16.10.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 10:43:58 -0700 (PDT)
Message-ID: <3dd10a3ddf4484390d756f1447a24838de4fb21f.camel@gmail.com>
Subject: Re: [PATCH 0/3] Support NVIDIA Tegra-based Ouya game console
From:   Leonardo Bras <leobras.c@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 16 Sep 2020 14:43:52 -0300
In-Reply-To: <20200916122247.534374-1-pgwipeout@gmail.com>
References: <20200916122247.534374-1-pgwipeout@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 2020-09-16 at 12:22 +0000, Peter Geis wrote:
> Good Day,
> 
> This series introduces upstream kernel support for the Ouya game console device. Please review and apply. Thank you in advance.
> 
> Peter Geis (3):
>   ARM: tegra: Add device-tree for Ouya
>   dt-bindings: Add vendor prefix for Ouya Inc.
>   dt-bindings: ARM: tegra: Add Ouya game console
> 
>  .../devicetree/bindings/arm/tegra.yaml        |    3 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm/boot/dts/Makefile                    |    3 +-
>  arch/arm/boot/dts/tegra30-ouya.dts            | 4498 +++++++++++++++++
>  4 files changed, 4505 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
> 

Hello Peter, seems a great work :)

Does this work in that device I sent you info back in april 14th?

Best regards!


