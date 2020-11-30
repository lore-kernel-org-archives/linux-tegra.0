Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C72C63777
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Nov 2020 22:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4B7E2076C
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Nov 2020 22:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgK3WEf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Nov 2020 17:04:35 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:37042 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgK3WEf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Nov 2020 17:04:35 -0500
Received: by mail-io1-f67.google.com with SMTP id k3so5600171ioq.4;
        Mon, 30 Nov 2020 14:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LDgTcXGFR+vTXwm6AltCH/wuRmdYVoDhpMzgf7Xk0Us=;
        b=sFghrQmTmnZBSBVj5mMKNCK+R4jBUMPVOW1Yew7Grpq+LN1gp3/9NZPedA0qi/s+vf
         hYjILnkDLD8lXzN9F6yoEm7vCKfcujnCZHdCIm0gCmTk+hs3q9U9xFFBUYDuUxJbH9uG
         D1zVRuWMmbEMpsS/QRqTL8WqvS/6u+7dEkdaeCYu+f2B3amiiRzsEA7mjnLP73cdYG4v
         jK4G82uaGPSkT4+mMkXX7qGicqxcpSJ/zr2kOEt/LwX9icmWZEZ9nXNxw/RgFNLEHTjZ
         Bp3UL0k+/qE6qH/xeviDVZaUzIuVU7xLgtm96kBGf8rgCxZ8gGKc2LYfuk4Vqq7CzKkv
         yFfg==
X-Gm-Message-State: AOAM531OG13VPztMeVU+zs+efjrHYwhB3eFrqPdwcn0Vq8lOayiBZxZj
        1pPfK8f51VuJ2txluMwtIg==
X-Google-Smtp-Source: ABdhPJzW9SCDHhMS8gQJ9gnGG1JH1BQBi/KBvCkAtSKQoZMqqCc7hfmKkRhYAvugPumR+Iykavbgsw==
X-Received: by 2002:a05:6638:124d:: with SMTP id o13mr21077467jas.98.1606773833504;
        Mon, 30 Nov 2020 14:03:53 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p7sm2562387iln.11.2020.11.30.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 14:03:52 -0800 (PST)
Received: (nullmailer pid 3111931 invoked by uid 1000);
        Mon, 30 Nov 2020 22:03:50 -0000
Date:   Mon, 30 Nov 2020 15:03:50 -0700
From:   Rob Herring <robh@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     nkristam@nvidia.com, kishon@ti.com, thierry.reding@gmail.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jonathanh@nvidia.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc
 prop
Message-ID: <20201130220350.GA3111877@robh.at.kernel.org>
References: <20201119085405.556138-1-jckuo@nvidia.com>
 <20201119085405.556138-11-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119085405.556138-11-jckuo@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 19 Nov 2020 16:53:59 +0800, JC Kuo wrote:
> This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
> PHY driver. It is a phandle and specifier referring to the Tegra210
> pmc@7000e400 node.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v5:
>    replace "pmc@7000e400 node" -> with "PMC node"
> v4:
>    new change to document "nvidia,pmc" prop
> 
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
