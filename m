Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA50C43461
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 09:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A772078B
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 09:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="YkNcRn0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgIKJxE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 05:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgIKJxB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 05:53:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC729C061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iOgmppT0qGwZOUSB5AHlfatEojFVOgSi72SRxPTKIUU=; b=YkNcRn0/g+VnGQ/Wmck4Wd/mHv
        KcpmsVuBM0Z8eGelYlb3LJJnYbJRrT76gfnzWZqV9FT2XOhNQJT4fpq0q9xZ3tGvSlYTTpesFW+k7
        xdTgaictL65VL6kg+Iz4O23Zvzw6qtw+M/ehmvS1CvUrBBAmxWeVL+BgOes0J2OJMDU3++3KzHDSH
        keyNQ4f4Catt0f97fjgNotpaEg6VKjbezZvaa5KKAk4xEmqyOfo29DF87AqdE20PE2Az9dLjWUmgL
        qdOJbIvFJBFg1cHM7xRgLhkfJSlp7ZjfYsODZj6yxXjF3kXjXq/4mZBToTlb+GaQXK1joAvvXbMkc
        G9sbCf/g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kGfjj-0000uP-NU; Fri, 11 Sep 2020 12:52:55 +0300
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
 <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
 <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b85af7b8-870a-31e2-2f09-902a84a2afb6@kapsi.fi>
Date:   Fri, 11 Sep 2020 12:52:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/11/20 1:15 AM, Dmitry Osipenko wrote:
> 09.09.2020 11:10, Mikko Perttunen пишет:
>> On 9/9/20 2:45 AM, Dmitry Osipenko wrote:
>>> 05.09.2020 13:34, Mikko Perttunen пишет:
>>> ...
>>>> +/* Submission */
>>>> +
>>>> +/** Patch address of the specified mapping in the submitted gather. */
>>>> +#define DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC        (1<<0)
>>>
>>> Shouldn't the kernel driver be aware about what relocations need to be
>>> patched? Could you please explain the purpose of this flag?
>>>
>>
>> Sure, the kernel knows if it returned the IOVA to the user or not, so we
>> could remove this flag and determine it implicitly. I don't think there
>> is much harm in it though; if we have the flag an application can decide
>> to ignore the iova field and just pass WRITE_RELOC always, and it's not
>> really any extra code on kernel side.
> 
> Sounds like there is no real practical use for this flag other than for
> testing purposes, correct?
> 

Patching depending just on if the MAP IOCTL returned an IOVA or not 
seems a bit "spooky action at a distance"-ish to me, but maybe it's not 
so bad.. I'll consider removing it.

Mikko
