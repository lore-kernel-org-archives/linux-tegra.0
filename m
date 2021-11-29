Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B629C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 20:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhK2VAF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:00:05 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45762 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbhK2U5x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 15:57:53 -0500
Received: by mail-ot1-f49.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso27247066otf.12;
        Mon, 29 Nov 2021 12:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B3hvgTrlRHqGF/IdTVrO9KCViKxMaaGzEVbvcpETaIM=;
        b=ueqAWUbi0CI20BPaYHBJzblMjXeF8659nXxLxKK655DJET9eLgFJZWOd667OgTh7B3
         IN8+EnETB72rCm7yJMRh0efOVwofUkP4on9jwLGE73IHcaP/qpZXsTCM+uLxplIylCJk
         u9OfMrsCxQxCqhaltOhtCO/BKgPl3oWxCtX07gHeBMV2ly9Ub/f0ZNzSctP/56XUV5Mw
         aMWSRehID6FqhJRrgbmwXwQS68edfmrWYP8xEeAyXcco5ItmTzhd7BlktYT+MqTEiNHF
         TlNJLxXyvGKMxnTrKVZBg8/CWOeyJ4T9+ykZTLnzO5qLN+sFoB0762hZ1BhWZLlBQUTi
         E2Ag==
X-Gm-Message-State: AOAM530GjdmiVvUFOjIFmPR5fqA9Wx0p7V/jjEdKlOwd/xpuJitelomG
        sfjQsf9TnS4BJ8BmZZ6cFQ==
X-Google-Smtp-Source: ABdhPJzH+ruZaEt4NU1QvkQa6C6oL5IHatORLHK6E+u8KZSlK6SKMeiCcGpSmlVI69LGgw5aQ3mOWQ==
X-Received: by 2002:a05:6830:25d4:: with SMTP id d20mr47784301otu.143.1638219274797;
        Mon, 29 Nov 2021 12:54:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a5sm1872649otd.74.2021.11.29.12.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:54:34 -0800 (PST)
Received: (nullmailer pid 591965 invoked by uid 1000);
        Mon, 29 Nov 2021 20:54:33 -0000
Date:   Mon, 29 Nov 2021 14:54:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: tegra: Describe recent developer kits
 consistently
Message-ID: <YaU+CY5s6u6hyFNI@robh.at.kernel.org>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112123542.3680629-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:35:32 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add descriptions to entries that were missing one and don't try to
> combine multiple entries into one to avoid confusion.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra.yaml        | 20 ++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
