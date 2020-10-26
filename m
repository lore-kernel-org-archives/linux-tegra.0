Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0888C4363A
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 20:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96E0A21D42
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 20:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603743292;
	bh=8KLUIb8OS6YSmjZyYN9hokEpdgO30AV/TW7YIz+gh0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Eyw1VPVisWrcZExTlaZVSqRsbfcGDHkxeXmhMUgQwnEp7QwdS533JChonBMLKB/+I
	 vr0LCDGNXIyVO25xfuV/vH5v68AqXyM22VGbcSzofELfH+gnu2+WWsiXS2rENuMryH
	 fbKvpIB45t7z2SdBCe9WhqeJ5Ct+FMWovw0tTfnk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgJZUOw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 16:14:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33399 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgJZUOw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 16:14:52 -0400
Received: by mail-ed1-f68.google.com with SMTP id w23so10886226edl.0;
        Mon, 26 Oct 2020 13:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8KLUIb8OS6YSmjZyYN9hokEpdgO30AV/TW7YIz+gh0w=;
        b=NkFpjhJITAgp2TIk2nqBl3IOPc/V3uhB3BNZkII+eV0O+K2MVmzcFjE2UzbzWfJYsU
         o+7XhpVuNiKPxPp+rQwZa0eZy6TN3JnciqRXQ52nYUH4JKYlx0T1wA1lP8YGXabr5kAh
         94l0uXuerB3H7bqLJVrCnA+jhwghxEDwpfvBI8rmi6y1hk3APcfmn8MVhC5/oM8GjJfY
         lnLAxzMh/yPJ2mRKjjMP/BHPrm/8IZNoFsS/H7FoWu7spSU+SYL0NYObJ5yjqBALYqCc
         fzfyfoOIAUixMOJde52i56dpiSDZQIk7l6eGHyKumyKRQnNZyKsu9L5dbj7dKg4hPxrB
         yvUg==
X-Gm-Message-State: AOAM530gqqdpKsG5ZA56f7ca5He60Zoyc53reKuusVpKIYS9Wcefogea
        1g8P47sXe9dIqOpI2aL0gwQHXZivynrUlw==
X-Google-Smtp-Source: ABdhPJySsYsaA1BUsVpXj0m96ZkfQ1dsjMZpu/rfj7BJFtxxKNSDPXTQT0zTlyptEnWnUYf0iEMJYw==
X-Received: by 2002:aa7:de97:: with SMTP id j23mr17739492edv.45.1603743289955;
        Mon, 26 Oct 2020 13:14:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id k23sm6593061ejk.0.2020.10.26.13.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:14:48 -0700 (PDT)
Date:   Mon, 26 Oct 2020 21:14:46 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] memory: tegra: Correct la.reg address of seswr
Message-ID: <20201026201446.GA248919@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-2-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07, 2020 at 05:37:42PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, ALLOWANCE_SESWR is located in field
> [23:16] of register at address 0x3e0 with a reset value of 0x80
> at register 0x3e0, while bit-1 of register 0xb98 is for enable
> bit of seswr.

> So this patch fixes it.

Either use the imperative form ("Fix foo bar register address") or just
skip the last sentence as it is quite obvious.

https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L151

Thanks, applied.

Best regards,
Krzysztof

