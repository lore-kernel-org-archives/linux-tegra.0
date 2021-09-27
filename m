Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18C4C43217
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 16:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A3C46108E
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 16:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbhI0Qie (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 12:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbhI0Qid (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 12:38:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5948AC061575;
        Mon, 27 Sep 2021 09:36:55 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g41so79864347lfv.1;
        Mon, 27 Sep 2021 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a3irQuzXcmJ3SaUrVWrpItQuRKBrje2gTk7DCRbRsQM=;
        b=jI55Zff60BLNnV7bhyYUXQpBjUwP8T76ka5M60SixBxI6fL9AH8aUSFXKtQTYx1B8u
         ei5ek7k5JTmGZ82pjKzLnWP7HMqp5PQKFr0fVlhQbMxLSkkI9hOAHd5tNGkmyrKokOkR
         CBrNciMMA/fvqKhyccD2itltjTetfWsV5iDYZ3a/YhjDT37a5oer0B4ar678qW3QLe+0
         mjH16VehgPByZrX+6P61WDTUFZsSb3NUZKL1ZutLflq6RvbRd/u7iOsphppFDuq0GgVc
         B6keFBpOygJz1VxyUR1H/YMtLcquY+uRaac6ADHBnKaru6yMH2sKIaxAfLHP8k07AhXE
         ZLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a3irQuzXcmJ3SaUrVWrpItQuRKBrje2gTk7DCRbRsQM=;
        b=4h1CkP4DRgmcLjk0APnUnaHOwoyU479mvXHO6tt8DmX2hPE3h9NGt3rcYibytMiY7H
         PO46nXxSUiJfzX4Q3BVp0YYSaKgPRk5JYmUIuX8XtGGrow4DacB48qQiH3isMLtwflXA
         3cETtuMU5EjgLx94iGMI9IL3dLFZE4ltMKIM808KrSFgZkl71nCkDrJTXmISLwoleQuR
         M71JCbpsc6lRdKcGu895mJMkE8XM6Qtj4GQLlBFf9jJs+dc/yqIzie1K15ncbsuJrTPT
         mMTKWUN6oFRuRwEvbBSmbrNE/J21JSAdZcn6+jMKPj+RKQbxxRReNfssV38oLIBRphwl
         UyEg==
X-Gm-Message-State: AOAM532WKEMHrpWbsW8eKKo6mkqYbPcnTiaWdzue0MqM/bgkE2t1mD23
        HnRpryybuStwf+qMO9e4WiyytutxEQI=
X-Google-Smtp-Source: ABdhPJzxOPe7qDAw4MaX7bB6k60wC41MoxRiAoiCoeVzO9t5W7OGRArncN5cph55hr/Vw1ICAmH9Og==
X-Received: by 2002:a05:6512:513:: with SMTP id o19mr699839lfb.31.1632760613335;
        Mon, 27 Sep 2021 09:36:53 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id c2sm2077219lji.71.2021.09.27.09.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 09:36:52 -0700 (PDT)
Subject: Re: [PATCH v7 4/7] usb: phy: tegra: Support OTG mode programming
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-5-digetx@gmail.com>
Message-ID: <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
Date:   Mon, 27 Sep 2021 19:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912181718.1328-5-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.09.2021 21:17, Dmitry Osipenko пишет:
> Support programming USB PHY into OTG mode.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c   | 198 +++++++++++++++++++++++++++++-
>  include/linux/usb/tegra_usb_phy.h |   5 +
>  2 files changed, 198 insertions(+), 5 deletions(-)

Greg / Felipe, could you please ack this patch to allow Thierry to take
this series via the Tegra tree? It depends on the soc/tegra patch of
this patchset.
