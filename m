Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D904C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbhK3BgH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:36:07 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44594 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbhK3BgH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:36:07 -0500
Received: by mail-ot1-f54.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso28043419otj.11;
        Mon, 29 Nov 2021 17:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xcUhzpJIsTN3woHlUJB738tXRxy+lYTgKoijkSeTT/8=;
        b=zNNLx9iRGNu8uoQCOO6RUCi92YjwGEpVR8q7gUIHr92if0QexlSi4fxynMKT4aAMk5
         evS5LogTQVsigQ6/RWxxjCK3PtIEsXKvsx806BkSTgdAzPsvcuaN7rqQaSu+w/aVPW87
         a2XkrcVAYhV/vxoWVkCMM9KavuhbUQJJyWwrpNB4Rp5vDZaS+4LwXrq4QVN1YevDbvf2
         AsuUn9dQGhVq2cQJCbyqRF5BxtCYGuPd0mquBXpZ9zNq9vXQ1/A7NaQ1xoabMBC5aCSP
         Hit556a07O2X0t+Ju1bRmgLJ9SYOfR29pcZ2Kpe0kbm2oRUfM+zrvUop/oAE0zIqJdsc
         WUlw==
X-Gm-Message-State: AOAM5330iQSyyWqmkaYcaajBij/RPTnp5VABmlrO4YD0jFohlswP50BF
        JRCX3PUjtec4FMMpepL7E2rNltAZbQ==
X-Google-Smtp-Source: ABdhPJywn73txft+HXe4rYgqnyybU4NR+N9/1WE18o+r9wMA2fB0u4VaqjNlgpTakaqsHr94tCF+cg==
X-Received: by 2002:a05:6830:118a:: with SMTP id u10mr47250663otq.194.1638235968616;
        Mon, 29 Nov 2021 17:32:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m12sm2954640ots.59.2021.11.29.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:32:48 -0800 (PST)
Received: (nullmailer pid 980645 invoked by uid 1000);
        Tue, 30 Nov 2021 01:32:47 -0000
Date:   Mon, 29 Nov 2021 19:32:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 04/16] dt-bindings: mailbox: tegra: Document Tegra234
 HSP
Message-ID: <YaV/PxunmnnvXEI7@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:27 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the HSP block found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
