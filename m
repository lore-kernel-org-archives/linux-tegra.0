Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8FCECAAD3
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 09:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiINJtw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 05:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiINJtu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 05:49:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AEEDFE9
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 02:49:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g3so3898717wrq.13
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bbq4/4T4JjPGUfth20drkaf18DSxlzxy1kFL2s5Skkk=;
        b=ExcJVlbc0ZagiH+Rt7hA0bIVbTU/NxhHDjFnmOG97vfk7AfET8oP8YY+6s84+Q+Kob
         AJ5rZVaCR4FSyyotJ+Um7fBWBWoMhnq6QmyyFF+rO62RqwDs2N4Cn46ksL+KGnpwh78j
         S9EN8XhjlqB4zz8tP/9vhz/LY6UjBPfju8CSPIQ4BAqdnZkjw88ejZd09ya3aFzcPlFx
         1+nPK7TEXW2EAEnjLYIuPT+P98eFpC+AhVnQvUCuPinG4F1UA1iUwSzMXBNZ6rOAIuA5
         rt96dfG3b4g5SHEDUERGZ840y1RY/kPx0dSau+lT3vebZafJpjfn+RBOIRHaCUGx6/1o
         JI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bbq4/4T4JjPGUfth20drkaf18DSxlzxy1kFL2s5Skkk=;
        b=2qocvToL9w13nZe5w2FDUogJoewNv6NwSTOk/vLJVGzswJvigwC8eC7QX8Dsi6MUNX
         RcgiHRRrJlDIiSASLwWdu0UJ3yj9GiCxSjb9/PjusCcszpFcg4MzKvJdfFYWOJAuIC48
         4KOVDEYsBDC+H6MlnP7Q7z4iIXvzDVl8RaTz5f/Yc9A+1UVzPdY3DbDmjOW5yzutezJE
         kgYqT5JKLGzVsrSo2/cBiYH8pwNUPY2k3LV7TaPiH3I53R7iSjUlR+2tv2izH9U52RAR
         +/KFxcDZgWMms9Dcz6aK3/n04unHiFGhDp03EcdHqVZsPB8jRp9Kma5zgWG4JfVG2mbR
         Wk2A==
X-Gm-Message-State: ACgBeo1Gyp5pgH4hb1w5YrsX05jNFyAOQ+SEIBLfnpdlBH3pSkf5r4ph
        Io62WKiHnlzp87wO8zRVdQKiug==
X-Google-Smtp-Source: AA6agR44NE7mkRWSZbkSxz7tUVdtOhV3Q3E9t0A41MbdOWdyWfvzOmpa8UdB3Zu6U/6tZw10e5zx/A==
X-Received: by 2002:adf:e199:0:b0:228:60f6:f775 with SMTP id az25-20020adfe199000000b0022860f6f775mr20581130wrb.478.1663148987482;
        Wed, 14 Sep 2022 02:49:47 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe4cc000000b00228c8ed21c8sm13192128wrm.17.2022.09.14.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 02:49:47 -0700 (PDT)
Date:   Wed, 14 Sep 2022 10:49:42 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org,
        suravee.suthikulpanit@amd.com, will@kernel.org,
        robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        matthias.bgg@gmail.com, heiko@sntech.de, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        thierry.reding@gmail.com, sricharan@codeaurora.org,
        yong.wu@mediatek.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
        tglx@linutronix.de, shameerali.kolothum.thodi@huawei.com,
        thunder.leizhen@huawei.com, christophe.jaillet@wanadoo.fr,
        yangyingliang@huawei.com, jon@solid-run.com, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 4/5] iommu: Regulate errno in ->attach_dev callback
 functions
Message-ID: <YyGjtsB2Yq4fQICS@myrica>
References: <20220913082448.31120-1-nicolinc@nvidia.com>
 <20220913082448.31120-5-nicolinc@nvidia.com>
 <YyB3F/o3RfymqiFW@myrica>
 <YyGaqsXSDMn8R12R@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyGaqsXSDMn8R12R@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 14, 2022 at 06:11:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 13, 2022 at 01:27:03PM +0100, Jean-Philippe Brucker wrote:
> > I think in the future it will be too easy to forget about the constrained
> > return value of attach() while modifying some other part of the driver,
> > and let an external helper return EINVAL. So I'd rather not propagate ret
> > from outside of viommu_domain_attach() and finalise().
> 
> Fortunately, if -EINVAL is wrongly returned it only creates an
> inefficiency, not a functional problem. So we do not need to be
> precise here.

Ah fair. In that case the attach_dev() documentation should indicate that
EINVAL is a hint, so that callers don't rely on it (currently words "must"
and "exclusively" indicate that returning EINVAL for anything other than
device-domain incompatibility is unacceptable). The virtio-iommu
implementation may well return EINVAL from the virtio stack or from the
host response.

Thanks,
Jean

> 
> > Since we can't guarantee that APIs like virtio or ida won't ever return
> > EINVAL, we should set all return values:
> 
> I dislike this alot, it squashes all return codes to try to optimize
> an obscure failure path :(
> 
> Jason
