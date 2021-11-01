Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7CDC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Nov 2021 19:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F4DD61166
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Nov 2021 19:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhKATXN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Nov 2021 15:23:13 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:41707 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhKATXN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Nov 2021 15:23:13 -0400
Received: by mail-oi1-f169.google.com with SMTP id y128so26401508oie.8;
        Mon, 01 Nov 2021 12:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qnlgup2nPuigrBK07/+ipFujxJBXEGw/fmGyNY/BIAA=;
        b=LfaM9AKPcnrRlgW8T2vUuVMVVhoXiC085XSo66mIyRzFuJsauuBOyXFVKIBjd1xJe0
         I0ovTEKd6Ns3M7zxFblO3TQI+BQIJe9DVYbakcV+uj9wyZl4iVDcTo+k1nUTKHNmJPDF
         RrACS8mD1ogjr5TNoIMmeLyQeRctBB8JEqs42pSaBdPbLqVvfBsWKxulWk/i98hGiIFb
         aNY6ZRSo6frZzleuq+fzXS5p3+mK5bAM9D+548wVvGLOKVw7vD30MLj6HHg+qU4WiF08
         7kfJzdNRBACr2gQfy8JZQYEiY7PzwGNrG953FZTlLzdYhnfMKAi4sqzbDnmOejsUhgnb
         pPiw==
X-Gm-Message-State: AOAM5336mdUJscO9bbXbm5jZRfsgeSew/BTKc7b4G1fhEL/Bfcdu2kqR
        tec1/p3EHu3As2wAkbogww==
X-Google-Smtp-Source: ABdhPJydRoF7Coj/95HW2ujIlqgiT94jABT8VFdmFF8KXQFh4ELSGADKjE89MgQcKWhaTCt1xae/ig==
X-Received: by 2002:a05:6808:3d2:: with SMTP id o18mr762987oie.121.1635794439033;
        Mon, 01 Nov 2021 12:20:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n10sm2166547ooj.42.2021.11.01.12.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:20:38 -0700 (PDT)
Received: (nullmailer pid 866927 invoked by uid 1000);
        Mon, 01 Nov 2021 19:20:32 -0000
Date:   Mon, 1 Nov 2021 14:20:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        ~okias/devicetree@lists.sr.ht, Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Tegra194 P2U convert to YAML
Message-ID: <YYA+APGxn2i8ZVj/@robh.at.kernel.org>
References: <20211031113236.29712-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031113236.29712-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 31 Oct 2021 12:32:36 +0100, David Heidelberg wrote:
> Convert Tegra194 P2U binding to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/phy/phy-tegra194-p2u.txt         | 28 ------------
>  .../bindings/phy/phy-tegra194-p2u.yaml        | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
