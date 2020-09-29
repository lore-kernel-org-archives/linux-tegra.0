Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AD2C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 05:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9336E21548
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 05:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl6NtFtB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgI2FmK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 01:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgI2FmK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 01:42:10 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742A4C061755;
        Mon, 28 Sep 2020 22:42:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so2957837pgl.2;
        Mon, 28 Sep 2020 22:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ysq/ouKi6jMX8v57M9aoYWZV/MYW1mEd7coTo5/bzDw=;
        b=Pl6NtFtBjxltcAhP3oYqpHyC619vq+rUWAO9wpQ6r8xOUeOIxMFo/fHVYI4AEJHNp5
         za5pJuRd13498wxA34MIuOty5BAFPXDNXLNTPKu7BdxxumMPZFZCE8W8Qd0KEhvHyQi2
         M3vaxz28cgacT7MPwiOr3VsoRjQnjZfUgTrwYTCFb00/XO4S2QH1oNTz4af/IvgRweLO
         9wo/bGpsvINwXh9YQButyh5UJ2mv9kQggxpVN2aIb+C39jmG/gzP9lknTrgLHQiFS+nC
         yhTcr9o2sEkR+NKFCNn/apjx6TtRm9Ix3QDTddE4XM5mrR6W+fp0Qr5TWg504z/tAyWO
         uuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ysq/ouKi6jMX8v57M9aoYWZV/MYW1mEd7coTo5/bzDw=;
        b=a6VhMSnojUwzkjCuaYlgJ5YyckW6Er0pzSf8D4b7JS/FGTJKRrhIaK9KGXzFbTBtEB
         BcucRkzxtWuKHE8bS8HokpdWZbDiLIPqh1emDEZrOvePT8TCrdDE/5ybkOoQD+DjrIAJ
         rUPgXPZJ0uiA/KQ+QBTlD9RqZYjH0JiK+xpjX9b9dfB2yPmlHQb9CCWinb4gKb5DzSUQ
         7DF/VWpzqEmdUMGPCes1K+jppmVN5wkmmkaIK0xcaQl83ovSW8KHdUh0zclw+dJigNTt
         kES7xap7pcaMR7bSWG0yD9AKSRJ0LSEdPFSS7WsGLnYpoAsaOlXRkJ6p0payVSk+FL5q
         UbUw==
X-Gm-Message-State: AOAM531yYFa7WtSdc4FmTr91d9J4AsJH3yvGso11ba0PR1/3ItxwKAw8
        DSEtA780BukSTY/YdPaKmhXqKEAkmvg=
X-Google-Smtp-Source: ABdhPJyu1vAXv5K39kZ/daoUr01rwlDpclPujRxh1WhIz2iFoJLLEPOBrK46HT+Qjp2OFkW78c7Hjg==
X-Received: by 2002:a05:6a00:23cc:b029:142:2501:34e5 with SMTP id g12-20020a056a0023ccb0290142250134e5mr2621977pfc.62.1601358127716;
        Mon, 28 Sep 2020 22:42:07 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id k14sm3527621pjd.45.2020.09.28.22.42.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 22:42:07 -0700 (PDT)
Date:   Mon, 28 Sep 2020 22:36:45 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, krzk@kernel.org,
        jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
Message-ID: <20200929053645.GA16611@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <20200928075212.GF2837573@ulmo>
 <20200928221829.GB15720@Asurada-Nvidia>
 <2a38018a-3f95-74da-6dc1-270efc26a8fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a38018a-3f95-74da-6dc1-270efc26a8fb@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2020 at 07:06:37AM +0300, Dmitry Osipenko wrote:
> ...
> >> As I mentioned in another reply, I think tegra_smmu_find() should be all
> >> you need in this case.
> > 
> > This function is used by .probe_device() where its dev pointer is
> > an SMMU client. IIUC, tegra_smmu_find() needs np pointer of "mc".
> > For a PCI device that doesn't have a DT node with iommus property,
> > not sure how we can use tegra_smmu_find().
> 
> Perhaps you could get np from struct pci_dev.bus?

Possibly yes...but I was hoping the solution would be potentially
reused by other devices that don't have DT nodes, USB for example,
though I haven't tested with current version.
