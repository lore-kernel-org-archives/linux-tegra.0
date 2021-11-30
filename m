Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D63C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbhK3BiU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:38:20 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:35449 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236613AbhK3BiU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:38:20 -0500
Received: by mail-oi1-f174.google.com with SMTP id m6so38189386oim.2;
        Mon, 29 Nov 2021 17:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vFi62osWwIyhrUoVqt1oEoR7BiQ3ZqTvsAmiRENyNwo=;
        b=d74XWUe2QfaJIW+PsdWzYAj+ZtOJTapc6AJe1T49JV5AGCvEL84GYGlAB+QDRWIHDn
         dIArNFFos+accqM1XYSNGUNgfBkP1gAy9GJhHg/NiSS+6pkuXA2AOwSRsZ6lmEN6Ypb4
         n0ke+q5XhGGTOhWtyLATX2fjIQ6zRmep2U0vik4qu6H1STyxZoTjXl8l9Sd+GyerzTpG
         sJWK+MvQ3EAVp9Cww/MVGfvwgKdnLyjFnD4bsn8ZAdc3asbpyxLbpEmsOYKjIsBIAS9U
         U4ehcxmTk/HMpZVM5api1ORPXaym+8QdSnDMJE9zUend9iqpi49oyebocpG3uLNuaxqF
         +9PQ==
X-Gm-Message-State: AOAM530fhNdXLi1QvjiAxdAKE67pfHualg4ZqcM/gEBbAoqRMEU754JT
        Lu2RIzedJjUY18q2p/913A==
X-Google-Smtp-Source: ABdhPJwhBpoksYE5bXJLrj4+Hwp3FdLjY+lyWfn8ICk7LpqN0H/FLPg4+cBW+/enq1cHGxtrM2bYjg==
X-Received: by 2002:a05:6808:10d0:: with SMTP id s16mr1593586ois.0.1638236101533;
        Mon, 29 Nov 2021 17:35:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t14sm2973593otr.23.2021.11.29.17.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:35:01 -0800 (PST)
Received: (nullmailer pid 984049 invoked by uid 1000);
        Tue, 30 Nov 2021 01:35:00 -0000
Date:   Mon, 29 Nov 2021 19:35:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 07/16] dt-bindings: fuse: tegra: Convert to json-schema
Message-ID: <YaV/xMIQaSA5OqCi@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-8-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-8-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:30 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra FUSE bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add missing additionalProperties: false
> 
>  .../bindings/fuse/nvidia,tegra20-fuse.txt     | 42 ----------
>  .../bindings/fuse/nvidia,tegra20-fuse.yaml    | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
>  create mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
