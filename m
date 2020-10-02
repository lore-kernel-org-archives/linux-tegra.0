Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1379CC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C513D20758
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJtZfY19"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388198AbgJBSEf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgJBSEf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 14:04:35 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D6BC0613D0;
        Fri,  2 Oct 2020 11:04:35 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y17so2918828lfa.8;
        Fri, 02 Oct 2020 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E9bgZxYv/RxOeJOXWw7426mT+7GbY13hZGXLbKnQnYw=;
        b=iJtZfY19TrniD8h6LVpwXQn4bQdTtYlCkB15ZZDFY5ziTHHV5/ugU9dpZ+n+a/ERuj
         wQsbUbibEdLoh2fFAQiOuQOkwytpq0Vg3Pv/xKcddMPnkB7WU9JUC5MYsPuEZiJnfUGd
         4QF3US5PQ8ofVdHAMEZq452OzNSgi05+YD+qYwR9HpNXiNgko8cyVbtyfF1duWz0zwjh
         GhbQpj46bZT28MWjOGvAQp4PNuXxDD5D73eXdvXQBhApXx4r4Poyvw3TqTZdbNZNGXNi
         aPB15/efAvaCc2m0FIH5s223YF5fbiKS1XmA/OXdqan6KL5JhZbNToW1wHkCbZ0/iD0C
         pncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E9bgZxYv/RxOeJOXWw7426mT+7GbY13hZGXLbKnQnYw=;
        b=ibIbui6M8cW3awQdAkPvj6R0CUrU1PSp3lF7j7qzewgrbBPDHFYKxGufdszp2qlnXi
         f3utgTx8QUC2ASJXFq0qltnQB5i0eFTXeiLsDT9bpTKEryNwb2KkQwqOkufrc58F04qT
         iiWcWonjDgNj9IF5FbwT1VXOz9f5nazvwxNZOfw5wUKnFrQzQFEA017jjmyzmIt8ZWcK
         DUtoUvWEKCBVZ/iRfklqk2VkSJ/uUDc+Z+7axg0xBlXbxC9BWykz4yKjifhRccdqVG0w
         mVaPQALdzZYnmAI/eY6MGegmfmijU/Z3ku0xPNmhIxVisFbecVqJkGAf01excsDsIZWY
         RVrw==
X-Gm-Message-State: AOAM532nwFexCxvPb++QA8UY3pkMLZkI4OgE209NBGpy2B7cohTcOjNL
        lBuFuXR6CESzLF62Jq/pOXgxvxkF78k=
X-Google-Smtp-Source: ABdhPJwYWn5ZEXsgsJyPwVGhib96/ISyH1PDMH0P6JD3SZBGoy/27BBjnJal2G/WWHFCRV+BspS++w==
X-Received: by 2002:a19:f245:: with SMTP id d5mr1170281lfk.97.1601661873255;
        Fri, 02 Oct 2020 11:04:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id r4sm444396lfc.162.2020.10.02.11.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 11:04:32 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6668f545-a2d5-120d-f34d-57f0ed1bbddf@gmail.com>
Date:   Fri, 2 Oct 2020 21:04:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
> This patch simply adds support for PCI devices.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
