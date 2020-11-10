Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E7C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:36:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F0FC2076E
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="do4lRAMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKJRgK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730990AbgKJRgH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:36:07 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76274C0613CF;
        Tue, 10 Nov 2020 09:36:05 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k2so10251753wrx.2;
        Tue, 10 Nov 2020 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yI7pvhhf9eYcr4c4vuzWGXxLuLv6b6en2IDwqJXbk+Y=;
        b=do4lRAMBI6RWf83PHfjNL7LPsj3Vf2qxc4GqgjMUYqwPTvqWkyZPcShe6XJ8Pw1xqj
         CMt1QROqtHQxccnccQjkYB1/RU50s/0pQW20jZylYDs6hK52PVtN4PQa2+ZAlnoRDGu8
         45r/cgM5N4ZBPeLL9ICWi5HUkMJeoAOzYGv+CuyJ9l/hAihuvUlM5gTXvCeZC7xZ/2bN
         iX7pIeJWVdJp/YF145/4GO3cbHsKP6nLfGU9u9KChlucAy6rc2qbh2SFD5ApARn56lgd
         Kb7tZwjzlRZoS01w6KfbC1TJjIWjVlAnMv9axciNcCxkX5P1CE9eaZR8PqzCeWQF0zn/
         addw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yI7pvhhf9eYcr4c4vuzWGXxLuLv6b6en2IDwqJXbk+Y=;
        b=h3pIlw8WtiYrQEx83GHC1/Agn0xXHiVivoQpQkAEv/KrnvVLHbXJbtmdp+jm+NOFel
         0LuydyluljqvUGcecKf6YqOrY48XeCZURVLVGIme+5TlOANG2JuMxl8YC0m+Fy+M16xM
         bkAhCZ4K5bFUTS6Gjvdl+MBpYbvlrjYSBSs7JQNVWVmVy5rxq3hP0njWE1KdVFH3EWZa
         uvb4Z3Ad2IqC/sHblxKrDpw2BYKQyaZVjSDUrOM+qGKOVeovMuyWLwZXW7ntSEGIX9db
         PBNblQcbcXPuyR7QJUTpUHAaDyW031v9lxYkpu/sUTNXepzMX9M3JISOrJLNKvxZtv99
         FOxw==
X-Gm-Message-State: AOAM531oPEfjFPuUn08/Ticj1TYvuytHKyxBvOqyi9RRMh5/+SSVuAlI
        WG4o/EYuZFH/N+X6v6cyDCs=
X-Google-Smtp-Source: ABdhPJzuzKaU+Y7TqU/Dvr4PZBvls9L6VEQSJmi0yNMwk/sieOXMXK1ErnIWP/rXHqhVY/x7vd6Z+A==
X-Received: by 2002:a5d:444c:: with SMTP id x12mr13123292wrr.6.1605029764212;
        Tue, 10 Nov 2020 09:36:04 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n9sm3683926wmd.4.2020.11.10.09.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:36:03 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:36:01 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra186: Add missing CPU PMUs
Message-ID: <20201110173601.GA2297135@ulmo>
References: <20201013095851.311478-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20201013095851.311478-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:58:51AM +0100, Marc Zyngier wrote:
> Add the description of CPU PMUs for both the Denver and A57 clusters,
> which enables the perf subsystem.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 28 +++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra186.dtsi
> index fd44545e124d..6bb03668a8d3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -1321,7 +1321,7 @@ cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		cpu@0 {
> +		denver_0: cpu@0 {
>  			compatible =3D "nvidia,tegra186-denver";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0x20000>;
> @@ -1334,7 +1334,7 @@ cpu@0 {
>  			reg =3D <0x000>;
>  		};
> =20
> -		cpu@1 {
> +		denver_1: cpu@1 {
>  			compatible =3D "nvidia,tegra186-denver";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0x20000>;
> @@ -1347,7 +1347,7 @@ cpu@1 {
>  			reg =3D <0x001>;
>  		};
> =20
> -		cpu@2 {
> +		ca57_0: cpu@2 {
>  			compatible =3D "arm,cortex-a57";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0xC000>;
> @@ -1360,7 +1360,7 @@ cpu@2 {
>  			reg =3D <0x100>;
>  		};
> =20
> -		cpu@3 {
> +		ca57_1: cpu@3 {
>  			compatible =3D "arm,cortex-a57";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0xC000>;
> @@ -1373,7 +1373,7 @@ cpu@3 {
>  			reg =3D <0x101>;
>  		};
> =20
> -		cpu@4 {
> +		ca57_2: cpu@4 {
>  			compatible =3D "arm,cortex-a57";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0xC000>;
> @@ -1386,7 +1386,7 @@ cpu@4 {
>  			reg =3D <0x102>;
>  		};
> =20
> -		cpu@5 {
> +		ca57_3: cpu@5 {
>  			compatible =3D "arm,cortex-a57";
>  			device_type =3D "cpu";
>  			i-cache-size =3D <0xC000>;
> @@ -1418,6 +1418,22 @@ L2_A57: l2-cache1 {
>  		};
>  	};
> =20
> +	pmu_denver {
> +		compatible =3D "nvidia,denver-pmu", "arm,armv8-pmuv3";

checkpatch complains that this isn't documented. Did I miss the DT
bindings patch or do we not have one for this?

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+qz30ACgkQ3SOs138+
s6HBzxAAwEqPA1wNNau74MzrdtTvnywfhkpkSXdS4sGF1NCGM/vv/ztqHAiaaEK4
SsqfPs5v3Qe+qPiEAH3BHZxJ9hZBtJNQHtx7bT/98I5BUXpsQB4S9IwIWXy6zoy6
5Ji8kF59PdCXGoPrlDNSZJq1t1dje2O1OtRPKLO0pDMIFNxZN+Ae5SuTiV9BkVjJ
e7wEF7a+Ty2davsHmZfgpkgETgDArrmZmniF6zIVWsxrj7wkr7ZvcjToxG5O/Xf0
XJnvySxDj9ImXrgrS8BMDkGn5WbQSbPNGCTCymDoScCxlIHxkW1qFCI6y+VrdrK0
X+uOQ8wXV5pNEUR1dna8QGHG41+dWMpih6tGXDxd94FUBFeCiZURuk8LP9tl3WDh
vXu915BVIaWbXrL6UK5Z2Fyy1bF+3OSsl8QtwyR7cDGCPyAkp/KrDr42LEbkV2N8
tTQtm22A65L3v3RLxnXxvG9cue4s+Jc82dPbzTwEXn23T29gcL56Bzt/mQQRICz1
1gVT5bGHY0x3RvW+whI5CZhvmYhcZXbXg3jZiTrexRMzTqrvq24kt/UIb/TMvJi9
y9OgY63cAUR5HPepC23mPI0sQY5kYgjlYe0p0B2oRm+fUJzCW9duTwpkknFPjh5L
ntIopqi3tuv+flXIjaTdbuJoNZr3VbOAHrKacm9d9xB6MsEQbFo=
=iZdz
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
