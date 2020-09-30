Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D57C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98C9420789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEKFiD9I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3FKF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3FKE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:10:04 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B6FC061755;
        Tue, 29 Sep 2020 22:10:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u8so581063lff.1;
        Tue, 29 Sep 2020 22:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cEH+zGuhb7boZPnK+5qwlskD7dzNXbs2N7hqt0FYXtI=;
        b=JEKFiD9IhMc0d2BR62xEDLkwxPUNZ5O5AdjXzgRfQBoaNRDPyAaOzVSksh5qzthbOn
         cYaL2EEnInhh9d9qCI/VzTHM1UAFrtLeelC6pPjdHatdMhlXKjkbIwO7k0//RsZkRsjS
         423U++/3789kQEX1LWZcA5NE/DgIeZJI+acgQJ9GYvKAG4XiCcvjr/EDmHXnhenbvhwx
         tuH8F9P/YTm19nRrmsNVTDY6ylX+zAyu5FzeFSHMQ0xbRSvwdp3IfcWatk/brX3Rh49h
         ptCq5FurX26gGHPZHjo9Rvr1ERKApIQju9F9KmmigUZ9gY3kmkYyPPHkqXtglU0jw/ww
         +Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cEH+zGuhb7boZPnK+5qwlskD7dzNXbs2N7hqt0FYXtI=;
        b=WjX9P8Z0UwYDVMSCc7211iHSboENiwIpjR6AqZ7acdesEvUohqEc43a9LITZ/5d2N6
         URZvI1vKDtzntx0bmT3HrWNAa/Sg7Nn2x9XaNpniRc9rnozsj3CgI3+R2BPuL2DWazFm
         b9/MpjAtgZRHDa42DSU4FCFOXeSE0+wPWREkRBYvtvE6YjE/bccLNspa1IQlVR7VyaPZ
         Kkr4v6JjCWK3bvA9Nwr4jKolEMApqODKIskris1pdNbx26VFwwFJ4kP0dTfTIGjQgPoW
         SYx7L2twQXiV5VPyfNYBaO8O6g4DLgtCex0BE3Xuf8dCOrCcESq77XFOOHt2QRlC2uwH
         msZw==
X-Gm-Message-State: AOAM532cI/Swnz8r4ar17ONqjtIXPfPbFxa/rlEr8/2EecFPDAVhNR4t
        eo3KGY3Q+QgfOxnmu9EghmVqqxZYkO8=
X-Google-Smtp-Source: ABdhPJyOrfcyT8AJjKsE9UZTICu54D13qTLp0F9P1YPzBCvcB7eAm/HnfeYg1e2/Xa+QzTIeCRVeNA==
X-Received: by 2002:a19:8bc2:: with SMTP id n185mr211884lfd.211.1601442601966;
        Tue, 29 Sep 2020 22:10:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id v196sm54763lfa.96.2020.09.29.22.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:10:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
Date:   Wed, 30 Sep 2020 08:10:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 03:30, Nicolin Chen пишет:
...
> +#ifdef CONFIG_PCI
> +	if (!iommu_present(&pci_bus_type)) {

Could you please explain why this check is needed?
