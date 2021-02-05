Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C47C433E6
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 18:13:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED3364E58
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 18:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhBEQaZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 11:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbhBEQ2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 11:28:00 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD79C061574
        for <linux-tegra@vger.kernel.org>; Fri,  5 Feb 2021 10:09:41 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id y17so6591183ili.12
        for <linux-tegra@vger.kernel.org>; Fri, 05 Feb 2021 10:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iSGUYlU8VNNBRqdy8VTbbGEf6C9L8ldY8pady5boXSg=;
        b=RxKYiw8totJBxLt4stxBy2dyUyB9sJ0jmzGh8PkB7ACuGouoOTKMAk8xJd7ihDYb4p
         swCGokFtdsJFZIApXjDDxuXjqzJBCNCb583z11gbjihPqOQAFDlk+Aj15Z+mbbd6YulP
         E2vF42SyEOdcOi9vxfudsZUqoO9hMRB+YXzQ/ell/SyEthLIZoIUUBmWXXyOnbaZCMXL
         8cRPxTMn91Lr7/7axV4kOmfrWDJe3q2NXAktX3W/Es0UxrQbCDCNSpq4OXBiy82aiCFI
         qy9I+vi8jauo09g1meY1XvuPCQGO/zbMgX/DQzcBgiuk1OMd31sV6rV7HDpl4FxWHIHq
         LbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iSGUYlU8VNNBRqdy8VTbbGEf6C9L8ldY8pady5boXSg=;
        b=ma2PqNljdglfb1xy1iMWOTOACEf57KE/hUQuvYenyH973XzuEFl3SfXLo1vjNQC/i6
         eusulA432g0y4U9yJVZYf4qyjZW5KovjZLKjjxSh19zFRgnisf1ZnvekUoo3ui371iGj
         T7EngPn+qu0rM2b9VNtNdG7DZsNASoEtWqrrOjsde46w8ey9XpblSLOzVM+VNk3Fz+Df
         Mzfu05fn+qVBIvPCeHuDm1sGJBjchmb1C5a9atwJhuyvCEvq36dH3X6s9CzFQFNAUotm
         HTuzm0CazFi0Bx5WZ2vXNFtjk42gnz4xawwpIy8ht+qmaoRhzXDZ8wM6ZRJGp5LU7wm3
         KsVw==
X-Gm-Message-State: AOAM530JggDfgE27vz+Z6POrdn4Xa+ndl5zhZnuWhEKXj4Z9ish0MiCC
        OEThcH62ZKcZMG6k8rHOpBBPMyZAQY8=
X-Google-Smtp-Source: ABdhPJzZkAOKkPP3gQoJocGdN3LwzrekFIyLicBg7Fyti46Y1H5Cc62wl2lepkRlVJDiJTokOAdnRg==
X-Received: by 2002:a92:1904:: with SMTP id 4mr4824080ilz.201.1612548581360;
        Fri, 05 Feb 2021 10:09:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r11sm4343881ilb.13.2021.02.05.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 10:09:40 -0800 (PST)
Date:   Fri, 5 Feb 2021 19:09:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/11] drm/tegra: Annotate dma-fence critical section in
 commit path
Message-ID: <YB2J4e8gpIt7CINk@ulmo>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
 <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U/4uM/neOvp42j8/"
Content-Disposition: inline
In-Reply-To: <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--U/4uM/neOvp42j8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 04:29:58PM +0100, Daniel Vetter wrote:
> Again ends just after drm_atomic_helper_commit_hw_done(), but with the
> twist that we need to make sure we're only annotate the custom
> version. And not the other clause which just calls
> drm_atomic_helper_commit_tail_rpm(), which is already annotated.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.c | 3 +++
>  1 file changed, 3 insertions(+)

I assume you want to take this through drm-misc? If so:

Acked-by: Thierry Reding <treding@nvidia.com>

--U/4uM/neOvp42j8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAdid4ACgkQ3SOs138+
s6Fy2RAAtfMRIMDsAm08wwhw0p0iiBWuvDMIJ1ESzdAB4875oJ6ShXp7IC5KRTqY
wfcSbKvKQB/Ze/aqwDAutJQkWVL0oGV6vW8ctUvZMWeAdLnpbFIIOhErBL8JAKfi
NRs76VV/1GePrn2YnrhkYgyfxpZh8/kMfkFpQsC2/2cFdXiU7p4Mnie0c7QeXfpx
DQa0gi0ItWyrGXY++FAdhQW4tPYpiWIS9G/VZYhZ8+exMCx4JDgWKaoP2KwVlnhZ
HX+0+jp08iUuW22ceaMxfBcmus01fuj739a/agCuGfYml92QEuVxuAJd4D2lOgqA
mdoGiluS/zNpRRgkyfN+svK4I7nWjeV/yFVXqI/1/1Yn/kfzUQh6PipQzt72nY6f
q3V6dKOMZZVD9OZT3VNV2CosfHMrPSwWrcR8wjGnBUiaI4T9QjnjDsFREVtaADo5
t6MXMr+VYTNCQKjFnaDvxe7A3ybJd+04aHFoiWKSZY5MWJ5Hq2bPZNVNVG7AJt/O
lWBdhx96ugS/fosq7RGSaC7+OA8HlHpg+RewVifxMavHqcWmAw/v/Xj8pY9Vyuz2
H+MSq139dZIkUd86tfNJeJdbR2ZzwoP9+UAa0V+3uShwZPn55itLZIT14cfGuTlc
IQBcgBjwwGl+NauZRlekmcKUi5ckw1j8jd/NAP7A5oVfWBk2xTg=
=l9dU
-----END PGP SIGNATURE-----

--U/4uM/neOvp42j8/--
