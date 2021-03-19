Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E609C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:49:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3896E61981
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhCSSsj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 14:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhCSSsQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 14:48:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4895DC06174A;
        Fri, 19 Mar 2021 11:48:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b83so11516649lfd.11;
        Fri, 19 Mar 2021 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yYYW5DnVy84/4kP9GQaKkhK/K8GjeKuwEY0DFeSN6Tg=;
        b=JTkd1WijALfGVwHAIoHlFxO8p7v7gsY+v3XsU4ro23Xiuebo+6inwyLeom2X3oieeR
         Rxbht7CJ9Cph507VFPJyZCyfBvXEDvxP4DDgrQupKDDvoY0SXyX7oFdES54kUaFcKOSf
         KMF+M9SMWxPRD87A4nUsCQaoqQMtxMuweDb1qhZCK67kH68m89fjECpPs82IPsD/4q7G
         9A8B++/bytkP118iuQBWU27wQN0BsODSkIDVUnCSqD4X63mwLwopetQrQajalwBSP2Ch
         ve8nkl3nzABqJUBkXLw55WpYmTKsS2+w9zJEMYEBtoFwXxujuI3FxMAujL0UPr9W/q/a
         OrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yYYW5DnVy84/4kP9GQaKkhK/K8GjeKuwEY0DFeSN6Tg=;
        b=IIzsbn1amkzi4xxG6niNcD+OTwijRhg58xQbWXL7E6WVzW5+PXGAaralApIKLZbIm4
         l2Je7Cvq7AJfvxdvzbbGcp8YmcMRzPEdmHKZRE7XKrE9Mc+bcFqPpbdOd2YKRb4Ppk+7
         J0xCexkoasAvBYPnZZbCE8Nx+TfTCdyNmNZWZUOwnM/XLqiCfGp1xh1+l4AXbWfJ9Yd9
         UnCIdAd66wr6LY45HO3Wvn1qJn2dxKkwu/F6dvydGSCp4jVGcnNl3DwHz2bQdGPxHmal
         r/ch2DMuy9SJwFw1B+qmmLzv1ozsizXqUBEoaAKN78W69u+TY+WQRG/WhAQBMIHfGUEi
         oCBA==
X-Gm-Message-State: AOAM533ckLtWSXYNClAhny+UULZ1O/uITPXx4qjn+dcUMIFaw0VL2Do7
        CxYauctRNwipK+Z2/FnIwX6p83wmPIc=
X-Google-Smtp-Source: ABdhPJzfZwvhL9QOMDPUSINsEPmuq4pkpT82W3ZXu8vQCjJ+UoyheGgwRO6vRplbFKl7HgrIFiC7tA==
X-Received: by 2002:ac2:454d:: with SMTP id j13mr1586740lfm.129.1616179692482;
        Fri, 19 Mar 2021 11:48:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id j8sm871890lji.8.2021.03.19.11.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 11:48:12 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Minchan Kim <minchan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com> <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
 <YFTrpN8Qkv6ZY0Ci@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
Date:   Fri, 19 Mar 2021 21:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFTrpN8Qkv6ZY0Ci@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 21:21, Minchan Kim пишет:
> On Fri, Mar 19, 2021 at 08:56:06PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 19:30, Minchan Kim пишет:
>>> +static void cma_kobj_release(struct kobject *kobj)
>>> +{
>>> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
>>> +
>>> +	kfree(cma_kobj);
>>> +}
>>
>> Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.
> 
> Oh, good spot. Let me use kzalloc.
> 

Thinking a bit more about this.. it looks like actually it should be
better to get back to the older variant of cma_stat, but allocate at the
time of CMA initialization, rather than at the time of sysfs
initialization. Then the cma_stat will be decoupled from the cma struct
and cma_stat will be a self-contained object.
