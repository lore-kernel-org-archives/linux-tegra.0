Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76945C47420
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EC0621707
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="hroJCYAi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731661AbgJAJ0c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 05:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAJ0c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 05:26:32 -0400
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Oct 2020 02:26:32 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFB3C0613D0;
        Thu,  1 Oct 2020 02:26:32 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id DEF2E5C02DF;
        Thu,  1 Oct 2020 11:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1601544082;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJK2/g5MDYjG3Sxi9BcFtEIq5rC8/bqmlZd0eKbR634=;
        b=hroJCYAiStf8dHR+l235HZ4Q/wXFIt0RGC0QrXUjZM6vMQtcSlNWvSatOm5CqbWHVcLPoz
        sH1xFsuRN5uEi9y63ljnone2N3VCyU4jkQPNXCZi1jc8KbD9y4vMkSNaJeXum7vJWBhwlv
        xqJ3IorFVg1q/EFjnE8eC2J2ylTrBrk=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date:   Thu, 01 Oct 2020 11:21:22 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Jann Horn <jannh@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lucas Stach <dev@lynxeye.de>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
In-Reply-To: <20201001101206.6e4beea7@xps13>
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
 <20200930213634.GA12855@embeddedor>
 <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
 <20201001101206.6e4beea7@xps13>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <22e3b020f4c7e7a8cd0c1f474ba07cad@agner.ch>
X-Sender: stefan@agner.ch
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-01 10:12, Miquel Raynal wrote:
> Hi Jann,
> 
> Jann Horn <jannh@google.com> wrote on Thu, 1 Oct 2020 00:32:24 +0200:
> 
>> On Wed, Sep 30, 2020 at 11:30 PM Gustavo A. R. Silva
>> <gustavoars@kernel.org> wrote:
>> > On Wed, Sep 30, 2020 at 11:10:43PM +0200, Jann Horn wrote:
>> > > On Wed, Sep 30, 2020 at 11:02 PM Gustavo A. R. Silva
>> > > <gustavoars@kernel.org> wrote:
>> > > > There is a regular need in the kernel to provide a way to declare having
>> > > > a dynamically sized set of trailing elements in a structure. Kernel code
>> > > > should always use “flexible array members”[1] for these cases. The older
>> > > > style of one-element or zero-length arrays should no longer be used[2].
>> > >
>> > > But this is not such a case, right? Isn't this a true fixed-size
>> > > array? It sounds like you're just changing it because it
>> > > pattern-matched on "array of length 1 at the end of a struct".
>> >
>> > Yeah; I should have changed that 'dynamically' part of the text above
>> > a bit. However, as I commented in the text below, in the case that more
>> > CS IDs are needed (let's wait for the maintainers to comment on this...)
>> > in the future, this change makes the code more maintainable, as for
>> > the allocation part, the developer would only have to update the CS_N
>> > macro to the number of CS IDs that are needed.
>>
>> But in that case, shouldn't you change it to "int cs[CS_N]" and get
>> rid of the struct_size() stuff?
> 
> I do agree with Jann, I think it's best to consider this a fixed-size
> array for now. If we ever want to extend the number of supported CS,
> there is much more rework involved anyway.

I agree, too, just assume this is a fixed-size array of 1 element.

In fact, I am not aware of a design which needs multiple chip selects.

--
Stefan
