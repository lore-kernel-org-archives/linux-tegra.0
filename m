Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D812C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8616461501
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhJDVPl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbhJDVPk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:15:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DF0C061745;
        Mon,  4 Oct 2021 14:13:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b20so77806260lfv.3;
        Mon, 04 Oct 2021 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uNTJy4nyoFNjcMWJJxtBf5MiY7MfgIk5KPCbms68E8M=;
        b=l7gRmUHnIwmF6sQ0/DgS1G2mAZTSwwqPkFQaxe4bhL/A67SeGWE8+Zp6mrr5pSJs96
         juUlNkgnIW1shN9vqNYyw5hS4BWg/vCbMBsDPdqBo0Bpf7M3NSo4tkhf0QS6x/kCUNP8
         UhxbRvdYuqPOz+n37B8e72W+CjA5L7CfHrkUvFqusfBMw61Ih4rPE019Em2HabZDHQVk
         yg1IirczuSveAJUE6o9zTmBbycFLzzQ04His+0Xy+PF/0MC3Dom8zwvTZbrjPUGSFWgs
         zQs4kL8sEj5VrAQHZTQvugX7hHHXdOlvk9+g8NOIEKAQ2Oj0YIvaYurphLX6Qrsvmkm0
         kQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uNTJy4nyoFNjcMWJJxtBf5MiY7MfgIk5KPCbms68E8M=;
        b=j1paJIaLrTCeiOyAY0DaqBYsaHjaIeWyGVv6TmiD+0PiBOBgp37qTcAEe8v9P5kkar
         YrjW+qmwY4FD0aKgL92JVsHSlosf0Aq2R6CpjxCF2UCkhzkmQp8IoAYPNIDSBHWfBeEy
         TCgyYKUY5ULv+c4mcCHdBhu+c1mpZFhDxIMFIg0KI8gxwptZ5ql8T94mMFjMSw3D///F
         HZn7D9GJq/sIgMRvCmtcNGAWUaYREW3eTmiqimH0hIcF4BkhQFvP9OEN83Yb7LFpmfF0
         hKXrOpuLsvZtj8q06cGJByLuUa0BpuwdBmuHaVUfE05fuCRb4EzXPK2LFlXrNqhaYa0A
         p8dQ==
X-Gm-Message-State: AOAM533vzOD2ByIBKhEDv2AURcNrKIRnKaWsUa+Q327e4/s+GY9bhuCK
        fzKbmLRc981Qwf/7r0LlsZs=
X-Google-Smtp-Source: ABdhPJxBoF2cwQ30/HndDVE2Yae4znnGxgecHl9ljWnLdvT9fnxOTnrHVg/3nRh4ZGk6/c40VFYgWQ==
X-Received: by 2002:a2e:80ca:: with SMTP id r10mr18767211ljg.347.1633382029254;
        Mon, 04 Oct 2021 14:13:49 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id l23sm1866167ljg.99.2021.10.04.14.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 14:13:48 -0700 (PDT)
Subject: Re: [PATCH v7 4/7] usb: phy: tegra: Support OTG mode programming
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-5-digetx@gmail.com>
 <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
 <YVtslrGXStvdO2IS@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <94949858-6089-06df-1226-f7974a3ae6bf@gmail.com>
Date:   Tue, 5 Oct 2021 00:13:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVtslrGXStvdO2IS@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2021 00:05, Thierry Reding пишет:
> On Mon, Sep 27, 2021 at 07:36:52PM +0300, Dmitry Osipenko wrote:
>> 12.09.2021 21:17, Dmitry Osipenko пишет:
>>> Support programming USB PHY into OTG mode.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/usb/phy/phy-tegra-usb.c   | 198 +++++++++++++++++++++++++++++-
>>>  include/linux/usb/tegra_usb_phy.h |   5 +
>>>  2 files changed, 198 insertions(+), 5 deletions(-)
>>
>> Greg / Felipe, could you please ack this patch to allow Thierry to take
>> this series via the Tegra tree? It depends on the soc/tegra patch of
>> this patchset.
> 
> Looking at the series, I don't think this necessarily needs to go
> through the Tegra tree. Given that you have backwards-compatibility with
> older device trees, applying this separately to the USB tree should work
> fine. Once the soc/tegra and DT bits and the USB bits get combined they
> should enable the new functionality, but nothing should break if things
> are applied separately.
> 
> If so, I can just pick up the rest and let Felipe or Greg pick this one
> up.
> 
> Dmitry, can you confirm that this patch should be applicable separately?
> If so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

This PHY patch has this hunk:

+	phy->pmc_regmap = dev_get_regmap(&pmc_pdev->dev, "usb_sleepwalk");
+	if (!phy->pmc_regmap)
+		return -EINVAL;

If this patch and the DT patches will be applied before the soc/tegra
patch, then USB PHY driver will fail to probe.
