Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAB4C433E9
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8814D64F9D
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbhCCX7y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 18:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345548AbhCCS2b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Mar 2021 13:28:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821F3C06175F;
        Wed,  3 Mar 2021 10:26:04 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d15so9543833wrv.5;
        Wed, 03 Mar 2021 10:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eYt6ZSK+EgInFtZhuqC1D7JLS9QReq7n15THZCTsgVk=;
        b=So6UcJhCtr+TDGsTKMYMGcEgIvQ8qXS4pXDKMPVBvrdP/soN6tyXdmr6H1WwEx5bx2
         gDPW3JGvrUYYsRYHxDlhwWpKL2xFRD85s4z/RnPDTafKD/rMB2Wtyu+Ax4GjZXWLjoAD
         ahEgKEfGQEmNtYLcB5l8ewTYob5tz0S3ywVva2YE/+AJGyetg4W5IyzC5FJfje/q0pLK
         tPCm8dcSDOG5WCSVIlcSEfK0NC+XXJX5H4nMp72gNHNrEEro7BEIVgQ8x52+L0xypZXF
         vKDz+0zzeUhqZwMeVl8EkICSriB8JJ+AWWbmnl6vN0PT15NQIRJGiiGwsxJ+0jTH3w3Z
         XJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eYt6ZSK+EgInFtZhuqC1D7JLS9QReq7n15THZCTsgVk=;
        b=pDeg+6hILww59Hylx/bm09NRr0XsjfIoON/5CTl1bjUVmY11tJ6+ApCBaBII1lwWei
         OFK1fW1kfG3nWoO07srYe8+rlPiIeZ4+9eJ9OBAje5sI8sH36A9/nnOugC3Unj8EdjFa
         JYh9VPLiLpPciYuVRVr9K30nU2THmecS4kLUZb9/uryAvalF6J75LU/ui/PDcFA5ascu
         7oKFbYbzuoof30GtI1vZemypMXC8o9yKLu9v9et6rbpSkxRWo4ZOh/tWMYncjRuw18Cq
         2q3/EbteijND4zXpFIlXzffg8P+jEuUTGUmMHGT5pr4GSD+dD8pJ54+C6/S4JBv/p1lS
         P8hQ==
X-Gm-Message-State: AOAM531LCLXO8GywDSv2lu9j76eIQCa1ETEFj4RHmOVUZoIKjNkUXoZf
        b55KjofT+ZEQDnzH+rHQdRs=
X-Google-Smtp-Source: ABdhPJxHDJsAroLvERXU4YkzIwdRIoOC7p/qdk/y2QIvgCLRbM4GrW5br5tfym/QqGE47oBEkp/Dbw==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr16973744wrm.37.1614795963156;
        Wed, 03 Mar 2021 10:26:03 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o11sm13549883wrq.74.2021.03.03.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:26:01 -0800 (PST)
Date:   Wed, 3 Mar 2021 19:26:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, guillaume.tucker@collabora.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <YD/UuLSeVTLMh6HG@ulmo.localdomain>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ou0ZJPXLgmnnIia"
Content-Disposition: inline
In-Reply-To: <20210218220702.1962-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--4ou0ZJPXLgmnnIia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 02:07:02PM -0800, Nicolin Chen wrote:
> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> tegra_smmu_configure() that are typically done in the IOMMU core also.
>=20
> This approach works for both existing devices that have DT nodes and other
> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
>=20
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 EMEM address decode error (SMMU translation error [--S])
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 Page fault (SMMU translation error [--S])
>=20
> After debugging, I found that the mentioned commit changed some function
> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> client before display driver gets initialized. I couldn't reproduce exact
> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
>=20
> Actually this Page Fault is a known issue, as on most of Tegra platforms,
> display gets enabled by the bootloader for the splash screen feature, so
> it keeps filling the framebuffer memory. A proper fix to this issue is to
> 1:1 linear map the framebuffer memory to IOVA space so the SMMU will have
> the same address as the physical address in its page table. Yet, Thierry
> has been working on the solution above for a year, and it hasn't merged.
>=20
> Therefore, let's partially revert the mentioned commit to fix the errors.
>=20
> The reason why we do a partial revert here is that we can still set priv
> in ->of_xlate() callback for PCI devices. Meanwhile, devices existing in
> DT, like display, will go through tegra_smmu_configure() at the stage of
> bus_set_iommu() when SMMU gets probed(), as what it did before we merged
> the mentioned commit.
>=20
> Once we have the linear map solution for framebuffer memory, this change
> can be cleaned away.
>=20
> [Big thank to Guillaume who reported and helped debugging/verification]
>=20
> Fixes: 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Guillaume, would you please give a "Tested-by" to this change? Thanks!
>=20
>  drivers/iommu/tegra-smmu.c | 72 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--4ou0ZJPXLgmnnIia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmA/1LQACgkQ3SOs138+
s6HVGg//XRVrMcKyH+kjocZCLqbtvtkJkZW4MT4aOg4HGwc1axFrRTMlHVOWPn3j
dcMwCbAVNb/ClbkvxsZ5bxbK5/ZnSR2ZQGV9srukln9RWKO+255jlM925qVJ5Yzd
UNweJ9ToVMeNfkSeU9VK8JnpnJDF/NLxevydeX9UJQVieclLKhjW6dcASIc/sRGI
X4E8dqtO/sbj5712Qj0A2p7VnrYQ+02tyipiXI3p4KSRiMWArCcLqLs0F9ccv47+
mEsHB7P8+nstkiatna0jC4xzdBeIznxVwkIYYr+TcHLCrycljQh56giXPN0TnQn0
7xplMX5OHAHFhJyqXgOw4ZeuXFuc5uOjNFcA6fGJ5uCyOhpQMZhoFQRFxkGy8edc
bNoLiHjFO2HyS7YXdkzscj15xTS0wq/aKLFMo7I9AJedHnNnfzHEhzcpQmg1eIFl
svEAap+gQFG1X0Bc5DC8puXRWwkHwrr/xCcfDp53dQirjIJoOQDo7usVtQRWLi/0
rNWU5r/HQ04pqJZcdEVpT+VmzwcOZoLcQCHjDW2ohllPq8hZGfldaW9OZzXaveKe
UMikX5lx3ANPkTKTxxq7rfsbzq0UIfII4o391Vdzxk83YIvDbENrfx3tl2LGxJsT
4O00KcDGgdgfy8oxcy22+TbhdeSdC0MDo/CRLGzPLnwxdMn1s2c=
=66rd
-----END PGP SIGNATURE-----

--4ou0ZJPXLgmnnIia--
