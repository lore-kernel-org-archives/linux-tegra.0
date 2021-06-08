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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B1FC4743E
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 12:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5956861185
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 12:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhFHMRs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Jun 2021 08:17:48 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:51954 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhFHMRs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Jun 2021 08:17:48 -0400
Received: by mail-wm1-f41.google.com with SMTP id l9so1703774wms.1;
        Tue, 08 Jun 2021 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RTw6h67yYGIfkq0uNmib+64EPQNtkd4gyJ1XCCEbH0g=;
        b=IkIg/DTEvB2VPfv0iGeBPu96cKkU3u9UoK9a8GgPT538Z5/CQ2SFYywGI770UkRZ1n
         rg8iwYwMSUt4K04TDxnVdn3IH9lVHPFZBE4nnTBkKGwBCOijyGzWdRbxJ5U5Lfikt9HK
         xA41O5oh37pyFjohgoA5/7ugAH7esmMHqLNnT8CgD7DTo6bMxsEMh4KOC8aXku3hzfYp
         OOzIuUpE+FLPSDaCb52fm2p8OBpWhaK2gkS6NKdU0tmwxMmBMJ8Bq6dk71zsqKRXcLnJ
         3jNmeX1fne31A8H6OmNX9LgcrDTdTbelPw+k0CpTS4SeCqbiEITijKgMMrEZ/etspNF/
         73oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RTw6h67yYGIfkq0uNmib+64EPQNtkd4gyJ1XCCEbH0g=;
        b=of8whRJl1nEvOc38MF1oeWol6kynPig2/I/JX4+8MeVG6vcPu+RT6nQU2fFWvUaP07
         5X3F4BluVLG6Xsl3toeZpGoN6fIEAKkK5Wp0vgaj90/KhOYG/0Lf2LTKZZ82awA1+0kp
         HuyRQ8I4YuNkODAnuyqbC00SeKzoT9bBGi/gLiKd7ugO1Ds2lazkodcporkAhcJNJn/y
         2nAf6S62Z08QrdiJOukpMwUA8jmUIyNqgRAysGDB0wuSpikflsCFgrvgF1zBiu8lNvKp
         Y8TZ9vQ3ywu3Fx8K01jjFgNHorTemgS9b6JUWCQkuKA47k3QNDCGSbod8XIZOSOOkO6x
         MT+w==
X-Gm-Message-State: AOAM530aTEzOMWHtEgbADjrQyGHeSAKCi/TbK6POGhJGn6+6SPtR+P3r
        zZolI140AX7wzRZ/Szn0kRg=
X-Google-Smtp-Source: ABdhPJwYRhOgNjGp18b/XJzeuJ7+AiN2QGfTleFv7N5Pr/y+p1AcEDq/cQPiEHq1LJA3rhq0G02Dfw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr12255357wmh.30.1623154480309;
        Tue, 08 Jun 2021 05:14:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t1sm19457036wrx.28.2021.06.08.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 05:14:39 -0700 (PDT)
Date:   Tue, 8 Jun 2021 14:16:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Audio graph sound card for Jetson Xavier NX
Message-ID: <YL9flIkIcI3KH10W@orome.fritz.box>
References: <1623149388-11995-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jqV2DqZFSXOM6h6N"
Content-Disposition: inline
In-Reply-To: <1623149388-11995-1-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jqV2DqZFSXOM6h6N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 04:19:48PM +0530, Sameer Pujar wrote:
> Enable support for audio-graph based sound card on Jetson Xavier NX.
> Following I/O interfaces are enabled.
>   - I2S3 and I2S5
>   - DMIC1, DMIC2 and DMIC4
>   - DSPK1 and DSPK2
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 593 +++++++++++++++=
++++++
>  1 file changed, 593 insertions(+)

Applied, thanks.

Thierry

--jqV2DqZFSXOM6h6N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC/X5QACgkQ3SOs138+
s6EyERAAnzCrBnBDK9RGX7zODpVNwl4mGgCeUqvcLVmc02CBOw60L/251o6OS7Sw
gBB4/5N1cy7NW7SFGkji5sS115rArPKpU++0gGNrzpJ29O8JKau8jnbM+kST3KaY
NAnuHWh4fLS0cRVF7DPBQSqjONfrLvB17EEiOEaymOEZuy1DNAR1Q3t3vLpY+irv
N59H8cuDpp08jMBbf71MlliM4PmsPz5NvENWGS1/63RM+i6JmnAzS0iOdkMlM3rZ
2MPe+ZajC/pyIpcCY54mgFlFiMeiHcDyGSvGpKGJQ4CpWQY8XgtmRA2K8IEtDK7z
geoGkjTIu9rl9JO7hr8SAIKNkhFSYE7WO2rvWkqpU2/szDsjfyyCeQt4oOL+zfdv
WJM/217beKUXn1TldvsaEbNDGBrshmTI/O4GlwWvmFKcZf1oaiToEPQbQAruritC
b7rWJc7YuIGyWwZnHp5EhFtqO+epgocSAmO07KQPhZnhQjmCRpdtBBLvaXKlypNn
Sk5LY1kqadn/Gp8o9N0BIsuyIC/2Q9TKxvWnOcpks42RRvnAyKeuL3k/vUNrnyrB
7yyquBteBY6inu9lpMs4sfhQFtTqVNfIihE+/hK3HM4WEbkUN2Wcg9nBKzcUnD3i
zw2XggnRWLjD9DslM2F3wxv4pqn652iO/zu8Z4PQOvxL3b4Eg6A=
=/hG4
-----END PGP SIGNATURE-----

--jqV2DqZFSXOM6h6N--
