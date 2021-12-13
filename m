Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4309CC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238429AbhLMQeh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbhLMQeh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:34:37 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D59C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:34:36 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id p8so24531068ljo.5
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=luC+x/6EXzmMuMww9uroHARbjHXLUZxBpMcmzEaA90s=;
        b=eotYThJRcw70Ivk2kWFtAMS2Rpis3/I8vnfTqMuawly3kLhxuBX/hxzOcDFhw/7c2v
         LuHxCjrViq+V+JPfeQ0xIGGcg1xLb+qtQrfzFrmLbc59fQqsVOPjmQcnGalNeGm2gwjX
         enLuxRlQXANyxoCc6ibHddN63WrhK8bE0TcQabJFznhKDAMXT5d6YKRb2y83YZEbefDD
         5veRwNYr1pd2IJvFdeLVctJ3l+JmtEZ1tM1SM1TTqB/uamW31BY92VhJefMw5fZkWXr8
         BxMoLKzIfe+OWccTzVYKRO5BrVO8wz/AbK9jGNpnzuZm8q9pkMQtJ+i5/B3sD9Wboj5g
         /EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=luC+x/6EXzmMuMww9uroHARbjHXLUZxBpMcmzEaA90s=;
        b=N4EhuGPb2ZwgHjG8nH3xFjLUzyDbudXfGe8TiBQL/e8J+o48xzN5f5p2tsIMrQzMkX
         jtBX1YnublAtoH9QEQgoNThkt0z2U9kpbEoLhjjSnnX+ZgtObRGn/wRD6BeIsbsxoFkA
         PRVjfXQSUso2cFRKo2r50EltN++oHg72D22bYqsvfJiMY0sL1JAXXQW0lcx0lqI55NkK
         G/QNUc/MhCDs+Hx4YtVAD2R+P1qo4eVQ5l9Px4JHArP2xM+8OGV5xSWG5F4RyvYMndLc
         Yeh1xjfdpzoAVe/h2lAEVe6f7CwCaTxa8zrSpR7FtPlU5e4wYOCv5+FBI+4dkuhi15yH
         FD3Q==
X-Gm-Message-State: AOAM533zUcQD/iyMKyzU9wEJ/so9ETW6I0lCr+DK+zdw7CmGan4smOLh
        L2zvcCDvcp7l338j4GLHZv0p5Ydz1fk=
X-Google-Smtp-Source: ABdhPJxtQwp5cVYjoQXJoxFNkZIByqllnc8AAJorBCTk/SNOLJjm0DvX8+5ZkHqpd6ZV6JrwLwP4aA==
X-Received: by 2002:a05:651c:2102:: with SMTP id a2mr31036964ljq.323.1639413274774;
        Mon, 13 Dec 2021 08:34:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id x5sm1474328ljm.101.2021.12.13.08.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:34:34 -0800 (PST)
Subject: Re: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-23-thierry.reding@gmail.com>
 <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com> <YbNrxsv6Gd9jvx7l@orome>
 <8bb98f01-5cd6-ec17-fdfe-13557d79d590@gmail.com> <Ybdwkul6RrmLvXND@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3de09c3e-394b-f6fb-dc92-420b62c223c4@gmail.com>
Date:   Mon, 13 Dec 2021 19:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybdwkul6RrmLvXND@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:10, Thierry Reding пишет:
>> My point is that you're ignoring the existing patches. It may not look
>> like a big problem to you since you can apply patches directly and I
>> understand that own patches are always the most important ones, but this
>> is a problem for everyone around you.
> I wish my own patches were always the important ones. If you care you
> can take a look at how many of my own patches actually make it upstream
> each release. My patch stack regularly grows beyond a couple of hundred
> because I don't always prioritize my own work.

I've no doubts that you're doing huge amounts of work. But it's is easy
to push a hundred of own patches when you have direct commit access and
don't need to wait for anyone else to merge your patches, don't you agree?

Can't imagine how many patches I could push if I had commit access :)
There are more than 400 patches in my upstream queue now an it only grows.
