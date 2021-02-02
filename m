Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5135BC433DB
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 17:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1855964ECE
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 17:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbhBBROJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 12:14:09 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10007 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbhBBQZS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 11:25:18 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60197cc40008>; Tue, 02 Feb 2021 08:24:36 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 16:24:33 +0000
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
 <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
Date:   Tue, 2 Feb 2021 16:24:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612283076; bh=CEvP7Tc+GVpLUt9/g/q0cu5A7O0MJxg4tJPKJVFK2TQ=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=OLaOgypbOgXoCBypRvB4lzmBlljAml6HE+jwwCRJX3TpY3GR038XVJWyZrS0ATVF5
         SkXKFACbfjJw1DeMcyOjyEi2wK8K48xdoZcCu5wZqINh9SVuZJyk0VZC/M7oHGaPpH
         2kYNT4GjZD+dSOQqkOyYtHFFK4MFE0KuiwrJYN78TQqB7EEDhoxiSzho56n3wg/ldP
         c6bSbihD/jQxTDQOVmya28qE0323C5va6znTIpCA5TDljVwqRKCRjed2QqPex1XgH8
         aPKF/xhBdIal6CcqwRXndKmr+7nHf9FJami2Su/w7oCbn6xv5CGoPL7e7AbMHTWzgv
         4Tt0L3l4OGhbw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/02/2021 15:25, Dmitry Osipenko wrote:
> 02.02.2021 16:22, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> So this is very similar to tegra_rt5677, is it not possible to support
>> both codecs with the same machine driver?
>=20
> These codecs require individual configurations and those
> "../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
> quick glance.

Right but not all of that is needed. What is actually needed from the
header files?

> The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
> driver should be a better base anyways.

Sounds like a good time to update it :-)

> Overall it shouldn't worth time and effort trying to squeeze these
> drivers into a single one, IMO.

Not sure I agree when these drivers appear to be 90% the same.

Jon

--=20
nvpublic
