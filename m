Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732B4279E9
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248274; cv=pass; b=lfAJ3y+6sMez5SmOD5jJNdV2rAvuivrILjRKNVPF5JQLIzzICIGuAdvck5r8XrvYquRKVOiIzQU8gnQCp1IVvUtflaeypUCYOjJL60FR/JaHASZRtCdlFMlfLA6+QLGwXxdzvqCGI2GOWWkrGIUKRzEOFn/P07DrpgpD8CFkDEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248274; c=relaxed/simple;
	bh=s0L6BAhWQAP5ekhIx6eSaVT1WWCc3scLWsxKArPZM+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9ezvRxUU5vlPqtYNAQXhC/X/UK9Z7ebWHy++NjnvxmjB//cbFSVgVRmLRFloKl34wbW22t8/mpRSWlj+FbF7N2vJe7bOVA8EI2I9JbgJkgdDxs1jRPdqmXRGOLAiEdVTFTYdTFOz1KSSQlLRN9wnY4BxDVuc06MvVcRDChW01M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YokSOt0f; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YokSOt0f"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3658982a91.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 07:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248273; cv=none;
        d=google.com; s=arc-20260327;
        b=ArYskiEQUTt7FpWPJWCk7j0Q/cDCQaEAvvPjIv20GcRjerjIePkErJGwgjoA2VpObe
         kJdnIJU6+Vw0sEUmPejERaubh1G1iMPwSaMZERu0a76qjPh308XmulM0oSwY1YGd6mEc
         VrbePhAdBNbh91oL315nF+Ws2KL1aAxF5YoGU2r9DVBqcvIFD1U/lB3uEOhp12zSjHAq
         8BCm3Wv8XBjua/6PjBXsbci0wyCyMsJWysf3pjG+Nt9jUXJNN6Mtbl9b64lQzaqHE8/J
         oDNNFthfIj2kFDqkuI4FBj6FSDpJPO66mQS9IU41VUSaHRtpwqHNKAKjIR5qRMYxprca
         /BLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        fh=ey4IDT78kKOYSWKKNQtrOzsPypuY2LOBL7ZovePILAs=;
        b=fBjiX+GGFgg8huunYPeLKUuYlC7d6TVhyyvBnYhPmMWCp/EVdWV2+vD2tsKYk0HZvO
         DDZCGT5DdQCVGRM1mqDzen6o5ZX1xmArNG5DhFbhIpAsBWFMadFGL4Ar6AhQCZ+ysfNY
         FzOiePU7C6um0TsnUubb3Dn6hLhXz12Hvrrxog3wNPzqYmdjYaIFXodSrZEe4n/YVfaW
         2cm8CJf4K45fzSOkSTNtCJM8rfEXSzsYJ87VuVwnALterUR8YldHBoJmRnumZ25Pfju0
         GVSzMlgzQzfjV6vLLHPJGuEF3nRu9dofDUtVwivpmH1upzRaL01NtZo6NmdiF2VXcjcp
         fhEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248273; x=1785853073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        b=YokSOt0f/DaINSJN0LmqmT4PMOiXwK3fr8lnQaquGQZs5P9xdLSeTYplaDrd2IEonD
         WvhdXA/wvxAtzDZv88HnuNFCPf0pEybOn7PWcdDSMVuC4BOkE9iOSi8NJX4pWE1i+PVb
         l9QiEqsJZNBiGCAaN496wPY/n1W02ZGtkDM2Qcw465WHzCy8HaXuQvUiSMq5t9gNpori
         Q7clE8c9dZbf4td7aCkA6kV08YWzgM9fcx5XLUXPriBvduFXPeiWfpmE9Qwz9IWI49UL
         ukoqCabtd0kSnf+qdA5dcU0NIpwN76K1EMjOPjyJ7qyRYMSOsTX7WAJI63bKQNQKposQ
         LAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248273; x=1785853073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        b=SSiLfkmTCSfM0DpSJoq/WLpMzQKRGlAvee0pV3diU6eWA6iwuWl9Exot8+yyWymAhu
         T8yXxLTWFJlLKBLs3MbekRAsui/BZWkJaPQJQJydYQWMTN9JrqMnbV+ZCdmr/muuAZJM
         KaZsvifQFSCGfQ2lGKNqtuQYi/t8oiPLhDiZqz+SmBENw+IOOk75qvfBlbvdmmXPUxnJ
         bKF0p7N6L2a8lk2MA4Ev+vG6wp2xdUkCXHd4InoXFUTT3WB7DIsp4JBjE+rrFXGOP0BC
         JTM6zy6F3jR7EDq0W0vTqrb7SpxvcT75pCsIyKep2nuaHR0FWPOcrSlIlYSyrj9pBjdQ
         gpmw==
X-Forwarded-Encrypted: i=1; AHgh+RpJKkmvpudOWOh5YGOAtcnEWhxDV4kwrW5LqR+wUz48iDU21xP5BSMx431s/rAbLdbwa+Ov61zuxr8n5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVg2QNiywk7vyISIbqLBarLxqMbXpz+3KqYhmwhXLeAL9iFuT
	n62TktZQ71OPCv9yAxYDtZgnO3YokBINGIYkLgo0qYRAqAxkGZuSZt9UgK+cyRzRo5ztce/LJH4
	qTy1p1UXzhqtkjHM69w8MCdtpFPubvKQ=
X-Gm-Gg: AR+sD13q+nK2/70pRqp5Ly7VYmL3FWHCO5KOZJaXfJ1VYJTI7dZE7V41P896rviH97G
	K+uHal+66Ymv8/jYJwPSEXGXfJ9WRMdXgdtjaUXsZtU26+zTlnrNZokjkQz/Udh5q+DWSA3Tq2g
	E4lrU/muaYOM0HtsS7lLdUd5/KcEKVbw3yAOmv4CsW2s4dTa5V5Q7afuYERfEgfZ7Fwxyf2Q4xd
	VCTp1lIctzmaGVg4yw+6xDFloJ7IQlCzJBkfzlfMpNVClFWky25IW8i8TZGapl9FPyg139dexvs
	/7hgOcqx/cuR5Pm2qZw=
X-Received: by 2002:a17:90b:1806:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-38f6a40bd7cmr3263576a91.13.1785248272625; Tue, 28 Jul 2026
 07:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-7-clamor95@gmail.com>
 <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
In-Reply-To: <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Jul 2026 17:17:40 +0300
X-Gm-Features: AUfX_mx6nAQUP8140au6l006nq8pIwhJbqbjeri4r4lcGh_AF4WWT8JcJVxbdyI
Message-ID: <CAPVz0n2cBDZ16rek-phtp0J5QKSfyZHWHtJX7CeWjraEuz=5qw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:09 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8v
> > which is eMMC specific and improve their power sequences. The uSD card
> > refuses to work reliably with fixed regulator and 1.8V IO supply. Adjus=
t
> > configuration to mimic setup proposed by the vendor in the downstream
> > kernel. Add HS200 mode support to the eMMC sdmmc device node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++------------
> >  1 file changed, 13 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/a=
rm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > index 83f8dd84d28a2..3de5c84d5f009 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > @@ -1645,9 +1645,9 @@ ldo8 {
> >
> >                                       vddio_usd: ldo9 {
> >                                               regulator-name =3D "vddio=
_usd";
> > -                                             /* min voltage of 1.8v is=
 not stable */
> > -                                             regulator-min-microvolt =
=3D <2900000>;
> > +                                             regulator-min-microvolt =
=3D <1800000>;
> >                                               regulator-max-microvolt =
=3D <2900000>;
> > +                                             regulator-boot-on;
> >                                       };
> >
> >                                       avdd_hdmi: ldoln {
> > @@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
> >               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> >               clock-names =3D "ext_clock";
> >
> > -             reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
> > -             post-power-on-delay-ms =3D <300>;
> > -             power-off-delay-us =3D <300>;
> > +             reset-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>=
;
> > +             post-power-on-delay-ms =3D <100>;
> > +             power-off-delay-us =3D <100>;
> >       };
> >
> >       /* WiFi */
> > @@ -2372,9 +2372,7 @@ mmc@78000000 {
> >               non-removable;
> >
> >               sd-uhs-ddr50;
> > -             mmc-ddr-1_8v;
> > -
> > -             power-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH=
>;
> > +             sd-uhs-sdr104;
> >
> >               nvidia,default-tap =3D <0x2>;
> >               nvidia,default-trim =3D <0x2>;
> > @@ -2396,14 +2394,18 @@ wifi@1 {
> >       /* MicroSD card */
> >       mmc@78000400 {
> >               status =3D "okay";
> > -
> >               bus-width =3D <4>;
> > +
> >               cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> > +             power-gpios =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>=
;
> > +
> > +             sd-uhs-ddr50;
> > +             sd-uhs-sdr104;
> >
> >               nvidia,default-tap =3D <0x3>;
> >               nvidia,default-trim =3D <0x3>;
> >
> > -             vmmc-supply =3D <&vdd_2v9_usd>;
> > +             vmmc-supply =3D <&vcore_emmc>;
> >               vqmmc-supply =3D <&vddio_usd>;
> >       };
> >
> > @@ -2414,6 +2416,7 @@ mmc@78000600 {
> >
> >               non-removable;
> >               mmc-ddr-1_8v;
> > +             mmc-hs200-1_8v;
> >
> >               vmmc-supply =3D <&vcore_emmc>;
> >               vqmmc-supply =3D <&vdd_1v8_vio>;
> > @@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
> >               vin-supply =3D <&vdd_smps10_out2>;
> >       };
> >
> > -     vdd_2v9_usd: regulator-vdd-usd {
> > -             compatible =3D "regulator-fixed";
> > -             regulator-name =3D "vdd_sd_slot";
> > -             regulator-min-microvolt =3D <2900000>;
> > -             regulator-max-microvolt =3D <2900000>;
> > -             regulator-boot-on;
> > -             gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> > -             enable-active-high;
> > -             vin-supply =3D <&vcore_emmc>;
> > -     };
> > -
> >       vdd_1v8_cam: regulator-cam-vio {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "vdd_1v8_cam";
> > @@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
> >               regulator-name =3D "vdd_3v3_com";
> >               regulator-min-microvolt =3D <3300000>;
> >               regulator-max-microvolt =3D <3300000>;
> > -             regulator-always-on;
> >               regulator-boot-on;
> >               gpio =3D <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> > --
> > 2.53.0
> >
> >
>
> Which vendor BSP are you referencing? The one I have seems to set
> MMC_UHS_MASK_DDR50, but I'm not quite sure what board definitions these
> devices are actually using.
>

TF701T is based on Macallan board file. Downstream sets
MMC_UHS_MASK_DDR50 for sdmmc 1 and 2 (sd and wifi) and no flags for
mmc. From extensive testing on the device I can confirm that sdr104
mode can be used on sd and wifi sdmmc (in addition to ddr50 which is
not removed). Same story with eMMC and HS200 mode.
