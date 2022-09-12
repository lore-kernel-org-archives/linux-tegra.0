Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B49C6FA86
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Sep 2022 20:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiILUbY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 12 Sep 2022 16:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiILUbX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Sep 2022 16:31:23 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC74402D7;
        Mon, 12 Sep 2022 13:31:21 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so6669028oth.10;
        Mon, 12 Sep 2022 13:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6A3CWEMAFPkwUp+B5fXnYASflBbpzoqE0pypp9nRf24=;
        b=srEX69MaNb0/eRQVckoWsCZg+g0SyI00y3F8l5hDLoXf/GPKQxsDrmTDFpGp31PR4e
         ijgjMpKM3rWQfDIoQ+Smk745COZtVbI1xwjJdJcdu5bLqvRWlHCa5DgF9tgzCXZrHjuD
         vLIK/CPG1xUKUQQE6iSNoD6xaXfRKa1zyCZwZQKADCEH9HnvGX+SwiFc5BtERPXRQXgZ
         70gwzSRuQdRAxYYirG+FVYu79aj9kX+MRN6AhNmzixdfFam/7ejeIj2+quSBi62g1XgT
         Vw+66tye9IZBckQ5fLoEqKeM0uyfYVTJe20wm44B6XktnjNJC11Vu6pkH1vilxoKSdfk
         aMoQ==
X-Gm-Message-State: ACgBeo0C0+uE5NduNQYO8v1wmjaIzLUo8VVSO9w+szEfQ4S2sQ909r2G
        ZWOs4QmQimPzH9J17mqgtPudQVzhdg==
X-Google-Smtp-Source: AA6agR41y4ZEWvWRxBL1Wfr2qArgX3oQFk30/7wuiEwQu0d00nU0yB/xzhB66U8l7MAC3QkOYkZ8FA==
X-Received: by 2002:a9d:7442:0:b0:655:df84:5bd3 with SMTP id p2-20020a9d7442000000b00655df845bd3mr3021379otk.155.1663014681070;
        Mon, 12 Sep 2022 13:31:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870818600b0010d7242b623sm6113334oae.21.2022.09.12.13.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 13:31:20 -0700 (PDT)
Received: (nullmailer pid 1783124 invoked by uid 1000);
        Mon, 12 Sep 2022 20:31:20 -0000
Date:   Mon, 12 Sep 2022 15:31:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: Add Host1x context stream IDs on
 Tegra234
Message-ID: <20220912203120.GA1783078-robh@kernel.org>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
 <20220907083844.2486805-3-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907083844.2486805-3-cyndis@kapsi.fi>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 07 Sep 2022 11:38:43 +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add defines for stream IDs used for Host1x context isolation
> on Tegra234. The same stream IDs are used for both NISO0 and
> NISO1 SMMUs since Host1x's stream ID protection tables don't
> make a distinction between the two.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra234-mc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
