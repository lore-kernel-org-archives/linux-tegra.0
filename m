Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A158C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 309996103E
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJFSKh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 14:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhJFSKh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 14:10:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4081C061746;
        Wed,  6 Oct 2021 11:08:44 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so11373119wro.3;
        Wed, 06 Oct 2021 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DTgcaODMLq0FDZOTCg8W/z1Fr7XxKSIUscX7w76buGQ=;
        b=RsC8UScmhM19mw1WinyAleFhYLrVR7Gk3GliZHEQSHzxNPJkPFd61OGqk6FXJ44ozz
         qT0/VMvwcqKN8FnasbeAPYQqyMV/rsrfFBMkidUDnqKPnzXI3FWxx3QJwbsFq+k2Y1j0
         drtqGfyEjt1LJDtlcEBUSlSl4GbLePnASMLtINKAIyOeKKUGr3aKEKwUEUtFQDPrwV0r
         NCUwmA+XKXNw4p+AnzHGp0buNiwV681fvQvpzXj9JHCtGUt4zS/OH1S05115IxU6Bzng
         j8JkC6ojWs9MU1OlYebr6sVkSCo4jNTH45P0vAIw5Xmi5B5/9/BGn8siYp2QrVSAC2Qj
         rHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DTgcaODMLq0FDZOTCg8W/z1Fr7XxKSIUscX7w76buGQ=;
        b=ozKHJm3gnPpIq0PXhv12zsZbN6RUyMVAVo6bJNneEq4oQ0T4eWnfmwcz4mWmXSGM5W
         di4NujcMdIXITZA3+es4RJxJAPWaLGvJNTxv3CBcotGZ8Lb7wppYwiEtJKmoczgTDodX
         XaLGRBoKNcAqQTnn/foIdjfu5taO1bkUlsWFZmzkUeUWyLYtuG2u9+miiXXm5T42vsx0
         ra6XAgnaERXsAhcvWIX4/nOO5iMKrDcQJNQUPw8983yvUkwPb3NSsjuK+RlHqZwVvDNq
         bkQkrV4FaABN0mocMw4KVOIio/g8VTeh9U56Uo2kIUalTHn+t5Rt7Vop8WJxJX8P3HKE
         NPFw==
X-Gm-Message-State: AOAM531AqWF3sDxwJR8u+JVMMeUU6YVfkeUVJ6sKo3obYAkEVHiSSuZy
        G/8FeV9pztl2H7lcztAll60qnXn1plQ=
X-Google-Smtp-Source: ABdhPJy5jk7/29DVswHa34STgqGvvLSP8za9je7mjfhKchSht/aLzUE6uR0yrsmglRMKhmyeLcjmTw==
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr11736487wmi.98.1633543723399;
        Wed, 06 Oct 2021 11:08:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d1sm25183923wrr.72.2021.10.06.11.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:08:42 -0700 (PDT)
Date:   Wed, 6 Oct 2021 20:08:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Bump VIC/NVDEC clock rates to Fmax
Message-ID: <YV3mJ6hH6M08CTvG@orome.fritz.box>
References: <20210916150920.2136180-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="knCz4z4ruBPHn7pA"
Content-Disposition: inline
In-Reply-To: <20210916150920.2136180-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--knCz4z4ruBPHn7pA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 06:09:20PM +0300, Mikko Perttunen wrote:
> To get full performance out of these engines, bump their clock rates
> to maximum. In the future we may want something smarter but this
> should be fine for now.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 6 ++++++
>  drivers/gpu/drm/tegra/vic.c   | 6 ++++++
>  2 files changed, 12 insertions(+)

Applied, thanks.

Thierry

--knCz4z4ruBPHn7pA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd5icACgkQ3SOs138+
s6GztQ//ce6l8V7kt1dBAN03Tk2ITlc434/6Q8kmc1mbfTIcNFhFh2Xd5LqzdPVw
x8xuxiSmUGfwnSBmIt7527SoiQX6xJZnb5MDJNjTotHQEV7iXlV46eGPEC34WmdG
PrnbPdrGOYxIKvVRomsAY4V/BOUTjwUxX8VyCeXGRm6pgtFL/Cm+VQ+T7BVtZ13Z
JhsUA3nUIv8MVCZvubFNTacSidRLhPUs/IlaSZFPK7QQIXrkQ+VGTXKDFBN+c/yf
oaHQNc9kPlCr8odOG5KbdL4jJfwOuOvRGkKfbXtMpp3fkygfxRE/nnwi+McHdEfG
YvQjZ2vOa2rRx1AcFfRMy9IK72CY9ZeRCUNNjlqoCYeGGUs2ScO1qxb8j8Iz33oK
2pZaA5Ewi0ygmmJBnZtV5xX2f48w7ijq2kzJeMUNn1QlLdgNR7XbgRcP1zM0Oda5
BZcetENg61O+QiMwb8jsX6lYGnOQlul6YsTVWsuiLVGpFt7356PXfF/VP54299oy
j1DPKdLFD3803EelRgmEQe67qjshGt3iB48vKBGv3xlEUb70V/csd70DzC3CUaUN
SF0tGS+GGchEF3t+t7+zQNSwh/sw5q6wZNVFKscBxDKotQDNoVqce+9hyMSZkjEu
NNhXWK+2OjODfEeU18IeBYga1Xmf1U2s3Pk3rGKK14bwh7MBPwM=
=12s0
-----END PGP SIGNATURE-----

--knCz4z4ruBPHn7pA--
