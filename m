Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E41C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 16:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 283FD22CAD
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 16:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406377AbhALQXC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 11:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406371AbhALQXB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 11:23:01 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578C2C061575;
        Tue, 12 Jan 2021 08:22:21 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id f17so3428341ljg.12;
        Tue, 12 Jan 2021 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rM6mWr7O8Oy7IkGQjWrrd4PjuMu2KQXpKSzChL6UR30=;
        b=rpICpfc8idHvAZrSqf38wOEk86Ckf2Bkn7ZC3hWhbbTL+b0erAeVQAfloEg+OaSqIL
         3egNeTKy22Ouq57RH1cvILPk+yDDCEh1aEWT9x4SH7g8cJRDdqcZx8LWfxrfMu5AfchJ
         EZ50iSPzDkQ1oGYez3VAzui3iNNUNo6/XVSh+XWGoL4NDpAiFpVnbLR41eL6JJi6j0ey
         SO61lItgbbgi3GCLA6ztO2C5MWubSDGmMGKTln5l9rU8txd9DrLx09RkkTxcd7gv4qx3
         iN7lRMe+l6ThgzN72cOngDKrLwep8ns7SACTSXndmWr68FYb05gUgxqmuUEV5vRDsdYr
         DvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rM6mWr7O8Oy7IkGQjWrrd4PjuMu2KQXpKSzChL6UR30=;
        b=O1nNGwXBLgnZMxL4c17Zrbimi88dUwnGuZE6Wq6K78ymJC9cEdaIhaBK7VDduxEvTW
         d9V1M0ZBXAaDzkb4FHn9TjUhWJJdxyA/YDfgI5QO5ffEd97GomJiNo9iOwSOarxcoJwq
         XNe1GN+AEECWe8TuLc0QThKMWZ/8Zinkdi00BTZVmbR7f9+zEbqg2yos1fXCxBtoR0Az
         iJUCrXqS90FLUIU6Vu48Z8dTmUDrMvAS5s4sYxWIoGbv6yFqR6nNCbD5gxfUQQbwpXa0
         qNKIbaszo7zNAg0R1x/FGpjpjR4WUEriGuJxXacLJRdw6aHAsqZuiV27bQCKiyyBQJ0K
         b2Ig==
X-Gm-Message-State: AOAM5320SSlDCIw7bHERqsWX+NAsO5AdLyONUZdPXkXI0itxZFNYYjLQ
        Eqfen7RhVqBy/6jgdsvE+3R/KZ8vo7Q=
X-Google-Smtp-Source: ABdhPJwneL5K+pX0tKSeFXjPAd0OZQx8RPVxV4z6EID5cTmW6WaHsuRYg0wdaoRPQ00wgyo2w/b/oA==
X-Received: by 2002:a2e:7806:: with SMTP id t6mr31408ljc.298.1610468539622;
        Tue, 12 Jan 2021 08:22:19 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id n10sm403211lji.99.2021.01.12.08.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 08:22:18 -0800 (PST)
Subject: Re: [PATCH v2 29/48] soc/tegra: pmc: Link domains to the parent Core
 domain
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-30-digetx@gmail.com>
 <CAPDyKFrj-8WwK1U7KJaCiWkt2bsohgoEnqhQ4sgwjZzZfX2iMA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9feb43dc-1303-4207-6bc9-a3202696acd2@gmail.com>
Date:   Tue, 12 Jan 2021 19:22:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrj-8WwK1U7KJaCiWkt2bsohgoEnqhQ4sgwjZzZfX2iMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.01.2021 16:30, Ulf Hansson пишет:
> - trimmed cc-list
> 
> On Thu, 17 Dec 2020 at 19:07, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The Core domain is a parent of PMC power domains, hence PMC domains
>> should be set up as a sub-domains of the parent (Core) domain if
>> "power-domains" phandle presents in a device-tree node of PMC domain.
>>
>> This allows to propagate GENPD performance changes to the parent Core
>> domain if performance change is applied to PMC domain.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 4f96dc7745c4..1a659d1c06d7 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -1236,6 +1236,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>>  static int tegra_powergate_init(struct tegra_pmc *pmc,
>>                                 struct device_node *parent)
>>  {
>> +       struct of_phandle_args child_args, parent_args;
>>         struct device_node *np, *child;
>>         int err = 0;
>>
>> @@ -1249,6 +1250,24 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
>>                         of_node_put(child);
>>                         break;
>>                 }
>> +
>> +               if (of_parse_phandle_with_args(child, "power-domains",
>> +                                              "#power-domain-cells",
>> +                                              0, &parent_args))
>> +                       continue;
>> +
>> +               child_args.np = child;
>> +               child_args.args_count = 0;
>> +
>> +               err = of_genpd_add_subdomain(&parent_args, &child_args);
>> +               of_node_put(parent_args.np);
>> +               if (err) {
>> +                       if (err == -ENOENT)
>> +                               err = -EPROBE_DEFER;
> 
> Okay. So this special error treatment is needed because
> of_genpd_add_subdomain may return -ENOENT, in case the providers for
> the parent-domain and child-domain haven't been registered yet.
> 
> I suggest we move this into of_genpd_add_subdomain() instead, thus
> letting it return -EPROBE_DEFER when there are parent/child nodes
> specified in DT, but the providers are lacking.

Alright
