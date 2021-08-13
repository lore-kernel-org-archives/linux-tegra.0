Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8427C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 17:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2F7760F36
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 17:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhHMRRG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 13:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhHMRRE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 13:17:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04468C061756
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 10:16:37 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g13so21000750lfj.12
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k0zJ3rZaNMERSNYqq6URhBvNhvYLmHCNYyswRaf+vtE=;
        b=XdLodVj8joNQK2AkFGxq5HaWGlGcBNVl+74ce9J2nIQ9ND09Uqrv4KHPFAmvIQUrbT
         KA3XUzM+xuR4J4bY3inZvasHe1Jmy1s3dYyyWvH2UuK75HauM/nNoxtcO6BXuTVV0OMI
         VcbsY02OoLfie+s/tZl6R8mjR9JLyoJPrpRW1VS0ZlS31QIlN0ADqaq5FMF7iWv4IKo6
         APgi+sd+oK3azIGwzEfJ2iq1nP38b2lb4EBS71zAZ5OlSprCAMKiYbskFKxYxaUeUmmc
         sgvUzdJQ3n3mcoSCdup4tAgCLg7PEgLkB0yao+KfD6Q1ugUl6CvwUk4dcZ29vrYaggjq
         f3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k0zJ3rZaNMERSNYqq6URhBvNhvYLmHCNYyswRaf+vtE=;
        b=e9vE+E0dcAtoZI7HOu0vJaMRN1HMP9eROTiew7+ZFhSJIQIH3lQYKXiQDiis1+rvbF
         u7C6HRl5Vx38ApQDiOSS2y/uKtqcxwhhsKqQi4GtwytqDiyQp/pcWQXMcKhFxstRJuhq
         GYnwi80Mae+Pz7uKKMeaVtBUJiruhLH4PImtbndfTrqFql9Wfusyg8tWW1Tp5RnZm6rc
         9wUJeDgPfTOtwvogMDWTbKbDp6YRME2ryeNRlMw34f9Tg6wsVisQDXaKaumvDRbYSFnK
         KksyF3mCIHZ46YVSkc/Q1Tpfd6wR9xHV8c+niyKqS8m+nig42PeonhvCrsbqInGeQTor
         1qIg==
X-Gm-Message-State: AOAM533A9mh6VzcTl3Qk9k8kL3T9JbBqwGsMDsBbgpT6HDUM7CZwp7um
        VF2anvBJAJewYLHii0sI6yc=
X-Google-Smtp-Source: ABdhPJxBe/FM/ViWF4zdlx94Z2ckuYNmL2dP5iqD5rQNLHUOYfNegEjAtQ0tXm/RaPlvdBLtG2ufLA==
X-Received: by 2002:a05:6512:4019:: with SMTP id br25mr2467106lfb.494.1628874995428;
        Fri, 13 Aug 2021 10:16:35 -0700 (PDT)
Received: from [192.168.2.145] (46-138-117-53.dynamic.spd-mgts.ru. [46.138.117.53])
        by smtp.googlemail.com with ESMTPSA id d7sm224131ljq.112.2021.08.13.10.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 10:16:35 -0700 (PDT)
Subject: Re: [tegra-drm:drm/tegra/for-next 16/17]
 drivers/gpu/drm/tegra/dc.c:1843:53: warning: variable 'new_dc_state' set but
 not used
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>
Cc:     kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <202108140028.U2Z9tWIN-lkp@intel.com>
 <6a4b2b81-cf37-5a0b-bb6a-4857d1a4ffc5@gmail.com>
Message-ID: <167372e5-1d16-9da4-941e-848209d9e828@gmail.com>
Date:   Fri, 13 Aug 2021 20:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6a4b2b81-cf37-5a0b-bb6a-4857d1a4ffc5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.08.2021 20:12, Dmitry Osipenko пишет:
...
> I probably should update compiler or set W=1 to get that warning. These variables were used in older versions of the patch and they can be removed now.
> 
> Please amend the patch with this:

Perhaps too late already. I'll make patch for that and then also check
whether the UAPI patches were fixed.
