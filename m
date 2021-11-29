Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2189C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhK2VFP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:05:15 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:37669 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbhK2VDO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:03:14 -0500
Received: by mail-oi1-f169.google.com with SMTP id bj13so37030679oib.4;
        Mon, 29 Nov 2021 12:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iAS8EYPq2PAAeUBXEXfHrwdYqgvlNby9SeJKD+GJOgo=;
        b=wqgGEyVtzgYSD1jaJDrgyUSZbRkx+kyRuRXZ+mx9rBuQiafNNWkjSmHXV8TPqPsfUs
         kuX9MZ2mbVfVD3UMq7b7hji4b/QtafWz4NKU01K/gk2drLWo0GeDI5Yb68JqvQq6tJMg
         6TiOFcvhPV/ZSx4GE1Un7sleKEvTcR+6C6N6urzArwy97s6qgd6iZOtQvKFcgk9Yf36d
         0hUaFy+Krxg/NJnWyme4YRTV1sboyWE1risUnVUAIXulfZ/DGs7xGHv70cwiUP6sMfz4
         Y1CcZ2vJtsWY+sAqd+TUQaJ8uyTEoT+jpYRrQNUExwtJXNUUiZ5u0LPhP6a+nnu6BsT8
         aPpQ==
X-Gm-Message-State: AOAM532CLD0aHAbEEtGbPdS7DFtKpiTUxzJtlR0p6q9LDMeGJXVxeSy+
        xTOpFu5XQ3CmG352YWElzQ==
X-Google-Smtp-Source: ABdhPJxHT3zgOdnewflILXSfML/qG+VFvox9exBnHdz+zn8X7xmtYqFHf2rkHkPiiarR4L2XfRbiCA==
X-Received: by 2002:a05:6808:2004:: with SMTP id q4mr458971oiw.56.1638219596389;
        Mon, 29 Nov 2021 12:59:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 3sm3188104oif.12.2021.11.29.12.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:59:55 -0800 (PST)
Received: (nullmailer pid 599850 invoked by uid 1000);
        Mon, 29 Nov 2021 20:59:55 -0000
Date:   Mon, 29 Nov 2021 14:59:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: sram: Document NVIDIA Tegra SYSRAM
Message-ID: <YaU/S9EpUyGmdGtP@robh.at.kernel.org>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112123542.3680629-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:35:35 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra SoCs have extra on-chip RAM that can be used for inter-processor
> communication. Tegra186 and later make use of it to establish a two-way
> channel between the CCPLEX and BPMP. Add missing compatible strings for
> Tegra186 and Tegra194 as well as a new compatible string for Tegra234.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
