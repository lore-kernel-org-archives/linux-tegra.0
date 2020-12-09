Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4AAC1B0D8
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Dec 2020 20:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4AB223A22
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Dec 2020 20:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388314AbgLIUQj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Dec 2020 15:16:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42593 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388306AbgLIUQa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Dec 2020 15:16:30 -0500
Received: by mail-ot1-f68.google.com with SMTP id 11so2654604oty.9;
        Wed, 09 Dec 2020 12:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8uhElzcobLmvJ4CJ8rrknqlI/sKGj1GFlEu7d86pG6Y=;
        b=YFUdnOezLbmQCFhrE2f2UmP327/7GgzFGMIa/h4jqEjsWNhZ7xxxrazFC/9YRtQkiv
         UkTeCcpkv6dEuy/9PTTVvSUOckQpP6cW5/c8XVCYeXVHIF8+olxRsaraZnWhmT/5k8H/
         IT9Mgehz/HJ8XJl0bF70lIQWh6ezwLoGtx9TTqp7OHjBpKGGko3wUF9pJhcrkvjXUfyX
         10cPbDOb6L6mOaHoI7Gd+ceSudT37x1rUhoRULFH4tkNokfy4vaG++HsIVRKeMuP0zX+
         TGOT3bz8E5C9L7Rgu5pwR8PnfOEI3iDtb0TDTIer3BnVkRii44evePuFEGWP58WwEgWL
         NMZg==
X-Gm-Message-State: AOAM532JTp9QwC7+gc3DhcoyDYBS+FR5Ng3mjCUdZyoGO9bfDBNXAX7z
        wXGrxLJ7lPkZ7EFoabq2mw==
X-Google-Smtp-Source: ABdhPJybi0Z6Obt2cspPMGRt7yCnDYiVdU/vAftLj6qWIRBhe1uxzVYP6NeDiR9hYoTckA/bE7t1pQ==
X-Received: by 2002:a9d:2946:: with SMTP id d64mr3240127otb.214.1607544949663;
        Wed, 09 Dec 2020 12:15:49 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a24sm529252oop.40.2020.12.09.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:15:48 -0800 (PST)
Received: (nullmailer pid 867803 invoked by uid 1000);
        Wed, 09 Dec 2020 20:15:47 -0000
Date:   Wed, 9 Dec 2020 14:15:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     sharadg@nvidia.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        broonie@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] dt-bindings: tegra: Add missing HDA properties
Message-ID: <20201209201547.GA867682@robh.at.kernel.org>
References: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
 <1607006202-4078-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607006202-4078-3-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 03 Dec 2020 20:06:42 +0530, Sameer Pujar wrote:
> Document the missing properties which are currently required for
> Tegra186/Tegra194 DT files.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
