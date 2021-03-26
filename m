Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBF8C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 509AD61A02
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 16:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCZQ3Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 12:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhCZQ26 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 12:28:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267EBC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:28:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u5so9300899ejn.8
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XfiMkxOSKnCM3WBrbINx55gt3hO9rgqZUMHuwA9vK0s=;
        b=gJUUJRsS6Atywe0x09TsRJR0vW4UBZZK7Fi8lFtOsPllIwcHr0D2JAMBZhVJGzt2vo
         G2W8NPyHHLZro5OkOqht4WXFnZ2RKlu2WtxsK2FxV1J4LQiu4cdvg7lotzKwmZAnrAf7
         GhIogshMRCcyT8MtlFuhCzknDHo/mwYUEPpqlJP+epkMRSzc7rGvSBe6QUqhJoFcIyeq
         XOIZiubUXc808oW1V3aiFQVPE2ku5yLG9QIVkDlcFPb3UYbRn7LwOesk7nEeDousOUhc
         6w8wJAyuFaxlPr760eqylWLDHfJGGxaUPO1ME4JPkpPR/uk+9+SyleqhkwuAtcNMoD//
         MnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XfiMkxOSKnCM3WBrbINx55gt3hO9rgqZUMHuwA9vK0s=;
        b=t9kU6ATeXHx6w4Km9lOXYt7UMkrNUN9U285WmuBrD21g8kFUJOKbo5WnYJ7l/oMFHZ
         z07s9uVrFmidMGc1/Rj3nW35v1o6Nqx3HfokJfPR2lbdnyVV/4Sup2IZu29PKfGbWTPR
         BRCEsnLji1VC+QadsY9VUxHj4IqODy25j09iWrLk3aDW+XsrSP77fVF26L9Qle8pbQzq
         8Pk3LdJik8tqR3PMiHbikDIVHR3nShtgfeHKfWX2kTGk3Cv9CT6YoZkkS88T6BJIV2NG
         cvJ9+qQzcIBjKin35XUlokGnaheJDpNLq4RZwatYfcJydxdeJL38ypvabYmxj3BLSjvy
         lCCg==
X-Gm-Message-State: AOAM533RAcgiPkqiSXN0/+SMeLayjE6RI1uc9urf+BT95YWXT5n+bTwy
        O0bYQyZzCTjT5D1EPufdpuo=
X-Google-Smtp-Source: ABdhPJxnUv8rZ/nOHfwUUEysunJJImhJ/Sj3JPuR1aFnJGqlZbaVKjCaIkuOZBbzeS841gDtlHNgDg==
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr16516705ejf.401.1616776136891;
        Fri, 26 Mar 2021 09:28:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p27sm3982365eja.79.2021.03.26.09.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 09:28:55 -0700 (PDT)
Date:   Fri, 26 Mar 2021 17:29:18 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the
 modifier vendor
Message-ID: <YF4L3kq9UN6PWh/h@orome.fritz.box>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="686Eb1WuHm6N1ecX"
Content-Disposition: inline
In-Reply-To: <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--686Eb1WuHm6N1ecX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
> LGTM, thanks!
>=20
> Reviewed-by: Simon Ser <contact@emersion.fr>
>=20
> Let me know if you need me to push this to drm-misc-next.

I do have commit access for drm-misc-next, but I was thinking that I
could take this through the drm/tegra tree along with the subsequent
patches because of the dependency.

Anyone willing to provide an Acked-by for that?

Thierry

--686Eb1WuHm6N1ecX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBeC9sACgkQ3SOs138+
s6FTVRAAqQIOOT3+3AlCUL/zjkDyNQtgVx4n7/yhYFuYP6w2EF9nRjSfP6EdslTB
ximrw+qW0srUEU+Kp3uf4OQwHze1m6OGcKMlZMtVhI9cUUuE/GK6hPcAPmusr54L
nNnKjoD4kwmXBN2BB+xAMsRYD91kbTTpEKTovcnTh8QJvuyZXLnwDCk4NKAsDjC1
e0dM4FdOwFoSoDMWFtuC5obksf1lnP1sn+WnVo+PZa9OvhFjFPYHOsXiS7I7x3Fb
jg+fD32TH2xu6j77xkEjVZaw+Vp2VuQ400uD0P42dKaAzCamiJJFfLJicyzkKteF
2EVUIDPV0Yasd1RZw0Y9NVj6BR57VQexIdfVGWXr7QfzwWjEiN3HoMmEoNbn2dsq
ysQoAXCD5L/fM1F7WSZMlUHEa3/t/RDNL08DdvTaC2xQS1z+3UZyasv2RLy5FeqT
T+NNkhqRE+eOrUKN99XzA0r1pdhe+w1Y52VvHsh1Kcm7tuj+KWl3CSJR7bTP5PbR
G5bM2PXX5WlZ7bh3d68kU7TU6yUXZyNBIOZTAYNC+EGE0nu8bWSQN9gxDvGXhBEs
6E1F0OvW9BRt7HJwSfWpAtsNpew9J610T629ddAcaoGXEqNlssdsfpoJYH0Rh3J9
IRo/RhH7/QRrGqZwCG5/cWbYgIPrIlGOn7y1DfJIHf1Vp4gYaUc=
=aNQI
-----END PGP SIGNATURE-----

--686Eb1WuHm6N1ecX--
