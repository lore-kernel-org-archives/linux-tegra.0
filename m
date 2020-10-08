Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1B6C47095
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 05:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84FF120789
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 05:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMxlxOaK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgJHFFM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 01:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgJHFFM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 01:05:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B22C061755;
        Wed,  7 Oct 2020 22:05:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id p15so4329494ljj.8;
        Wed, 07 Oct 2020 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rusu0oIzTOO8ocbnxz5JOA49UqEDQ44SxR4hoPni0y4=;
        b=DMxlxOaK/nedSuliOtyVH5U0m6WjODloC7rwVN+cLO+FHv+XkmiW9G9++sH9q0Ohoi
         w4juf+0yq0laq2EsMB3B+8dXcqnnEyZJ2ntqeNMUKLsbVsFg/GK+TH3+M8gTjlFO8PQW
         qeomMFcDNrpIHkfH0TjkNSUkysUVg7nBB8PchPPapN8TqS2ksIj8+qsV2M/JVMs/eZyD
         unoYbvp62fB9JAmiXLI0pUqXj9iQRGMm3cVjXFQ1Vz6z03EYONrqX2kzubOjOZjrfZsp
         e6aodZ7mgEKQS0oFwILkPyi1+LA3C68TpuVMpKtUoKfzVW4UzGbgKN6LDb030rIPOGTX
         KMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rusu0oIzTOO8ocbnxz5JOA49UqEDQ44SxR4hoPni0y4=;
        b=P7T6PZX8KA8WxaKLPSJG8bUTVMbxE/XhvTfdBELn3G3RuOAI4v8FfRk5czsRH8d6fR
         2oK0dSGfWrCjuYFNyf9uyVnwb2YYunouT8y+HwIOnh9cRjfum5d8x9zcj142QvcoRNp7
         SAAISMYkJsYlxxIjLzdEmANPoh7Ga9PIZjit4d02MtSgi8cOSi64jMHFVx+o7uPEFNGc
         Sv4DSu5Mg8ea+RBu6YHj/7jH77ejuMSJ1IZHJZHKoOtauAE6+qVTBmIBgwHjuG3izEkh
         L+B0y348xOcSy3B89DtKh5JTn9eyC9YLBkz9MNV/BOz21A2FSoyBJOPHY5PX5D4p2a+H
         SyuA==
X-Gm-Message-State: AOAM532Tlilrwb37c0tEHUiwOB+S/iEC0W2nPZZ5R55gJwZ7duEJxAWt
        4otCGVDPwUXrpk4WeRQfUn0WRNzCTJk=
X-Google-Smtp-Source: ABdhPJwkr1Tk3q7ENrjOstfBgfgOD/7cM8ziJ+xFeGTQyU6DHpUsCVfPO9+F6oo269EdZNlRS5sn+g==
X-Received: by 2002:a2e:b055:: with SMTP id d21mr2672202ljl.429.1602133510711;
        Wed, 07 Oct 2020 22:05:10 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id m19sm716152lji.112.2020.10.07.22.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 22:05:09 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
To:     Stephen Warren <swarren@wwwdotorg.org>, Bob Ham <rah@settrans.net>,
        Stefan Agner <stefan@agner.ch>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Rusak <lorusak@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
 <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net>
 <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
 <f12c1ad2-d180-8981-c3bf-db8ab6afbbaa@wwwdotorg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <293ed420-259c-33da-eda4-3be94ba8d109@gmail.com>
Date:   Thu, 8 Oct 2020 08:05:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f12c1ad2-d180-8981-c3bf-db8ab6afbbaa@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.10.2020 19:08, Stephen Warren пишет:
...
> The facts[1] that Ouya published the code and that it used GPL-only
> symbols certainly does imply that they *should* have published under GPL
> or a compatible license, but doesn't mean that they definitely did. The
> only way to know that for sure is for there to be evidence in the file
> content or git history, such as license headers or Signed-off-by lines.

The code wasn't only published, but also was distributed in a binary
form to end users. This means that even if Ouya Inc. still existed and
they made a mistake by using GPL-only symbols plus GPL-incompatible
license for the driver, then they had to resilience the code. Hence
either way it's okay to use downstream code as a reference for the
upstream driver.

This is my understanding.
