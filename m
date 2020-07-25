Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DDEC433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A3B2206C1
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="PPNCdzhy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgGYMBv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 08:01:51 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:29317 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbgGYMBv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 08:01:51 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BDPn81jwXz4D;
        Sat, 25 Jul 2020 14:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1595678509; bh=w3jUGDxRIp+sGpE9bEyj0oc+ewSofeGPQslarzeKxxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PPNCdzhyzVxX03mIEivhG7d/l2lFQD2BCi4mXt9uALM0rUoA3As8RN4hksjdd9FYl
         /ZTPDoAlxYg+lRbB/iSg4TQVhZ/DGCMOOIS3GHG1+fF6j2muJrefXUANdfObiX4alB
         Pt/YVFHIwSKttoxv+geGRe/fz1TtLgYdZ6ZQoRxBxB9r5aVBc22MpyyiqWvfeIHnjV
         SPYtgHdNAfeNXAUq0y2rvG317NDE1ThkfGi+addFjm/fKwZov6HKJHzzpVMsHwpmH3
         eibaAFS81VCVyWKs0cyh5ZTwxa7KKeI7F3kyzrNnh852vUCE4GmWvNo1lFikhp0vw8
         nGT2jBMykX3Fg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Sat, 25 Jul 2020 14:01:47 +0200
From:   =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
Message-ID: <20200725120146.GB26689@qmqm.qmqm.pl>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jul 25, 2020 at 11:59:39AM +0530, Rohit K Bharadwaj wrote:
> changed usage of slave (which is deprecated) to secondary without breaking the driver

The relevant I2C and SMBus standards use master/slave terminology. Why are
you changing the names to something unfamiliar?

If the reason are the recent coding-style changes, then please note they
are about avoiding introducing *NEW* uses of the specific words and not
about blindly replacing existing occurrences.

Best Regards
Micha³ Miros³aw
