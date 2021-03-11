Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAFAC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 21:35:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79E2464F94
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 21:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCKVe4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 16:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhCKVeW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 16:34:22 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDCDC061574;
        Thu, 11 Mar 2021 13:34:22 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BE3632224F;
        Thu, 11 Mar 2021 22:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615498460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C4zSLxlmqKWF8rF0E50MCvu5Ykg7ipqxtjl4CTHHmzA=;
        b=ZpGo7Mvg7andqY/6j3wcUlI/ZZ36ZFpZxlFQ7qjY7AyvhSjy4Lu5xwF4lK/BQqWYb35nT0
        bFAmPDCx5s/W5oWNNnIYXpJPMm5HbpgX+6vfndyd6XUT4FxjqkjqV7bjgSkhPt/tfDE7XU
        a1Acu4TpejE05Ov5HorT10yEPvOH+64=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 22:34:19 +0100
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     spujar@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210311160052.GF4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <20210311160052.GF4962@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9575973104ff11d4a864a510b5c0a350@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-11 17:00, schrieb Mark Brown:
> On Tue, Mar 09, 2021 at 03:41:56PM +0100, Michael Walle wrote:
>> Hi,
>> 
>> > If "clocks = <&xxx>" is specified from the CPU or Codec component
>> > device node, the clock is not getting enabled. Thus audio playback
>> > or capture fails.
> 
>> This actually breaks sound on my board
>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
> 
> Please, when sending replies format the subject line like normal 
> replies
> with a "Re: " at the start so people can tell it's a reply to an
> existing discussion and not a new patch.

Whoops, must have missed that. I need to figure out a new mail setup,
rather than saving the mbox from lore.kernel.org, editing it and
sending it with git-send-email.

-michael
