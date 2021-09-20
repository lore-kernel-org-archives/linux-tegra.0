Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5997C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 20:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD613611ED
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 20:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhITUdM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Sep 2021 16:33:12 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34791 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhITUbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Sep 2021 16:31:11 -0400
Received: by mail-oi1-f178.google.com with SMTP id p2so26552242oif.1;
        Mon, 20 Sep 2021 13:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AH19fZDa3RGD1bXp8KensKJGxcb/KKL33WSHbuvr/mU=;
        b=RsTzGM/RHDUcfDk0n6rh6cdHqOzfTD0me4EqPjZKLDFx9r0imLpeEiAkJWft9N4z/8
         Y+stkzXEaJJg272KDsu37pOIqiyWF1/BViLxq48hLhfR2DMnSTGsHXnKj3c4RGyde7qy
         qqHGab1gGqyX7R1oQDcUi2fI+s/1tjf3wYDDGN6L1VngTgRELgZ0uef/3tImXeHZrqMY
         K7NPdTSgr//3c216C0Bd0EB38tPFl/OkCxabnUn6HZT7qi2+MmJvtypLv0V80reIj3tE
         iKLBBK7ytddY6ZOj9itRwBTbvho7yPej9eVYEItrF7KGex47cjrMi4bsJvtq1pXjLTwi
         SK7Q==
X-Gm-Message-State: AOAM532+quMTtKwchOjdHs7Wx/3hBOwFNGtImHapg3vJp+V5/V2fL5An
        7GIEBYguD6SaLyJo5oh4jg==
X-Google-Smtp-Source: ABdhPJxbK/iL/HBM5wgfss+lB7OVXLSTbwGo6rZFtSZ7S8wUZy7rjh4eYLbR2TGSaErAnOS1tB3eIw==
X-Received: by 2002:a05:6808:1a29:: with SMTP id bk41mr733432oib.167.1632169784453;
        Mon, 20 Sep 2021 13:29:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p21sm3431243oip.28.2021.09.20.13.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:29:43 -0700 (PDT)
Received: (nullmailer pid 697302 invoked by uid 1000);
        Mon, 20 Sep 2021 20:29:42 -0000
Date:   Mon, 20 Sep 2021 15:29:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        airlied@linux.ie, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
        devicetree@vger.kernel.org, jonathanh@nvidia.com
Subject: Re: [PATCH v6 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YUjvNmsPEBZHVDw/@robh.at.kernel.org>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916145517.2047351-2-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 16 Sep 2021 17:55:15 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Elaborated description for nvidia,host1x-class.
> * Added default value for nvidia,host1x-class.
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

With the yamllint warning fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
