Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AF7C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Feb 2022 09:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiBRJcO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Feb 2022 04:32:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbiBRJcN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Feb 2022 04:32:13 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED33FDFA4
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 01:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZWzFD+fZAT9gS80utVJN66uFT1ivyAO5yOfZeu12/TQ=; b=iCu82oBceEVukg0+9VBU00Cm6j
        7UXGS4riJvK9Xd9yU5qNIq6x6P0f8cF/L3pfmdBohnn/bQ+lbgthnW2EvMABDl1fD2uUqQXH0O4I9
        48EZlNMQrIJ7GMSgEGbYK171bpueDb2Hcc/Fm3tGxG+vDlUKo7jDIDMlqGyM6qIFYwMdB8R8q1L9V
        9fta4HxyW7I5Rug7hIPMSfYVj5iN9CL/alNBRTUSTHeCUT01c/jMq6w3gt2tC7//qxZUQF8e90pT4
        vmauDGql9SFAwctnHn5MsWXuhVwbV070T8CISY2d/QFiWddWx4FH4koQmlD4AdRjVTzotrBM1eRt+
        Sm2OWPQw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1nKzcG-0004WD-PA; Fri, 18 Feb 2022 11:31:52 +0200
Message-ID: <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
Date:   Fri, 18 Feb 2022 11:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2/17/22 21:16, Thierry Reding wrote:
> ...

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Left one cosmetic comment in the VIC4.0 patch, but overall looks OK. I 
think it would be fine to have some basic tests in libdrm as well.

Cheers,
Mikko

