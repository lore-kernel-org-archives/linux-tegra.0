Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1B4C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DABA720BED
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1bd/TxP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgIJWJu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 18:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJWJo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 18:09:44 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F44C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:09:44 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so4418845lfp.9
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vg6m1Dp8b5XLKvFQ8jfS/reWQnW1RmWz2NuJau7dp7A=;
        b=e1bd/TxP6zwnW0PdTgJTO1Cp3zCufWPLaHx9xD2dWVl6yMqcx1nJWV2+Ou0GmVPrUx
         R7oEfVIo0BrqAnPzIPkwuSrKNYq4hZm/sWQ7kAqFOKTY0We9pD8RqUDDxzukTR3VfMbD
         PE3fPEaMyNNy8S4xxSeyYYdgkQE3rrSy99MxXiOsDRRSnP9hqoeKp4y4T3yGCJhkuZjo
         pY0KK50uRFjfJyh9lm+Cy8pdlHzIq1m8gP6VcbS+ZWEsg3Rwgo+eIi+RWllxsHzbKDpg
         weKZBSX2KzM0jMoFrUbAwlw6Hjad/2+l4XnDYbs5o4F5HEd9JFadZE/UuLQR8MIxkL+T
         //yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vg6m1Dp8b5XLKvFQ8jfS/reWQnW1RmWz2NuJau7dp7A=;
        b=V9YoeA2dzrIpPOWXMjwvHMu9YOAslybn9iS2bdfEjkszSu0kXfgIYdOcLw/H/grIhg
         jej1YVrH08QaoRTE2S1CvLuiSmcFKXKbG2qHBLCropNKq0GNYiDscdSMTj0cfWAK41px
         Z5ToDR06aidA3YaL+magTMFsJy+pfWFVx2exuSu/mUulhy9n7iodw3xWuNvNMrJ65Hu6
         wkhpsGvTEf1bA6Mo92t4jbP1zdCfXdU7mELqGCi5kKaB/hDk3dZMRzV6Tj6n9TQf4sGa
         wNjM0XD7E3GnoNli7lzCNj3BiD0JvfBskLMXPW9lFPUKJLEQOAEJsdzCkWkifO4Cz2XR
         hfRQ==
X-Gm-Message-State: AOAM53254Kd7kpmymhu8IQ6wawbcCqt8Um3MnTxIsazvqTNqMG+RNTtN
        c9ROVbYgipNb5oTrzogi5ik=
X-Google-Smtp-Source: ABdhPJx/4CqhC5R9BvAl9DpGdk1FYGTliLAbf4Pl12nZWA+WI/WZmmrQXjlg+aVC9i1PivjU0QF3Cw==
X-Received: by 2002:a19:42c4:: with SMTP id p187mr5226615lfa.149.1599775782656;
        Thu, 10 Sep 2020 15:09:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h27sm23975lfj.87.2020.09.10.15.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 15:09:42 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
 <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4f01491-55af-73d3-f39f-bd8d2149795e@gmail.com>
Date:   Fri, 11 Sep 2020 01:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:40, Mikko Perttunen пишет:
> On 9/9/20 2:36 AM, Dmitry Osipenko wrote:
>> 05.09.2020 13:34, Mikko Perttunen пишет:
>>> Hi all,
>>>
>>> here's a second revision of the Host1x/TegraDRM UAPI proposal,
>>> hopefully with most issues from v1 resolved, and also with
>>> an implementation. There are still open issues with the
>>> implementation:
>> Could you please clarify the current status of the DMA heaps. Are we
>> still going to use DMA heaps?
>>
> 
> Sorry, should have mentioned the status in the cover letter. I sent an
> email to dri-devel about how DMA heaps should be used -- I believe the
> conclusion was that it's not entirely clear, but dma-bufs should only be
> used for buffers shared between engines. So for the time being, we
> should still implement GEM for intra-TegraDRM buffers. There seems to be
> some planning ongoing to see if the different subsystem allocators can
> be unified (see dma-buf heaps talk from linux plumbers conference), but
> for now we should go for GEM.

Thanks!
