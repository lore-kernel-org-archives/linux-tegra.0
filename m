Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C8C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 19:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E64D764E41
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 19:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhCOTHi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhCOTHO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 15:07:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B7EC06174A;
        Mon, 15 Mar 2021 12:07:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x4so51889237lfu.7;
        Mon, 15 Mar 2021 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xsFFCIyjjCBLlr6/kBgfTXRD6Bn3TD7vxXln3l8CVcQ=;
        b=fDGwln/YTfSURcV/aXRx6x29A9JqqK05F3Vdgy7UrCF/YH8kZckPhBuHM7PdDK1lec
         QmVgndOxSByzGW3elmk9BZu8ncispWco/9QtIu5Y99mqFU5nA0R8YnhAcxNiOx2mVelk
         EFM9dsrplt9ByNEbNtQaKB9kRL9vs2RWr9wncXgl//yIN+nPSwu6jV58nz4jwIJIoqTy
         4FDaZ0q586oCHZU1xnAqOrm9H9Bo85XiVFVazDQ2r2r1D/EKThNas0WjsQx4sljOiZQH
         fT020bfhVGYC/LtmHNiqFmInW0KU8qMmazA7bTk7P/k8+M/EF9EmI2cuWqdcXTz5eFlr
         b0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xsFFCIyjjCBLlr6/kBgfTXRD6Bn3TD7vxXln3l8CVcQ=;
        b=EQJUffj+VfWvc4hQPj76YPXU+ntOq0wRuZ8HokZ4rjiZeHoDTBPQz6u9xtI6h9n4QL
         KO24L6X2HCy/rQbnNokeGN6k7iwwR6tTTnZ8WpOOZ02PYW4KNxj5V7CRpksmzFdkXzHV
         +qPse3bkxsXXfwgvlzWWlYDtNGjSFpzXJQru1GsHjR4Vfqy84rBGpQXqunETeOULWgkK
         HISNBSF3MhDEDSDmM8ffMHcNhSdw8lJ1F9n8SytEEDZIULIuHdNAQeHylWWHu1OHhRxW
         1xxl66OdsXR5x7a8ddFCVzBkFyhkW233o6jwanMHOLG4QE1HaLjw3apWFrHnk02gu04N
         G4/A==
X-Gm-Message-State: AOAM533TKe8yzL44LMyoyUjdL1MiQOT3iieA+iDgfHYUpcvekuGUBN/D
        y+MvfG+s8FQeq9MtTf2OELqz5/RrMMk=
X-Google-Smtp-Source: ABdhPJzh8OG03R8LFHK+Dhi6+n3HkZmtUuPJOJvkb2HhD60gazlMLhqPnStaMxEQXKQBnW2PTE/Msw==
X-Received: by 2002:a19:b47:: with SMTP id 68mr8368793lfl.343.1615835232287;
        Mon, 15 Mar 2021 12:07:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id q14sm2984362ljj.132.2021.03.15.12.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 12:07:11 -0700 (PDT)
Subject: Re: [PATCH v4 7/7] dt-bindings: clock: tegra: Convert to schema
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210312163632.8861-1-digetx@gmail.com>
 <20210312163632.8861-8-digetx@gmail.com>
 <20210315155310.GA926230@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3aae4fb3-6b45-24ea-df2d-63746ec2afda@gmail.com>
Date:   Mon, 15 Mar 2021 22:07:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315155310.GA926230@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.03.2021 18:53, Rob Herring пишет:
> On Fri, Mar 12, 2021 at 07:36:32PM +0300, Dmitry Osipenko wrote:
>> Convert NVIDIA Tegra clock bindings to schema.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/clock/nvidia,tegra-car.yaml      | 118 ++++++++++++++++++
>>  .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
>>  .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
> 
> Seems like this one is a bit different and should remain a separate 
> binding?

The T124 binding has optional EMC (external memory controller) clocks
that aren't used by other SoCs. The T124 also shouldn't need these
clocks, but that's how the binding happened to be defined historically.
Since the optional properties have no effect on a non-T124 SoCs, I
thought that it should be better to unify all the bindings, rather than
partially duplicate them with out any real benefit.
