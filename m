Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EE9C11F65
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 22:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 064D66147E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 22:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhF3WMd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Jun 2021 18:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39169 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232712AbhF3WMc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Jun 2021 18:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625091003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ReCbrtMP/cxLMRe/lZJL4GXF42nMx1vpMXEPSI0hvQ=;
        b=UWhIer2ssqqbSIV0AVF0emTEEQHV7J7lHD/+HzG4cRFBzFd43Nnt6RYmrxokzWBuTsyP3j
        M82KpBS171yfu1sWJmk7Cc6oVyz9oxIkh4eUCBPTkGdcaXxqj5rFt1k0OuYaGrzhvNrvvo
        /aonUPxS2av7DSTc2iOa5tLf4uWNw9o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-_CZV4xUfNl6-Aso_kmTlOA-1; Wed, 30 Jun 2021 18:10:01 -0400
X-MC-Unique: _CZV4xUfNl6-Aso_kmTlOA-1
Received: by mail-wm1-f71.google.com with SMTP id m186-20020a1c26c30000b02901e1c85168f1so913529wmm.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Jun 2021 15:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ReCbrtMP/cxLMRe/lZJL4GXF42nMx1vpMXEPSI0hvQ=;
        b=dBZAecDjNsrli/4WHsog0Pp7vOoYiYzynmRMPbGpUDuw2H2Pqn0ySYbznegGjLPJ3K
         TYn5SDihkm5NqYMpmRsycaNOLMaQcidCe6uy+/sSfsL+kGGEieEcSOlDO5HA22e6/LuX
         NMX0ga2W7IuVf7+ZrvAanroHfiQpeWyuhLyphEVyHv9bh3goUyTQrp2xs7JjUszRMzYz
         bBkFyi08AdM4zh16mEZSTu0SWg0gaVA/sE2Ev8BBqtq2UY7fcQEmFlsfsOkeKf6/LBzO
         lGfaW6IYyojQsYC39L20kQsvPn72nnP7+xc64gVmbIa7OrFHAgDess+U4ReqbCKXdOag
         ecpg==
X-Gm-Message-State: AOAM531kaypV8s9neFiDQvXyAP6QfME06bgqG5mdALV4RzWH5FoGx6dD
        pO7T/i9TlVjsVdqx8CqsVHqswvmiF/vbSRqBodQX5+zEwd4H77T3TA0nkTMQXXEZR8oPyxXL/Ri
        K9pz69xTKFfHuy5WFxlmjRPzCE43XWbxmS0oc5qPPEbjXOpq3GIAV6KvcvhCklV5uNgin+1hQUw
        ==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr16882658wmg.117.1625091000140;
        Wed, 30 Jun 2021 15:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlU5TtFXVLyohpWwUCLVR70qKXp8D+c6+g8CDe44j7e9CNHSYRynn3Hnx7Cwjxfz20NWN+Rw==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr16882631wmg.117.1625090999901;
        Wed, 30 Jun 2021 15:09:59 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id d17sm9611715wro.93.2021.06.30.15.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 15:09:59 -0700 (PDT)
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
References: <20210630203030.GA4178852@bjorn-Precision-5520>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <51276875-658e-e6fe-5433-b5d795b253ff@redhat.com>
Date:   Thu, 1 Jul 2021 00:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630203030.GA4178852@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/30/21 10:30 PM, Bjorn Helgaas wrote:
> On Wed, Jun 30, 2021 at 09:59:58PM +0200, Javier Martinez Canillas wrote:

[snip]

>>
>> But maybe you can also add a paragraph that mentions the CONFIG_DEBUG_SHIRQ
>> option and shared interrupts? That way, other driver authors could know that
>> by enabling this an underlying problem might be exposed for them to fix.
> 
> Good idea, thanks!  I added this; is it something like what you had in
> mind?
> 

Thanks a lot for doing this rewording. I just have a small nit for the text.

>     Found by enabling CONFIG_DEBUG_SHIRQ, which calls the IRQ handler when it
>     is being unregistered.  An error during the probe path might cause this
>     unregistration and IRQ handler execution before the device or data
>     structure init has finished.
> 

The IRQ handler is not called when unregistered, but it is called when another
handler for the shared IRQ is unregistered. In this particular driver, both a
"pcie-sys" and "pcie-client" handlers are registered, then an error leads to
"pcie-sys" being unregistered and the handler for "pcie-client" being called.

So maybe the following instead?

    Found by enabling CONFIG_DEBUG_SHIRQ, which calls the IRQ handlers when a
    handler for the shared IRQ is unregistered. An error during the probe path
    might cause this unregistration and handler execution before the device or
    data structure init has finished.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

