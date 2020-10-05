Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1D3C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A85052078A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBz8kZzF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgJEOWm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgJEOWm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:22:42 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E13C0613CE;
        Mon,  5 Oct 2020 07:22:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h24so5662683ejg.9;
        Mon, 05 Oct 2020 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e/lZhaxCRr5BovF0A1Nmo/njVQx8pABrvOL8ijbfSPk=;
        b=MBz8kZzFan8wo1BK+ir1/+F+2M4mk77f4qpC5OzgVCnub564dYUiB0OFBm+IafOyBA
         2EL/OKsv1KEe7plP6id+uPtrxMZQKR3cCmZkRQysULFs5WTlWwmhRXd1eIFZIeyPcIs2
         pmP4ivSVfIpE8UqHnJ95BgapkT+0npSie7s1y26fbPATovMxC/By3MFOTGngAYOYoeeX
         9RnwDuHg31sibSbnGTcRbTY2MCecsbT2Cjw6OR5dyh63fskNA3xSHVBztDATv/UhZlo8
         o//2v1W0opCe1aAtlXn0bShrFiGeZGqbRMIfGxWzN+4zL9JCUd/SKqoaIVv4AQ9LKgXC
         oxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e/lZhaxCRr5BovF0A1Nmo/njVQx8pABrvOL8ijbfSPk=;
        b=FhrFRJnaV5Gjqo3NZH1S7CyAn3ge+QS73C1GpcdpghkcUk6JtIkVi8qxC6iPlirWtI
         24SfNqzn+ArvHEiEaqVDXiVfKV+Jk1tmdnk6K7wF8UUlOHdJpxXjpwDogOTTj0STOflW
         9w5ddAJAHLPwaC9XUGLx/9P4AZjfCQA4dxu5vvDh37TlB/saKQu4ycuCIhrjSk6hurU1
         BGsWTab/v+mo5vgEVajna2hx72aLHynpxOlExHCj5WxxLeil5pQzvLYHVsJpMRpmEiZz
         JYW87EK25XRo0gEgId/d3fepigtp6lGED+pIRfUbJhYI05i7gHXhZkcp9XWz7TAb5iDW
         QJ+g==
X-Gm-Message-State: AOAM532+SDYHhphsrMTMkGmD5F0QfFmK0I8rQ84DzS8r+FEOK8mMmdsV
        IQu5StrSFroQCG7Qp8ZMvKA=
X-Google-Smtp-Source: ABdhPJyq2WAXeuWpH0EsM0A11GYqoWFcHmHPoW6C+LT7kuXTUkDowJ9pc1oN4eOI24q0fsaT1wRkwQ==
X-Received: by 2002:a17:906:5fc6:: with SMTP id k6mr5709468ejv.494.1601907760363;
        Mon, 05 Oct 2020 07:22:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i7sm8566566ejo.22.2020.10.05.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 07:22:38 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:22:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005142237.GA628746@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
 <20201005095351.GI425362@ulmo>
 <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
 <20201005111547.GQ425362@ulmo>
 <39cb0056-1447-2232-d33c-adb17114740a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <39cb0056-1447-2232-d33c-adb17114740a@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 04:28:53PM +0300, Dmitry Osipenko wrote:
> 05.10.2020 14:15, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Oct 05, 2020 at 01:36:55PM +0300, Dmitry Osipenko wrote:
> >> 05.10.2020 12:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Fri, Oct 02, 2020 at 05:50:08PM +0300, Dmitry Osipenko wrote:
> >>>> 02.10.2020 17:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>  static int tegra_smmu_of_xlate(struct device *dev,
> >>>>>>  			       struct of_phandle_args *args)
> >>>>>>  {
> >>>>>> +	struct platform_device *iommu_pdev =3D of_find_device_by_node(ar=
gs->np);
> >>>>>> +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> >>>>>>  	u32 id =3D args->args[0];
> >>>>>> =20
> >>>>>> +	of_node_put(args->np);
> >>>>>> +
> >>>>>> +	if (!mc || !mc->smmu)
> >>>>>> +		return -EPROBE_DEFER;
> >>>>> platform_get_drvdata(NULL) will crash.
> >>>>>
> >>>>
> >>>> Actually, platform_get_drvdata(NULL) can't happen. I overlooked this.
> >>>
> >>> How so? It's technically possible for the iommus property to referenc=
e a
> >>> device tree node for which no platform device will ever be created, in
> >>> which case of_find_device_by_node() will return NULL. That's very
> >>> unlikely and perhaps worth just crashing on to make sure it gets fixed
> >>> immediately.
> >>
> >> The tegra_smmu_ops are registered from the SMMU driver itself and MC
> >> driver sets platform data before SMMU is initialized, hence device is
> >> guaranteed to exist and mc can't be NULL.
> >=20
> > Yes, but that assumes that args->np points to the memory controller's
> > device tree node. It's obviously a mistake to do this, but I don't think
> > anyone will prevent you from doing this:
> >=20
> > 	iommus =3D <&{/chosen} 0>;
> >=20
> > In that case, since no platform device is created for the /chosen node,
> > iommu_pdev will end up being NULL and platform_get_drvdata() will crash.
>=20
> But then Tegra SMMU isn't associated with the device's IOMMU path, and
> thus, tegra_smmu_of_xlate() won't be invoked for this device.

Indeed, you're right! It used to be that ops were assigned to the bus
without any knowledge about the specific instances that might exist, but
nowadays there's struct iommu_device which properly encapsulates all of
that, so yeah, I don't think this can ever be NULL.

Although that makes me wonder why we aren't going one step further and
pass struct iommu_device * into ->of_xlate(), which would avoid the need
for us to do the look up once more.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97LCkACgkQ3SOs138+
s6GUWxAAwst4IWu/G106iJ18+V0k/VEU3oYZtPoGitMHGJworwYhaqmAocTs2CJ5
6QftbaeJtFwiYhpWjhm+u79QgtKtYHMQH162UjeGDiXVM9fjIMf0+1oBnmd8LKkw
MxzaiYSvm5QzFQe4Ib/KzpNutCzgLncuf2VDPpG2XvUtAPDaj25hRQH89orrbbVG
RzfcHQ0p4fsz4t2IQgJf7aeMzU+NrvvFBRD/FEI8LfqMfuGehLecbjEi1LKnrjbR
coz/2Kn+fjkjdC8H24XLvSK3U5ifRd0Ck3xdo6OAe8WE+wXdXlPqY40JzNLjfoDw
PBnp4YGw2Qy1fQ/oFwEyyW5MeBUMe7IcoAAGES7p8Z/KuMNvEDa86n6qoEZn8/fx
P7J5jyT3L1fJAnASD5P+L3I5TwTENOrdG0XxZMUVCH64GgkrdtN0lL/QIlEx3mJe
Xr2VAauFsQgqFw1f8PrFQFiXX/0RU+vFE7ucF81okFKpvuqZdouwc8ye+AKf//pF
+iNxHmcRePB4GSe6hqO84EpgTcvpQo6RfA1ECG5J84cXOE4TIcefy7WT1K3vatWv
l+U/4Z+B8HCP5P2Bo0BsOO27/nOdkv7pMKe2XvrsAuwWSGZsxJRSYlA+Rr1vE/fy
nFrCH8cy94ewqryTQqz7MplvRG7CnQtivYdgSPG5BxYbHxJHmR4=
=IQAU
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
