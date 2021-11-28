Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74ED2C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Nov 2021 01:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhK1Bh1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 20:37:27 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:12526 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232398AbhK1Bf1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 20:35:27 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1rZ10mfpz9Y;
        Sun, 28 Nov 2021 02:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1638063130; bh=IT34OA2T8T5QYWv3CvxR4a7HBvADEu62sa6cbezZpws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=msz01PhdtYMryd2JuGQtsnPJnJ3xDtMqGmA7Yx3H2wh7JcB5Qr4YfmPG5yTusc90+
         wSqYOAHslEi0c5NG/nGB/+JyDJ0X3HF9kO8j+a2M6z4qOFmZ9BGh1V3TW94+LSpauJ
         l7/AyutJQlQ7KUmsoeJ8tlNX/6dJ2VQL+NAMLAl42CdmR91NTQXD1mBXAUNo5GbpJ8
         /8ma/teHT5CFmFhvm+kLy4Kf946wuLw5i1t8vzyhd1TFwskscULlTkQ1wb0ROBXppX
         NhuyDLmtaWEcC+MxzyBDNYYn2c4BdTATH3f0Ld9ZejRQ1GotW+iLds4cA+mZJoGMoh
         Bj6uNl6cgYQ6Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Sun, 28 Nov 2021 02:32:07 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] ARM: tegra: Add labels to tegra114.dtsi
Message-ID: <YaLcF9PxYUj8v3uj@qmqm.qmqm.pl>
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211127142327.17692-4-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Nov 27, 2021 at 05:23:16PM +0300, Dmitry Osipenko wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> Add more labels in order to use label reference in device-specific
> dts files. Labels make device-trees more readable and prevent typos
> that are difficult to notice.

I believe that you had also a similar patch for Tegra3 (or my [1]).
Could you pull it into this series to make the DT's easier to manage?

[1] https://rere.qmqm.pl/git/?p=linux;a=commitdiff;h=2c3341163b07d94d209680a22286608d0e4d711a

Best Regards
Micha³ Miros³aw
