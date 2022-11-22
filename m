Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFE1C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Nov 2022 21:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbiKVV0O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Nov 2022 16:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbiKVV0N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Nov 2022 16:26:13 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30EFB7E8D
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 13:26:12 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C9ED25C024A;
        Tue, 22 Nov 2022 16:26:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 16:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1669152371; x=1669238771; bh=Y27o7ls/C/
        POGETtDqQFm890m4+vtj7zdLi7EVu9jcc=; b=nXWhpH2axb0EAXOPgeXt1eO8K/
        hF+KlM/8k6hkrQVXJnIZzpYEQ1BYExtasiNnFokKrFsWdXogy9044caAdnCSHQtB
        0/efOyrgkvURaYXE1tnvloIZzfodFnxhmbf1jtB//V+/fViLhtgtpmMx9Xks+atb
        aAx3bY7Ns8fNjZr5w5rzgQLY1+X6wIXSqSDOF6XwUTq2InaIZjsUXcaeufz1DkVW
        kvnsQ67+MMg0Qip9tFcoevcKiqaDFjnhdPmgVmbIwO4k/Zp6fbkWsjROWmGNMrvP
        eBytA0VfmJ0HufmEQOHeYXiZqn38ci9LZpO+h1Sz3+VmtWcY2QQz679BpHCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669152371; x=1669238771; bh=Y27o7ls/C/POGETtDqQFm890m4+v
        tj7zdLi7EVu9jcc=; b=hfkljb+uUGSlF1DuSLk7BpQPCuKOuyBekbgVZk6EfWnT
        r8xwv5UOF7lunw8csM7wbXUwCamX1kkzhG21qyZ8ZI69u7CDsUjtNt6005eQSWWU
        jWrug8WSbKvClTvqgXCBuHm7SusbuCnegoVZ1J9cJT5tRMrV5qsdRdGA6OtNTwsf
        1eXnvDxyeY62Bk3XCRrXkNXZNQHf5dC6+oVytkD1S9pvy14u/7Bz61xs8rC9Sm92
        yiH9RnjHmxu2WHOLoN7wKgx6P7FP+/IQ37p8DnPyVeYfw/wXwCVHF7YkBEgdUH5v
        9Dfe4NBGtrZhd5+QqSAxqa5rVRsRGTwgMjVeCEBtbg==
X-ME-Sender: <xms:cz59Y7ZoLmh2-9fdRph74umAkS22svvvRLZz_MY_0SXI5H1JtSXz0A>
    <xme:cz59Y6Y1lLHOdOQ86MFqCDB5PkWwMTH4XFjDhwIjwO4UWxWcO4v1acTKA9MZc2UZV
    YKna3FHmnvwKeprQys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cz59Y99TtiTOXFP-klL7tj1GtufKenxWT07hSsCB6gXIkWtgW-b_nw>
    <xmx:cz59Yxp8c2nhAU7K3-OzDKRG64kAac4g6vW67mgfs4D4WfM8r4ixNg>
    <xmx:cz59Y2r35tcTopMfzsymO-iG1ZBeaA45z5ys52kfEp2poiaADhUcgQ>
    <xmx:cz59Y5WwqWtlW8Z9vQ2h9twTwD738jcLzRI04EpWv2hqU8UcDftbzA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 03420B60086; Tue, 22 Nov 2022 16:26:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <374ae4ef-2f57-4737-95af-b1bdfdb03740@app.fastmail.com>
In-Reply-To: <20221121171239.2041835-2-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-2-thierry.reding@gmail.com>
Date:   Tue, 22 Nov 2022 22:25:50 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Thierry Reding" <thierry.reding@gmail.com>, arm@kernel.org,
        soc@kernel.org
Cc:     "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
>       firmware: tegra: bpmp: Do not support big-endian

I pulled the branch, but I think this patch is inconsistent with
our normal approach: Since all ARMv7 and ARMv8 processors can
run with both big-endian and little-endian kernels, we normally
try to keep drivers portable between both ways, even though we
don't expect anyone to actually want a big-endian kernel any
more. Changing portable code to nonportable code doesn't seem
helpful here.

On the other hand, there are already examples of important
drivers that are fundamentally incompatible with big-endian
mode, notably drivers/efi/, which is required on a lot of
machines.

You don't have to revert this patch, but it would be helpful
to mark code that is explicitly unportable with a 'depends
on !CPU_BIG_ENDIAN' line in Kconfig. If you agree, I can
add that.

Do you know of other tegra drivers that only work on
little-endian?

      Arnd
