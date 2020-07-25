Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD9EC433E1
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:50:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C6820674
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="eEtye1y8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgGYMu7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 08:50:59 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:9952 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgGYMu6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 08:50:58 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BDQsq3DH3z4D;
        Sat, 25 Jul 2020 14:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1595681456; bh=lOrzlYaUy5M9mACsVH7i0G6RcZ9CCXP8CXf0i8hOFi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eEtye1y8BrE5ycM2NcC5NcDjpHnETN6U6d+PeTEF30kF0HLofs8hEM7Ho4Q1qZG50
         RHk05JxX5XLQ5wuGOCy7+KOgfv6P2c7E1qb3XvokNAIayz8zXE+6vS+zyIL3zHGrog
         iYI9yHuacTAKuadM4T6gr7p+ntadxLB9VTfpmKJc5f3i69bXRDTrvf8uRucigeQt6L
         0RLRTDC21Kf4OMv3VH7wAOIgA1FnRbwruR9PIkee2zzVeNLNhD68jSzqm3peqbMisf
         J7xVYZTTiPfsGXMNkgDMUvpTTTftq9h7rq7q35BPWZM0WraeAObSmM17WA1aZtX8cm
         zztyEVWn2KT7A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Sat, 25 Jul 2020 14:50:54 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
Message-ID: <20200725125054.GB18633@qmqm.qmqm.pl>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
 <20200725120146.GB26689@qmqm.qmqm.pl>
 <5597e949-b93c-9133-efdb-9714637f9ebc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5597e949-b93c-9133-efdb-9714637f9ebc@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jul 25, 2020 at 06:01:19PM +0530, Rohit K Bharadwaj wrote:
> On 25/07/20 5:31 pm, Micha³ Miros³aw wrote:
> > On Sat, Jul 25, 2020 at 11:59:39AM +0530, Rohit K Bharadwaj wrote:
> >> changed usage of slave (which is deprecated) to secondary without breaking the driver
> > 
> > The relevant I2C and SMBus standards use master/slave terminology. Why are
> > you changing the names to something unfamiliar?
> > 
> > If the reason are the recent coding-style changes, then please note they
> > are about avoiding introducing *NEW* uses of the specific words and not
> > about blindly replacing existing occurrences.
> 
> I'm really sorry sir, I didn't knew about this, yes the reason for my change is according to the script checkpatch.pl to suit the coding style, I would try to fix some other coding style related issues if this patch seems to be a bad idea.

I didn't know checkpatch does this (it doesn't in current Linus' master
tree).  I can see there is a commit in next adding this, but seems that
it uses a test far from the original coding-style wording...

Best Regards
Micha³ Miros³aw
