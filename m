Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C4A32;
	Sun,  4 May 2025 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379118; cv=none; b=RIYyGykNH3WD3kb1nH5aHe3n1Q3a1U1SjDIkgIpBH6w0YebJYQY7Zkk+fcFsp9w5G2vWFBjrUAeXm4rduGAxMpOpOngx4YYzc3AZtPm1Y2+3L8COJXuow4wCE13j01ciJapv9YEIcYVhaOWCnawDhqZCUl00Kd6hFe9wpRsS+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379118; c=relaxed/simple;
	bh=I0hq3eDBdGZrgWGltOj1TAOZuR0QAVaK+iDwwAfYr9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAU6+14L9pIGjrNX6e2kzJgGfIUt4ertBVgXMc2qpftprfZT5tCkyPBhAnb+wDpvG9FxJ7jEqlsqt9WPFSGi2l3Zmzw16RzHNFoNk+HktIrJGblvwY/uTb/K2m2xEhqdiaDCBE0/mhV4/ptxswo+yDLvTv9NqfOTXpyNLKe89kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSdMtBm/; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSdMtBm/"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so31932121fa.2;
        Sun, 04 May 2025 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746379115; x=1746983915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5EvE8nJ60I3FDp4A3qhuov2iiidF4hCnBuLpKm1khs=;
        b=VSdMtBm/RhwhaO687DQo6Dzk0TJaFX1m1apX2rTa3C7YRyD3C1Ltp1Jr19+4AbdwUx
         Y1y3kR5XSM5nqos8Ny0iI1UtDr4AzEHbQ50Eq9iyjUojslVwVCnSnd3DJLV5VlcyEhEV
         d3QyAHnWJ5tVlHO1zrCTb+fdSVx7JSDoWjnDHnEftkTSdAkFyEMiSnqnJ48lTTAD66cB
         SdmdZgMtDS2CRL8obNvD8RpFR21fGfgnXsZpXX3j8czhFo0XRwzUti75oMtXRYVM6T1A
         oJqfgdtJktch8zGshwCglnQYpEMnvLoY+vPlHexgrOOvXtK3Of6w8Cbit0GzO/O9KkLB
         IDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379115; x=1746983915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5EvE8nJ60I3FDp4A3qhuov2iiidF4hCnBuLpKm1khs=;
        b=GeLog9MXx0x5LeRGE7OMAqcUmSBqRyFOvEhckqbrf/BmBPryIOPPEBnRi2eLuTSXlc
         V3mhOtuP6SGRuStQMKEfDmwBNDBkjO/D6TczRn8gjGMZh0gsIt8uk+3KOjC+u9RayWXS
         RYD9BG2xE9mNyGWkQ6m0W68X8gPVrjP964rdGWTHmWAH/ZS3Q8BX7WHxPdALuKuhhSZA
         uYVk6inyXssUStRLMuRi/IhViz6F4MBaHH27tjjEu2JWVgeA9I0nRjZwiWihPxKEeJ6b
         FZSQmPDMxOQMM7l5knrAOLLIAMTYI4HibyTThWSVKO6WiKyo9txms3tB5rZlh7kYtnuh
         60Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUEwr2ubwMXVewm/cw9KKmy1ZXr/tLgBNa8XN33meIEcwpyKSce7cixFxCnAfZVQufOFJ9lyMI9HmpJYaw=@vger.kernel.org, AJvYcCUZT708iopsodXycY0yE2Fys7K+9pQwMZEuWnmSs5MNscafyJPZSbjg7hLEBokbjR9/sJobX/9ZBhvDClc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTp7loWw57TuO2AsAGIG7Yytl3rAeQ8sHqS/lPvVlXgenGedD3
	h3Fw0Fn9TWNT/l4PXRMI8/l9eR5zqSXt8IQwGyn/y04TnxF1kjDqaMxdoIJZZB3dnKTPJmMwofx
	3TZfesx+nLN5a7Rwcc/lnGn7L0tk=
X-Gm-Gg: ASbGncvDtpfrct5B0Z4jQ4CLOqodfivuGtNnXvmaL/zpKFf07ipaezUbF+/6ncNJMor
	OlI9xi5BSWdLNY77mfVwuTOMyYM9NKzdxVaSCMK6J+hr27ao2c4Utxf8eQLIRC/UINcNS93fWEp
	2tjdcuM4+Zhac6MKe3kYdeUQg=
X-Google-Smtp-Source: AGHT+IG64QQoeTIa7+lI/0M6SMcvKOFZf458yzpsTObJMLTskQenR6/8MemJ1kb7Hf3UtjW0SyImd8STPdtMGRfNLnA=
X-Received: by 2002:a2e:a10a:0:b0:30d:e104:cb72 with SMTP id
 38308e7fff4ca-320c5be54eamr27584351fa.39.1746379114388; Sun, 04 May 2025
 10:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com>
 <0dcf786f-d93a-4526-bdc6-e11d59347f98@kernel.org> <CALHNRZ_oxOO_iekbKvN=5mJrR+UEh5jjkZ56UHGTaEAcs-BE3Q@mail.gmail.com>
 <c88f59dd-2319-41d2-a21e-6fa7c205b1d0@kernel.org>
In-Reply-To: <c88f59dd-2319-41d2-a21e-6fa7c205b1d0@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 4 May 2025 12:18:22 -0500
X-Gm-Features: ATxdqUHmrS0FdihfZxm5iWOcztt3Ipd9fcMwnJbXcxat9gvc_nJ1AHwN_vS_WR8
Message-ID: <CALHNRZ-G5UADZznFivTTe1P2N=sNoJxA6b9Nwho9jsRh_NmLPw@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra210-emc: Support Device Tree EMC Tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 11:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 04/05/2025 17:58, Aaron Kling wrote:
> >>> +static int tegra210_emc_parse_dt(struct tegra210_emc *emc)
> >>> +{
> >>> +     struct device_node *node, *np =3D emc->dev->of_node;
> >>> +     int ram_code, ret =3D 0;
> >>> +
> >>> +     if (!np) {
> >>> +             dev_err(emc->dev, "Unable to find emc node\n");
> >>> +             return -ENODEV;
> >>> +     }
> >>> +
> >>> +     if (of_find_property(np, "nvidia,use-ram-code", NULL)) {
> >>
> >> I cannot find the bindings for this. Where is your DTS? Was it tested?
> >>
> >> It seems nothing here is documented.
> >
> > The relevant nodes are filled in by the bootloader. I had hoped that
> > the early stage bootloader would be able to copy that into the
>
> It does not matter. You cannot have compatibles and ABI here without
> documenting that ABI.

Understood, I will keep that in mind should the situation arise again.
And it will be rectified for this patch in v2.

Sincerely,
Aaron
