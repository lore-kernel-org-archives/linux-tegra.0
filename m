Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73737C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 17:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46E6764E13
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 17:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbhA2Rbg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 12:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhA2R3Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 12:29:24 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249B0C061573;
        Fri, 29 Jan 2021 09:28:44 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b8so5575431plh.12;
        Fri, 29 Jan 2021 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=i4YXa9+oUVNsluWZqNeovQVGehxzdePq9D0BS8DMKkI=;
        b=E5Eq5LjEJ+KIvRT+gUvCHdCqXHtL+2IBSs2+2T3BN1qup9kTDA7YByXqA0IL8aQCA/
         x+qK5yuFPe/j7VNGh/QciE3y4YK9+JTq2zA/52IfvaA57pBXYpLG9pIlJOL+F582OtUt
         20ueM+D5WkPieuuGVSmqiY4PacI3HgmgXys73AnadyATMeI+VHwG3X2GuMCLu0SS7jzZ
         CZTTKAPH2VNFMRlxapHzPj8c6nE4qPns+rxkJjZGRng1F2/FeP93J2MU7snAR1TgkMv9
         7c1y15pcyyISmV2BiGhVPS9pOzjyT3SH9uvK9Rr9hMfI0X2gM8eIeIlIkzyBcMc+Ul3w
         pB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i4YXa9+oUVNsluWZqNeovQVGehxzdePq9D0BS8DMKkI=;
        b=TGqtz9qUv6d2hdqw3EboI4ZeAshaYrJMGmPPs/HE3patAQ6asJSm6ogU+d8cuHkUhK
         k/ZieNUEbdkQ/YlsR4Zx9pEZgXpIyOpZKB+/QdClHYJOH8oqawE0muwmSd526oZkcuKP
         n+EwM+zRGcqejXAUUfb3xFN+3+I/PwX47TwNi6yaBQcRs4ZMUhP7mbTbjjwCzayHTg+c
         LQx8Bv/mUe5h/lsjyb1tn47QLL252OxEfX9eSxccRrKgrpYkoDTavhaTFpaSJ2aQFS9e
         0xFo+kVRDq2VW96zrmdVNdIJjsZvZ5QPSZeQe4AaUofPuZ42VTZ5bF0wJKOt5O0R2W3z
         +FKg==
X-Gm-Message-State: AOAM531ntyD4pZ+Tz87jXGhEa86UfQTqXvQQlFk9D7lzMdLUMQLzOa6R
        Ak8bgUVPbtAlg5ot8bMlkecY6eMJQ1vgBg==
X-Google-Smtp-Source: ABdhPJwpob9XLa+enm1Bvj+AMTD2zpUuszy1UGCflSG1OYghuF+vKjPh09cWTnrk+73gxOglOxlNWg==
X-Received: by 2002:a17:90a:4bc7:: with SMTP id u7mr5447970pjl.51.1611941323248;
        Fri, 29 Jan 2021 09:28:43 -0800 (PST)
Received: from [10.25.100.162] ([202.164.25.5])
        by smtp.gmail.com with ESMTPSA id w186sm9110790pfc.182.2021.01.29.09.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 09:28:42 -0800 (PST)
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
To:     Mark Brown <broonie@kernel.org>
Cc:     Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
        lgirdwood@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        sharadg@nvidia.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
 <20210129124454.GB4560@sirena.org.uk>
 <d6cb9252-246e-d6c7-7500-5f1d1823325c@nvidia.com>
 <20210129154858.GE4560@sirena.org.uk>
 <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
 <20210129171954.GF4560@sirena.org.uk>
From:   Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <2f7e3949-e6b9-6940-94a4-6c1cea3b8db0@gmail.com>
Date:   Fri, 29 Jan 2021 22:58:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129171954.GF4560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/29/2021 10:49 PM, Mark Brown wrote:
> On Fri, Jan 29, 2021 at 10:15:51PM +0530, Sameer Pujar wrote:
>> On 1/29/2021 9:18 PM, Mark Brown wrote:
>>> If the user wants a given CODEC driver then they should enable that
>>> driver.
>> Above card driver is intended to be used on multiple platforms. DT has
>> already a way for user to describe the CODEC connection required for
>> specific platform. So idea is enable these CODECs from driver point of view
>> for this card driver and platform DT can use what is required. Also the
>> CODEC driver will be a loadable module here.
> No, you're missing the point of a generic driver here.  This will mean
> that if someone wants to build the driver into the kernel for their
> embedded board they will be forced to build in every CODEC driver
> someone has decided might be used with this generic driver, and even if
> they're building things modular someone trying to cut down the size of
> their kernel images is going to at least have to spend time building
> CODEC drivers they don't want to use.  Distributions should just select
> all the CODEC drivers that are available in Kconfig, people configuring
> for a particular target audience should be able to build only the
> drivers they know they need.

OK, will drop this in v2. Thank you for details.

>
>> If above does not seem fine, alternatively can I just enable CODEC config
>> independently from defconfig?
> Yes.

