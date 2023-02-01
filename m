Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB08C636D7
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 21:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjBAVs5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 16:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjBAVsy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 16:48:54 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18470125B1
        for <linux-tegra@vger.kernel.org>; Wed,  1 Feb 2023 13:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hubGEZf4ZraTDuQsrcF8EsKr65EW
        qd8xY4s6J5P/QNY=; b=xW3XxxjZGI5PQb8/hyJ4JyKS6jDj/KBzVMbtDcPWBEtn
        mEvs4jdEonsXZW0Xg6M6loeWu+VZIj1ZwppJ+exexVvv1cx5KbtUBzjMiiLFO1MY
        eheSqTI60lVTea8JKTN6wmazbpHP+MI/N4nWJtq0EaFhtJiygvfU3jQoSl0YrWY=
Received: (qmail 2393229 invoked from network); 1 Feb 2023 22:48:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Feb 2023 22:48:32 +0100
X-UD-Smtp-Session: l3s3148p1@jMTRaKrzzOUujnsO
Date:   Wed, 1 Feb 2023 22:48:31 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Message-ID: <Y9reL0BBF9Po0Yam@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-5-jonathanh@nvidia.com>
 <936488c6-f86d-3552-1a35-1039eca55c00@nvidia.com>
 <00059af2-dc99-0771-4d30-b7dd94ce1150@nvidia.com>
 <DM4PR12MB577082ABC3CE4731E06E4963DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MjmHH0M0XfhIaQAP"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB577082ABC3CE4731E06E4963DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MjmHH0M0XfhIaQAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > >> Now the Cypress CCG driver has been updated to support the
> > >> 'firmware-name' property to align with device-tree, remove the
> > >> 'ccgx,firmware-build' property as this is no longer needed.
>=20
> Acked-by: Ajay Gupta <ajayg@nvidia.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--MjmHH0M0XfhIaQAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPa3i8ACgkQFA3kzBSg
KbZSYA/+K7njFaUeK0bxDYLNUiVKOdYHpDIFuzJZa/eOxmNaf4SAyspFVWNa9c89
jYqglT+ZHZ5zptZd0yp3bT3lvUbQfO5g3wX9fhme3qN7mzPprWBqY3LFks5wKxVr
iArQBIfBTZ5ulMrOkdS7UaLnEBiitwL9dQpY4GtV2xJY/yr8soX3IWK6verSJOuo
CHpn0XfIgr+O9Yslu/bNEmRH4GJPFWNY/fSAJFKiDg9Zt3e6pW2xHiAB7ljjvTLq
g8gwqNHX1TYAOUx7Y4qp8XlLUQkukIkn50fvMHrZaiJRbKSu6W3PG6u36fEo6fBI
Moy4rtBOJRBz6EbVGm75xozzIqd1elhwQzKlbZaQSJCWb70bhkSZjBil35/LzDix
l3odfAsxxpFwPKyRYw3BNilh7MfybbCw5Mc5OM+8nCwpTof+19O+RpC+tMNQxzVX
0tw+9JCgPZkutXdId9xa24WBsLMXAN1n3qTVk1YYuXz7RcTsCAbnIejaA3dWp+nz
HAWTAERv3z9IGNpcFyYHbqjKkU/b5mE2HXxyXVtBVs1YKo1wcL+W5fyZ8ZwUaKLN
FxYXILXJPneZ2djaQsHe1+I1HCpxPArpBlvhAf3UBFcMzeiRBQemKeIIX/78CqI9
LtaxuiCD1KhAO/iRIrVnMql61AbmTt67GPmJFFDcOw0r5sjsKYU=
=2M82
-----END PGP SIGNATURE-----

--MjmHH0M0XfhIaQAP--
