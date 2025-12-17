Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0B2C08B1
	for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003394; cv=none; b=R6WVDs7HX5YThqpXoJJB+QTvB7FVhrOp2plk57JHezuj/7J1iM7C8fP8OFYChggWpfAokd1KbaGi9W5FtBvphhBlwCF79ks8WViR6PP6fav2S4Md25XF9YD9GcP1eoelML/SYcA9GmT+4W6mTzVmDeS+o7TYhPcyPT3hrsnVNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003394; c=relaxed/simple;
	bh=I0QaxssPlYkK2KN89dk3oT/A0G5pLDJj6HbpOMyxDgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNHtKTQuBUwcv9h58ElbLSilJ/XhAEOaU7dTQcLoTRLOSH+av/sBopKP2S+7AJAI1L4kCl7+pB/DcDqcPTxV2dEyYusfOKSCimA81qAXEbfyogsHH+zUa4tqWIGe/X7AvijM3JjbkHO5OZs7520EWVIpiD1zYc19CkdDFoYJTVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFiZQQmU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFiZQQmU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5943b62c47dso5998239e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 12:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766003391; x=1766608191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0QaxssPlYkK2KN89dk3oT/A0G5pLDJj6HbpOMyxDgE=;
        b=hFiZQQmUKBMln/NzHSEgkboO0EMFAXqS9FmErovCq7gULjQmGezJv/j3sGTUB8VPQX
         6TE7HC0WL3mlHU0xgLCPklL8ONZKvCsYes65JAD7P6IaXGRJFCSzi6iIMTkHeMceN+0v
         R/wCXSIEDOZSjsrfUvrtx3F7oyuugKsx6ZXpSLFKlmfT0TMJXBifvSHKFyOy3VqtA606
         GXIABU/h8tUXRgoA3msrQuwTIc34YQgRRhSrktH5EEHVX/I9pMQ6qUblX4KGYs+R76uD
         k5l6VE3GR0eCiyVvRUwnSZUVcV+BZw64i25o8brwZGx1Gj1l7gZgW0sWxNy0OxSvCYlC
         UHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003391; x=1766608191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I0QaxssPlYkK2KN89dk3oT/A0G5pLDJj6HbpOMyxDgE=;
        b=sAZRBAE+VewPScQnY6dKgOUBUxejpJj981HyJL+Hm4dLDll3p6AyXo8jyRS5v/3eBR
         Ix9PwOEqX02Iblirkkv/Aadi760JQJhn8l3Svzn99Op19vg8pQLyrwDn+xlAMqH+B1jQ
         W7ksbXGPFOpKvmoh+Ym5qVQ2gU4Z+nLDtPgYOQgMBDkjNO/KZ1CVWyhy5WqU+Cj9yQaO
         NZ3LWBsffFPlXQ1+yC5KZ+vuE9PGVXb2LBWlvl1lHvbHSuizN2gSuiAB5yLJHYvQPEM1
         qCQ55jRm7ze9Ez2y1/AI7GcoATeW/kNAbnK7McGzuTU1htaerSUh4JHXnQ+dV7LymmG8
         +u4A==
X-Forwarded-Encrypted: i=1; AJvYcCUXVJ2S6YyH/lGFUi6p3zPSbgMbxGJI4StDd668hDkLY8AV1j+X5qDSfTlxbMHkduNdCstY+QYteYB6tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJveGYiIKBTNYVz0IsUqfz+/SkT6RQKpDXDv9ARvr4OnlBTtH/
	3VPpYSsCjz/9aY4S0VukgdUT28e+Z5BirzWFmX0y4ZrQM1k/Nacp+Hamh33yqznCyQAnRVj4JO+
	B9AaAJzdyLhXV8SR9psq3pSzoes4uBGA=
X-Gm-Gg: AY/fxX6yqhrS/PKxpMmFrAJWXVKJh/1FkTeXcCP1KbAcEpF0aVI9DdAmHj9LFyPA/6I
	5Zb1n5BMb3DaGu+RIVWVvc4vipB5HtJwihQC34Hzu24217C3jIpZfUEXdpzD3bWq7J4OcPPfDVH
	0vX88ve8n9VMABQrmYd6xPGFS3pnuLecaJtlPEtoD0nJxQyzXa7G8BeIHqaWkSIczGt8prOBx3U
	lPxuglNuNqERTUIMPkKnvSBJTRTxQt7e/+a5kATTTTX6Un9YyvkXljWSHhXX5fjQQvRA4s=
X-Google-Smtp-Source: AGHT+IGSaILNaRarC8+vvU7EuRNihpCY/48ShEUWRbAX71tFMzIu4uKSf0sutUNzSYeLLOsL226XJuVMSmT/b4fSoUk=
X-Received: by 2002:a05:6512:1156:b0:59a:11a4:4c29 with SMTP id
 2adb3069b0e04-59a11a44c45mr435224e87.41.1766003390355; Wed, 17 Dec 2025
 12:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com> <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com> <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com> <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com> <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com> <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com> <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com> <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
In-Reply-To: <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 17 Dec 2025 14:29:39 -0600
X-Gm-Features: AQt7F2qVN5yX_6cKGG72rCEm9mQVm3ZGjk67T6z4GHpE9_yirrlYFXKGMXzv3LQ
Message-ID: <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:59=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
>
> On 17/12/2025 18:39, Aaron Kling wrote:
>
> ...
>
> > To try to move a resolution along, let me try to enumerate the issues
> > again. Again, please clarify should I have something incorrect or
> > incomplete.
> >
> > 1) The primary issue is when an old dtb is used with this commit and
> > the pcie driver is loaded. I can reproduce this issue on t186 and
> > t194. If this becomes the sole remaining blocking issue, I would like
> > for an exception to the normal rule be considered and this merged
> > anyways. Since it does not cause a boot failure and distros package a
> > new dt normally anyways. And to my knowledge, working around this
> > would involve redoing part off the icc subsystem itself, a major task
> > in comparison.
> >
> > 2) T194 is reported to have low clocks even with a new dt on the
> > Nvidia regression bench. I cannot reproduce this, even with the pcie
> > driver loaded. Can this be re-verified, please? And if it still
> > happens, can logs from the failure be made available and/or more
> > information provided as to the state of the unit? Like changes to the
> > default defconfig, modules that get loaded, etc.
>
> Can you list all the patches that need to be applied on top of the
> current -next and I will run it through our testing to make sure I have
> this correct.

This series, message id:
20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com. And the dt
series, message id:
20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. So, my build
sequence is:

git checkout next-20251217
b4 shazam 20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com
b4 shazam 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com
LLVM=3D1 ARCH=3Darm64 make defconfig
*edit .config to set CONFIG_PCIE_TEGRA194, CONFIG_PCIE_TEGRA194_HOST,
and CONFIG_PCIE_TEGRA194_EP to =3Dy*
LLVM=3D1 ARCH=3Darm64 make olddefconfig
LLVM=3D1 ARCH=3Darm64 make -j33 Image nvidia/tegra194-p2972-0000.dtb

I then flash those with no modules, packaged with the simple ramdisk,
and I get a shell at 11.2 seconds and emc rate is 800 MHz at idle.

> > 3) Setting the max clock via debugfs fails when icc has pushed the
> > current clock higher than the requested rate. This is a logic issue
> > with all tegra emc drivers that implement dfs via icc. The suggested
> > resolutions are to leave this as is to keep consistency with the
> > existing drivers, perhaps updating all later, or to update the
> > existing implementations in a separate series, then send a new
> > revision here to match. I am personally unable to verify anything
> > older than tegra124, however.
>
> Thierry and I chatted about this last week and we feel that debugfs
> should be able to override the current configuration. So this will need
> to be addressed as well.

Alright. I will start looking at getting that logic straight, then
upload a new series for the older archs and a new revision of this.

Aaron
