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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08595C2D0E4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 10:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96AB1246CE
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 10:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwNq3gNS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgKSKsL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 05:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgKSKsL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 05:48:11 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4428EC0613CF;
        Thu, 19 Nov 2020 02:48:11 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so6709904wmd.4;
        Thu, 19 Nov 2020 02:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0oiSOde3ukUdcW4AaR1Bcp0zwTptRMD9+MwlC9b8EXA=;
        b=dwNq3gNSdLSLMHFiIRSZdeVYmIyCSlCPaJpEMuU0a7cY1zCA+Liivh/uoEFlcHX8U1
         ao3dLEsceMZ50qmChMah17laga7xiTYDtATAjGnOF83GucLlyErEhJ7YJ/5uF+RTDlyt
         ZrHLzvJQ46/MZsG7fj9GALoFRUKxvSzfv1eYt2DZcZZooDtl0jUP3JTg6PkxVJLHBvC6
         NfIthf5XJYcbEAc0ybyfwi1sowODLCexwwStnPZsrrsctCkqXq7xZ9pZMX9GpWzLOcaL
         pcJnBL4+gmkI76lzUQAdWS5jNsTQqTSDRMqDHRvu+YZhIQO7HEjl/TVl7mH6V0e37fLG
         aKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0oiSOde3ukUdcW4AaR1Bcp0zwTptRMD9+MwlC9b8EXA=;
        b=rLEZLUVypPz3zqdA5PnMz+sk5rg4SJpsey6xpY3FCYveH10E9a0AQHRsnsODT5VhYW
         LxgNjZSucOQCqcKowlbi5pTVxBD2W7qEhXYsLa95Z5Xv3WVzEAfbGTSEwjcRUuhyG9QJ
         Nk2WN56FUZS42T1fJk209t8++15/BzNTh7fNGx1la4AxaECgPJNDdxAuo9NlKKKGuZPl
         JxspouzEjR9NhE+vENfYTXkEoVygQ3D25EznN4YgbwjZ55X1raidlO+vJa+l+DVWZjw3
         TgRCP8xmtvYLhvVhHCiiFX5D+nMp5dmVS7IX4jeGgeBEsj97GjTFcpaEcdiCAPFfm44y
         6MvA==
X-Gm-Message-State: AOAM530PLMjvXIVXHe+560qQvcLwb4gn0z2nG21SrhDVWxfKI+Yoo+WZ
        JFXQxpSVZvgGZl2sv46+ck/s/ndVOfA=
X-Google-Smtp-Source: ABdhPJy7FA7YOl/ouCKQDzY9pwrfgXBwGzFQSG5LKeKYRw4JElSG96VmFwazErvLl8FPKWgZjOJ7Gg==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr3811365wma.15.1605782889972;
        Thu, 19 Nov 2020 02:48:09 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q66sm9561801wme.6.2020.11.19.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 02:48:08 -0800 (PST)
Date:   Thu, 19 Nov 2020 11:48:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: fuse: Fix index bug in get_process_id
Message-ID: <20201119104807.GC3559705@ulmo>
References: <20201119044457.29528-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
In-Reply-To: <20201119044457.29528-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 08:44:57PM -0800, Nicolin Chen wrote:
> This patch simply fixes a bug of referencing speedos[num] in every
> for-loop iteration in get_process_id function.
>=20
> Fixes: 0dc5a0d83675 ("soc/tegra: fuse: Add Tegra210 support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch! Applied, thanks.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+2TWYACgkQ3SOs138+
s6Fn0BAAjQeG/dgCzE7gY76KXQXtr9WvpHe6/WxAws8BjmNl1RQqIgs8NMsmmyOE
0U2bzhyHD7FQQf5BFxAhpgEcwV3G3vk737mbovsO9HPYFgU6DkYtxXAMrLt1HsEX
7Icc8TtTdmB9p9C3Yucl73FiYohLx/dAsA3ruaE3O679fOopL7l1H3xxcFGUg6GK
4mDymqorTp+pMIAUT2p+CRONp8d/3bp4SqNo8N5lTC6GyeBvVZSW+ZpIsbhXDuxr
bfz6h+KtleTymeTzRaaN7GQtqjvt4qxgXV4+ftwZb+HQcPbW8PqwGJDfKspHVAAv
eFSiGYGXpdXnwbUcNYotek1/hevwJwseSkS7Owu1xhJ8z84ayb8rXPORfYPqsuAp
1uBB/BLSMKyjoS+9TVYQs6qH37mLSfnGy94bV5lWRgHg9GcmH2SgF1mOrMlpy9Ie
buZ5jTJgPKGZULzhGgxf9zJMJVzCdERGS8NYP9us0zvq4jxDrqcesYGEPiSve+G3
sbZtnPUlHRFiIuAbchBNPet7hhQzXoiH1OdLu6wzrDj7nrgNUTbP9lmwMwk8ZlCM
t3IIk+/8VrW392Z2Mfgwc0lfpX7rPulXsU8vjyQ7uWcr1NDJOuGQsBbM2kyKumHe
ow2KPCjqbUZztsutQN2Ib0F4swR7hiJQCitvl/K9oIj9l9l6t5I=
=R6rf
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
