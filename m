Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D1FC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB0C20759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srdnNQg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgI3GKm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3GKm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:10:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2687C061755;
        Tue, 29 Sep 2020 23:10:41 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so546187lja.7;
        Tue, 29 Sep 2020 23:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tF1+/MycUx+KyCDTvsvj5n8w93b7S9PxVTTODrbJLlQ=;
        b=srdnNQg2feKgQJzm9RAwg47hsQoXa0Hg/Q3ues2KB66TP8x8y/5A3LJCtSuayucJbD
         VBaWOcAD68TRSQvWDlG605UftlLRtya4qHG2obIaz64msOSgSGsbGnoKlqxgjeDctpaN
         G0+e+LmR1IeSvoLVsE+68lLoYFw97769Mb+ZSLkToZ6kD5FM4TRt/jpe0S5J2cLHs8P8
         U7s1lXwu01mPPV7GlfREG12eBepSCdePirmn9d1LqlcJQ08CebrEpsNtM/DC/Q2oK/7R
         vPhUVkrrfuPYfFGKMHLZEzOre3MnxfNiiw6KXOIamClZZZz6z1DOw87Mgm8yhmlVTmpr
         4UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tF1+/MycUx+KyCDTvsvj5n8w93b7S9PxVTTODrbJLlQ=;
        b=HAjHy8Nm48zBdGtTJahMlDeSi5lfI+O64LafJA5B8ggHd69q0F+OSKRmi0Aadsgfls
         qBJYR1M83UXwLKl0XgC8Lx1NGQdpJ2Fc7e1GbZ4wpeOy6uAcPvSQOTLoftVXihqS7GVL
         hDcbO9Gcwmz9WiZ3Ydi7jDMJNix45kKQt0J6/4jqAtEehugwUbWy3y3tZaOzeBgcT3Ld
         8xUn/UQeJ/wSlBNzWdbUb0H2hiQiJs1uxyVBqahqu/ckQ0UtizVZ4DZ7Uhd+JNZrQKMC
         ix5tb8W+2JDg9CXJa2YP3LPu8QkOYsLik8w2XombpsKj4+QiHtkJ2TW183wtF5cevBOj
         qbdA==
X-Gm-Message-State: AOAM533c3Jj/pcXlvhwKENoiWk5myaDA2I8UfpSeWsd8CeGlHPoueQmP
        SuAJlg5WKQa3Bzj+PvlYC0H2MjPMGfk=
X-Google-Smtp-Source: ABdhPJwQtAdUuITXXpykkxgwWFhu2CUYJjNGKst4ciCzx9dSlJJoZPdAALZZNafTQuN9U8PB3hKmcA==
X-Received: by 2002:a05:651c:227:: with SMTP id z7mr352115ljn.99.1601446239924;
        Tue, 29 Sep 2020 23:10:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t13sm61057ljc.70.2020.09.29.23.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 23:10:39 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
 <20200930054900.GG31821@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b74f96cf-0edc-c7f2-3a0e-2a4fe51e3b2e@gmail.com>
Date:   Wed, 30 Sep 2020 09:10:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930054900.GG31821@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:49, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 08:11:52AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 03:30, Nicolin Chen пишет:
>>> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
>>> +	if (IS_ERR_OR_NULL(mc))
>>
>> tegra_get_memory_controller() doesn't return NULL.
> 
> Well, I don't want to assume that it'd do that forever, and the
> NULL check of IS_ERR_OR_NULL is marked "unlikely" so it doesn't
> hurt to have.
> 

I don't see any reasons why it won't do that forever.

Secondly, public function can't be changed randomly without updating all
the callers.

Hence there is no need to handle cases that can't ever happen and it
hurts readability of the code + original error code is missed.
