Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB86EB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 20:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbjGEUsM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbjGEUsK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 16:48:10 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEDD1BD5;
        Wed,  5 Jul 2023 13:47:53 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-346129c9512so2891185ab.1;
        Wed, 05 Jul 2023 13:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688590072; x=1691182072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgZtzgLZ186D+1VHF9SOT0+7OMjwAxYfRWxIat2rPFA=;
        b=YI4/qZK97ELHpBJL28cbB+xIdSer3nxdLGltVOHZi7OovP8X/x7V+ubnxeWTvHVWCC
         K30TCLfHdggDxrt6d5XsH59LiwHfX1nZjrg4v34jxPN/7DOAeJZJp3q/Q8q9ydy5JUrS
         XZ0NvchYo59Z/IOigb0MmJgng3N0VXSo5Z5SdCAY6fWNRHmNTQRV1msGjBH9MINTeZce
         dMT4lxTt5IwMNJmrD6DJk7Ptv1+ono880kSovN+3MEF3d89Np5deyLH0ZzfnHB0Vue/h
         GhVTnqo5FMxhMhgnSux9i3f/9EHQQIJnHRYvrCP2z08iGksgHodWsSDQDzWd4wU8n7WQ
         d/KQ==
X-Gm-Message-State: ABy/qLYekI2E6J5oFMNZEBYcZkGxR5deCYg5y7v6Fe3ISVlTTe5qvcm2
        HfAUwwg9IM9nmXFpRWyTUg==
X-Google-Smtp-Source: APBJJlGWMpOPqP+zrdVougJFHDhqzbYjDJhYkwYkJE9Ms+H4wZ6OluKw330MOnr3EifVU/4tQ32pjQ==
X-Received: by 2002:a05:6e02:1350:b0:345:ab30:7b42 with SMTP id k16-20020a056e02135000b00345ab307b42mr2059889ilr.1.1688590072224;
        Wed, 05 Jul 2023 13:47:52 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r16-20020a028810000000b0042b0a6d899fsm4023jai.60.2023.07.05.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:47:51 -0700 (PDT)
Received: (nullmailer pid 1871046 invoked by uid 1000);
        Wed, 05 Jul 2023 20:47:49 -0000
Date:   Wed, 5 Jul 2023 14:47:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: tegra: flowctrl: Convert to
 json-schema
Message-ID: <168859006921.1870949.16152189289677856562.robh@kernel.org>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705155222.2519728-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed, 05 Jul 2023 17:52:20 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra flow controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - move to soc/tegra directory (Krzysztof)
> 
>  .../arm/tegra/nvidia,tegra20-flowctrl.txt     | 18 --------
>  .../soc/tegra/nvidia,tegra20-flowctrl.yaml    | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

