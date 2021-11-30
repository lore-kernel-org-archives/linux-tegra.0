Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1014C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbhK3BqV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:46:21 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42939 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236824AbhK3BqV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:46:21 -0500
Received: by mail-ot1-f46.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so28060524otv.9;
        Mon, 29 Nov 2021 17:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JlgfINHxDLWC0tkiQnFqiBk4LtLTtre6lfISBUk+A8w=;
        b=OM3I/cjuLLBYRbQ4EnYZPV76HL0B94x8pBjwcaJiRWxrqxOEtPQJ8xGN7WFyIqinFU
         OstZ/K7H7RW15Ek2vbYZQOmY/HgDf5qZmLgYR+JBX4Ho/FSKWWo6YoBWxc3U5fZTSI/7
         zt0bxWAFC3+vYrA4lNYCGF/fpjQtbIoNWJEp7X68nvjsDpSXBL7lBFg7RekdOfXx7YLQ
         SYV8HlDodBcXBK2+CTROE/CTx213qdupOvUtNLfWefR/WU0mcsdabxzDsscCwOZ7uir3
         2W3YziRFcDVbg7CMqJg+qoLWbXxExN/6vayPd0f9SHFUhZ1m++3v+g/F82RgA+72KiPw
         QAkQ==
X-Gm-Message-State: AOAM531zJcqYyXTVsnVBcqBdEfVLZ+2BzQBr4KBqxIoLLS782Ju4kipV
        /ZbR5XHLbHZPsZtAHvpJWg==
X-Google-Smtp-Source: ABdhPJwLUEAUWMA8IXrOwhBRjTvGnvACTTEL37veV34e3zRIph9Vj2gc4+VO/2A2HV6IvBFJ87e4sQ==
X-Received: by 2002:a05:6830:2643:: with SMTP id f3mr48538652otu.187.1638236582624;
        Mon, 29 Nov 2021 17:43:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g9sm2951780otr.18.2021.11.29.17.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:43:02 -0800 (PST)
Received: (nullmailer pid 995187 invoked by uid 1000);
        Tue, 30 Nov 2021 01:43:01 -0000
Date:   Mon, 29 Nov 2021 19:43:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 12/16] dt-bindings: firmware: tegra: Convert to
 json-schema
Message-ID: <YaWBpX4849Lf9PZk@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-13-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-13-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:35 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add some missing properties and set additionalProperties to false
> 
>  .../firmware/nvidia,tegra186-bpmp.txt         | 107 ----------
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 186 ++++++++++++++++++
>  2 files changed, 186 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
