Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8FEEB64DA
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 18:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGJSk4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 14:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjGJSkx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 14:40:53 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419D2E6E
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 11:40:30 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-766b22593faso345374785a.2
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689014429; x=1691606429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp4+jo/0AHmLulNuvIh/KwLGCyw4HNK3R4SueheNcGY=;
        b=lYxf8rghghWJv0Q/vA+V23rYsyKhY8pOyeUVCpJjWaQeoVTTwwX5NsHIOYN6eF/d5q
         1OzslYw7Mew3LXDQCKkepu0Mk88a/7qtxxHvKbssn1FyLQ7dc10gcdJv6dtWSE51dqeq
         EBE4968gpBAofOVhg3FiKpizWNQgR7ux/JcfgP37z0nzpjyNHw/6MYL38g/Aj1kfytSS
         A8QlNgghxoMgCo26xqlUi3iXl8p7ENNY9Ev6lhCIkFPIiEAhJUJvX/icgklDaLGZ772+
         GjDzmwjFSJsSnlH2SGmSoJi7KBvTF5JRBpQok9/rdqRbYvqTwGN2tDW0hQY2kjtQhndb
         +h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014429; x=1691606429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp4+jo/0AHmLulNuvIh/KwLGCyw4HNK3R4SueheNcGY=;
        b=grkqx5upjJAed4UH3+jjBqGgTyHIU1AL98uQDX8cce2TTTTvIybAdRoY1mhqQbLdDk
         6Nsfd06gUr2DnvzTbQD+OND0WkGnYWNgYfsOcVxTIhbWyFTy3D4PHZ62OG3X2y7OUVGW
         VThhv3xgLXuznwlR9eRaXTvHY2NKeruin9A2lkDb2CsAL+8UjsX6LFalFQJVxGAw2qbG
         5eMb86dPisye0NxAxPBsDKWr7xx9J1OAL+ujqVJHz1HfQVmCyLCeARtmxcdmaMnIywv1
         6f5IHsqP97LO1RhxO9b94hHtg6Yi7A3n5YQPGQ5m06PfBS16oqT2FqnZEy9uOLPOv/T3
         MKGQ==
X-Gm-Message-State: ABy/qLaw9wAk0Ym1hNethVAxLZgitrsnt5ZNZcque33k4bqh9HFTKATK
        nkquj8veiLH5Umztw05sXqldxg==
X-Google-Smtp-Source: APBJJlHFbNkZF410er95MF4TKaxREjQwy7UnQBG18GsQoNgShoGn/BNZdT9yh3AybAWNLnEhuqOvOQ==
X-Received: by 2002:a05:620a:45a1:b0:767:3771:f770 with SMTP id bp33-20020a05620a45a100b007673771f770mr13588204qkb.40.1689014429364;
        Mon, 10 Jul 2023 11:40:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id 20-20020a05620a079400b0075772c756e0sm119355qka.101.2023.07.10.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:40:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qIvoC-0004j8-Gp;
        Mon, 10 Jul 2023 15:40:28 -0300
Date:   Mon, 10 Jul 2023 15:40:28 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Stanimir Varbanov <svarbanov@suse.de>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [RFC PATCH] iommu: arm-smmu-nvidia: Add default domain type
 implementation op
Message-ID: <ZKxQnKhqKziyxX8f@ziepe.ca>
References: <20230710082252.9702-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710082252.9702-1-svarbanov@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 10, 2023 at 11:22:52AM +0300, Stanimir Varbanov wrote:
> Add def_domain_type implementation op and override default IOMMU
> domain Kconfig option (CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y), which
> could be enabled on some distros. The current quirk has been done
> for Tegra234 machine, because I found the issue on it. The issue
> itself appears on USB host controller which cannot be initialized
> without IOMMU translation. Something more, we proved that IOMMU
> translation is needed for display and GPU drivers as well.

Generically, if you find HW combinations where certain end points
cannot work with passthrough (which is really weird in the first
place) it should be narrowly quirked - not just an entire platform.

Also we don't really have a way to force non-passthrough, ARM32
systems will always run in passthrough, for instance. Broadly the
kernel expects it to work.

Jason
