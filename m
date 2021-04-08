Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DB0C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 12:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2804361106
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 12:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhDHMkI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbhDHMkG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 08:40:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECCCC061760;
        Thu,  8 Apr 2021 05:39:55 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w23so2227195edx.7;
        Thu, 08 Apr 2021 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ldEtYBSo9icSaV7Ru0Hgvo2mRzkssFWyJBEPkEeuVk4=;
        b=UyR9UA0A0wJCi8qmeXIQbtws/BwABZpv5E3G4DfYWkynZ4AZSKJA0X07IxuY8kLZ2I
         bkTmOwhTtIfJV/jvW3KDqhl8ITs+MguxyZ6dNi7Pvn2oAddnmEtQBVAa6VAI2Coem93S
         KQf1hkxEUWYXaSkopNw0L8RLEZZjiqFSTs9CYdzDw1YUn3KHHXdVSxUhgTpY50cKKTtJ
         M/5YmdNBl20CiiTe/U7VHrE/KbNvP3DRM1eHxlfTaYjT3G5P0okTHhGK29rWshq1U5Ei
         yTpiC22lMYCeWX1V6ZSRv1Ph5tYFFajua6PyzQAKUzs4h7dMK/q41AojnxeRH2nj2sq/
         pFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ldEtYBSo9icSaV7Ru0Hgvo2mRzkssFWyJBEPkEeuVk4=;
        b=Nu7TtWupfTp8YyngtbE3D8u2OPsEvnO7CkcR5XmeL7TiaSLkhHxCH2CRQEDiubAmRQ
         0KApO8k3wMl0WZXgSiOCZd2wU/4CgwYmX6L2s1aQ3kDdDuaJ2fvLtr8FefV4t7sqWmDz
         scBLsS8C2tvFPHXqO0igN/UeLh5mRiTOwO9Scx0YbvEiY+nAxuOS3NmCtWdyO60o5vl1
         8QNVV9WqM9vmBZ54bsc/8xTpBZQb4Xs4AvvvByldpAq1XFk4XMBKuYJ0xmgiPpLhGA9a
         iwilee2yzw5fNID7ndmv+K41sO/X9c54YAHvyr6XiVTWrCbpkDbkFuq0CMENkM79sHNC
         7Bdg==
X-Gm-Message-State: AOAM530qAJxrO6kE9o/A+MGruRUXixg++w5w64B+eZsE+vCQjQRUChFH
        +Yge4r3HRyVM3ursczSGsoM=
X-Google-Smtp-Source: ABdhPJx18kttbZszeC9sn/xiBvZQ6GO5acnFzqNWeXNeymfbXJ3mMOGR5EBVk3Szl2zG0Ov2DT5xXQ==
X-Received: by 2002:aa7:da46:: with SMTP id w6mr11545868eds.30.1617885593751;
        Thu, 08 Apr 2021 05:39:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w1sm9660802edt.89.2021.04.08.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 05:39:52 -0700 (PDT)
Date:   Thu, 8 Apr 2021 14:40:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
Message-ID: <YG75urcXAb90Jj12@orome.fritz.box>
References: <20210328233256.20494-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WuhvTUWuu4INKIyN"
Content-Disposition: inline
In-Reply-To: <20210328233256.20494-1-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WuhvTUWuu4INKIyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 02:32:55AM +0300, Dmitry Osipenko wrote:
> All consumer-grade Android and Chromebook devices show a splash screen
> on boot and then display is left enabled when kernel is booted. This
> behaviour is unacceptable in a case of implicit IOMMU domains to which
> devices are attached during kernel boot since devices, like display
> controller, may perform DMA at that time. We can work around this problem
> by deferring the enable of SMMU translation for a specific devices,
> like a display controller, until the first IOMMU mapping is created,
> which works good enough in practice because by that time h/w is already
> stopped.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 71 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)

In general I do see why we would want to enable this. However, I think
this is a bad idea because it's going to proliferate the bad practice of
not describing things properly in device tree.

Whatever happened to the idea of creating identity mappings based on the
obscure tegra_fb_mem (or whatever it was called) command-line option? Is
that command-line not universally passed to the kernel from bootloaders
that initialize display?

That idealistic objection aside, this seems a bit over-engineered for
the hack that it is. See below.

> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 602aab98c079..af1e4b5adb27 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -60,6 +60,8 @@ struct tegra_smmu_as {
>  	dma_addr_t pd_dma;
>  	unsigned id;
>  	u32 attr;
> +	bool display_attached[2];
> +	bool attached_devices_need_sync;
>  };
> =20
>  static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
> @@ -78,6 +80,10 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, =
unsigned long offset)
>  	return readl(smmu->regs + offset);
>  }
> =20
> +/* all Tegra SoCs use the same group IDs for displays */
> +#define SMMU_SWGROUP_DC		1
> +#define SMMU_SWGROUP_DCB	2
> +
>  #define SMMU_CONFIG 0x010
>  #define  SMMU_CONFIG_ENABLE (1 << 0)
> =20
> @@ -253,6 +259,20 @@ static inline void smmu_flush(struct tegra_smmu *smm=
u)
>  	smmu_readl(smmu, SMMU_PTB_ASID);
>  }
> =20
> +static int smmu_swgroup_to_display_id(unsigned int swgroup)
> +{
> +	switch (swgroup) {
> +	case SMMU_SWGROUP_DC:
> +		return 0;
> +
> +	case SMMU_SWGROUP_DCB:
> +		return 1;
> +
> +	default:
> +		return -1;
> +	}
> +}
> +

Why do we need to have this two-level mapping? Do we even need to care
about the specific swgroups IDs? Can we not just simply check at attach
time if the client that's being attached is a display client and then
set atteched_devices_need_sync =3D true?

Thierry

--WuhvTUWuu4INKIyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBu+bgACgkQ3SOs138+
s6GnYg//akmYGEEg0hZ/wfT4gktVzczuNNA1sjPxwj34gUrKsdRHuZWFr4gFlzqw
LE/ObmCAkAHO99WeD0cXPbf/Eulr2QWzlNK8DZ2/YcPJgBg7lpnPcVYhro0ujvUJ
voTVDRp1NnFLesP6CkfLskgsSKRRIJBMf/F4D6EPSKl1NO4fFcwBFvAVcI0cnJpT
BFeSH6CeBfXYZpsNOOi+4wEPmZ3YQ2ejZ+r9/RLHv+vkqYTqVcVx7g+HOxJIEFpo
J9ygKJ8WG9NKwaF4x/PXozyIWnxyFTjLe5Cxscn999SM3HUkolb9ncNTMleZE7hb
94secQ4GBGR7VJcJrkkwSka5LpfWWqnyHSy1MdsCj2dAEHJSc5ELWiir1UmysKX7
i3LDq8zAJAIqS1gKU58UIDNIqDmfJBeP9bcUGH34YxlUTnAepRsFxB9nX5s5A0Wm
9MskrIRl3TXhedTQXSd4F3ih/QLuL7V0pMhuYdBCHLgUa0Djn2LLO+MOg3yzluvk
0AfzPp10SDMw20YZhDOlDOQf5IXJQxKiYiJYUb56wOAkmDpkwx5rTmYiVkoN4JRq
9f5IuqI+5K9L5vDWjaL+J57E7WDrs1c6OoRC200h9gPZnjUBHxDdJPmDrPovFOUm
JL0+kPRZNlvkipYSaBP3HHeUtpb88R+MAVKnlANCaejpO7cuCTY=
=OZ9i
-----END PGP SIGNATURE-----

--WuhvTUWuu4INKIyN--
