Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB80AC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Nov 2022 22:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbiKVWKG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Nov 2022 17:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbiKVWKF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Nov 2022 17:10:05 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5565FDFEB
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 14:10:04 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C3D675C020A;
        Tue, 22 Nov 2022 17:10:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 17:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1669155003; x=1669241403; bh=+1pSwNGi5w
        6RwGfgfKw3DWnoyiMQ+n+aRYEUUvuT/2s=; b=eUtbdRKo/ytCVIQF3qs327cwhN
        1WjnKUbg7LtgJDYRGamPjAp2nenex6m5P58aFcAwhj9sVAaB0mWC0lBMWjWIG0of
        iim+BYpNC2ToglByY6pwOFdk49aXlMzlJA+uTM004YoxV7XHbWVMe1oQ6l+iVIVb
        IZhfBg7dnPH4R5j5Dwm3HfSvv31KtIw6cxJ9uozm396Ogd9NG7j/pmlapRgkLN5X
        SD0LpK3i9eXzVHESPZNE+WDLqdqZ2oBBpz+VyPTbw1szDfTUqoc1VOvDqW5LRlxO
        Yj7iX9mQqo8sc21eq6IDds7z6W/6meSMgUfev6JXwKFb4jg2dppgL5XBk9JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669155003; x=1669241403; bh=+1pSwNGi5w6RwGfgfKw3DWnoyiMQ
        +n+aRYEUUvuT/2s=; b=IlzZSdzhAFTq5eS9A733NnQC3oZf1kOAfR/gQhgkMHCM
        Mp1KHtFoqAu7s8E/gpp4cJTP0jDoieVuja53zH8i3OEBtLVCDdwjuJCZsFMFUk1g
        AB64YYtZimtThB+v0WoXZ2/k/AULqZa+TgZDpIJU1mjJBH6GosReuE2tJ/2ZsSlj
        VvD8Xnvovg1ejz75V20pR1BNMW6xh9OvR1w5NVE+sdAWMMq/Vt0SkCH3tGz8fWoM
        Q+Ma+m+gCBqnXfIN386+SDVBUYvQdCQTsHYTBZaENd4qNsp/xaPTp6pdlp2mAuA4
        jYyzNGoIZi62Jq1O8BD75Cv80+Yz/hfcbIrzrgEJAQ==
X-ME-Sender: <xms:u0h9Y_r3fKberml-T0osjf9SCv0kGd596qHOBf-8LVKd-1UKvNZzIw>
    <xme:u0h9Y5pNbti6jvS3O8oT0dXY7ouHklhAYjDr5d6zSqcJDYo_y4jrqQRYBVu8XnxXB
    M8HqKsjup1FkJIfRA4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:u0h9Y8O-B07npFyQFFRvw0QqjJ9NhOnGboYGWLZ72Eq6fZewHgzXpA>
    <xmx:u0h9Yy7XVmnsErnZl4MEZRFFNs0XK2bfJbo4Xc0755Wy9B8NQubvEA>
    <xmx:u0h9Y-62-F27KaAouC2ky9nZWojxpD0dfUVLIYMYWmTWkfdQO9uG1g>
    <xmx:u0h9Y0mGPqyvZQbrCTz3-mWSatfx0dY1oyQ6n-gBU3TNqmFwvwGOHg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A1915B60086; Tue, 22 Nov 2022 17:10:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <4994fbb1-72d2-4d21-bfb9-c1eefd9815fe@app.fastmail.com>
In-Reply-To: <20221121171239.2041835-7-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-7-thierry.reding@gmail.com>
Date:   Tue, 22 Nov 2022 23:09:43 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Thierry Reding" <thierry.reding@gmail.com>, arm@kernel.org,
        soc@kernel.org
Cc:     "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 7/7] arm64: tegra: Device tree changes for v6.2-rc1
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
>
> Jon Hunter (6):
>       arm64: tegra: Update console for Jetson Xavier and Orin

While this change is clearly correct, I think it would be even
better to completely drop the chosen/bootargs property completely
here. The bootargs are meant to come from the bootloader anyway,
and the console= argument is already implicitly set through the
chosen/stdout-path property.

      Arnd
