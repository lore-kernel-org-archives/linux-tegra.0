Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233A3C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C38D6120D
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243737AbhJGSj6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhJGSj5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:39:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4DEC061570;
        Thu,  7 Oct 2021 11:38:03 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v17so21923793wrv.9;
        Thu, 07 Oct 2021 11:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0T4sFmsFD4jLWnAWeMtgvLVvevwwzto8DJfNckqAtjk=;
        b=DH6fzr+IIzvip9zeeAFecwpDyaHALa4B1Oe0c/V/M91O7gttobD0SPdeyjx95lbLJL
         W+XMI7LFo1/Yb718Lz5oI6G+nenZ1v4SAKbLSpheS/IMWMAJMQTrgMSP5oUOm5sLNJVD
         66SXUtnopJLlySa9fWdXU9f06q1GfGykRH4QZezgx1aHDXlRJZORvhUT0p0s0xYOZy0+
         U0NPIQtE818CunbhYVeyd5/Tx9ElijJBBRhACr9dVw0KCU4BGhOLwezRm0pSZtKTm7Sw
         lY/R5JldsmD29j9U8/y1Lf96e9XpYnVNnksLNAE4PKvFr8SVR0AmxV0P6a753XU58SUn
         F8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0T4sFmsFD4jLWnAWeMtgvLVvevwwzto8DJfNckqAtjk=;
        b=Euzoy1mIDKzi0HXgvPFYYvQ35khSOkhNGS4pkZZi+ye+3H7oGKXeqqio6yHe2DzapK
         oVtIRTs4wtTOzbhgWB+C++ZFW1wHJpycT+e8RhxGnvFPP6LwAHOIx1yglrOYuqO0j6/P
         U3zzA1HYhLbiuE422dl/eNFrScjr8rF63j4bhElou1ya38ICzkU+NWPK6cWKLM4MKIG7
         8M0tYrhfxbZPQWR1KBL8Z/s0sjvUxASVH7dYU1lkScSjghPVpgUB05x8TeU/JLF/Kh1w
         Bb1h5NWHZgucXBrChrYbWdfBY8HkikiHIUx8RJZYrq9os6XljXp1F9nuP2u+yf8bEGZs
         ZtKQ==
X-Gm-Message-State: AOAM533k4Z3lzelYuL1Z5wxnyZ7T+pFZbACOuDd+xgl1Au8G88rgLxIa
        ANIRRBWm/GW/R+w2OTzOUXM=
X-Google-Smtp-Source: ABdhPJzJfuDW9EQbVCHx1gflY1tLjMExzGosRt6WHhIO2MXUwwvJLhDGBqt/htKqf6iSgvJNqqHdww==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr7627454wra.125.1633631882331;
        Thu, 07 Oct 2021 11:38:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w5sm102868wrq.86.2021.10.07.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:38:01 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:38:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 13/13] arm64: tegra: Extend APE audio support on
 Jetson platforms
Message-ID: <YV8+iNu+BFWtUi0k@orome.fritz.box>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-14-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WYOR3Bx3yFK/LlLF"
Content-Disposition: inline
In-Reply-To: <1631551342-25469-14-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WYOR3Bx3yFK/LlLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:12:21PM +0530, Sameer Pujar wrote:
> Extend APE audio support by adding more audio components such as SFC,
> MVC, AMX, ADX and Mixer. These components can be plugged into an audio
> path and required processing can be done. ASoC audio-graph based sound
> driver is used to facilitate this and thus extend sound bindings as
> well.
>=20
> The components in the path may require different PCM parameters (such
> as sample rate, channels or sample size). Depending on the pre-defined
> audio paths, these can be statically configured with "convert-xxx" DT
> properties in endpoint subnode. The support for the rate and channel
> conversion is already available in generic audio-graph driver. Sample
> size conversion support can be added based on the need in future.
>=20
> The support is extended for following platforms:
>  * Jertson TX1
>  * Jetson Nano
>  * Jetson TX2
>  * Jetson AGX Xavier
>  * Jetson Xavier NX
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1554 ++++++++++++++=
++++--
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1493 ++++++++++++++=
+++--
>  .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1520 ++++++++++++++=
+++--
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 +++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 +++++++++++
>  5 files changed, 5900 insertions(+), 419 deletions(-)

Applied, thanks.

Thierry

--WYOR3Bx3yFK/LlLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPogACgkQ3SOs138+
s6E0BA//V/eXDLK/uGRMAQbd9X+wxshlGqYWKNNJgBMMyoAm0pmjd9zMOsHzZEZi
0lgEL7Bdy2BvzUF2KG79yQfyggFZPNLG8eGtSmSrbTtJresRXXHO0R75vN071bF7
KFYG4rVvYiucFakXV56UaqesjPUJLWW6Gp9XmTkkyBIA+UA4IpOJHoIxF8NZ4Kb5
37yQfqqweQf9B/eblz699rnZMYlZHKRQh4TXlyav3HiMUOb2JcowF3wLF+nac7mj
6QsV48xa0gFSgMy9k9KeiAmhS4EYEAsGKbxyrf594U6cfLpXgKFhZv4QJ3w3UZHJ
mrY9ktzkjDj2fbOqtQ/U5/pMGBa71IJWgdc1/HZbXcvzxQ9y4A6p3143XFLHdw0z
s7VDJ4teuu4lPaE+LocpWVqXepIUNlvKZzQZOdFMMJSlXOwI+Git+wBT4vS9+tDX
VDMLvjf+0LOhGtw0gPuFxr3GBnWy+3gwakqVnSnCHZoEvdCo49TPbWOA8GUjfOve
YWrFw7Om6iQspODn/uNTrtg47sTonx9+6iITIC/o4Ie3+kZHWqm6OxOz5Bx2hQ7T
dqC2WqbjRCGvYzdAY7fGo+wycz4gGihabgEQ/sjs8J9J/+Pv5Zezwrkda7kc1Al/
jNG5ZgbLb74oHlXwPtQFtF5DuQ1NCYo25GSOevRXj4fDx24vLro=
=B2Sx
-----END PGP SIGNATURE-----

--WYOR3Bx3yFK/LlLF--
