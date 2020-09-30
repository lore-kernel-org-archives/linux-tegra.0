Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0687C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D09206FC
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ2qFS69"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3FMO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3FMN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:12:13 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7124AC061755;
        Tue, 29 Sep 2020 22:12:13 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w11so577782lfn.2;
        Tue, 29 Sep 2020 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WnFP8lnfHJgOPmmswyB1oqxtTdFe5yGHV9kG5nGP1I4=;
        b=bZ2qFS69/vWFPYql8daXf4N+6wro+5xZYyVsqEffhxC47wWH+8i0zGZyc6e8bskZU+
         rOgj+WMdVjB3jb61M29438T3GD2zcBc2MY6mxg3XHjD/wuJYOVpl5N6fUyY6SLGJoNW3
         fYhyhcNWCV+QEXo5mQWxgI/0lp8PI2g3dLcHy20/UEQP7zVVoYlr9k4+ipbFxlViJesF
         c1khISIBWAqPPQQDzhe6Ka4eGmvSclZQFK4wHHEGdk+MAlg/FSmoDJiRVJHseZRi7iS9
         OFcH+2YCmYZKJD1pMMeyfMK+CFNJs+wYm1raLJXbxLxwJ7KkCU4umuodpn9eYCymeNe2
         eefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnFP8lnfHJgOPmmswyB1oqxtTdFe5yGHV9kG5nGP1I4=;
        b=VJPSxtEq4aqId1RGk2trPbCRZys7PSyFU2qGnUJxSpu4D0DhBOPG0o03+NqhmZP8Jo
         fYoyNOFNL4Y6kOMda6aN4EC6hBV5V7L6ftSKeyfVzQIuTctK4vL9IVM4P0efouKtc1SR
         NrELPPjaEBBeztZba5iAyeAoCR8qRdnU5EsMsGxg0V42cy3riwBlFKOLTLkSrt5L/pCW
         B4KPWAsuZBlSipO2+nsEo4Bd1KvUKmbFqVUDpHwo11pV/toVYvbmbWx/8hYooskJ6Y9F
         gYPhAqzeVCtl9AO/glMbj6vh6wioAqhRkw+erNYXrFxSQPv2Jozdp5fpTQl5PEBdmTGT
         wDRA==
X-Gm-Message-State: AOAM533hBxCJ2P5cLAEfthOsta5Jyj76ikWa6f8MmsiRQsLClyCe8cCW
        X8cmpsUJ5OMlpb4m7LQqfy8leZ9xKSQ=
X-Google-Smtp-Source: ABdhPJwj3hG5D4s4X9cvpm66sPqDZ0OHtsu9PITFwy9p2nU9IKOvdUk/0r+Ie5zIY3pz0VFv8jfcKw==
X-Received: by 2002:a19:e54:: with SMTP id 81mr280338lfo.178.1601442731681;
        Tue, 29 Sep 2020 22:12:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n8sm49566lji.1.2020.09.29.22.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:12:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
Date:   Wed, 30 Sep 2020 08:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 03:30, Nicolin Chen пишет:
...
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> +struct tegra_mc *tegra_get_memory_controller(void);
>  
>  #endif /* __SOC_TEGRA_MC_H__ */
> 

This will conflict with the tegra20-devfreq driver, you should change it
as well.
