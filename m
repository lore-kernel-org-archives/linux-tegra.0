Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E166C41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:28:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 443E92067C
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhOSZeSA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgJCO2H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgJCO2H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:28:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC43BC0613D0;
        Sat,  3 Oct 2020 07:28:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so3556243ljk.2;
        Sat, 03 Oct 2020 07:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dGAtYbvgm2iB2nhNBJQ3LZ+7XxG9iYYI3OJLkO7ZNGM=;
        b=GhOSZeSADUrn9ikkACkpJv4jzdKZ5y6XojVkNPolxlCowrqoe2qWbfyNhXAokZpAiE
         Bau1J+7vzh3nlRgjb1zRxC5vxslgrt7Z/IVwHClNKilevwUTBbwxa4TObXOfxmTc6HaS
         TiYFAXZ/9WzNHPLtKZEsWI3s/tiK1azE1oDVPZxp1EJPfNHy4kS4EIHWbSMHVF1q5ycF
         eax56SVriiTb9uV4JKgud2gEmgkEiLk9OelmlSFTT1S8xfiFNtwVuTIEoj+J0lUXBCW1
         hMrvzWKCd838goSAtRoa2kEOaiR0OscSOJzlPXeAyD3mArK3cxbe9mvZrPCsqrI2c5v6
         sdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dGAtYbvgm2iB2nhNBJQ3LZ+7XxG9iYYI3OJLkO7ZNGM=;
        b=HHXNUjfINFrETGScUVR+JZ8AiJU4mH/XwiCNIcJRxI7sKYnNe48Olzah/G7i8bfQ8T
         unyjgqWNrE/rskvJWA5L2WPGkFM+KIdimx/Ebwt+NFdSNhQ4uYmISqG2vzi3ng2z1o61
         VHDantNbXYbjMXPXnsFx/BPzOW1ryNOCe4rf+nfk2GxtarkoCnoW9nV0JupX5/l3KXMN
         DHq0D2qf5g255pD6tiryfLTrgimPUUKxFVcpiEshYD+NVPWfTbFdoYFUQI8PRoTK9xUR
         CNWTOP1jQ4Xw7+6ihFsIlEl4kNLF50tQ2g6H4l2pef/7KAGEUz8uWwU33YdP8NIDd3uj
         Mpnw==
X-Gm-Message-State: AOAM5315kB/64pMFX8f4l78HE9WFBTNiC25hbtqQH8oidSZ3h3dKkcqY
        WPWf7nUQ/W1x5jG5ZycXhiM5fodIhmg=
X-Google-Smtp-Source: ABdhPJyKcCE7ucvwBxNmnQVRetkWayhSceNFemtkrqcbXAVAvBnxBgwPzfYP2CrnObb7dNng2oehhA==
X-Received: by 2002:a2e:9907:: with SMTP id v7mr139424lji.167.1601735285367;
        Sat, 03 Oct 2020 07:28:05 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id n26sm1436324ljg.133.2020.10.03.07.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:28:04 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] iommu/tegra-smmu: Expand mutex protection range
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-3-nicoleotsuka@gmail.com>
 <184163e9-01d4-dcc5-0adf-a3d175e56f16@gmail.com>
Message-ID: <7bcf39ad-a254-7601-af44-c05805113930@gmail.com>
Date:   Sat, 3 Oct 2020 17:28:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <184163e9-01d4-dcc5-0adf-a3d175e56f16@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.09.2020 20:42, Dmitry Osipenko пишет:
> 29.09.2020 09:13, Nicolin Chen пишет:
>> This is used to protect potential race condition at use_count.
>> since probes of client drivers, calling attach_dev(), may run
>> concurrently.
>>
>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>> ---
> 
> It's always better not to mix success and error code paths in order to
> keep code readable, but not a big deal in the case of this particular
> patch since the changed code is quite simple. Please try to avoid doing
> this in the future patches.
> 
> Also, please note that in general it's better to use locked/unlocked
> versions for the functions like it's already done for
> tegra_smmu_map/unmap, this will remove the need to maintain lockings in
> the code. The code touched by this patch doesn't have complicated code
> paths, so it's good enough to me.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
