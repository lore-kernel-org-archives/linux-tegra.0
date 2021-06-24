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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D31BC48BDF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 12:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84764613EA
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 12:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhFXMEx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 08:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbhFXMEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 08:04:52 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9BBC061756;
        Thu, 24 Jun 2021 05:02:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so3455853wma.2;
        Thu, 24 Jun 2021 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
        b=A4ZJSYnWcvNDaAGkscckQ1T0JedTdFDVSuL2YBNdwwF7acWK0AZcsU5zvsVBjaEnE0
         vsxLXeiOkPXV0sDkt5mf5/o226lI7HBeiLI3sEq1aMRGbypsf6Bch2Kg62wRL1La4pDI
         oGZydtxItkAsfL83TfuEmUWoDMxV7rufPNivK3ryBzWPLuL+5usBc6MglcCUM6IzelM8
         Nz6qtrU0C9W4JeYrs7rwBFAjukEAoFywD8y16Q8wkRFeIXm2GbxrFHrfjHBLNTda9rqV
         SY0IiWXgH48K8ZPh9MWtQ5Dh1jLdaybwti7HCY0TZjkN9TbYA/yL3MNnHzS9FYivGbwv
         lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
        b=fFULB5KTsTUcvCsHviZAU07YRt+xORu2Mw7knpNHb0TlGS7DNVyApRokUlmisuEVJi
         4urPIwxq1yG7YP88bLltI9X2cddSg2XdpBkPnQbNqeS4OHaOccGijakaOzo8TZtIbM78
         bFi6YpCpRUz2OvM0YkDpQbW16jCHvGDmD3p8MuQLWtN6n4XGTKLcGrNteRSqELrQzkH0
         xTdB3tqLxevi2RThg9UMFBKJ+ximwz/ULqMTUGtuweX/+Qfg+YGr9DJbOVRmzkVRZG9A
         IEWEklB2QJCj1mlbJuGMTatz7XztAW8r36/PlA3i2wuwM8ctPv4OkF7cSd5Co1/sW/CA
         ZoXQ==
X-Gm-Message-State: AOAM532oNeCWdYWeWLusqxn5n4OXHjFkuGdlvD/kQJ/IUASZ1Gc1uMYT
        Q/qE+TMbdsuGKoM72+teDQA=
X-Google-Smtp-Source: ABdhPJwnAQpQT/2sEz7viSMJ7t/+2zmdWLWtmPK9rh67Szq5oWv4lL/lZy1xAEGpP06+iHH3w5wUNg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr3844668wmp.125.1624536148907;
        Thu, 24 Jun 2021 05:02:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c12sm2972417wrw.46.2021.06.24.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:02:27 -0700 (PDT)
Date:   Thu, 24 Jun 2021 14:04:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
        jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, jani.nikula@linux.intel.com,
        rodrigo.vivi@intel.com, linux@armlinux.org.uk,
        kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 21/27] drm/tegra: Don't set struct
 drm_device.irq_enabled
Message-ID: <YNR0zpVzMxQauzet@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-22-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ENqalYeZVO/RAx3+"
Content-Disposition: inline
In-Reply-To: <20210624072916.27703-22-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ENqalYeZVO/RAx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 09:29:10AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/drm.c | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENqalYeZVO/RAx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdM4ACgkQ3SOs138+
s6Ed0A/5ASxTJhpMIfL1u/g0kk5pjZX8ukNK72+ftE+sJWJhxDmTGuM+EzcPNaNg
sKT+65FK2YsGeoA5fnN9QKWuUyS+bpExys5n39Aty+YN4tI4CV7CbU9OJeYm9Iru
i+Ziu6gkJl2SYom/+cxuU42UkUDkQkWofYRel+HJZeDMogSRAIhiiQy5/fadGiJc
36fJrXjueiB3EZjkg7CubNsLgy08qblR+sZGpuq4RIc3aVe6j6U8QxHiZ1eA7tMD
ki2Nmub5WThcAUGn/ky+FD9m/yfieoI9sPkVWRpAF0oa6SDp6YO/oPFf2hJzl4jk
HPXABfAWIYFTEzjFkGdRHjOfGgahPAXvwd1ku5zjBuFSH3vM9kNaNRuIQe2Rg9ti
p3+b5RfPlO/1fiVRkuzXwROpjWNW44Y+eVVyee84h813aqYh9OOLJVrmxmrzZ1Xx
mzDTvyZXuxtVb79T4XSkb0LnRw3wrraylMLP1X4/QTqttUBoWgYeKM5MwDgy+6zH
Bx1VWtnjn9NmwEPfRmPpwIQNByNJ2DG/E8wZmEfeqJAEHo1SLOYaBixh9W7DUlWC
e9mZFcD+tYSTurqcg0mS5T1mSPJGyCjcZFP27RkFRSc9JbRAQt2uuKcr1R54mjTh
gAJ6mf8hPIWA8Q6ro+2TgW8p0X/wbPsnZdXjZrTGBsV1QA84k+M=
=pLLR
-----END PGP SIGNATURE-----

--ENqalYeZVO/RAx3+--
