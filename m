Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B6C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Sep 2021 22:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5015560EE7
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Sep 2021 22:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhIWWiE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Sep 2021 18:38:04 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44700 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236363AbhIWWiD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Sep 2021 18:38:03 -0400
Received: by mail-ot1-f51.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso10604393otb.11;
        Thu, 23 Sep 2021 15:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LZZHj6SzZYVGQv23sf5FhNuoeSPgog8iA7xK5TOLtVs=;
        b=SRu0d3vT/k6NNHOFhKLXpnIeM0DurbFp3huDF/DHB3SrNChgob3d9D6RP6zXK3q6fQ
         QYiwqdi1tgEUxYSf/21Hypw7LSjWbHR5g6RoAehaFk0Fd0ZIeXufxMgco5z41VcfdwA8
         qcgrF97ddEspuSrtHeshfPUvuarkv9THE0osP6zomkOZZGGeM99IOGO8VESjUCe3MTIZ
         50VdfG/VHIsxFGOnb96kHrGjxn0z43Xd2VI+jGYFJhUCQDwzZvtNVJJrov2j0xY2YWiQ
         WiCkgu0OHADY/8UKhBcwv8jz8Sx4tYQaz8HWve+rszY7Ak9ye8ua7loTeQ8XX3LtyNej
         i1VQ==
X-Gm-Message-State: AOAM531GN7p27wF2FUyQsarAgr/VUMLF8YKo+8Yh1Mm28YdslLY2kqHu
        N5Gek8BL9y+PNv3Zb7thZA==
X-Google-Smtp-Source: ABdhPJzWjXrhi1fJWFn2yjUbAQyd5QSTzmV/cXD+yZR3O2o/nmNPh/iuuqk+7cWJrJsRx1a+0NViyA==
X-Received: by 2002:a9d:ba8:: with SMTP id 37mr1006553oth.249.1632436590557;
        Thu, 23 Sep 2021 15:36:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r18sm1269369ote.28.2021.09.23.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 15:36:30 -0700 (PDT)
Received: (nullmailer pid 3650743 invoked by uid 1000);
        Thu, 23 Sep 2021 22:36:29 -0000
Date:   Thu, 23 Sep 2021 17:36:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, rostedt@goodmis.org, mingo@redhat.com,
        jassisinghbrar@gmail.com, p.zabel@pengutronix.de,
        skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V1 0/3] Add tegra header license and dt-bindings Copyright
Message-ID: <YU0Bbc4lqtENJ5WF@robh.at.kernel.org>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921174434.4839-1-bbiswas@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 21, 2021 at 10:44:31AM -0700, Bitan Biswas wrote:
> Few Tegra header file are missing license text.
> Some Tegra dt-bindings header do not have Copyright.
> Add license and Copyright for such Tegra header files.

Who do you expect to merge this? Tegra maintainers or I can apply 
patches 1 and 3.

Series should be for 1 maintainer clearly, separate series per 
maintainer if there's no dependencies (this case), or clearly state who 
you think should take a series if it has cross tree dependencies.

Rob
