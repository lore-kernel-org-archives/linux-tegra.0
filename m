Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A266CC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 884E66105A
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbhJNVxd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:53:33 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33317 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhJNVxc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:53:32 -0400
Received: by mail-ot1-f52.google.com with SMTP id l7-20020a0568302b0700b0054e40740571so10261476otv.0;
        Thu, 14 Oct 2021 14:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Vx3+8EvOr8q4y6u6WcKh1ipOQ+CdJ+IY0Ez5s6SGr8=;
        b=06yssWMkNldPXs0djdTl00WVY+TI5oR1zGKNwnJ7xxAyPRLxX7otaTG5vCOzE2XR2n
         ZEZ+tpncEoStARoJz40PcMHzOkpPLwApPBlOK9haW3rq7Yqx0AvgK1v96IvNDijpdvQb
         Arrf7tGK2Fqg3pwHbGEV+0KM3/C0yU7Jmw7k3qSX9VflXA3d0DQqxLYk+uL1mVGbHu+1
         /YNRLhzy4SRfaIzvjVWj2IuYDcAQs94zGprs9dT1FxJfQVXRrKsan77MuV8d2LwjXgeW
         7aAnHZ0ccxBzedXts1dcBWFFd35D5Vu/kCQ7WYhgDWXQw6PaBlORLNdau4EImRuRhDCY
         wo1Q==
X-Gm-Message-State: AOAM53234XqTFAuYQsNccJEzBqByZq092DEa2Hkr+WSJjbUHzr4qmIgh
        OXa7c2KU0F0tyA6tGHf0OQ==
X-Google-Smtp-Source: ABdhPJxaIMBSFyoQVSsDR1HfJ5lxVzMv6/JFk6N//ZFnzNh5tYmgKtH3WKbey2ivSyAy4qCY3CTQYg==
X-Received: by 2002:a05:6830:440a:: with SMTP id q10mr4548683otv.80.1634248286774;
        Thu, 14 Oct 2021 14:51:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i28sm679094ood.23.2021.10.14.14.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:51:26 -0700 (PDT)
Received: (nullmailer pid 4010238 invoked by uid 1000);
        Thu, 14 Oct 2021 21:51:25 -0000
Date:   Thu, 14 Oct 2021 16:51:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 4/9] dt-bindings: memory: lpddr2: Document Elpida
 B8132B2PB-6D-F
Message-ID: <YWimXaaz7kbxHDjq@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-5-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:54 +0300, Dmitry Osipenko wrote:
> Elpida B8132B2PB-6D-F memory chip is used by ASUS Transformer TF101
> tablet, add compatible for it. We need to specify this compatible it
> for a device-tree node containing corresponding memory timings in order
> to allow software to match the timings with the detected hardware.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
