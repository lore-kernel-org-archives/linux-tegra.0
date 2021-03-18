Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B8C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:21:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AF2864F45
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhCRQVY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 12:21:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44073 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbhCRQUz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 12:20:55 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMvOH-0006Iy-SE
        for linux-tegra@vger.kernel.org; Thu, 18 Mar 2021 16:20:53 +0000
Received: by mail-wr1-f72.google.com with SMTP id n16so19292110wro.1
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 09:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZzHyZiP7q249349QnQTRfCWxuT/vhfc7B4spDMVzQz0=;
        b=TFZtVRQTUTHiy7qijppjWS3MRfvvqe3s4d8qAqMxRaIb0/8voCVgbVroDZ51JccVs1
         b/5ZNsn/M45IDG7KKhsl9VnIAS6RMcvuyavM894+9ovQx7aBKFpt8cL9/iATbvGo1LUc
         o6V/ymHfaRZAbRtMBOZVwrhh/mCNnYPfe/mSZVbpQ6K4kbSYhwLWCGfXqi80KbwvOWPN
         9H5jQ4bHMEheqSloWveusEMA5xEWk5gn0l5QFjAcO9cqKS3JK7iZ5rc6WcAe9ZQC35sE
         QDgkAToPd+rwgrcvEVIuqIBd78r3EVMaAA9S/du6bKg4OPqkdXHcgV4SEaZMQ9ATn4F7
         0qHg==
X-Gm-Message-State: AOAM531Wqz5OHSqkZXLD9mCX9zR0AtmYE9dsvywyQ4RaQgThgE+xBO6P
        KbySHg/jamPYhnOCH88rYewEpJwM2xn+umU/aPlEh1NBiazH7u+atfvTtB4UzQAuD/OXXtH8UKS
        SFQNoVjoVY26xYMLUJoXm6Cjny2r7y8aZROK0K3Jx
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr50265wmq.73.1616084453298;
        Thu, 18 Mar 2021 09:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1DpeLXYiW1I18/I0ZlN0TTxX4pn4vUI/YgGtX9kIOuZ84jxL1Z6siAJbnotuq/VVZh43bsQ==
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr50251wmq.73.1616084453095;
        Thu, 18 Mar 2021 09:20:53 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r26sm2771392wmn.28.2021.03.18.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 09:20:52 -0700 (PDT)
Subject: Re: [PATCH v1] memory: tegra20: Add debug statistics
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210318115556.22792-1-digetx@gmail.com>
 <acdbd1e3-8f38-1ee6-0980-3699df9e4375@canonical.com>
 <26ef74e0-67ff-77c4-1682-8f8261b71463@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9a634d0f-b12f-8b4d-8807-56182533fc3b@canonical.com>
Date:   Thu, 18 Mar 2021 17:20:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <26ef74e0-67ff-77c4-1682-8f8261b71463@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/03/2021 17:18, Dmitry Osipenko wrote:
> 18.03.2021 18:23, Krzysztof Kozlowski пишет:
> 
>>> +
>>> +	/* collect memory controller utilization percent for each client */
>>> +	for (i = 0; i < mc->soc->num_clients; i += 2) {
>>> +		client0 = &mc->soc->clients[i];
>>> +		client1 = &mc->soc->clients[i + 1];
>>> +
>>> +		if (i + 1 == mc->soc->num_clients)
>>> +			client1 = NULL;
>>> +
>>> +		tegra20_mc_stat_events(mc, client0, client1,
>>> +				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
>>> +				       MC_STAT_CONTROL_PRI_EVENT_HP,
>>> +				       MC_STAT_CONTROL_EVENT_QUALIFIED,
>>> +				       &stats[i + 0].events,
>>> +				       &stats[i + 1].events);
>>> +	}
>>> +
>>> +	/* collect more info from active clients */
>>> +	for (i = 0; i < mc->soc->num_clients; i++) {
>>> +		clientb = mc->soc->num_clients;
>>> +
>>> +		for (client0 = NULL; i < mc->soc->num_clients; i++) {
>>> +			if (stats[i].events) {
>>> +				client0 = &mc->soc->clients[i];
>>> +				clienta = i++;
>>> +				break;
>>> +			}
>>> +		}
>>
>> Could all clients have 0 events ending with "clienta" being undefined?
>> "client0" would be non-NULL because of loop before.
> 
> As per 6.8.5.3 of C99 standard, the declaration of a for-loop "is
> reached in the order of execution before the first evaluation of the
> controlling expression".
> 
> http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
> 
>>> +
>>> +		for (client1 = NULL; i < mc->soc->num_clients; i++) {
>>> +			if (stats[i].events) {
>>> +				client1 = &mc->soc->clients[i];
>>> +				clientb = i;
>>> +				break;
>>> +			}
>>> +		}
>>> +
>>> +		if (!client0 && !client1)
>>> +			break;
> 
> this means that both client0 and client1 are set t0 NULL here if all
> clients have 0 events.
> 

Yes, you're right. I missed the assignment client0=NULL in the for().

Best regards,
Krzysztof
