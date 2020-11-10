Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287FEC388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB4AD20797
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rag352IM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgKJR7e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJR7e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:59:34 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1A4C0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:59:33 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p22so4020164wmg.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+I3RS0HCsgZOQRrQmGX2d3xbpMY0bkwXOvbU9SqDMc=;
        b=rag352IMdNdVtNkTYHpjnqK7oNPX7AskAwr8KJoUcUgbqTs3ztRgpFfvKwhRxZ7oJa
         PHngI6o3LMTj++bYiqW0fpqOF5v6zL3DKHXg7zdBinvZmA4naL/zNMeJ1MVwPwJG/iLL
         PbnH/yWHZP8YzwWTWZuey2m+k8YL2a+IXZBY53x3F4825DwozjxVceMw2dPWxYxkxCpL
         cVCyGxzwZDFFuk0BA3AEUA355Z6GN5ovZCqwDbQ3Xbe2Rw7beH/84O66itN9jdn6pgWR
         dVOGvN3dwBsW2+guTCKJXLyIzAOCgw3XBXB4JXl5j77oWwBlCH0+uA0VIOlmai7viX0s
         YrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+I3RS0HCsgZOQRrQmGX2d3xbpMY0bkwXOvbU9SqDMc=;
        b=IksiCtDRxg0xbpM1C+en1fWembrRnAydyJMVaucfZ7+KNcdPhNPLsDIZ8ggWxtw2Ck
         oItbY4oTimSGkufEgledKMkNaEgZJ3F39lfwBozJl2X/ruNmggmYTFilkDbWF4FZWMN8
         M6uH5aByTQxeLLZlxeMn3n1TXlPtTfatskJQvSt/lAxORqsRob0JnIv2fSn1IsI+VNKd
         wGxzb12r1EfqMp7EvQrrIKNm7HnrtacT1zGkuiP75+7nkS8MRXhLifcEm3soYvP86gaH
         uSbHlcSB/Oh6E+MP1SzhxKMCZxKz3Zg2zIBSd8LbCmgBCEZ1py77/THgW8w/FgG21+1b
         HOyw==
X-Gm-Message-State: AOAM532g/IqRaCeHNHctd1UYywpurlLvodDBW7LuPhBKduP9mPzEH9TM
        ItIaOe0h9a6bmJxYMsv52sk=
X-Google-Smtp-Source: ABdhPJyEdmOl7XBhFGdKFjwP2kWU2DKjCSu2iwZEerp3eLjNrM/yOB3RFknvzkkJ8I84yzSrBCh3Cg==
X-Received: by 2002:a1c:254:: with SMTP id 81mr304267wmc.21.1605031172715;
        Tue, 10 Nov 2020 09:59:32 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x63sm3828154wmb.48.2020.11.10.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:59:31 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:59:30 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Nexus 7 and A500 device-tree improvements
Message-ID: <20201110175930.GH2297135@ulmo>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Content-Disposition: inline
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 05:12:43PM +0300, Dmitry Osipenko wrote:
> This series improves device-trees of Nexus 7 and A500 devices by
> correcting old and adding new DT properties.
>=20
> Changelog:
>=20
> v2: - Added these two additional patches:
>=20
>         ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
>         ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
>=20
> Dmitry Osipenko (8):
>   ARM: tegra: acer-a500: Correct thermal zone names
>   ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
>   ARM: tegra: nexus7: Correct thermal zone names
>   ARM: tegra: nexus7: Improve CPU passive-cooling threshold
>   ARM: tegra: nexus7: Add power-supply to lvds-encoder node
>   ARM: tegra: nexus7: Rename gpio-hog nodes
>   ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
>   ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
>=20
>  .../boot/dts/tegra20-acer-a500-picasso.dts    |  5 ++--
>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 30 +++++++++++++------
>  ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  2 +-
>  .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  2 +-
>  4 files changed, 26 insertions(+), 13 deletions(-)

Applied all of these except patch 7. Let me know if there is some other
patch that I need to pull in first.

Thierry

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q1QIACgkQ3SOs138+
s6GjqQ/+IoNA7SM6bVvpbORpSMJBfxxSg8io6AV2bqTcaipq7SFH++SuwwDbBQ3J
tRJJyj5ID7vHNrdS0pXHbXaBh3ND+khHRNtpARznx89bkOInmOFNgpMVU4+ebkJl
eadONdp28DEi4NwnDHQy1hHtoPpfGRqW929ipr23qXZfqH+n/s6501spgaVaSfhU
2nXBzmrR4y3dBkKzaU5qStsv/2uFNYyImS+q+IBbMUE3X5weqK6lNF+m4mUOmkpL
mDdL7imoEXXRiCqknvCx59ewBHR5eoB3Hh/EETgiO02OkvZEJID6gh8yJD0uOjNx
oN1s/SmyYr1RolOCjR3oLcsOFeNFbi2Us67EaZch2umNVVGzaqo+Uztj/zAoQa3N
MRQAf/8icXTRamlkUYBZpgJNwXpBLalQuoHd3t+KfOglBSpDXOWU0GYXPRirAyJn
EnsnUFTL6B/G8O1o5kz+q+sbsEqeJg6qaZT6gKz3OIFLP9bljDwnwYJDD0R0rlQA
2UXfg9P8lg9aXry1UwBhwgqObzI3KsvIY7oZfFRYO1jW5ohRM2wIcgDpbYtLlaD5
cFD6731nqc/RhJcB6OoL2uupi/71Ib7uISFLfjGaeyvjx3p+GNZJyFNWvKb+E6Oz
CFiN17F/ZATY6AGoH+cLiYBB/+pltvWc7U4JQkj+fgsrjmWuH14=
=5/q1
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
