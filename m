Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D10C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 04:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D92242076E
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 04:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUdKWY6J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgJPEHH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 00:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgJPEHF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 00:07:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D251C0613CF
        for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2020 21:07:04 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so712381pff.6
        for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2020 21:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8vX6ndPTi8E0weS4M30AEHmjjkLUgJeoHZsUqEDqihg=;
        b=dUdKWY6Jhx5+1cfkWmojPdPlr/pmkDTzwPQ+xyqNJObDcOwpuvD+A3cr0W+xkwP/M0
         YgRdYCg64sgcX/z/zh1WhITxU0bWX+5gGSinRooozAeNpb5zC0VNMteclsfIepJq4aoG
         utgGwQ0GWhETE5xvJI2sC6v0ffOwQOXy4T87rUfAgDozbyke6L7owsoTd/JtQ2LM4cZd
         juG05Xa0+MNJgWGp8qCFkYRpUe17UdqYgsDMdW8tszaWZwBbm/Fl1yrAt5DeMtffO++U
         xa995M0boaXZ0+HhiM8rcI8P7JpATbsG4N3ONQgIZCPZDQUiKVXSTjnGC1i9dlxtEfMr
         TeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8vX6ndPTi8E0weS4M30AEHmjjkLUgJeoHZsUqEDqihg=;
        b=mkW0Ez8aDCsRqI+iT7v9YyLHN1gcjUTSt1q+dSZMUR4L/R+tl8K4d4Z3O15oMLVf72
         +tAEah5IN/pghIWe7v8gq+DU17isswGQiCoxeQ9PWKk4jV7dTEXZ4HCWgOXrd3WB+8+e
         Gvih7r2Sj4CEfBn1eXbyoy4XMiABoz1RVemG+hI9H+afxCrkrLur2IzEgbkQR8x1f/mV
         QMeWdyhtkac4DrIqKHgxffvE9/344RnxQG/m0D7X3h/FPEDpM6q4H+7Fqp5PMgI6s9jD
         oRuCeEm360YJbk4n/dPbtdk3fgYdurz57PXqFsGyeO3fjX03icybzmZaFPYVjT/MJoNj
         cjcg==
X-Gm-Message-State: AOAM530aR3ZKclOB+Yh3xouffXrQ/Le/1LxpyAnN6VU1VPxn08NPPKAK
        UyTqUu1Wt7NESGzIs8gSt0ZZzdh51+8VDw==
X-Google-Smtp-Source: ABdhPJyBTTEAFamTg4RJhFEdUUEc/mchclzo4KAppRt1V0Onx7JzwJTpskED/j0U2zGvoBE6O9jPNw==
X-Received: by 2002:aa7:83d9:0:b029:138:b217:f347 with SMTP id j25-20020aa783d90000b0290138b217f347mr1937661pfn.0.1602821223447;
        Thu, 15 Oct 2020 21:07:03 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id e20sm858618pfi.30.2020.10.15.21.07.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 21:07:02 -0700 (PDT)
Date:   Fri, 16 Oct 2020 09:37:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20201016040700.wzfegk7hmabxgpff@vireshk-i7>
References: <20200824145907.331899-1-jonathanh@nvidia.com>
 <20200825055003.qfsuktsv7cyouxei@vireshk-i7>
 <09ac354e-a55b-5300-12ae-3f24c8f8b193@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09ac354e-a55b-5300-12ae-3f24c8f8b193@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15-10-20, 15:03, Jon Hunter wrote:
> If not too late, would you mind dropping this patch for v5.10?

It is already part of Linus's master now.

-- 
viresh
