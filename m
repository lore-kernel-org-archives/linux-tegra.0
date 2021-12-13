Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D30C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbhLMQGJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbhLMQGJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:06:09 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1ECCC061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:06:08 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso14374260wms.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6x8wfU7+3Xu+EXhoSPvOzm1IHDIOslrdeTHjkPZ61u4=;
        b=aYTcB2ZObnENzJxNDPp3xfzf0evk2iqaQThhWamBW9yP7j/oU2Z4eqSZJoHga6B+Zy
         gM9kcc8n2GVSrbAVirZXkMq0QhwF6trpxUUh/EzXQiRNqxWoDTVDTlRz7YkDy8LALo0l
         K4offX6HNPqyyUkQ2NhrNpNW0VhN6To+LKiXatOd+N4D0vZr9m2V7qIyF3rzZ8M17iC4
         ye85goD9vjDvPg/ZOFeOy3NSAkGJXlW91ZlqO3hWEII+cCNe5AW9E2tTFACq130xFCJD
         WC4k/9gMMk3u7J9Z+LVRGF9W47mth/l1QDni6ZYt5dvj4GtxHvZ2J4rlqlZnE1a9JD89
         wDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6x8wfU7+3Xu+EXhoSPvOzm1IHDIOslrdeTHjkPZ61u4=;
        b=Yaa1f4ic/Y7mbFT42h0esMVE1/S5f60EjuFWaLkMVPjEp7GaZ2wZRkd8sB/A09HEXG
         5app6uu/mfnfFdx8QDGTAnib/r/5h7Xun6VmMmMV7U65/dyw8fdpdzPd1bryPlaH7d4g
         8YhEeGYPgJ20xa+MB7AUpRsnLCr5kiGRjvfYpzCbKMB2SnLllRpfruRXESmwMK4YOyAr
         ZFstXgMz0NEeVX8p2cno4A/uy7ISCDxEJIDz12A2mJsOyC4Lkn+Enh7M+6J+uITrumSe
         VMzuuCVzdd0+oQhUK/OxYZhOfKvg17RmDqPseTLlBigSp1a3v8nuSJjci9JLqLNHUDyT
         frnw==
X-Gm-Message-State: AOAM533/rI3mcGDVreEw0BDZI3rn0/rjKDPIUL7Pd4WeiG/sYtxrplLd
        wSpNyvr2N4oSncRJVohlRII=
X-Google-Smtp-Source: ABdhPJyjNpJhYR/EDMzu9vRhw6STaqlJvijBqRimOBXQvHA6ycP50uzncKK4t4U2RgZP/r8QAE8X0Q==
X-Received: by 2002:a05:600c:3846:: with SMTP id s6mr38333940wmr.55.1639411567449;
        Mon, 13 Dec 2021 08:06:07 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m34sm7868772wms.25.2021.12.13.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:06:06 -0800 (PST)
Date:   Mon, 13 Dec 2021 17:06:03 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
Message-ID: <Ybdva8E9+vsBi0mP@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-8-thierry.reding@gmail.com>
 <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com>
 <YbNZlyjpi/i2Dph6@orome>
 <60c59ccd-eed4-3046-3ecc-b74475778a3f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LlkxCYONN1CwFRcf"
Content-Disposition: inline
In-Reply-To: <60c59ccd-eed4-3046-3ecc-b74475778a3f@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LlkxCYONN1CwFRcf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 06:28:36PM +0300, Dmitry Osipenko wrote:
> 10.12.2021 16:43, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 09, 2021 at 11:34:39PM +0300, Dmitry Osipenko wrote:
> >> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The Tegra memory controller provides reset controls for hotflush rese=
t,
> >>> so the #reset-cells property must be specified.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm/boot/dts/tegra114.dtsi | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegr=
a114.dtsi
> >>> index 328425dba023..ce7410ee08b8 100644
> >>> --- a/arch/arm/boot/dts/tegra114.dtsi
> >>> +++ b/arch/arm/boot/dts/tegra114.dtsi
> >>> @@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
> >>> =20
> >>>  		interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> >>> =20
> >>> +		#reset-cells =3D <1>;
> >>>  		#iommu-cells =3D <1>;
> >>>  	};
> >>> =20
> >>>
> >>
> >> This will conflict with the patch that adds video decoder node [1].
> >> Since the VDE patch was sent out earlier, I suggest you to drop this p=
atch.
> >>
> >> [1]
> >> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.=
4064-23-digetx@gmail.com/
> >=20
> > I prefer to keep this separate because it actually gives the reason for
> > why this is added, whereas with the VDE node patch it looks like it's
> > there by mistake.
>=20
> So the direct reference to the MC using TEGRA114_MC_RESET_VDE is a
> mistake to you. I disagree.

That's not what I'm saying. I'm saying that it's not obvious from the
patch description or from the rest of the content why that #reset-cells
is added. It looks out of place.

> I don't mind if you'll keep this patch, but then please don't forget to
> resolve the conflict, or we may have two #reset-cells entries.

Yeah, no worries, I'll take care of that.

Thierry

--LlkxCYONN1CwFRcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG3b2sACgkQ3SOs138+
s6GmEA//WeSVzAc1nmiXM0aSmsawaF9xTTGnunC/QbqmFJ3dJQl1DOooHdjm3wXH
bMbLUi4GCptH1tYjuJNux0+J9TAR8D3YPJFh8R1tjnZUje/oo3cOACI2P1jl3I1V
p0zU9EubfX/db0t87nnBRh1aow7XbJtZ1S9OK+MoDdm0SOP67w8FUtJz++pIgPjq
379/O95vUMCBvfGSSaEK+wsKn7YlQT8nyVeOJG7QVcAl8H+mfb4rY4p4+jEPKLwq
LSBA3keiRv3CQWqeE4NB25cn295QfmO1SSCw/f4V6+NiKNbwjWbgjTmxkSR+vHgx
dl8gbd1gAxQF+UVi8ZKayD85NMc89eTjBfbA0g0ZoANMl48BuqhuQpaf1QFnzIwJ
LgrdocDrcgReOXKTxtyvbxD2ufyVn0sFVniCIPMuzRHfekHD3RaQ8m9E+U7GSpcW
CN7KwWh8liCEw6PKYqtJeTckT3NdiEIPSERHvk0zahBV6jhkcEL6akrT1b60HJJ0
e6EYfzXB4TunkYeQ4euFZokvCwbs+Quio8mT++qlURumg+Zn5JiDjWKFV39yJhOJ
3soAi/i+vmakDnxenTwB9RyGX2ax1HumCtjFaHya39NyeEIrbNBpqk5MXlfgTr0a
CKtUygr6bks6olpO7PcsLEg0PT1Fu5C1uEiXWArAnKuotZlPM7M=
=PUMW
-----END PGP SIGNATURE-----

--LlkxCYONN1CwFRcf--
