Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9260EC7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 12:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237729AbjDEMOw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 08:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237007AbjDEMOv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 08:14:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F0C3C22
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 05:14:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id w9so140554043edc.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680696887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpXRDC+Ftm8/s3u6sHKGTO7Ya5b3E/7w5SAWjP7y4Xg=;
        b=Ho7CL2c01JqDpDn1mnrDD8HDKCgkh8lPZtfdBik+ucWyFLrgVQTawDXrhpOzKQJjCZ
         8+WBrJ9EFzhyj+NGkOrrB4ca+A4/psZSEbqw3cuJoZOzOmffMG47xcfxn9XH4+h+r/nA
         RIS3Z6y0M0gP7vr1wkVWNJf6XNOkDCIUohAt9+gbc9qclvrPi54Wi46E47mpWK8+PHDx
         u4/IymiDsZcxNyYQctK0f9JpQRoKO31Gdh4daws4x+fL8uhSfT+xYLTcIA4MsSc7BtS9
         wFrZXvSuOoYlBKFQMmpCnvSuqeK/knm0giLlBLeWtLDMolZX2wYMNTOLn5v0b+TWpphV
         MLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680696887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpXRDC+Ftm8/s3u6sHKGTO7Ya5b3E/7w5SAWjP7y4Xg=;
        b=FRbM7hZ1MMHoDsGAEGi31wk1TaVQmzYCe0bu/a3uUpiCZ1qe1FEz6mVuEXbo9ZNGWj
         8YhgtfNNwr1xdB/K0T07G42QdoU0bMHqAnBLwzHtkTsU9PpgBCq4ko7JxdKWXR/MFXlS
         3Ru67AK35kXx0SKpSsAGD3CcqmncEkJTvPA+uc6mJUysNUAJqV0IU5GH7WwuHqtxXWzq
         3oMZACR9fHCnm8uYdJU94c3ktu5LLu/R2Qk5JosBVlkBgfKbeNNTORKlFZuxHhGhoRus
         IzeE+vP+XBmIs60QFr4wu8rWYDn0en6vqIKNWoA8XLnF8izvTGIAyeDo49vNBuYN1IR6
         A4fw==
X-Gm-Message-State: AAQBX9dQRiDBQUerO+1rnREjVQRje4YrUihI61sRiI4uMpBbesDJuHu2
        s5WAXmbOgztEEH4/2tOk/Sa4dxyclDQ=
X-Google-Smtp-Source: AKy350bGKXVF8AWToGmMNuy71ff4Yr3Em3vUTYC+hY/EoLY9s6TjyCvpLyuEAV4NVHMrLg6NyPXhNQ==
X-Received: by 2002:a17:906:110d:b0:889:1eb1:7517 with SMTP id h13-20020a170906110d00b008891eb17517mr2579662eja.30.1680696887512;
        Wed, 05 Apr 2023 05:14:47 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:3838:470:c3f8:814e? ([2a02:908:1256:79a0:3838:470:c3f8:814e])
        by smtp.gmail.com with ESMTPSA id t12-20020a170906608c00b0093d0867a65csm7399102ejj.175.2023.04.05.05.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 05:14:46 -0700 (PDT)
Message-ID: <e4ab3d50-f286-3858-5ab4-867e9a5cca2f@gmail.com>
Date:   Wed, 5 Apr 2023 14:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/tegra: fix another missing include
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org
References: <20230405114443.113834-1-christian.koenig@amd.com>
 <ZC1kFMgpXlqVErTi@orome>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZC1kFMgpXlqVErTi@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 05.04.23 um 14:05 schrieb Thierry Reding:
> On Wed, Apr 05, 2023 at 01:44:43PM +0200, Christian König wrote:
>> Since tegra now compile tests on other platforms the kernel test robot
>> started to complain that this here is not pulled in under all
>> conditions.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: https://lore.kernel.org/oe-kbuild-all/202304050946.yGGTKkcr-lkp@intel.com/
>> ---
>>   drivers/gpu/drm/tegra/fb.c | 1 +
>>   1 file changed, 1 insertion(+)
> I had meant to bring this up in response to the other patch that you had
> sent but then forgot. One of the sanity scripts I run complains that you
> have different email addresses in the author and Signed-off-by: fields.
> I already fixed that up for the original patch (I used the Signed-off-by
> email for the author as well). Let me know if that's not how you want to
> handle this.
>
> May also be worth fixing up your setup so it doesn't generate these
> conflicting entries.

Yeah, that's a well known issue.

The AMD mail servers are notoriously unreliable and mangle patches 
during sendout.

Because of this I've switched to using gmail for sending patches, but 
keep the author and Signed-of-by line with my AMD mail.

Christian.

>
> Thierry

