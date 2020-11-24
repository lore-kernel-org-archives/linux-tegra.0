Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB32C83017
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 09:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AA682076B
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 09:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GA6XFo0E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgKXJg6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:36:58 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10077 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731411AbgKXJg6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 04:36:58 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fbcd43f0001>; Tue, 24 Nov 2020 01:37:03 -0800
Received: from [10.26.73.42] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 09:36:54 +0000
Subject: Re: [PATCH v3 1/6] regulator: core: validate selector against
 linear_min_sel
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <s.hauer@pengutronix.de>, <ttynkkynen@nvidia.com>,
        <linus.walleij@linaro.org>, <axel.lin@ingics.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <1605280870-32432-1-git-send-email-claudiu.beznea@microchip.com>
 <1605280870-32432-2-git-send-email-claudiu.beznea@microchip.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cb096dc5-3757-d72f-41a9-c99007c84b40@nvidia.com>
Date:   Tue, 24 Nov 2020 09:36:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605280870-32432-2-git-send-email-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606210623; bh=l40HTXpzevEVEAEAdmPjFtiskwyo/SaTkS4mo69i94o=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=GA6XFo0EWRG82MhQ2+sy2JaurLhA93lfZB4bCF87UPO8OyvgT4cgPGQEnfKGnFuNp
         RkaI0KhguU2mPalny+tr5y6jrLlOjtaZXECFAJ4UVoi5Ov8f+qXOPtfZDYt9Alx2PJ
         lf62n1SxnsaAvS3KNznXup4dPWf0XqnrfXL0BaD2KJkhDCCoxUrnf6rn28Sb5S0Squ
         LdLQL8VuXlBABVpTgKkqZ94T9JA/0tkGyKEeDkBqvE8bLWS9kdCJgeaq+C8xBsDjzg
         vd2D7TyiITvz+TbWJvYZAIWgwiLR9G2zq5DJMNPPXFcEOsRhsJNdVK4jfPz6Dk02YU
         OtW48vLvNk2XA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/11/2020 15:21, Claudiu Beznea wrote:
> There are regulators who's min selector is not zero. Selectors loops
> (looping b/w zero and regulator::desc::n_voltages) might throw errors
> because invalid selectors are used (lower than
> regulator::desc::linear_min_sel). For this situations validate selectors
> against regulator::desc::linear_min_sel.


After this commit was merged, I noticed a regression in the DFLL (CPU
clock source) on Tegra124. The DFLL driver
(drivers/clk/tegra/clk-dfll.c) calls regulator_list_voltage() in a loop
to determine the selector for a given voltage (see function
find_vdd_map_entry_exact()).

Currently, the DFLL driver queries the number of voltages provided by
the regulator by calling regulator_count_voltages() and then starting
from 0, iterates through the number of voltages to find the selector
value for the voltage it is looking for by calling
regulator_list_voltage(). It assumes that any negative value returned by
calling regulator_list_voltage() is an error and this will cause the
loop up to terminate.

In this case the regulator in question is the as3722 and the
linear_min_sel for this regulator is 1 and so when the DFLL driver calls
regulator_list_voltage() with a selector value of 0 it now returns a
negative error code, as expected by this change, and this terminates the
loop up in the DFLL driver. So I can clearly see why this is happening
and I could fix up the DFLL driver to avoid this.

Before doing so, I wanted to ask if that is the correct fix here,
because it seems a bit odd that regulator_count_voltages() returns N
voltages, but if the min selector value is greater than 0, then actually
there are less than N. However, changing the number of voltages
supported by the regulator to be N - linear_min_sel does not make sense
either because then we need to know the linear_min_sel in order to
determine the first valid voltage.

In case of the as3722, the value 0 means that the regulator is powered
down. So it is a valid setting and equates to 0 volts at the output AFAICT.

Please let me know your thoughts are the correct way to fix this up.

Thanks
Jon

-- 
nvpublic
