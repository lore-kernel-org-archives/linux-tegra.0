Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03990C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 14:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380495AbiEEOTT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380579AbiEEOTS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 10:19:18 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57311572D
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 07:15:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so8992301ejd.9
        for <linux-tegra@vger.kernel.org>; Thu, 05 May 2022 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G0r63EWJGrRILahj/sz+EJV3EOcaqYNjGWpoFKqbQ90=;
        b=jgomm+QM9e2YtsSnghfam7Jo2Vy9nk+MzyosB8qkB7Q4XTv6CFUSq5Qchwh5bqndFo
         kcWYcsCLhG9W/XOKLjWtrhw0wvPv83ih8E4EX7PQ/kBVG+i8Zk8eRRV6DBEcvGV2GU7a
         GjasK1Z7nDvuyQeZFErKNACv+iSX/xV5rgl6RllK0WI9RYt4D8/xl2BXYpDjrhbpgLHh
         tnmCzixQEvlJbxc9xeqYJV8kNDh2OAN2RsOYxPxIVIAiDsuTaXsoIPI9MNUZwaM21fyS
         xWVcTdt7I1s+Z/RVl61LdFZDpgic3tDrbd1GCdPItXLD7p4kpy+lPW4z3ZQ3xv0iAvXu
         TDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G0r63EWJGrRILahj/sz+EJV3EOcaqYNjGWpoFKqbQ90=;
        b=yatWmcmwKmtGViBcRXnVj/NqI4DB3utjjLOgtAWFgcfqhnrAPxCbEbWSkh5zuFt/Xh
         n5v8miG5jXkl3z1FDa4X+5IEIXYmqFxMLZdQv4hqGvtU5tsp0Ykxt2+l4So2DbfyOVX4
         AfJsWFM9+GsfZ8qT5AaFaFKB+rv114pOtJ/6sBrvEjp8nFPP19NSxOwOXGSlV/jcO16+
         SyuiEidVDLOALAfOePemg3+rv9Vz9uYu80bh8VdRxCsVTqwnjFzqMiQXyDk1Z8hHTKpF
         htriZ+5pdo0pVE/5EZGkvjkKephTN/X8cJ2wp3vRjAgKtnGP8dysmQzNmiUAUaommLIe
         0Kxg==
X-Gm-Message-State: AOAM532uf2Bx5RtdbffnwOPKHta5iyR0/671W2/kmksd0D3uEbX28U6C
        PWGCcBerh50xGD67BWfxIdLq7u0cekU=
X-Google-Smtp-Source: ABdhPJxeMIlUXQL1s7qEc469SokpB+SnGYy3DObLLLvhCHkHuF4PeB6ZEUpydG7tZafDSLBy0Nqfyw==
X-Received: by 2002:a17:906:5d11:b0:6f4:a04:6b44 with SMTP id g17-20020a1709065d1100b006f40a046b44mr26261272ejt.167.1651760133375;
        Thu, 05 May 2022 07:15:33 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p4-20020a50cd84000000b0042617ba6398sm911046edi.34.2022.05.05.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:15:31 -0700 (PDT)
Date:   Thu, 5 May 2022 16:15:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <YnPcAaQTMRsNEQYJ@orome>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YYtfX2oWqzAJVJlB"
Content-Disposition: inline
In-Reply-To: <20220429082243.496000-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YYtfX2oWqzAJVJlB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 10:22:40AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi Joerg,
>=20
> this is essentially a resend of v2 with a Acked-by:s from Robin and Will
> added. These have been on the list for quite a while now, but apparently
> there was a misunderstanding, so neither you nor Will picked this up.
>=20
> Since Will acked these, I think it's probably best for you to pick these
> up directly. If not, let me know and I'll work with Will to merge via
> the ARM SMMU tree.
>=20
> Thanks,
> Thierry
>=20
> Thierry Reding (3):
>   dt-bindings: arm-smmu: Document nvidia,memory-controller property
>   dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
>   iommu/arm-smmu: Support Tegra234 SMMU
>=20
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 23 +++++++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 ++-
>  2 files changed, 23 insertions(+), 3 deletions(-)

Joerg,

anything left to do on this from your perspective, or can this go into
v5.19?

Thanks,
Thierry

--YYtfX2oWqzAJVJlB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJz2/4ACgkQ3SOs138+
s6HP/g//eeY9Yqwe2/A5JdXXX9QKOjJ6MRJ1VKXus3HLEWVYfWJWEbOb1SFLtfof
9gJam7J1Wf8zPGHCJs4J+v4X2vasY4JQcfGaJRkmXocoVbzScYX9T8YwNzH5vaWQ
DGQRmTOdRyZys/fVmr/8CYHPMS00uSxQrcp83drjSdh7Lpb7Cl3wfUQ9KXwsSW70
FIXZ0OCNi/NotlkKnkHKV71kX8B5GYTWv5RvJYVUPK8NielahkV4ZxjpZaYVHUQU
mDfTTlzJ1yLfUSPOibffiKdO2pIsPGwYvpzsQ8nq10I2H9W/34NpYhBzRNy/GLfW
tgDbqhUO9x3Ap96fD5AyZvQjJloVM+xPiQWh7qb5n1kgkBcnF3YGK5MM97FrhuDo
2NbTUnZM9y1e66Y/+VDrnhYzTvma4NDtsi5hWjzwmnaUP6Vr8vnYUYyQg3UvEbXi
Go+BJIUl4wfobVqNYHnV+7I0ngXVW/upnrmcoC4gaMwxtV4WdAiiYR0YfJXVwWTw
VTRFSmErt/hZ+QW6WZzyDoe5kv45sMHQHx2SlcmOzrx387pBZasqGL8YLzmFF4ZZ
auvNOH1FekCoR+MfP/U30eBWb0sgXrBVA6CWC2jOtS5VuCPm8TP3B7kn4Kidvaj6
Va8Hwp2T0Fh45nG4+eeibkwCnoSc/8XeW7+hQ5rz6v2koorR56k=
=DXYz
-----END PGP SIGNATURE-----

--YYtfX2oWqzAJVJlB--
