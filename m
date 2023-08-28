Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAEDC83F17
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Aug 2023 21:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbjH1VdN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Aug 2023 17:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbjH1Vck (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Aug 2023 17:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A983E188
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 14:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693258313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
        b=cnAcr7o5rP1q9MKsD+VtkwRBor2hYoTpsxruQbCd5Ka6XbwOZgKpxq4N1qZ1TDZogM/Zxo
        gpV9hFM4qrou8E5J6OT+HyxuC7dRrfJSWnT1IcJTcpq95hHfl7j15EjEVEWu2klL/cDMzg
        xv+eLRuPJaJ0u3TR2Lckpy65xwXXrd4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-h4o71I6SMs6d6li3zBfWPw-1; Mon, 28 Aug 2023 17:31:52 -0400
X-MC-Unique: h4o71I6SMs6d6li3zBfWPw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76e26652e6fso464271785a.2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693258312; x=1693863112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
        b=WK/kFDGvTo7ErPKr9bQtAGIZUT49bFR68qXnKRfe6/skcJxDbYPvkdoFqp4n9KIPwA
         ZQpMrVccuze0hTPT76nY7Lf/ZGc8nUl/A1IXWgH64sO4wLrF62fE6bmWjZ8eoS9NjCl0
         NGu+xGYgYVVQXUPetppluElNqr3CjnZXdkXw2sDyTfK8GuMYhnxKSiLC35NmykPShseW
         knD4XlOJeYHWdSTi3UNLvJEy86+szxgBmE+zGst3fMjYkpj4g1pxvE7eHhUYNRW8TRwO
         mv/eRcHXtGHAsXCnapcTqgbcyMYbzPRwSu8tXgRtb/dVsBWmjuvdg0h6tXjam6yzKa7U
         JRbQ==
X-Gm-Message-State: AOJu0YzXITaRw17i9XtenYWdT2k31Vo6xRILVKmPXiP3rIHS8RM+rHe+
        TIf5VRNE7K7Pr6T+jTqUtmH/l8+IGSw/O+iYYuXZU+PcgbD7i6kwTCLBONu5OJzu5eLYfvNp0Gy
        LBhd9Cht5nxRx19CKyvZyKiM=
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616601qky.32.1693258312047;
        Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuVcTMTBbnLPs86MnCDU8eGTgJIDkNhQ+SHq++g5N+BlxbjD8TqX467y2sj6EMGyNhF/9w9w==
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616567qky.32.1693258311828;
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a124c00b0076f16a00693sm697233qkl.47.2023.08.28.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Date:   Mon, 28 Aug 2023 14:31:49 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 21/24] iommu: Add __iommu_group_domain_alloc()
Message-ID: <dwrebxdzqjhnryum3czsh6zroapbhpjre7untly3cvl2tn3nij@hpckzx65oxx6>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:35PM -0300, Jason Gunthorpe wrote:
> Allocate a domain from a group. Automatically obtains the iommu_ops to use
> from the device list of the group. Convert the internal callers to use it.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

