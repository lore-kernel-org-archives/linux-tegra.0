Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FCFC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbhLIRSU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbhLIRST (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:18:19 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CE9C061746;
        Thu,  9 Dec 2021 09:14:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id j3so10946185wrp.1;
        Thu, 09 Dec 2021 09:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1WIvJ0cMOzreLs80b+VI49//n3XG9dDrPeLotL/bUDk=;
        b=oqzKpfW6ahOYYATVIkEj8+lMiWjswlMB490eQDhQzqTkdBoYBxVz6oCWiFV/xwT5Oh
         2zwt1J27fHtPih1bTtyzmIb22poeL+8f4G9QFBl2a0IHg88+ro2SVpxfQ3qA/uMyQohk
         K/Fdko4eX9WIuFgKG3B5fszYGZ85o0k5t+ujX3JW2YpaZYvQtdJeVMiLKhr7iZQ2VOq2
         qaCorvae4NsYjQos9Ec18lMAjPp/e5srRCLT3OaZebntpm71zDUTVyO/N90+B3hbFuhA
         2bwQ1pGVg29nqlVEaGEM8jbBwJE8jhNXFhchkQDUHTakaXWTCHjRk7jZxmFhtGnu7Yp9
         9ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1WIvJ0cMOzreLs80b+VI49//n3XG9dDrPeLotL/bUDk=;
        b=4blH4YEd+OcNW/SW1hrUhK6hDHNfg3BGJrOKAK5St0Rzg8VMoBskuwmeYeL89a2Tbj
         L6ENWB4REZzu33RxHRSKKR7aUS6MpeIuCnZmJgLeX6pG1pslhjo4u7h/ARkLd7Oh/7Me
         e1Fl22PdYA2x8SklloUllZRHyX6fgV6MucIpU6GA5i6sIU2irpKrVuKRNMp+k7YmlIHC
         YCMWvt91eR6DXFChA1Qdk6hhH+6absy1AKJxT5eerBkRwYjVHmcXc73UKpxe9GJWooG2
         LmEAOlD+BK2Hu7qooT6sUyic8il57M72QjwaQehqrHS3IvllAZmiFFIB6UBp6HupR3nd
         WW/g==
X-Gm-Message-State: AOAM532v7RPRmlb0FtDP76A2PCnZGu5dly2jO1dLGE+nA3CXi5cSH1V7
        I5PU7ovrfTtoUx3osy6HzTc=
X-Google-Smtp-Source: ABdhPJwRktuofTJyEgBTDGYurKcdU9wj/SmOmXpVhXUyg/Sq8RhVLeGQ9B/NPgxX1W3cbakHx1IwjA==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr7880445wro.395.1639070084560;
        Thu, 09 Dec 2021 09:14:44 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id u15sm298752wmq.13.2021.12.09.09.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:14:43 -0800 (PST)
Date:   Thu, 9 Dec 2021 18:14:40 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: usb: tegra-xudc: Document interconnects
 and iommus properties
Message-ID: <YbI5gNIitiikI+JF@orome>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
 <20211209165339.614498-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XphOr6ZdSFzXaAAr"
Content-Disposition: inline
In-Reply-To: <20211209165339.614498-4-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XphOr6ZdSFzXaAAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 05:53:39PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Add the interconnects, interconnect-names and iommus properties to the
> device tree bindings for the Tegra XUDC controller. These are used to
> describe the device's paths to and from memory.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Sorry Rob, I realized you already reviewed this one earlier:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20211206155559.23255=
0-1-thierry.reding@gmail.com/

so technically:

Acked-by: Rob Herring <robh@kernel.org>

--XphOr6ZdSFzXaAAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGyOYAACgkQ3SOs138+
s6FZsRAAgcx3SMFsP4NMdw0V3PGov6oKJS5d1KilhVi55+DsHH1TRPEJgU3xY1/K
15DCTeDj8vSPSvPLNh92yhkD43B4/i71Sc7dNy4KYycCGRt/UEzKPL0jPahKFnl/
Z2PzcrUtYDWN2B1AhbHvoRvyWj8oQ8C7BerPGqtFPnfJuML5g1kqcon0PmD9cZB3
HzJAakuRXjM3SC1RDLxFK0YCQJ7+HIydTtQ2q1/Tglb7wW4sv9FSUgI8PWWbdo1+
Id7xZT2SWVxaiUtdrYsLFzxdXaEU8EuOi84OdA5ZE25RE9+KhrLi9wlDHS12RZaL
LNLMkdFm1KKxsUeF4mTlXleH6i17wU2TZbzNxZaEV15chLgJwvDuA0TEPTnU60wW
JOPb2TUJV7CCaDvbRLc6kKqcnfJCmh/1gHJM2FFaOrzTd3OHNYSPH6cCP0EQfSyM
Pg9hpx+0iwS54ghSKqIkTWinyyY2llhpSeXIXCMnw6B/iCxGXhJbSmyJR8vZLV4h
14zNkQp4yhcN4sEbwZVH6WiRtn/yF5MShDNY4KHuLa/UaqzecQlrFf5dmtUGT1R9
cWevfQ7xuCgzcuC+5Cisuu+oKSo48vqAgQH6ChkbDy+qrdINHVtLB0Fj0gtBFH/y
2pDwJodmvvm2dT3etM+ukefKkLM7uWldb+A1Ky0IIQeoioBIJpk=
=72yo
-----END PGP SIGNATURE-----

--XphOr6ZdSFzXaAAr--
