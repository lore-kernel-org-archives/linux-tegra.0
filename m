Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E26DC388F9
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 13:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A434220773
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 13:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zoq0uqB/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751649AbgJ0NDH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 09:03:07 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:42435 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751646AbgJ0NDH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 09:03:07 -0400
Received: by mail-ej1-f66.google.com with SMTP id h24so2085173ejg.9;
        Tue, 27 Oct 2020 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Akn6mMwbEqEcrNKkBd+E5DBkoaC18RuxAMvchT22bhE=;
        b=Zoq0uqB/jDoZ7Sk/NpQGtwww9G2rqm0eSAK9Lrg/SLYlfNM0+Fh7enuckFfySeqQm7
         10JN1sD3M4mhLJhD948mDKggfrbBfoLIyLDtvL3lAVcFnIzaBRgAmwbYhiMmuwlxdqqk
         +A4zS4KypMoUDnNtW2UUW532kAnbhzErHi6C7xT1yRZsCbuuqcGSgvuNOWb3GrMkzJGq
         scB8aKaY85waMFNdrbsx4Hogk14mwXmXlfhromf5e150EfCyrDBht0pH/7T4dgY/m/Iz
         7e3Nbi9V12IE09HQb+rBZdiEUJchhefHoWT/cJXLrQVXuR2RSTADjynHKMyeS7c6RCu/
         oc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Akn6mMwbEqEcrNKkBd+E5DBkoaC18RuxAMvchT22bhE=;
        b=bmTMZwpn9mhoF8Dyx4XQkhGsJGxaPP1sQhq/d72FkSjo9HY9mtZZJ809hfOnYoOaFr
         LWaHNLmJoMI9Z+m7rW0JYfw5mGORzJxXMmKuahJpr1IgDR4qSpsEn9eBJ+74xTkaozVX
         9D12OixbVGAU0oL2RtPY5MI2g5myAmJaRgdXuDHR2nGamRhPa0M7ia+12a5SHup9lvKt
         D3Os4FkNGepIHXsv7tVYXOhaGIrzloMW63QUPWbBhzOQPVGujoKr3VixAnjn1CwUzyK+
         n0b0yFrt1JDHvZVMtoiOdOE+lwO01TuOAilap9O5U1Dra4LqUgQfCpMAOOFXqXaP11xT
         Fl4Q==
X-Gm-Message-State: AOAM531pKbZTysvpvUUKXrfVt/X86mL1mpwCD2lovOuVvuLr57flHggn
        c3q7kU0xEzqqBcNK8LMoHqE=
X-Google-Smtp-Source: ABdhPJzM5UgjxXHEQvTfepwS2pEiStVoMABpcq+KJMMAyQfFtkSboC6tL/FKRuJabajvNq+NW55nGA==
X-Received: by 2002:a17:906:6d99:: with SMTP id h25mr2285299ejt.281.1603803784246;
        Tue, 27 Oct 2020 06:03:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d11sm933442eds.83.2020.10.27.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 06:03:03 -0700 (PDT)
Date:   Tue, 27 Oct 2020 14:03:01 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-tegra: Fix error handling in
 tegra_ehci_probe()
Message-ID: <20201027130301.GC1822510@ulmo>
References: <20201026090657.49988-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <20201026090657.49988-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 05:06:57PM +0800, Tang Bin wrote:
> If the function platform_get_irq() failed, the negative value
> returned will not be detected here. So fix error handling in
> tegra_ehci_probe().
>=20
> Fixes: 79ad3b5add4a ("usb: host: Add EHCI driver for NVIDIA Tegra SoCs")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/usb/host/ehci-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 75a075daf..7b0efaf15 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -479,9 +479,9 @@ static int tegra_ehci_probe(struct platform_device *p=
dev)
>  	u_phy->otg->host =3D hcd_to_bus(hcd);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (!irq) {
> -		err =3D -ENODEV;
> -		goto cleanup_phy;
> +	if (irq < 0) {
> +		err =3D irq;
> +		goto cleanup_phy;
>  	}
> =20
>  	otg_set_host(u_phy->otg, &hcd->self);

Acked-by: Thierry Reding <treding@nvidia.com>

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YGoUACgkQ3SOs138+
s6GZUA/+JuSpXjUsoZE9QowE0w/gzP2RDl6eBSJcKvL9KJSOoydP5AHCfKuVk2UO
f+dCqptwPH32vcASHayD0yaNU9rFJtK7H+7fR8Q8RH9kJ3ZPhro3GjatJZymZtj4
2zfmR+y+kjoOzDFM2GxLwZil/h4+ACcejpV4oQ1iRYC7VHBbPo3TBOip/Mutb0vr
1Quu0rehKgZS1hGQdUfSBKf2yr3Xb+OPnYAWzoVW/+a8nh7dyEu3Sp3CkPdHkKRT
MT9sw8aWaVdRzfjvQhxGJqo2iqV9rQCoDqDrV3erGlxsAc2anmG9K34o6btQejYi
Ubi+mvCM7dI4dcSaqgEA/OJSNDUAC6aKg1j0dc59JkKj9iALdMvtxZPKonzZdRZM
YJsLKhXcE+NZ0MxmJsV/NeBmbE7RKmTDuHWASQYZUl5rtmIulc3JyYngH7eQwNUf
D6peaHPxPOOnQ/IaxL0NP1IauaQMQ1ll36ZyeYUnRzCeMrHsqY0ENkOr2X51Tpy3
y2OgCArLGumjz2uKESiqmn4Iq83eyIacyXnAzTWC1PB3QQAbPKXFqkORPAef+na5
1rcfNss+dartFdWfGqUl6TxP0IBnryn4l3Td8Oj15/98RaDafTG8hCAIxq2y/u9u
mNfMKomGdJpkklLlPGQAp7jTMBuB5l8KsA+c06iR2VPCfgGN3w4=
=xKhy
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
