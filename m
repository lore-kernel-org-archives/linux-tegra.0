Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE14C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E12F961058
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243678AbhJGSeu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbhJGSet (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:34:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7616C061570;
        Thu,  7 Oct 2021 11:32:55 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r7so21864821wrc.10;
        Thu, 07 Oct 2021 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BrYFk3n3wKlXA8WLTss5loXYswBXAXQcm0uu3iwx1oI=;
        b=MsmiKmM5Xym6tqTIRo1kiphYf5bA1ylKLWS+V/xinVqK4hzPC6mYF8MnSUtIlH6DNV
         RIt82LI/xZTYqZXJO01GpviNeRI6Yw3JUYGSFseeu4zog29LlNXUMl/MLCG2idIB5L8D
         CjOaOzo5oK1/HTA3mta6bMF3wMn6I2nCtBEzeqPPyLan6c0TGMJ891xn0ivvqjMI6LDV
         4nDF78xt+yP/1sOYDwWuE0jxCSwpiu0a91gBt6FPa3wl9P4HJ+5aI/AioM2SQ7SsGXj7
         hN2kY88SrcJu6IYemiXcWBF6B9IjS6YXa9iSUfcNlvRM1+232yIm9u5nl8kM0WoTkEVi
         T4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BrYFk3n3wKlXA8WLTss5loXYswBXAXQcm0uu3iwx1oI=;
        b=MeE60+B5mMgXwecBazz/3953iXdKndIwEr93377CQPVZ797EhReOloCmc9Fk2sUQ1o
         SBnOlgV5BOdvHgWEnBPEFYLahaG5uAGmK8PupmnhCWSN9yg2n7NmbY6DLlkETg/ox50c
         5HVKpnIj4nqFw4dHOJwTTkJhmrdf0JHvQNORVf1cVhT+RbziPccCBTd2KYh5jVqPKPq/
         fyvlPn3KEIBf6zuKopTd7wHEPal1x8jf3xuzqU/vKxAjFt5+Mq/hjIPzRrCWqpxBUsDk
         XBpm8F3We7mrFvk69qUkKnVV5mHQMOKBse/DfP+ug6Oj9qA8p4othmm6rwhxT7Hz23uc
         3YUw==
X-Gm-Message-State: AOAM533g3isLpJ0BCQnMJbOm8l6IpXc9ubVzX3cCR305sXnEf+c62eqN
        v5rOUBGVuWRCzR6d5sfDgu76ID8lqdU=
X-Google-Smtp-Source: ABdhPJxeMJ5V8OljD6sv6Bq3GPMYA2a4B9MI4IhMi5Wn4JY1Rjt7i54TrwpzsJgm+Ic44xKq6+7YZQ==
X-Received: by 2002:a1c:7917:: with SMTP id l23mr1740719wme.36.1633631574175;
        Thu, 07 Oct 2021 11:32:54 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r205sm180356wma.3.2021.10.07.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:32:53 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:32:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Heidelberg <david@ixit.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: dts: remove unused backlight-boot-off
Message-ID: <YV89VEW8TlT2DaKF@orome.fritz.box>
References: <20210919152720.72748-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LPO8ZLWxFwBYEdel"
Content-Disposition: inline
In-Reply-To: <20210919152720.72748-1-david@ixit.cz>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LPO8ZLWxFwBYEdel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 19, 2021 at 05:27:20PM +0200, David Heidelberg wrote:
> backlight-boot-off was proposed as a patch, but ended not being accepted
> since different solution was already in the place:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1406806970-12=
561-1-git-send-email-thierry.reding@gmail.com/#21327479
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts            | 2 --
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 --
>  2 files changed, 4 deletions(-)

I've split these into two (one for arm/dt and another for arm64/dt) and
applied them.

Thanks,
Thierry

--LPO8ZLWxFwBYEdel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPVEACgkQ3SOs138+
s6HofhAAkHuFOoH9Xs9hJuwIyoJHZq0Z/CzqUIl2ORpr3Id7qQs1uIrrFFE8MzAB
2lNS4r6XgU3ze2TH97G+Np740zqUvSw4fU/P5Iu+sIzOKwB+Fn2dICXBpkftSDGI
h6RYBXbABAEl7iYB3rvOZDZWlV7q0mFAhNbBOz+UpaUEYUHuEE4f92o9r39mR8QO
gL6FYs8FAnBHcaMXajeMF5ZDxCRnSn3XgJBj8pCMsjXz1RRRXX+tkL8b4p0fv2E6
TkXjAGc/m9V98qdK7p4/ZvTM5K97TIJ6dzT9SU7TKwIVnRlwaCrQb6+obVhGi/Zh
4pja71t1tNgKH65fwuhwvQ9Gozw0AUa/R8DcC58BAw8z0hZNx48nBLIFIELizttJ
FD/cGkKCr7q+zFnfV23tTYrMourUuWVGIdy6YBj5CHIs7nNaq57Pw8M/PT4GtLdI
ZuKqGWwwqlopQJ2xeFeNCtUM8Bba7Ho3dKbdPZEBieGZR8+sTu1htuwzME0wfRZD
JO1WE1kn755LJaMQ2DMMYcTFp0IqzIx6RqsVEvcX5Wshj3fcQnCCKbsL/cVZVa/p
7TsJl/YeWFUL8qLo+FvJFBGQytRVqGiGss/c49v4RIT6O+BnGdGSMjJfo8AdYa/w
/BhUQG8BPkFg8IKTKFM1+xhV0Ij8hy5zlCy0ZtL6w0k14BIdMAU=
=khHq
-----END PGP SIGNATURE-----

--LPO8ZLWxFwBYEdel--
