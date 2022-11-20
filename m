Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD1AC4332F
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Nov 2022 18:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiKTSAf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 20 Nov 2022 13:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKTSAe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Nov 2022 13:00:34 -0500
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB4D2A96A;
        Sun, 20 Nov 2022 10:00:31 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-142b72a728fso3734318fac.9;
        Sun, 20 Nov 2022 10:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqDV5bEOonkQKcGjRa8rDOkspDvNLwiewUYppvmzsG4=;
        b=jMFZFXobMn3OQo3tTEnGwUBu75jZhPtbFmS5LoowwymSor/l7C3BCPw/uF8FM0S71k
         v2y3Omp9i8uLDC3nMF3te48EkNAdqS/bwuudpmAnxLCufekNaZF1Mh4GlpzmQr0yoCLQ
         izeOqDucS9gYGaUKs0nSAdybeuIW8DoDgeFSP+vW31gePJsVRyRlfiAT9bXN2aJED6hs
         EItfkVlvUVvSuCVRtbf3hip1wsZjYq6+UI2fnIIOD+UFuUFDg2eJLR8Dqiv3XhI8eAFq
         KS95mNhZvmNEDatSW/HAlpsJtRw/hL276OMNS2oCYJDXrUSGU/Y0KKw0xHzJn+G15wg1
         NOSg==
X-Gm-Message-State: ANoB5plax+rdshLMp9RT+tqxj1b7fjPtPPhtSSuDRmKAGx2McLHplNf1
        6nvZ6wjlLXG4Dpwu++y/qA==
X-Google-Smtp-Source: AA0mqf59xqJp3I6E88kVPzETemIzIGpnJbqw6uctCutxVSc8VS3ZmMs7qXwBj7/o6UDxxyLKSGwJdQ==
X-Received: by 2002:a05:6870:9688:b0:141:51a8:2d19 with SMTP id o8-20020a056870968800b0014151a82d19mr1637577oaq.187.1668967231043;
        Sun, 20 Nov 2022 10:00:31 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
        by smtp.gmail.com with ESMTPSA id 123-20020aca0781000000b00349a06c581fsm3493232oih.3.2022.11.20.10.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 10:00:30 -0800 (PST)
Received: (nullmailer pid 3265089 invoked by uid 1000);
        Sun, 20 Nov 2022 18:00:30 -0000
Date:   Sun, 20 Nov 2022 12:00:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Janne Grunau <j@jannau.net>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, Krishna Reddy <vdumpa@nvidia.com>,
        asahi@lists.linux.dev,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v12 1/4] of: Introduce of_translate_dma_region()
Message-ID: <166896722896.3265021.2815009340512697667.robh@kernel.org>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <20221117185424.2359687-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117185424.2359687-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu, 17 Nov 2022 19:54:21 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This function is similar to of_translate_dma_address() but also reads a
> length in addition to an address from a device tree property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/of/address.c       | 41 ++++++++++++++++++++++++++++++++++++++
>  include/linux/of_address.h |  2 ++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
