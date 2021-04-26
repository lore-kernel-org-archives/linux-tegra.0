Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A27C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ECB9611C0
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhDZHOt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 03:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZHOt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 03:14:49 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1F0C061574;
        Mon, 26 Apr 2021 00:14:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i24so4832584edy.8;
        Mon, 26 Apr 2021 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o5YosDAqgcHK5JSw+rSfNotOSlvHjgAK1HQEBC6w8O4=;
        b=tpKrec62Hw8s3i2pcRV4bu4HKWAkT78kqycNK/3PBanAEoLPhbO+yvd0UzcQ1fm9wt
         FlzOgdN2WJ0AyIubw8syOmrqxxtHRN8nK+9G5u0/m38Nkj+9r0oEXSFy6UzbuEbTzMJ6
         l6XI16uici4FlPgkQx+ihGlcHkYjUhUORwTnJkLxYPLBpBudUfRQbL4fGpYyTs+nP+1j
         ZVE9J6DJ00p2+ET5vDUiaL11TyJMxrclw2iktGi+AhUqTqlqu8/s1ZE0WbtxMMxziFrP
         ZvsDDpxh6JunXik8Rg06C6EpcnTql6q74mQrlCosRwxsvaa+BRLDlS8XCNZ/L2lptjrw
         UEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o5YosDAqgcHK5JSw+rSfNotOSlvHjgAK1HQEBC6w8O4=;
        b=oN+FOAxPRnIwwyQsAqbTfoIus2AzgJ/hcKHvl14TplSAHFHbPSsUwyWmAzYZb1Ro2g
         bdtvcchs7b9Gy37MYPdF6Bl5hs1KnrLP2h5npiis2g4e2yzdImAANmy/T0zs/kCVy7dO
         yk5Q/AMonTC+h5bOW7f6+vNmnzN/DsHn916YrxHjzNXw8j7jBfzcNps1kLaCggdNnvbt
         fSdHHAAF7rO5c7uiJaEpeSMRpVX/3LQlldfba+B6G9d5aGZyeAYy+BLDF+Sy+RGMGW+W
         yL/s1x0L4R92N17bQNN4bFB0YuBLuFADiE1VsCX0W3jnSgzvBh7CocZUf00FJHbec5Rj
         pQkw==
X-Gm-Message-State: AOAM532IC363WBlN1zkLNg9E/uQt4ygoc4n65l5PPz6MjqFj1gT1TGRD
        e/rEySHufX7r5zbRvdiHRVmBhzg7yMQ=
X-Google-Smtp-Source: ABdhPJwoKjHDcmBY3hkB2/ZQchvIWgXSk5emYdxx5mRVLZZ6iEkE33viNcicn1ga/0UHiUMxMY8Log==
X-Received: by 2002:a05:6402:40d6:: with SMTP id z22mr19357889edb.275.1619421246066;
        Mon, 26 Apr 2021 00:14:06 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id da25sm6607998edb.38.2021.04.26.00.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 00:14:04 -0700 (PDT)
Date:   Mon, 26 Apr 2021 09:14:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
Message-ID: <YIZocTpPPM0vF4Wk@orome.fritz.box>
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210328233256.20494-2-digetx@gmail.com>
 <20210401085549.GA31146@Asurada-Nvidia>
 <50a7e4c7-0e72-534a-a317-366e455213c1@gmail.com>
 <d01ccde4-5fa9-2aa7-c28b-b3899cc54c54@collabora.com>
 <724e683f-5317-cdf7-7351-fcfd42b7b607@gmail.com>
 <5ec2be61-a70e-e3b1-9267-414793c32a04@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8nVwfCHntELqmzZ3"
Content-Disposition: inline
In-Reply-To: <5ec2be61-a70e-e3b1-9267-414793c32a04@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8nVwfCHntELqmzZ3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 11:27:10PM +0300, Dmitry Osipenko wrote:
> 23.04.2021 18:23, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 23.04.2021 18:01, Guillaume Tucker =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On 02/04/2021 15:40, Dmitry Osipenko wrote:
> >>> 01.04.2021 11:55, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
> >>>>> The previous commit fixes problem where display client was attachin=
g too
> >>>>> early to IOMMU during kernel boot in a multi-platform kernel config=
uration
> >>>>> which enables CONFIG_ARM_DMA_USE_IOMMU=3Dy. The workaround that hel=
ped to
> >>>>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed any=
more,
> >>>>> revert it.
> >>>>
> >>>> Sorry for the late reply. I have been busy with downstream tasks.
> >>>>
> >>>> I will give them a try by the end of the week. Yet, probably it'd
> >>>> be better to include Guillaume also as he has the Nyan platform.
> >>>>
> >>>
> >>> Indeed, thanks. Although, I'm pretty sure that it's the same issue wh=
ich
> >>> I reproduced on Nexus 7.
> >>>
> >>> Guillaume, could you please give a test to these patches on Nyan Big?
> >>> There should be no EMEM errors in the kernel log with this patches.
> >>>
> >>> https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D236215
> >>
> >> So sorry for the very late reply.  I have tried the patches but
> >> hit some issues on linux-next, it's not reaching a login prompt
> >> with next-20210422.  So I then tried with next-20210419 which
> >> does boot but shows the IOMMU error:
> >>
> >> <6>[    2.995341] tegra-dc 54200000.dc: Adding to iommu group 1
> >> <4>[    3.001070] Failed to attached device 54200000.dc to IOMMU_mappi=
ng =20
> >>
> >>   https://lava.collabora.co.uk/scheduler/job/3570052#L1120
> >>
> >> The branch I'm using with the patches applied can be found here:
> >>
> >>   https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210419-n=
yan-big-drm-read/
> >>
> >> Hope this helps, let me know if you need anything else to be
> >> tested.
> >=20
> >=20
> > Hello Guillaume,
> >=20
> > The current linux-next doesn't boot on all ARM (AFAIK), the older
> > next-20210413 works. The above message should be unrelated to the boot
> > problem. It should be okay to ignore that message as it should be
> > harmless in yours case.
> >=20
>=20
> Although, the 20210419 should be good.
>=20
> Thierry, do you know what those SOR and Nouveau issues are about?

There's a use-after-free (though it's really a use-before-init) issue in
linux-next at the moment, but a fix has been suggested. The fix for this
along with an additional leak plug is here:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D240569

I'm not aware of any Nouveau issues. What version and platform are those
happening on? Are there any logs? I can't seem to find them in this
thread.

Thierry

--8nVwfCHntELqmzZ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGaHEACgkQ3SOs138+
s6GG8w/8Dru/37L+I4463P/zyNgJnBU4GvCHytaoIIoRaH6Ku5fg2O723riz10ES
Sq4K03sPrtRDVhgZxUPF2wYP6yI4e5R7D/2Dc11Yren8VDJHeoafikpzb9LWUEJ0
xAVKj5dDtAJlCAMmdnHTtOxNdl6UB7d22hMY0fXlqzc7Grk+JYIey3ZXLUz0AHEq
OCvOxHBmDzSVMYKXR+It/RYcmLC3PKCwHJe37DVF0pa/pfR7vBzCVl/xVuKQ0Ww2
M8+sm4ilfMel6eNQvsDFzrAZNXiPFCNArVETJxWGl3Mq+PndBewozyn6GyLqlx74
Tnqr8wtsI4TgcEiOqaEWJC1/NGOGDat14OGtqwCOPZlzm5QwUjOCfo01tJn8vD8R
/47l6gK6rDp4oQEErGuHpnQgk4eLLJ+2M/CN6p5nXE+ArjuxNvz2mmoBpENj0jSv
ShsT9h7CrFtwsauOkOlEDfRpUUstZz79m51mQaWRMR17CFOiNsLH/08Qyoyo1CSa
ViNB9Uo/pKl3l2DYG2LtpHoTt76vpgAiHCyRRuW4ij6a3gVevsnXHSmHNKKRAsMi
garQt5W+iyjdgosEQsVEcfLjm5ZNqXyoYKmn7UnKDPmZ+yeRLy8WBHyb2DnzAAb3
1m6AxV/uzkUQVb+xFbrpSAmx96VRgCj/484RO6zt4HdfLbxsK3g=
=o6eo
-----END PGP SIGNATURE-----

--8nVwfCHntELqmzZ3--
