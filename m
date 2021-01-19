Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85510C4332D
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4673922DD3
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391385AbhASRSU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391392AbhASRSI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:18:08 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9448BC061575;
        Tue, 19 Jan 2021 09:17:25 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id z11so22555500qkj.7;
        Tue, 19 Jan 2021 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b5LVKZxTrplQ11RZzvZpJI3DUzGXGrVYerBOEgEz3Uc=;
        b=l/n21kYHvIIahJUswWHxBAyM/26feZo064ZrEbI6AsIrwNR0f8tI3sbipKjX+jYgtu
         fCJoADl181GNe+acSApG0KsagHqMvDJgGKB1nh9B4hdbtYSH4E3f+2Jm+U4GAZQ8rgQW
         MP5sfiPE/HKYPowcrY+5yaJ50ixgy/DlJy5IYQXpB3YdqBwWANQsfqKgJqnU7VGcDUmJ
         HA6yKOKoLb6gcBClXoHl1pQU/qpk6LNHGav76unhGL7HN2OkI0rHbV6IpU7kLWTQXQ78
         JfTw27VvqtXyTMRr6dlw5CVoRSSeHKc01G96mn6kN15d7hs3oEHEKp3tEZk0plShKmjY
         dCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b5LVKZxTrplQ11RZzvZpJI3DUzGXGrVYerBOEgEz3Uc=;
        b=LHwj8PHCInCydv6eIXeaL+WT44+798kOEZ1/6bhf91hNrnq9fRNAF/8IalSmt03uoH
         kKwZc2V/vgiPlYI+Tbl0PPzSrQu00wyzmNerBxGUZNDiKArXeBiFpPcEnNQRQ0cY+mC5
         /2chS4jpRg/39G6bgA9KLiFLzYpbL7JCU/XKwmWh2d3hSwZoZqOZEGy04nKn6VxcjXwY
         yIf2soXDfCl4T7GbPpb9RpDk70eRQjDreDNjk9E9YpwdVLHLLdzAXdbJoEFKiFAHJyz3
         18p3rW3V1teKenqxWQPklpqimuSRM7SI6+USSyh8FEkwnk4VHztmaTbR44pNxwRmirlo
         3lkQ==
X-Gm-Message-State: AOAM5309j8wbxJycy2WdmWipVWHEUByNsZltjS4mNI0OX+NidskABc29
        TfZSZTpDZnbtgWl3dajyTRY=
X-Google-Smtp-Source: ABdhPJzvA1cMspD0O9nIWOVS4ATYqPCJVxApWvkdPWnsRK8TH9FkVxLjk1DX1basETRjptxUwnfavg==
X-Received: by 2002:a37:5c81:: with SMTP id q123mr5289236qkb.309.1611076644872;
        Tue, 19 Jan 2021 09:17:24 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 8sm12922265qkr.28.2021.01.19.09.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:17:23 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:17:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [RESEND PATCH v6 6/6] arm64: tegra: Audio graph sound card for
 Jetson Nano and TX1
Message-ID: <YAcUIZpOVr7Sjyoq@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-7-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PWqwWawcwfvI8Z/3"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-7-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PWqwWawcwfvI8Z/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:16PM +0530, Sameer Pujar wrote:
> Enable support for audio-graph based sound card on Jetson-Nano and
> Jetson-TX1. Depending on the platform, required I/O interfaces are
> enabled.
>=20
>  * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
>  * Jetson-TX1: Enable all I2S and DMIC interfaces.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
>  2 files changed, 408 insertions(+)

Similarly to patch 5, I'm likely going to make some changes to this when
I apply to avoid those label references, since that's not something that
we use elsewhere, so I want to keep things consistent.

Again, just mentioning that here, but no need to resend.

Thierry

--PWqwWawcwfvI8Z/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHFCEACgkQ3SOs138+
s6FBpg/+LPSfyFZtSmQC9bfJ13HYxQ7gHohZ2vXse2/p6URwG/zJO5KWW3C6G7ou
1QPSEjcmu93wU3CdyJfMjeq0ZkTtETUO91lhdBJSVG0ZzVeuwMDTySwzaDnvTZfz
ZjYbM0eYIL2DNQYdPATo0jEBsIDkwvGvmnrdgcGQlQEfDp7mk28Xbp3nlKmyElp6
5D845/Mf8Kvna6eMX3op9gq0f/RSBGyQCXBaZbKSUapD9WEpRCDev6Y/dUwh4544
E3oh/LrkcXyX7Mh/pT26O0wWVDzT9TSFyBQ5TMbenxt03gV8g5Lrxi6p+8XvlPNt
Rz0YOdFQUdC5NTwtwPcEQTNJA4ZxUtcln9gzozFama8cG+8EcrnfdRQflzaARr3d
jt9ST91LzNGsw/Ua/KJS9P/MCOa8WbKERqR13/m3OUavXi22G6aBKErd+V03P6JP
VWj4gRh/N7gx8CPmEIb4pu6TJL/xEcDC+SmfRJlJx5rMvzwvDuwkz9GAxS+vYCzy
LPOsIRKM+K4SG1iKghK/fOjMoWECmB63cYiEVHvXs4aW4Z4hK6AphRlFEfCDxKrn
GJT1SkpssGZvLTl/I1QFQSSRIUIEyK5l9xgfBr5JAe1z/dwlITZOrdYPTkJ5OV+V
TGpp3ObTYhUYd0lhJUxYOlNkM1wdZcGg9ALEwJDKwfud0McFTsA=
=DCH2
-----END PGP SIGNATURE-----

--PWqwWawcwfvI8Z/3--
