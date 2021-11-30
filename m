Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD013C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhK3Bgv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:36:51 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44752 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236373AbhK3Bgt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:36:49 -0500
Received: by mail-oi1-f178.google.com with SMTP id be32so38109826oib.11;
        Mon, 29 Nov 2021 17:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ORY5Q2M928az3WBxQhtJZfRlOJzq1QbH3Q1u+xuqJY0=;
        b=jVK7DhK7b4nRv0QkiABzPIpOyfBKLPBwQaGOUzxsOO+i+aWbUq9BiTj8ekDR9KSFUj
         UOyUjVGnFOkYHDgrJM59A2dGRm/WPxJIRAr8dESZzDoeYTDwhSlEV8fLwEUou1XZtRDs
         nPQMC4onoGq07rkNEsvYLyQabcTzw3CL5A+MttDrjdbsN8Pfn0EQZu1DCfb1WlqJVXNZ
         ybqhuuoiWy3sqpzYtZa3NCw+iuIgjis5ShQLTG9apXHwEG+DouGqoxUxuZcAGcfPf6pf
         QvXX3Haq39JGz6UsaVYXG3zUjn7x0qefVrJvjtPaGppf9B78kHKm1n3Z+7KlGbjmjbVW
         MYgg==
X-Gm-Message-State: AOAM532/30krVc1yIPBPU4Me8gllXG7vu4RJwkoWrQjs9IWKyjgazzwC
        elqBdb5PVYGH3sFe4b/kf+qxPxkUkw==
X-Google-Smtp-Source: ABdhPJy2GeHadKKuoEqoC0zIM+DMrGIcRWw406E34T7k2OmSD8r84ZUxIDeMVUJMGAXP1nriJlfQhA==
X-Received: by 2002:aca:120f:: with SMTP id 15mr1516672ois.132.1638236011077;
        Mon, 29 Nov 2021 17:33:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y192sm3296679oie.21.2021.11.29.17.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:33:30 -0800 (PST)
Received: (nullmailer pid 981852 invoked by uid 1000);
        Tue, 30 Nov 2021 01:33:29 -0000
Date:   Mon, 29 Nov 2021 19:33:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 05/16] dt-bindings: rtc: tegra: Convert to json-schema
Message-ID: <YaV/aSzXMMY4LDeU@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-6-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:28 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra RTC bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - document clock-names property and add additionalProperties: false
> 
>  .../bindings/rtc/nvidia,tegra20-rtc.txt       | 24 --------
>  .../bindings/rtc/nvidia,tegra20-rtc.yaml      | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
