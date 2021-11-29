Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D9C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 01:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376877AbhK2B1J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 20:27:09 -0500
Received: from mail-oo1-f42.google.com ([209.85.161.42]:37861 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240364AbhK2BZI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 20:25:08 -0500
Received: by mail-oo1-f42.google.com with SMTP id v19-20020a4a2453000000b002bb88bfb594so5213789oov.4;
        Sun, 28 Nov 2021 17:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LW4WjEKRMKNnUNWNFgMkHBQj/K7wWytVhDzInU2NQMo=;
        b=k4P2m6EDgYrOJLoy59EnJfYuemAOYTg0dQaJGCIx5jXe60KSMvc4S1DgK58/7htstV
         PMSfR5krga5QeT0UyUr5Ai7YWzRgiZVKxbscSiufLPXdQyqmyeHzme2lvqp7jz4ekAHV
         2Z8Jgtvjuo/a2TVo+jf0OQEfUqJnSU4sqx8e0uiTxqwOC62RW7LfsIlAX+jVrLm+pCiY
         KDeMhEqKI6D+sVV3y3Yp2T+63kyOCfk7CF/C0MFod9M6LrQSH6MILxuY6e0pfB9QCn3X
         Wr0GzHtaR/WFcmiA525NI1OzK6YVmdwNMg+Pybu13olCoLyaNNHcjZ4getxiiBU5fuSK
         W8eA==
X-Gm-Message-State: AOAM530/xe31461JwpAllwL5uwub73kIaX8rjOAHLVhklTfV+NzXnfUB
        fC18bGJNEF4Q8qA1rT8e9w==
X-Google-Smtp-Source: ABdhPJzFQcwxm7HLcIp9yihozQMM6P/xMY01eYiDVyyZtOzCQBGspO3QAJY8+5jItYuEux+e1QdiwQ==
X-Received: by 2002:a4a:dbd3:: with SMTP id t19mr30015435oou.8.1638148911432;
        Sun, 28 Nov 2021 17:21:51 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id u28sm2392930otj.57.2021.11.28.17.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:21:50 -0800 (PST)
Received: (nullmailer pid 2966117 invoked by uid 1000);
        Mon, 29 Nov 2021 01:21:47 -0000
Date:   Sun, 28 Nov 2021 19:21:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Jasper Korten <jja2000@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        devicetree@vger.kernel.org,
        Nikola Milosavljevic <mnidza@outlook.com>,
        linux-kernel@vger.kernel.org,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 02/14] dt-bindings: ARM: tegra: Document Pegatron
 Chagall
Message-ID: <YaQrK5gLlq9yZkvT@robh.at.kernel.org>
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127142327.17692-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 27 Nov 2021 17:23:15 +0300, Dmitry Osipenko wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Document Pegatron Chagall, which is Tegra30-based tablet device.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
