Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC84C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 11:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63F9D6113A
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 11:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349287AbhIHMA4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Sep 2021 08:00:56 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42792 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348327AbhIHMAz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Sep 2021 08:00:55 -0400
Received: by mail-ot1-f51.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so2566266otk.9;
        Wed, 08 Sep 2021 04:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T4PU4tWJUcseqPugoo0HufAKZOsFvcQVYr/eQZCWYQY=;
        b=VE8Spebfj4a4nk3HfYRV9fJm+TIV6QL/ELR2shTAEnR6S9jjrCEaF3GR2N9H+ho0jW
         ho6KAPBoBx0V+iqu41HmC4JGDOzaZVZRv656TukIUnbrIhlxtVY0FHJITr2X77f1telF
         +GgCUWEBsRx5WzKofzeyZlVGa5W9v+VcPUYHtC/FS5Q+jeSYoGt9FIz4NzUzwKJ33rOq
         Z4eqv2IzsBuyXCZN3onk5WcKUDEXjXqS6Gl5UZeI+uSWZgYpI2z5pDg8RNWyvfyO6vIN
         b0lxViyGB0rOMeUjWMiPFoqkzLbGiJ7HuQw84HikMw3iy+3cOy6jxaaKDwldTlwmY4mU
         oO9w==
X-Gm-Message-State: AOAM532fXagFqclnGcZchxJ8egLQxkGFyXQN+gzFOF/s9XSVzMFadjbN
        ibYwjsj1bgQjRV2yWqy0eA==
X-Google-Smtp-Source: ABdhPJxuHJ6yMrpw2gpAVb4IKjHUL2sPKiA67QNtUQ82sqhj9xVUipj26dRMHxVd/lFHOhcAXuahNQ==
X-Received: by 2002:a05:6830:2b0d:: with SMTP id l13mr2655859otv.39.1631102387599;
        Wed, 08 Sep 2021 04:59:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m2sm373098ooa.42.2021.09.08.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 04:59:46 -0700 (PDT)
Received: (nullmailer pid 1852019 invoked by uid 1000);
        Wed, 08 Sep 2021 11:59:45 -0000
Date:   Wed, 8 Sep 2021 06:59:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     devicetree@vger.kernel.org, broonie@kernel.org,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        stephan@gerhold.net, jbrunet@baylibre.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        lgirdwood@gmail.com
Subject: Re: [PATCH v3 3/3] ASoC: Remove name-prefix.txt
Message-ID: <YTilsXG9j0UMz5BZ@robh.at.kernel.org>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630686919-19495-4-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 03 Sep 2021 22:05:19 +0530, Sameer Pujar wrote:
> Since schema name-prefix.yaml is available and references are updated,
> remove txt based doc.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/sound/name-prefix.txt      | 24 ----------------------
>  1 file changed, 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
