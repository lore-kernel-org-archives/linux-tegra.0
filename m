Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24712C43333
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC966023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378468AbhCCDbh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:56740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1447175AbhCBMvD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 2 Mar 2021 07:51:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B6664F64;
        Tue,  2 Mar 2021 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614689420;
        bh=WmVH+zXDxgTi+YtrZbgW5+vNGhWdHs8/AxaMBHbxCdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JOBXeQ9VgXV/INC2xKi/GmKK5Jz8qBkQE1lP2pI7N7hra2/rj3o82DhBbnmejOsD+
         kS3mZQmhKgrVKhM5r5CkDmzN72lwR8HHeEx/nOaoukXsrnWGrd9kRF8HeUN+1A/Fbn
         LHlWGVaY+jiXAyxfGUsnshRfCYHVUv2BFKKGDt85aaO7JSbcLc1z2AiEJtn9wQoQBb
         VdWkv6Njxgxdm1EcBOGRJM+Asw4knR4E12b6uMezB08a+u75W/faj5qrkcChDq/rjB
         1tadEPDuDCjI01DDPQKS7Rw5SyRrOgFk2PAW9lTZ5IzvuyowpogOYOTkMLnR6mF9ER
         8SyvF+No0caLQ==
Date:   Tue, 2 Mar 2021 12:49:13 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210302124913.GC4522@sirena.org.uk>
References: <20210302092712.310705-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <20210302092712.310705-1-jonathanh@nvidia.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 09:27:12AM +0000, Jon Hunter wrote:
> Many systems do not provide a DMI table and on these systems a warning,
> such as the following, is printed on boot ...
>=20
>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
>=20
> If DMI support is enabled in the kernel, there is no simple way to
> detect if a DMI table is table or not. Note that the variable
> 'dmi_available' is not exported and so cannot be used by kernel modules.

We could fix that, or provide an accessor function?  Or only warn if
we're on an ACPI system (which we can check from a module).  This really
does feel like something we should be warning about on systems that are
supposed to have DMI information available as standard.

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+NEgACgkQJNaLcl1U
h9CQDAf/Z48cJOMLdkoZSxTL6NDL7fNrb3cLcBfyh2VSzLXYRiPg9xSEGtxMEtZH
Nt77fAQr36jGJj5+ArLxHIZp3t0baGveNLoWOLR+0V2nq3ySxgUfKElwV5gQ/Xwy
NJLtb0s9AzeYnM6docqPn5mdfTHKidIEVtcdprYrPo4TGT5XwUayn5Nj037keTda
HFDHscgSyFqEwFEQs6qwAHfNocGEakSbtsmFD+tC2GCupq1gx3pJm1i/rS50b4U6
jiEj+pP2OPhGKj103UKc+wNByNfGPVo5p0fhKqrklHnAFC1B4ZXXWHqU7Xa/soVq
v1Ou/xkvrjI+ckyeeLLDpPMx2bjaYg==
=zWGP
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
