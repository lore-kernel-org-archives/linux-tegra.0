Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6F9C12002
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 14:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D165D613AF
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 14:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239786AbhGPOoi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Jul 2021 10:44:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240454AbhGPOoi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Jul 2021 10:44:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C22F613FD;
        Fri, 16 Jul 2021 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626446503;
        bh=Gg3Ke0wyfoprEaQsLgh/4ChP1BGmBVSkJ5TkIjXTauk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NVNSiK17IZjvwxQwUyBbXALG1OEfj/EPl2TPfwfVV2SEmLVoOjr8/JfNGY/aaVnE7
         MBfOD7nHttfeYeex7PtN6rz/vf+yKwTYMH1j5Qj8jc31viyzaPJgbFDX7MQ/OVYpMG
         Zn/YXvDOBP4atQd5Igte4jDFrMfeP8eHnhfYYll+sRylJ0NgfCPskA/xDlMmkUCI64
         0c7tJxUu1wL3Tw2iHsoRNhecQq2SO8VOhN6JQCfluFX18iRvaWMRxvyRv2vVqjdCjD
         YYVZO5etRr2K6DuF3T55f5ZpE7Wpl+NCXA4jS/feOK83aMKBsfr8YVRsK3SBlSSJFR
         YyPg86ZUtRL9g==
Received: by mail-ed1-f50.google.com with SMTP id l1so13219995edr.11;
        Fri, 16 Jul 2021 07:41:43 -0700 (PDT)
X-Gm-Message-State: AOAM5317PduytVt6McC7vm4pFPzAn/0YhL2ad+GGFxJ/ImAJbf55Hcc/
        seC3OR8RsATbIo1J8SdgIMWFY/vNv7I3o1L7Fw==
X-Google-Smtp-Source: ABdhPJytXw32jFRKV/IdOZxQT/8gJgcEca+5S6hsSEebSUX+rUCDRaxZJRXWlatA7XKj4j5GTedS5nJA2LZGGpnQGiw=
X-Received: by 2002:aa7:da4b:: with SMTP id w11mr13827478eds.258.1626446502075;
 Fri, 16 Jul 2021 07:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-3-thierry.reding@gmail.com> <bdc42077-d1f3-f561-2e4d-647b5fceb7b6@gmail.com>
In-Reply-To: <bdc42077-d1f3-f561-2e4d-647b5fceb7b6@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 16 Jul 2021 08:41:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jSY-OLau3gLPsDL02AYaE_TySOGrd9-tNLFaYvLHZ6A@mail.gmail.com>
Message-ID: <CAL_Jsq+jSY-OLau3gLPsDL02AYaE_TySOGrd9-tNLFaYvLHZ6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] iommu: Implement of_iommu_get_resv_regions()
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 2, 2021 at 8:05 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 23.04.2021 19:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +void of_iommu_get_resv_regions(struct device *dev, struct list_head *l=
ist)
> > +{
> > +     struct of_phandle_iterator it;
> > +     int err;
> > +
> > +     of_for_each_phandle(&it, err, dev->of_node, "memory-region", "#me=
mory-region-cells", 0) {
> > +             struct iommu_resv_region *region;
> > +             struct of_phandle_args args;
> > +             struct resource res;
> > +
> > +             args.args_count =3D of_phandle_iterator_args(&it, args.ar=
gs, MAX_PHANDLE_ARGS);
> > +
> > +             err =3D of_address_to_resource(it.node, 0, &res);
> > +             if (err < 0) {
> > +                     dev_err(dev, "failed to parse memory region %pOF:=
 %d\n",
> > +                             it.node, err);
> > +                     continue;
> > +             }
> > +
> > +             if (args.args_count > 0) {
> > +                     /*
> > +                      * Active memory regions are expected to be acces=
sed by hardware during
> > +                      * boot and must therefore have an identity mappi=
ng created prior to the
> > +                      * driver taking control of the hardware. This en=
sures that non-quiescent
> > +                      * hardware doesn't cause IOMMU faults during boo=
t.
> > +                      */
> > +                     if (args.args[0] & MEMORY_REGION_IDENTITY_MAPPING=
) {
> > +                             region =3D iommu_alloc_resv_region(res.st=
art, resource_size(&res),
> > +                                                              IOMMU_RE=
AD | IOMMU_WRITE,
> > +                                                              IOMMU_RE=
SV_DIRECT_RELAXABLE);
> > +                             if (!region)
> > +                                     continue;
> > +
> > +                             list_add_tail(&region->list, list);
> > +                     }
> > +             }
> > +     }
> > +}
> > +EXPORT_SYMBOL(of_iommu_get_resv_regions);
>
> Any reason why this is not EXPORT_SYMBOL_GPL? I'm curious what is the
> logic behind the OF symbols in general since it looks like half of them
> are GPL.

Generally, new ones are _GPL. Old ones probably predate _GPL.

This one is up to the IOMMU maintainers.

Rob
