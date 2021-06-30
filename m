Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F481C11F65
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 20:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E28C6147E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 20:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbhF3UCd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Jun 2021 16:02:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50704 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233943AbhF3UCd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Jun 2021 16:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625083203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kpbCmymIfNMu/sLXKm+zPCIGsHXk+XoDrOjYWyu1pFU=;
        b=ZHv2dqBscC+oHisACQT3MD44gZu/m6weRc7eRyxwz5W7i+Rz2xnhNxdC/drM1QVYyV8gnM
        apRlLnubDIPiSjBJogJONcpvzFfGc+Oyr7u1iUoPZ8+W4PnA5afrblZtYPT4O8lD+wxvsl
        IPuQVjCr8M07QfPPBkjofEokSFR1ZWA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-uIXiWFy1OK6u6vUtzcxeWg-1; Wed, 30 Jun 2021 16:00:02 -0400
X-MC-Unique: uIXiWFy1OK6u6vUtzcxeWg-1
Received: by mail-wm1-f72.google.com with SMTP id t12-20020a7bc3cc0000b02901f290c9c44eso1222229wmj.7
        for <linux-tegra@vger.kernel.org>; Wed, 30 Jun 2021 13:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kpbCmymIfNMu/sLXKm+zPCIGsHXk+XoDrOjYWyu1pFU=;
        b=qobtTCuDnFpQM3n8qSY7y3IsbpF/XJeMCXqtGwV5G8AljxGc7UVf9Np64UXf38kbEZ
         ez/Sar8f0QUvKDHyj463FPb/q35D6yI59kP/bbhruaIiWIO8Ry7xxKQb+hryCbpEAPRu
         X0q+1b7K049MwVtiuUYuaNXLNLyjrzYg/NXVU8QMDH7rf/MD8KbIj7reUmK9KW7sgMbu
         xsU9hcZvW2jKUG6oheSENNIBruwSOMK3vZiCgHyQI7104VCLPh3TGq74PGwwMzT1vLlv
         U622TMsmj9QF3ikuBHnlL7oWSqj0qpVSKStP7a87MwdLX3+WKj2c8rXW+4Tj9UFPwDeY
         WcEA==
X-Gm-Message-State: AOAM533bZmGC4bx+NMmm/EGEx2rsFNHNk+A1P0QImA62E07Ua+e1aSKT
        Dp3IxR3bqTvzQJY8XAzLz5mosEF2H0AWW015or358F3w0O6GF7MIk8cvZngkWu7KphquR0878T9
        Kh10gllUdy0JjW4yV2/C86xEwlBme5MVhZizDaCa8mnmolzf6sjG1SjdwW6qrlNL6aICR6JMdcg
        ==
X-Received: by 2002:adf:8061:: with SMTP id 88mr41122186wrk.233.1625083200936;
        Wed, 30 Jun 2021 13:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbZIKlGNykgS5LTjJzUuKd9t2lLDnL4kgF750pVyY2IVUV5P2R2ti+aPzbVcp/wpfbkYiwhA==
X-Received: by 2002:adf:8061:: with SMTP id 88mr41122158wrk.233.1625083200692;
        Wed, 30 Jun 2021 13:00:00 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id o14sm25399wmq.1.2021.06.30.12.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 13:00:00 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: rockchip: Avoid accessing PCIe registers with
 clocks gated
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20210630185922.GA4170992@bjorn-Precision-5520>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <e7f3bd28-8e5e-362d-11a9-43a60ff79dd2@redhat.com>
Date:   Wed, 30 Jun 2021 21:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630185922.GA4170992@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/30/21 8:59 PM, Bjorn Helgaas wrote:
> [+cc Michal, Jingoo, Thierry, Jonathan]

[snip]

> 
> I think the above commit log is perfectly accurate, but all the
> details might suggest that this is something specific to rockchip or
> CONFIG_DEBUG_SHIRQ, which it isn't, and they might obscure the
> fundamental problem, which is actually very simple: we registered IRQ
> handlers before we were ready for them to be called.
> 
> I propose the following commit log in the hope that it would help
> other driver authors to make similar fixes:
>
>     PCI: rockchip: Register IRQ handlers after device and data are ready
> 
>     An IRQ handler may be called at any time after it is registered, so
>     anything it relies on must be ready before registration.
> 
>     rockchip_pcie_subsys_irq_handler() and rockchip_pcie_client_irq_handler()
>     read registers in the PCIe controller, but we registered them before
>     turning on clocks to the controller.  If either is called before the clocks
>     are turned on, the register reads fail and the machine hangs.
> 
>     Similarly, rockchip_pcie_legacy_int_handler() uses rockchip->irq_domain,
>     but we installed it before initializing irq_domain.
> 
>     Register IRQ handlers after their data structures are initialized and
>     clocks are enabled.
> 
> If this is inaccurate or omits something important, let me know.  I
> can make any updates locally.
>

I think your description is accurate and agree that the commit message may
be misleading. As you said, this is a general problem and the fact that an
IRQ is shared and CONFIG_DEBUG_SHIRQ fires a spurious interrupt just make
the assumptions in the driver to fall apart.

But maybe you can also add a paragraph that mentions the CONFIG_DEBUG_SHIRQ
option and shared interrupts? That way, other driver authors could know that
by enabling this an underlying problem might be exposed for them to fix.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

