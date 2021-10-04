Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD163C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5F7861501
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbhJDVPs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbhJDVPr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:15:47 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E40C061745;
        Mon,  4 Oct 2021 14:13:58 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id k21-20020a05600c0b5500b0030d6ac87a80so700652wmr.0;
        Mon, 04 Oct 2021 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xqLfGx4HO+69QDr34tHSvG78VaiFucDFHMEYDpayico=;
        b=PQNy0rjRnW7QHX4zii0QmF1MFK7bAn8wXAecXKMigUtl5Vlg+hv1mfdE01jqxt/Jfs
         XGrN7eWReMB/sLejNWSYEDLPXoXXvKNZN50Kk9gaj6NGjw1NxNA3ngU/hB2p5x+Ru0Il
         Uo7ZdsmXIaw+WGS/QTcb3ws0yeeOl8WQKCMttSUcIz1mF/W4UHGCjhmljmeUUtBElybf
         DHlmZLDseoM7FK02hcXnemK0IJMasNZcz+fVJlJKC1k3w4ZJA6P/TAu/9vJa6gmo0pwv
         ZzLn4NNxbkxEPa78HPeoVIlPh64AGgbA2aY1NnGSAv+Tu9+T6P303tUKBXQa2n6VYnEA
         5RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xqLfGx4HO+69QDr34tHSvG78VaiFucDFHMEYDpayico=;
        b=Cf/9nRzS7D4uqBHPeI5QWvp74PMtb5M+uWszBovSb89B2qPleETjkF7yUiS4DaJpL9
         90WFUAdakzFIxWMtSfkFFS5fpKAAdhZPUa2Cn/PQiT4N6bvksERB7ghmak4gKss+UGKJ
         XDBkebReluS0fGze2OVF7Uv0gSsUwZhQtf54BQC5y0wD2U2XNcUKFz6lSGtjxY7sGB0j
         Ogim2QTaqi/yBM44XZEQMf8MPeJnGLS3hX5EntIfrmmLIgkhHGE4jfIADEAbsq4lszWc
         8AeHVB35lWxzl+CemB2iZ0nagEcdTOekQFPi7Mua7iBglty1AGdterX4kkiMyBozHQV3
         4qxA==
X-Gm-Message-State: AOAM530gcehonxvFXfv4XlGHaLrGjI7MKN3pzkkuC4YRmfIdisVST2fm
        sPqIVnZX7cVPeUVLXcgF7Kg=
X-Google-Smtp-Source: ABdhPJzuq0pyuuT0KTWOuerq1COGLWxrmAACAW/M9YGgKrbUTX2PaDQzpXZlOcn4HZxyZArx/fa4Pw==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr4075933wmi.164.1633382036526;
        Mon, 04 Oct 2021 14:13:56 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g144sm13605942wmg.5.2021.10.04.14.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:13:55 -0700 (PDT)
Date:   Mon, 4 Oct 2021 23:13:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 0/7] Add OTG mode support to Tegra USB PHY and Nexus 7
Message-ID: <YVtukiURJBTbP6G2@orome.fritz.box>
References: <20210912181718.1328-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hRqufI3Tuell20As"
Content-Disposition: inline
In-Reply-To: <20210912181718.1328-1-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hRqufI3Tuell20As
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 09:17:11PM +0300, Dmitry Osipenko wrote:
> This series adds USB OTG mode support to the NVIDIA Tegra USB PHY driver
> and Nexus 7 tablet.
>=20
> Changelog:
>=20
> v7: - v6 partially missed 5.15 kernel, only the power/supply patches has
>       been merged. Re-sending the remaining patches for 5.16. The usb/phy
>       patch needs ack from the subsystem maintainer.
>=20
> v6: - Added r-b from Rob Herring to the OTG properties DT binding patch.
>=20
>     - Corrected "smb347-charger: generic regmap caching" patch, it now
>       sets the .num_reg_defaults_raw, initializing cache properly.
>=20
>     - Added new patch "smb347-charger: Add missing pin control activation=
",
>       which prevents never-enabled charging on Nexus 7.
>=20
>     - The "otg-fsm: Fix hrtimer list corruption" patch of v5 was already
>       applied to next, so it's not included anymore.
>=20
> v5: - Replaced "Remove caching of charger state" patch with "Utilize
>       generic regmap caching" after Sebastian's notice about disabled
>       regmap caching.
>=20
> v4: - Added r-b from Rob Herring.
>=20
>     - Added unevaluatedProperties into SMB binding for VBUS regulator,
>       which was Requested by Rob Herring.
>=20
>     - Added cell to nvidia,pmc phandle instead of explicit h/w ID
>       property. Requested by Rob Herring.
>=20
>     - Added stack trace to commit message and ack from Peter Chen to
>       OTG FSM patch.
>=20
> v3: - Further improved interrupt handling in the PHY driver by removing
>       assumption that interrupt is enabled by the CI driver at the time
>       of set_wakeup() invocation, which makes this function a bit more
>       universal.
>=20
> v2: - The PHY's interrupt is now enabled from PHY's set_wakeup() callback.
>       It prevents getting a spurious interrupt during the CI driver probe
>       time.
>=20
>=20
> Dmitry Osipenko (7):
>   dt-bindings: phy: tegra20-usb-phy: Convert to schema
>   dt-bindings: phy: tegra20-usb-phy: Document properties needed for OTG
>     mode
>   soc/tegra: pmc: Expose USB regmap to all SoCs
>   usb: phy: tegra: Support OTG mode programming
>   ARM: tegra: Add new properties to USB PHY device-tree nodes
>   ARM: tegra: nexus7: Enable USB OTG mode
>   arm64: tegra132: Add new properties to USB PHY device-tree node

I've applied patches 3 and 5-7 to the Tegra tree.

Thanks,
Thierry

--hRqufI3Tuell20As
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbbpIACgkQ3SOs138+
s6EYGhAArBkqypXKqUdKbUHYbkzJ8ew3lE/NYi7lpYIEWO/Cnzicm+1iFL7LqRbt
7TabOYWgmVcqxHkKhTTHw0r8QnQt7gvxUJGQvgPC3AiVmEXhJ5oBr2xCYiVK/jqu
Ux32r7P/KDjW46fIc+0OYWYS1cbTFrXlJ9ffsvbEg6J9MySCJxHW26b+ru8tSvSz
hWtO+wOZ57EQ5UrGAK0/BNT9QvQr6ruHSIy0FPoNmBGtEcWLJELcSYSupnSkI+uU
9CGjEnbgggOuo3K8ic0Ma5EVKymjc8jk5z0hCUnvmYiyEmKWAh1u1LmsdZ0wb3U3
bBnw2jDKb9bOXcbAkxipOx3VrGW6oa8n6m5aoKBP5DjVayU0KWkT2CrqzvLYciQT
IeStZg+t6/198LtK0JKj+grml29IfJkoVQARhgVbva3QKX6Y2tiXHXsMQfueAkWd
YQgMR8U73AyWwRK1eoUQS4N9mHiRnYkNNW+VW42ffPs0dbmO08lkgpiHEGFKz+Uw
3yYYOR42WdI84R+Jv/47b3h+pL7mIgaMdu44GoSGsDRAw3PZ4cWB2ptldgA24oKX
c/4bp6btUR7hHno53DMDgKVgu2PMji6kP8axnWaX6q5flRhCtV1taFSQwx1sFnvz
0Xbh2qGyB39rxSLQAvP3oRs3ma16NnbS6dtiAS4U93DPHXRfrCk=
=5Zam
-----END PGP SIGNATURE-----

--hRqufI3Tuell20As--
