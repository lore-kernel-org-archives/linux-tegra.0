Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9648DC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642C664ED2
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhCRQjR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 12:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhCRQjC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 12:39:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7B2C06174A;
        Thu, 18 Mar 2021 09:39:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w37so5580603lfu.13;
        Thu, 18 Mar 2021 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jlC+xvbwF3TjADUAdWMR1fs3PQh1M9u7afRbkHJqUqg=;
        b=IjJXRxLMGOZ96zgQBmtTAY2tgasNVxxdpnxD9Zz9n0ZgirgyusN0ru32hHUYPzjfTI
         zDOpdXZt5s/LFs+Jk8zT9Rl0rK+7vav/RF4Lv1MCTZ2fu+Gc4y2kzqzR2N1cQVlSXrZy
         Ob+ydgV0BaF4R4KKwrhyArrLkGcMBVIMlPDE1+VyimOWxtg/0DtnKnDC/fjU/mxSRyj7
         ME51aIfAo5DIZ1z4vno5qyXiO50ssl4C8ggdBnwf7QEbGDcdxYUp19E0sbcAzNveg8fc
         +PDFnfd28VdI5FxisuVYtQ3L6kYJBqkmB7KSYXMAw5nRPTLcq3C2ADacBwmolbjTW492
         hSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jlC+xvbwF3TjADUAdWMR1fs3PQh1M9u7afRbkHJqUqg=;
        b=auIf78jabEHTC9zdgGxn3Qh1ACq+xpT5GF1lFP9PhWl43wkwUAC61fLT5Bazvxsf41
         n2Fw4y9HmRJHYIzRxIIzELFwOiL3L8lN6n0bHQ1Hz69tSP7B13qdNtph5Ap0ciWHM3Ja
         gMo5LYlh6fhVZ3Dog8GF0bKk3+nECjzOzhmX06R0taF2Fc8rncEUWGXbR8E8uBAMTyj/
         IeCNQEhSjhMJrz8g9pvUYBwhi7ooKtIaeMpu6mfg9V1NMTi9XWVxhp4UnCFMiXfYT1oF
         wS++odxEFE3Fl4a7+lWxSyYI5wRuTbeKXSZEoJXQyqc5tEjSpoK0AsgaMdYmbFG1zcvu
         7aTQ==
X-Gm-Message-State: AOAM5331NKXoRxoBriUNs1WQyHsAVRuhr02R4OTQIvU618i9i0leadig
        ztYueugO+kUoof2Xh2+5kBzIDiUYVbM=
X-Google-Smtp-Source: ABdhPJzLu5Cf+RK143s/IRBqBHDVleAIwJ3t27gCooOAXK4W7dLd7bNq4bWFIMtvloAyPVDwTmRjaw==
X-Received: by 2002:ac2:4474:: with SMTP id y20mr6336168lfl.230.1616085540114;
        Thu, 18 Mar 2021 09:39:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id n2sm277352lfu.274.2021.03.18.09.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 09:38:59 -0700 (PDT)
Subject: Re: [PATCH v1] memory: tegra20: Add debug statistics
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210318115556.22792-1-digetx@gmail.com>
 <acdbd1e3-8f38-1ee6-0980-3699df9e4375@canonical.com>
 <26ef74e0-67ff-77c4-1682-8f8261b71463@gmail.com>
 <9a634d0f-b12f-8b4d-8807-56182533fc3b@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c696c57d-7bc3-a089-43a2-c3eec1412895@gmail.com>
Date:   Thu, 18 Mar 2021 19:38:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9a634d0f-b12f-8b4d-8807-56182533fc3b@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.03.2021 19:20, Krzysztof Kozlowski пишет:
> On 18/03/2021 17:18, Dmitry Osipenko wrote:
>> 18.03.2021 18:23, Krzysztof Kozlowski пишет:
>>
>>>> +
>>>> +	/* collect memory controller utilization percent for each client */
>>>> +	for (i = 0; i < mc->soc->num_clients; i += 2) {
>>>> +		client0 = &mc->soc->clients[i];
>>>> +		client1 = &mc->soc->clients[i + 1];
>>>> +
>>>> +		if (i + 1 == mc->soc->num_clients)
>>>> +			client1 = NULL;
>>>> +
>>>> +		tegra20_mc_stat_events(mc, client0, client1,
>>>> +				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
>>>> +				       MC_STAT_CONTROL_PRI_EVENT_HP,
>>>> +				       MC_STAT_CONTROL_EVENT_QUALIFIED,
>>>> +				       &stats[i + 0].events,
>>>> +				       &stats[i + 1].events);
>>>> +	}
>>>> +
>>>> +	/* collect more info from active clients */
>>>> +	for (i = 0; i < mc->soc->num_clients; i++) {
>>>> +		clientb = mc->soc->num_clients;
>>>> +
>>>> +		for (client0 = NULL; i < mc->soc->num_clients; i++) {
>>>> +			if (stats[i].events) {
>>>> +				client0 = &mc->soc->clients[i];
>>>> +				clienta = i++;
>>>> +				break;
>>>> +			}
>>>> +		}
>>>
>>> Could all clients have 0 events ending with "clienta" being undefined?
>>> "client0" would be non-NULL because of loop before.
>>
>> As per 6.8.5.3 of C99 standard, the declaration of a for-loop "is
>> reached in the order of execution before the first evaluation of the
>> controlling expression".
>>
>> http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
>>
>>>> +
>>>> +		for (client1 = NULL; i < mc->soc->num_clients; i++) {
>>>> +			if (stats[i].events) {
>>>> +				client1 = &mc->soc->clients[i];
>>>> +				clientb = i;
>>>> +				break;
>>>> +			}
>>>> +		}
>>>> +
>>>> +		if (!client0 && !client1)
>>>> +			break;
>>
>> this means that both client0 and client1 are set t0 NULL here if all
>> clients have 0 events.
>>
> 
> Yes, you're right. I missed the assignment client0=NULL in the for().

Good, thank you for the review! I'll prepare v2.
