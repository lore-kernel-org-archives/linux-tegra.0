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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5DBC433E9
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E280C2070A
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 17:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbhATRd1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388426AbhATRdE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 12:33:04 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DFCC061757;
        Wed, 20 Jan 2021 09:32:24 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id l12so18646597wry.2;
        Wed, 20 Jan 2021 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zJ8U2n9EhC/Pe2YwUO2F/4kmI3QBIUjaTX8upLa9w3s=;
        b=MYc0Q/Zq7AL//XO6p0OK/0G943MaPYNWwje52d/36sV45V1Xtm1jSSKO2fo3OQ1yXy
         fNMNvoGS2tTRXLr7cbSklGkqSvy5Jhynuo08E4dwXc1oE+DBgNtk0MBjA7tTrRuI+/lv
         INxe4jbm09t0KPGoFuxJj1eMmWkAMT44lr3PhOL3bCsPpjQWFj/Utg0ZoRjZL+1UrI1n
         E6ZfCGM1urCaKoAIaS2DpUagQHZb/r71OF2oIfue7w8P9sZsRqmzUGxHWltd6KwleYSr
         2NkI1F6QngBvGLQ/IoFWgofN/FzvuzpVeRCdGAUTrbZwSlj+1xh+ElnTg344Pa7Z7/QN
         L33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zJ8U2n9EhC/Pe2YwUO2F/4kmI3QBIUjaTX8upLa9w3s=;
        b=czq/6dD+mqEErqrJn4WGvR0TEkl2PiJ1JqX0+PzPtmbVoic0UpJhzOnhFNRP/vynop
         AEPxfjxqSuy4etIoL67ryQ2CcmdTBPOe6WKaI1SbekUNIsNEJBTXqrWsS50zJ3+JVc4w
         eIJOPBCqzdy+G34ui7Lh00Y8U0qIkqfU3ToRSZ8IKXYCz39Clw42icv6r5w0sdJO1CGa
         sSeIYHasxTZKsaLJJZIGMTD76kRZWIy0KBnEn0oddGVSoESlTWDwNYv4VGUAph0Zhm2h
         +UE/w53VFtnmkAfibilUmt0BxlMQq3FazpyFLVwHFFT44INalIco1RoOo6HyBJOVv/3+
         cxHg==
X-Gm-Message-State: AOAM531nIVlZFnW1fYetXbBwF8X3S+OpBcVyXRjSShVB5jyqJV63TBLX
        tYgNqA8nIGRje5J+LISeQ7jIjw2v88s=
X-Google-Smtp-Source: ABdhPJy/lroUAMfjnIBypsieXp1MCgrzEomMwUoBSsdu1SDovt0TjmrvGHCmY05VokAinHrHmnerbQ==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr10415482wrt.15.1611163943108;
        Wed, 20 Jan 2021 09:32:23 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u3sm6185620wre.54.2021.01.20.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 09:32:21 -0800 (PST)
Date:   Wed, 20 Jan 2021 18:32:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 09/14] dt-bindings: phy: tegra-xusb: Add nvidia,pmc
 prop
Message-ID: <YAhpJOxdsKqdbT3i@ulmo>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <20210120073414.69208-10-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3aye17l91ktjNFcS"
Content-Disposition: inline
In-Reply-To: <20210120073414.69208-10-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3aye17l91ktjNFcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 03:34:09PM +0800, JC Kuo wrote:
> This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
> PHY driver. It is a phandle and specifier referring to the Tegra210
> pmc@7000e400 node.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v7:
>    no change
> v6:
>    no change
> v5:
>    replace "pmc@7000e400 node" -> with "PMC node"
> v4:
>    new change to document "nvidia,pmc" prop
>=20
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--3aye17l91ktjNFcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAIaSQACgkQ3SOs138+
s6GpchAAteXHL5ky9RQ6Yd7MFBnRuEK5lZ9ZpIYe+e05gDQqtvhzyzj4h1PF7WsR
JJR4ZqZEg+2RECwKDKGogPTXqwitFXeuqopdbERxJEx1IMaTZTiC1nQ2rqjTfr1r
2xe1Rnram3f0sfvvOmtVIqJmyZHT3Gpw4rvEXCil+9/W+WhAkGY0ofjohS+TJkTT
xiaCjrDydYNolNFnzcRF3KRo6V+UfD4HBIGkKtCQZpiEFv4756FYbgCm5Z38RvWl
UwW9Gaou7cvYYgbsKDOcDH1yDFOD4O24CRYc3j/pD+zTYPsvI59OnOt+RarClyMX
Z6J9lmneLZlxUYZmQO9ncNqzGrhJQVUtodIrqvASrh1/whjEeUCyVu+CjCF9eY5m
Rd0eIjepuqwX+LN9MzCPGMyKMlKXV8XwbAppmMw/8ptrHNVIGFpoL1XdcXu97Fdi
MniIK4OMqXvsHMK6B1sFDJ8TDkSKuE0SiwbQdkwchR6qlCF7h4BKNfbvXZM+MQ4B
nPVWeo7aYDysr3Etc5ATlNr8kusnMV8HbxIEIW+MiRhZy9aavp9FH30II9aRXvxb
4YixtZs4EtbOFgs4HOPzt/3zRx1y0/IJ7WA7SfS5Au36CqnpTG/C/6CBYeuObPNc
b0rHhHdeXCW5i1/oqhhriHe/2kbKW+4BIffCzRKFCac4i7Wu30g=
=ak8W
-----END PGP SIGNATURE-----

--3aye17l91ktjNFcS--
