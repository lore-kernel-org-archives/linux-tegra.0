Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286D6DCE1;
	Sun,  4 May 2025 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374302; cv=none; b=M+z3rbeCOh5smo5obHmDRSeiJXWGynNvLajX+fLu29wLieyIeal80pl/+jPcoWbowiTbiJqKVM2Ct0Qgw4CvvX4k2WiK8XlKvwBSp2OspN0IpfNbvOx29bTIV8oeJtGThqIDPR/RYaXPswAZwqqIgJz+f50n6GbdN3q08NkIDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374302; c=relaxed/simple;
	bh=WWCYEIB9zYprxa3yELeoLPPp0AFrhs3qp9Zjhr0d8Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFdtVr+MH/nNLdwk+83TH2Ab08WTgs8nlassl9y7cLL6i9F9mZLtZfSw7QCnb+ms1AiVqX3X8I45WvbCiWhT1x5rT6WgWXFkA+/ra8mK6zc32SHhKsSoJ/aPgELjHPk6G94nPG6cIcm4mkTFQ5MwGodpm2yTVEtDizBdf4toiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnPvGWaX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnPvGWaX"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso33677881fa.2;
        Sun, 04 May 2025 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746374295; x=1746979095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIWH3m2WE4KaDS8UGcLXeNGE3VEBJQFj52/VeAoTQDM=;
        b=MnPvGWaXCZrcviF90AALPuYKwFd5noBD3wO2DQV5ToLzFsO7bNgr/zaqmpibzit6lG
         vyzuW4eCknmwAGZbOmdZ854H9xpPwYsxhwH9MVW0AjzBEHUtIMRc33oNY4YB76N0WETT
         tyXNmb4MnBuBIdiwoD0HQQ3bIsFdTF7Z5zlNolrqcQhjCcPfbz0yB8pHPMQ9870qe4ju
         7kwnUYT+/QE0d0h5DK++cz760tPtexxKuc0/Gr5QIYt10M9BHv8ik/vWBYOImfixKUqY
         j14hZwTjQ9LdsAFo6ZLuALUWrWg1b//fpKZTMq5/DLHWgigGOIVGkaaq9S1jf8s1LEwN
         XVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374295; x=1746979095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIWH3m2WE4KaDS8UGcLXeNGE3VEBJQFj52/VeAoTQDM=;
        b=Yfy2xI9EMRsVR4zyo14PP3JoWkePogJjniJ3jk/z+UeI9L3LpEACfwxN+No8Lq86Hx
         0pUaG42VIFghniGvWj1DxDAzgB8iD63xjRDjHgbvaz+vOZ04lFUzgKIOQNFfu1WrE6Wn
         6D0dkH0zNqq3hyAKN46BIM5QI4/9VVHISouxdpqhaXu0uZZlIKuvkCgMWxN1L1cOmCmM
         LyZvWXvYeOpXGRpbzZLaBaR7+vpkKhuMIcjxihiCAvvIXWKlTKTTH4w0r+O8Ktyj07HD
         TrEZA3pPK+SpEo0JVGJjdxFS0EvYQrbiZ51TV76ULpko2xHMmc0O9XFFwHF5yExbmRas
         PbXg==
X-Forwarded-Encrypted: i=1; AJvYcCU4yD/8cclnkf2XIO37t/V5gvOR1EZYplSm2+JuhCRnEmJuHbZXuvxw2WCB6BsPovJu81hUj/CuNSTzmDc=@vger.kernel.org, AJvYcCVcu5Rn9dj8ZgRfzkFK7EFpIbSf4Ndr1nizEdgfgVrmi1yaT2JBP43mYkXOvZPX5eiPLMUt5kFnS0V1610=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZysD4GdDrw66PTDJePZSkKzYPVSratUxqTJRrK8KetA7iFMjN
	F3OdmO+EHU5TNsrhcyN9uHtX4/La/4KI4FyuacPrEQzkkomFi81ryeTBiS/kzLSRsbe2GAwWr5f
	HlU8PykQBSWcDsLtnQ8TiN0iMEeI=
X-Gm-Gg: ASbGncu2sBGDPF4PatOm92OOP9qAuyuZ+loQ+9Firpzkl25Ul0/8RKxkGf9WlUv50oJ
	lP0T2lQgMXhBrXVoTa57at3w4efZgh7BXLI/fVK/gnJKNkwUq9K/8hXSjfx8AfI2yxSb01Bj8Ed
	EJMKojMiC+mFi/r/QJEZaZq0c=
X-Google-Smtp-Source: AGHT+IFIVdlJx1L+YMMDDvVF2nPApQH4fruTq0NkAqAThKcG6rl1ZbBWunV7iiMUBHDzpI8kHXiZkO17duwQqfiQtZo=
X-Received: by 2002:a2e:b8c6:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-32351f2235amr11021551fa.26.1746374295075; Sun, 04 May 2025
 08:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com> <0dcf786f-d93a-4526-bdc6-e11d59347f98@kernel.org>
In-Reply-To: <0dcf786f-d93a-4526-bdc6-e11d59347f98@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 4 May 2025 10:58:03 -0500
X-Gm-Features: ATxdqUHNyaFXkzqzEh0u3EIUTcEOAhfiFb1OFb-nO6Ipx33Di2UOaKs6_6U1oTY
Message-ID: <CALHNRZ_oxOO_iekbKvN=5mJrR+UEh5jjkZ56UHGTaEAcs-BE3Q@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra210-emc: Support Device Tree EMC Tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 8:38=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 30/04/2025 19:52, Aaron Kling via B4 Relay wrote:
> > +#undef EMC_READ_PROP
> > +#undef EMC_READ_STRING
> > +#undef EMC_READ_PROP_ARRAY
> > +
> > +     return 0;
> > +}
> > +
> > +#define NOMINAL_COMPATIBLE "nvidia,tegra21-emc-table"
> > +#define DERATED_COMPATIBLE "nvidia,tegra21-emc-table-derated"
>
> No, you cannot add undocumented compatibles. Missing bindings.
>
> > +static int tegra210_emc_load_timings_from_dt(struct tegra210_emc *emc,
> > +                                          struct device_node *node)
> > +{
> > +     struct tegra210_emc_timing *timing;
> > +     unsigned int num_nominal =3D 0, num_derated =3D 0;
> > +     int err;
> > +
> > +     emc->num_timings =3D 0;
> > +     for_each_child_of_node_scoped(node, child) {
> > +             if (of_device_is_compatible(child, NOMINAL_COMPATIBLE))
> > +                     emc->num_timings++;
> > +             else if (of_device_is_compatible(child, DERATED_COMPATIBL=
E))
> > +                     num_derated++;
> > +     }
> > +
> > +     if (!emc->num_timings || (num_derated && (emc->num_timings !=3D n=
um_derated)))
> > +             return -EINVAL;
> > +
> > +     emc->nominal =3D devm_kcalloc(emc->dev, emc->num_timings, sizeof(=
*timing),
> > +                                 GFP_KERNEL);
> > +     if (!emc->nominal)
> > +             return -ENOMEM;
> > +
> > +     if (num_derated) {
> > +             num_derated =3D 0;
> > +             emc->derated =3D devm_kcalloc(emc->dev, emc->num_timings,=
 sizeof(*timing),
> > +                                         GFP_KERNEL);
> > +             if (!emc->derated)
> > +                     return -ENOMEM;
> > +     }
> > +
> > +     for_each_child_of_node_scoped(node, child) {
> > +             if (of_device_is_compatible(child, NOMINAL_COMPATIBLE))
> > +                     timing =3D &emc->nominal[num_nominal++];
> > +             else if (of_device_is_compatible(child, DERATED_COMPATIBL=
E))
> > +                     timing =3D &emc->derated[num_derated++];
> > +             else
> > +                     continue;
> > +
> > +             err =3D load_one_timing_from_dt(emc, timing, child);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int tegra210_emc_parse_dt(struct tegra210_emc *emc)
> > +{
> > +     struct device_node *node, *np =3D emc->dev->of_node;
> > +     int ram_code, ret =3D 0;
> > +
> > +     if (!np) {
> > +             dev_err(emc->dev, "Unable to find emc node\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (of_find_property(np, "nvidia,use-ram-code", NULL)) {
>
> I cannot find the bindings for this. Where is your DTS? Was it tested?
>
> It seems nothing here is documented.

The relevant nodes are filled in by the bootloader. I had hoped that
the early stage bootloader would be able to copy that into the
mainline dt without needing to prime said mainline dt, but that's not
working as hoped. I'll send a v2 with dt bindings and the first usage
of it in p2371-2180.

Sincerely,
Aaron
