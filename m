Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD44AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 985DB6108E
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhJNVyb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:54:31 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46725 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhJNVyb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:54:31 -0400
Received: by mail-ot1-f49.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so9535457otg.13;
        Thu, 14 Oct 2021 14:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0/BT3WQEIvQc0ky9Gu6Qly3eAQt86CTZ0AQ8niA71G8=;
        b=VavJ0ccLOlOof7J0FKCG04WJFO8Q6UPHCkwoQrSo9Ey60na8YwA3WYQz0LCL9cPqj8
         2hDX2sxHFHTuMNHwIlMROsRb1KrLOrd/RGTu60YMq9KWHvsq90L87YEEVVkfuP36CJcl
         CaXUSumAGcdScjoMXfYQsmE7mAr73xg9tUcbTt3WSQuKiaSKfDYDbrwHTteiIztMonK3
         gL+s0/7OFqDODhITySKkx88WFVmfb3fPlposMpbdV/k+a/+5CtpMy8ZokCAHCuPgIKuY
         j/gaygcJ+hVjxaLD+Ga/E4Xw5qpWCqBs4ysCXwOgFkqtcm3yb1/CBRi2Ul20A8nxgYZu
         /a2A==
X-Gm-Message-State: AOAM530MS5aGot+rgojy0V+zW9rae7Gn8iIGwloE8I+0NYAgDAFUTHHb
        DM2LmVY9y/sOZIheWrAwhw==
X-Google-Smtp-Source: ABdhPJyYFYcLNH05w3U2mp4FRFrX8XJFWQjh+gp9HpDJ4jmhvvqez4YWqCoB/P4icG92eBZzupGd9Q==
X-Received: by 2002:a05:6830:4027:: with SMTP id i7mr4792877ots.275.1634248345874;
        Thu, 14 Oct 2021 14:52:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q133sm813026oia.55.2021.10.14.14.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:52:25 -0700 (PDT)
Received: (nullmailer pid 4012195 invoked by uid 1000);
        Thu, 14 Oct 2021 21:52:24 -0000
Date:   Thu, 14 Oct 2021 16:52:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 7/9] dt-bindings: memory: tegra20: emc: Document new
 LPDDR2 sub-node
Message-ID: <YWimmE+DMtLpRmEU@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-8-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:57 +0300, Dmitry Osipenko wrote:
> Some Tegra20 boards don't have RAM code stored in NVMEM, which is used for
> the memory chip identification and the identity information should be read
> out from LPDDR2 chip in this case. Document new sub-node containing generic
> LPDDR2 properties that will be used for the memory chip identification if
> RAM code isn't available. The identification is done by reading out memory
> configuration values from generic LPDDR2 mode registers of SDRAM chip and
> comparing them with the values of device-tree 'lpddr2' sub-node.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../nvidia,tegra20-emc.yaml                   | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
