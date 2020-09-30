Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91F1C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 00:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8845E2074F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 00:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P47UtA2v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgI3AhA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 20:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbgI3Ag7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 20:36:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCCEC061755;
        Tue, 29 Sep 2020 17:36:58 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y14so5371862pgf.12;
        Tue, 29 Sep 2020 17:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/XM/k7ZAi/BqVvVYF0L63/UmQsPEgJkkXUJGypFWKDU=;
        b=P47UtA2v2KZFC8OmtrYRr+RubNI8j0poiQBEl27RUSlqIZHvxvXNaZJrOgUAt3/rWy
         /DrUlRu5ajujzTy0QpXVoLjbs2pOC0qhJd653+erbItYweTiAKAnQB8KKlMn4SFVekMk
         1Z7bmEmGI3lWhJNa9nnlVv5ZnONiRgJtdr8ska/of3UrsFUIq8qoHWUiyEUf7T1Y2/Rl
         ge/fmwFRy/8aPHgtq99cltj7Ozh1bZ69w9dOrtzODGETl+Dn2WXyKY6PWaKvpR7CIYUN
         jCoBB0//a8qx2Z0WH3B6FPIIzX5Wl1onxeB/XUmRchXFN2/ZQnJnIdd6o/07215abDG8
         c9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/XM/k7ZAi/BqVvVYF0L63/UmQsPEgJkkXUJGypFWKDU=;
        b=U7uuXAw79pMotu5v1JABc/vGKUTEB/P2lFvJueBfMtnuKGijzTW1Kj8VIuguAaFQF/
         PFZCnwkqbARVlhMWsQVXU9C4/w9twTf/4tkyqBCwzlPc3g1toB76bKOAfw0pl5vJgfpP
         gv0XdwIkRQqYXDcR5dHopxE1t9mtGHL+XA6J8BWScldfvFUxzptQJ0umqas0XQvr8LzR
         rNWZxVwSv9DG5CTbDIA3+T857B4yr+PBnR9tiQR4h37MgBjl9UAqMiBE8KbXwzaqk12a
         NRUsQEfO6kfdrqqRO5fsHqoQrDjskETs8FzACL75s3J61jhHvKxEglZRpGQYTcCnZYNT
         y8iw==
X-Gm-Message-State: AOAM530WpCl2mJ7FF2bdO2z1zoiNe9eZY+3eUvHlYSFsLSA7+YqOT07a
        bz1ymxaWOYgkYBSxip/V/yw=
X-Google-Smtp-Source: ABdhPJwtlJ5IyFYYsulqOxLUs9xgA8O8lmGoTtkpvPfrVi3PJDI3ugbs1A/OyAlKFTrYWeSawD1Bog==
X-Received: by 2002:a62:6044:0:b029:151:1a04:895 with SMTP id u65-20020a6260440000b02901511a040895mr249217pfb.34.1601426217687;
        Tue, 29 Sep 2020 17:36:57 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v205sm7268836pfc.110.2020.09.29.17.36.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 17:36:57 -0700 (PDT)
Date:   Tue, 29 Sep 2020 17:31:27 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        hch@infradead.org
Subject: Re: [PATCH v4 2/2] iommu/tegra-smmu: Expand mutex protection range
Message-ID: <20200930003126.GA31332@Asurada-Nvidia>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-3-nicoleotsuka@gmail.com>
 <184163e9-01d4-dcc5-0adf-a3d175e56f16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <184163e9-01d4-dcc5-0adf-a3d175e56f16@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2020 at 08:42:52PM +0300, Dmitry Osipenko wrote:
> 29.09.2020 09:13, Nicolin Chen пишет:
> > This is used to protect potential race condition at use_count.
> > since probes of client drivers, calling attach_dev(), may run
> > concurrently.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
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

Okay. Thanks for the review!
