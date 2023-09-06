Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B596EB8FB3
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Sep 2023 13:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241198AbjIFNpH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Sep 2023 09:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238703AbjIFNpH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Sep 2023 09:45:07 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0442810E2
        for <linux-tegra@vger.kernel.org>; Wed,  6 Sep 2023 06:44:52 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-56c2e882416so2252432a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 Sep 2023 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1694007891; x=1694612691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjmXiVfaEDODvjU2FievJvSdcMcGvy4WGcnM9/YFUIw=;
        b=F2TWW2AGgy/XiUiplFRyOKTcHJNiUGCOtsNbYU4dz7K9IwxfevsGKmAV+7eCL/7/Jf
         UDljFcLl3y9hSdKZHWTU0VU1Q59OF7UjnqMh7MpLYhmmh4LJ3Typ2fn8i1jxSTnRUTCo
         BpFrFyTjerDBfZ94BTpuX1Xa/iY6UDvQGWmDYUT9H2t+qNSt6Kyzn61Q1GBGKTiGHmhI
         HNZJdafZ9twHDFriAv3sR8HviEyMhvMp5fARx6khCql5LxRszYTNhz2IuLNizQyjLMWt
         ucxcHfIYqL74wKyN5MhHbpoMErdgxty+SQCkxT05+5Y72M+u7a6O+SxBT9PKvGlXjUPM
         BDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007891; x=1694612691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjmXiVfaEDODvjU2FievJvSdcMcGvy4WGcnM9/YFUIw=;
        b=hAlV/Xfhybm3+/AfuDHJydFcmul41NDtkT5a/RMCHsxqd4XuuqAtmH7xXkcEIfSO2J
         ZbL3lTeAufl3OKqDr9dx/nYNBKObM3xp9LbQu010lOOaFfXPyYCagZRRwkZePg5dAH4T
         mKsxoji9t3ADf4S20zPAqeHkYc3gb4shaGU7T39cdSyzHTwOXk8h4KXKktDHcc1HMjnW
         61WoNnoRUiQAf2Ab5BNvQhJqmu2WuFfdw5/uz6GdxWWTyfHebr3W7QfRAjtgoUUzRxhi
         GVXO70wg2pW3yOLEfAKPX5UbT6qyjOXl5SxPHKOh2nJIPkUmitT/LYyVmY+X6R7Na4Bu
         2tFg==
X-Gm-Message-State: AOJu0YyE33z/ckrbJbO9Iz4d7KnQXjZESVxkoqV6IQGklrGHFWFbiOaa
        rxb0jw37V7Cb0+0rC0WpFfTNxQ==
X-Google-Smtp-Source: AGHT+IEL+RpSURCPPA5o67iyCeVVmbxChqKlkrpULXGfrkmSIXOBkNGq1NxIr8VMJglhyURY9OigNQ==
X-Received: by 2002:a05:6a20:12cd:b0:153:556e:a78d with SMTP id v13-20020a056a2012cd00b00153556ea78dmr2617805pzg.43.1694007891529;
        Wed, 06 Sep 2023 06:44:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id e14-20020a62aa0e000000b0065980654baasm10950757pff.130.2023.09.06.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 06:44:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qdspt-000yLt-Ck;
        Wed, 06 Sep 2023 10:44:49 -0300
Date:   Wed, 6 Sep 2023 10:44:49 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
        baolu.lu@linux.intel.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] iommu/tegra-smmu: Drop unnecessary error check for
 for debugfs_create_dir()
Message-ID: <ZPiCUcxaftqCi4UJ@ziepe.ca>
References: <20230901073056.1364755-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901073056.1364755-1-ruanjinjie@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 01, 2023 at 03:30:56PM +0800, Jinjie Ruan wrote:
> The debugfs_create_dir() function returns error pointers.
> It never returns NULL.
> 
> As Baolu suggested, this patch removes the error checking for
> debugfs_create_dir in tegra-smmu.c. This is because the DebugFS kernel API
> is developed in a way that the caller can safely ignore the errors that
> occur during the creation of DebugFS nodes. The debugfs APIs have
> a IS_ERR() judge in start_creating() which can handle it gracefully. So
> these checks are unnecessary.
> 
> Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
> ---
> v2:
> - Remove the err check instead of using IS_ERR to replace NULL check.
> - Update the commit message and title.
> ---
>  drivers/iommu/tegra-smmu.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
