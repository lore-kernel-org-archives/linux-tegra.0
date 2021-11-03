Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FDAC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 08:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 989C560E05
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 08:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhKCIxp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 04:53:45 -0400
Received: from mail1.perex.cz ([77.48.224.245]:40436 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232068AbhKCIxb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 04:53:31 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D48ABA003F;
        Wed,  3 Nov 2021 09:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D48ABA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1635929449; bh=vFDLdnkcHsfk2/QTntSCR/dfoDKCHLwuRZx4pBby7YA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=N8CokAGHnvJ7JSUcHrunu04N62GiSOSzsmmM6fgknTNI8sN6oAEGb/4xYRLI8gbmB
         FhVYmFlM5+CBGg3wNe94fD7RKU95mcLkhRDvt40V2ITK/x5pZwg1VkhB05JlaG3C8A
         4waT4ejxQEPM72d0+rQX9aKAbMWlZ+CmrcSKaKdg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Wed,  3 Nov 2021 09:50:40 +0100 (CET)
Message-ID: <8a00ea68-4859-fbcc-6292-909a66b0a188@perex.cz>
Date:   Wed, 3 Nov 2021 09:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/4] Fix kcontrol put callback in Tegra drivers
Content-Language: en-US
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, tiwai@suse.com
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03. 11. 21 6:04, Sameer Pujar wrote:
> This series fixes kcontrol put callback in some of the Tegra drivers
> which are used on platforms based on Tegra210 and later. The callback
> is expected to return 1 whenever the HW update is done.

The logic is a little bit another. The 1 means change, so you should compare 
the register / cached value and return 1 only when a different value is set. 
Your implementation invokes the change events for duplicate updates.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
