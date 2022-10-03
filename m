Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63ECC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Oct 2022 16:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiJCQRC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJCQQ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 12:16:57 -0400
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A43D33A1A;
        Mon,  3 Oct 2022 09:16:55 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id m130so11757321oif.6;
        Mon, 03 Oct 2022 09:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=n6qNXTUxVdbW5pamC8yW/XZu0YEjyP8JbCRL+nV6Xik=;
        b=Wl6Z63+Sc3lP6InVrLx9lI5qsA3w2iU/0SC3+DwVzCLbfoKonEcAU3nruWCDyZuXtd
         Fyz2JZ9LxQJ4GKYB3I4/3+k3REfKC7ykxHbX9uN5kpu1XGoAm8mXIrl88g17KhYvKr+h
         ndPFUWn7wmOmNPI3nb5g0FloXGIcj3AqwJfu4vliHCAEXfJFFWdIq9Db1w5ydO/A8mAP
         jxDvHBFa1cxf24sLW1fMVE51kVAQP7wMFNfL273xjNjcOIsCTzcREXleZM/qGYN1vdLa
         M4OA6aoK7biMy3A393Gv5qM+d39UwnVs2EBCyi16UmqTgcpODo8Jh1IhXqU+6bQHjovo
         D1pQ==
X-Gm-Message-State: ACrzQf0SPWVdNx6k7v9JRc3NqyQm9nA/Kbi78qvUTRyS1O0kHUPnqpHK
        PDQJ0v8w7eHdy/gSDQj2cwATpESoXw==
X-Google-Smtp-Source: AMsMyM5EYqsB+/ddWpoDpynNS+3amBvzxr+amDgwN06v0eLd9S0EKVKIRe6kbLbya8z3KvSzYFYG9g==
X-Received: by 2002:aca:180b:0:b0:352:8bda:c428 with SMTP id h11-20020aca180b000000b003528bdac428mr4376671oih.13.1664813814275;
        Mon, 03 Oct 2022 09:16:54 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ep31-20020a056870a99f00b0011bde9f5745sm3018755oab.23.2022.10.03.09.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:16:53 -0700 (PDT)
Received: (nullmailer pid 2398224 invoked by uid 1000);
        Mon, 03 Oct 2022 16:16:52 -0000
Date:   Mon, 3 Oct 2022 11:16:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, Ashish Mhetre <amhetre@nvidia.com>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Message-ID: <166481381193.2398163.17368666034757782768.robh@kernel.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-4-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920081203.3237744-4-cyndis@kapsi.fi>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 20 Sep 2022 11:11:58 +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update NVDEC bindings for Tegra234. This new engine version only has
> two memory clients, but now requires three clocks, and as a bigger
> change the engine loads firmware from a secure carveout configured by
> the bootloader.
> 
> For the latter, we need to add a phandle to the memory controller
> to query the location of this carveout, and several other properties
> containing offsets into the firmware inside the carveout. This
> carveout is not accessible by the CPU, but is needed by NVDEC,
> so we need this information to be relayed from the bootloader.
> 
> As the binding was getting large with many conditional properties,
> also split the Tegra234 version out into a separate file.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> - Adjusted descriptions for firmware-related DT properties
>   as requested.
> - Small update to commit message.
> v2:
> - Split out into separate file to avoid complexity with
>   conditionals etc.
> ---
>  .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
