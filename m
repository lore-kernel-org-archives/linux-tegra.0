Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8313CECAAD8
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 16:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbiIWQNf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 12:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbiIWQNb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 12:13:31 -0400
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D2A11DFEC
        for <linux-tegra@vger.kernel.org>; Fri, 23 Sep 2022 09:13:29 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 558252B06DB7;
        Fri, 23 Sep 2022 12:13:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 12:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1663949606; x=1663953206; bh=oX65rBEzuV
        HT2aiySoRuYe3x16EoNfPo/gbgrI0PWbw=; b=d9V+awVWz1vp+7AdloDTbXyYcU
        wVqE1ctnE75usYmfUSy8CD6PF8gHMS8Wt3/hjxfrtr0AvrBC0Py0tJEIeamRohdh
        GJBZmGRjWiQ0SnHs1mR+UXyAbqTn11YjWKjJ+jj1lI6+H+5VPvQU1KQvUCp0hVHd
        8xSjHW5t/4ChQrskxB5wl/jaihpGisP7yxJZZn+47+7/bbaBr+B7naCMNvW6gLeU
        6ZfgZOF8t8Y+TCGrP9U8j7ofduhhhcscJsybo9PfWw3hoJpS9hZqObiqoXTkx9Zi
        +R1ADzLZ79ZEn7quJAEZ9NU96BBnjXJLkfIY8d1g1Licj7mE3re5rbc5zi9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1663949606; x=1663953206; bh=oX65rBEzuVHT2aiySoRuYe3x16Eo
        NfPo/gbgrI0PWbw=; b=dnbTEv+o3sZHFyXEouter0xeZxFw5kdyMW0eMi9IY2+8
        Wdv0A9TsNLjE2BFBL6MJ2vtt0qgtXeiIlwKuXdvQNIOBK5x57TXUtjS8Xp3A4R0g
        4u6cTWZCNjwS5ducyCXeZ2BboSEYC17T6rhFNjSL50q2N1bXFnv3rfjc2iD66EXm
        BuZIJHuDNX8ZCqyXbiQtssE0ykBAsT7PPI56AI/1wWiLkk77k8eek0gM08PAYg4c
        IOus67tZ5+Rqn0vNVw/4KaB2fKsrpWs267/X3BDH7QELZvqQZS2wCWsdwlEHFSFy
        BLdDiGhsBxYCeqefIu/xVTsSlucMSzNsWvdaZt/Eyw==
X-ME-Sender: <xms:JtstY3RRx8Y7e1SbobZPRljEdsqy9gEFAdyy3j8-6ezHTrxewvNuLQ>
    <xme:JtstY4wC8qzxm5D1-1bqO0KcKcSiplvwcQM7Bg_xkcZQr7o86B9lM955AvliwMI4F
    GNOqV_U6gbLmqCrhyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefiedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JtstY801xcmClzRQ2UAAjA2YmY9X61UUcXHja23TzWTwHqCs_WBsfw>
    <xmx:JtstY3CCLbujmYa9LfeOIcDMOUsAJx0aiUPeM_PUiB4bT3jn2ZzSaA>
    <xmx:JtstYwjuFDF6V-_9er0LqTDTegHqDjkcm2EcPR0u1Me0kFNSH2GBsw>
    <xmx:JtstY5vIaOEoPBE4WvBae6GYkLfYkL_l5-T-5amHIyg-M-86JCeuDaOX5S0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 66EB3B60086; Fri, 23 Sep 2022 12:13:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <758904b9-6b46-4e90-a4fd-b919a4dd0e95@www.fastmail.com>
In-Reply-To: <20220916101957.1635854-2-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
 <20220916101957.1635854-2-thierry.reding@gmail.com>
Date:   Fri, 23 Sep 2022 18:13:06 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Thierry Reding" <thierry.reding@gmail.com>, arm@kernel.org,
        soc@kernel.org
Cc:     "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/6] soc/tegra: cbb: Changes for v6.1-rc1
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 16, 2022, at 12:19 PM, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
>
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git 
> tags/tegra-for-6.1-cbb
>
> for you to fetch changes up to 53283105cab6f408968b7546826303ad329e9983:
>
>   soc/tegra: cbb: Add support for Tegra241 (Grace) (2022-09-15 12:41:36 +0200)
>
> I've split this out separately for now because after the discussion
> last release cycle there wasn't quite consensus about where this should
> go. The EDAC maintainers said that they didn't think it'd be a good fit
> so I'm including it again for ARM SoC here, but it being on a separate
> branch it won't block any of the other patches from going in if this is
> still a contentious topic.
>

Thank you for splitting it out. I'm not too happy about having
this driver in drivers/soc, as I still think it deserves to be in
a real subsystem with a generalized user interface.

I had hoped it would fit into EDAC, but I can understand that
this is not a great fit in the end. Since the driver has no
stable (ioctl or sysfs) interface but only a debugfs one that
can change at any time, my hope is that we can come up with
something better in the long run, e.g. when another SoC family
has a similar requirement and we create a more generic and
stable interface.

In the meantime, we can keep it in drivers/soc, so it's now
merged into the arm/drivers branch.

     Arnd
