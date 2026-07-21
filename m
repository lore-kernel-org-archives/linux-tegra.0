Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0EB3FE67B
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655108; cv=pass; b=gjsei+SxCTBTp2EIufwsEncybHpDbCtPQBzHC10i1r03ariTb5YxzrHYya/aFeGGjTKqNmxVXMmMCZ45jRkFCYpjTh2es8v2nCIGplz6dKJGJgJuZ4ny99i1RSmLiStCoYDk6e+YD5d48RbFOtWHE8ZB92LJViO6Br5PZE/D6E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655108; c=relaxed/simple;
	bh=Lfe0TtBKJj2xEVv4HyVQ1Hizpw0ZAh9TG3EESp3mGS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnigoR51dsc2ZkNWIHjiGjA34SKPkJBu++d1RDZMclSTIQqfKVaZdYEsd0ezo9HbWXWh1MyobT/q3jiQQY4WvdliKi87F19JIlFJPYqdPrpfA+qUdpOl3buHQsz8OrDD7aKbGpPBQ0puQntW5aZau6gcniLi0V5VlHo0vuu5HMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxRKyoay; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxRKyoay"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so1941573e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655105; cv=none;
        d=google.com; s=arc-20260327;
        b=EghK1zlR8LWVNjxxqY8Ofbf+zAy922KlpjmN3XA+J9W9iXQZw/lAVvjsCnGJ5KnJzz
         ZDvOPrSkM14c7rDE/BPKo2162G1wbL0RKIQK69MjYT+5DHDm2ApgKHnzYwI6VoRIHoPO
         p+SIffXftIm9dJwCPIirgHFR7FlMVECwkyAnQnJBgxPa1zgAsjmKTzcUC/haTQTyO841
         nDoUDZg/EQVWfCstikiOm7+rxX8sTKE5knb7hCv+j2QqvcgUYasmqNBq7YNCaLwdiR0T
         J5+pcsS7Vgv2KsqQ2Pw+KLcEQRtzA3K+HQj9PoU5Lg2bCyHsJMTOa/4XouCK1XNxC8fr
         fRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVJLJp9f4PophmcfsPqOlG9CBV28d+Gkwvhnwb7Vf1E=;
        fh=C4l1sWZofQvLyhitxg5Aqz3BJWttrSVf79gRxMRyZOo=;
        b=OmfgcrlJVPNNe5jktY773qth5Px2jkGYCoZCQ+cx0uRjcmgviPNYMQtBpt/F39a+sO
         s+zuGp5PYdeTWnj+APG6Dsh2Vivurz5cJVyxXJHEEJbSrbbAebiLHaMFFcJzmP00YxJt
         dqVGf3bqAeYPw9wVH0D1rxfYwH0OXhLAI8zsOTSbZZVIuHvTwCINwARBikg58aEDwbZw
         +dcYOtHMszGzhqxdGWZyJLMcqifozAOSUfFsqyj7Vo3pFzQqhz8mhIZwU5i7JS68EPAA
         SQzqJ9f3oaJp3k/i2HWTL8LSi7NCh98QSCpx+6Gkbvyrb7Qg7+HFWCyEORixyqV1KbGn
         kDng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655105; x=1785259905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVJLJp9f4PophmcfsPqOlG9CBV28d+Gkwvhnwb7Vf1E=;
        b=JxRKyoay9zcCxZld/VJDrXk3DtpfFjg8yTKIKtiRaWj8kHxCVRk8GzJnAPw/cT0pYa
         Gd928eZXIFxGs6Vcl9WQOcyADeOxjCIg0eudYgY0SggUrCnI7/LNFKML2pWUW0ZZuAfX
         cA6daFEGDHyzX/U8XordnI+v+YGAlnsX59HWiKZWO5DE6ySt54t87Yy1IueUkDwIXfVO
         UnYgCtC0o3vN4IfctNWSmvJGH3AWNIetbLLUwiKvs8F4T+f85BVczbaXSX/3+SVADeOx
         jKmMphzQVHei1+O7KejUzm2GcPdOnVvB0eB9vnFDhdMkU8/dhQ1ZwW2Fj2dx+gLPemOZ
         Hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655105; x=1785259905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVJLJp9f4PophmcfsPqOlG9CBV28d+Gkwvhnwb7Vf1E=;
        b=gXwxWJ3rMIfgsyOCbtLOnwjN3eHWenNNVtdzrwKG1kRu/3I2bQxGaeoKnYZcgRf1Ah
         To8+MjG2N2+p4Te7LA3Om/BTG9qDmrbAqGEfZsP2Ugx9dw+4uMpa1uBoDX+5UZQWZG38
         12VJeFBi/JnTJ1E7gqMqgYC9Bu733b4edBN+8pE4L1mHBZKFj/WvFVtOUiUSrIDKDlYE
         wknIdiyDjfNxnkHzR2PoeLtODrYnbgvtdfTPUcOdfiRqEG62OqVrvRH9Pcvdz+PjmJQA
         G7Co4yGyNrpaIZ4ci5J39CrXUFQOaAxdOc7iqGslmZT7+FkRQwOA8ArGcyxz6fafWRQs
         FaFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/LVrF++12ogL/XSxo3oaOqOHN+5D9O+tX6DzxEGDlrNKYVuA2JbkMoGtRf+qixMUL0jYgBj4L2I/G8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjtj0JGiM03XBlD22InsahydqFiCE00sMiSy58HqXau1HK5YeJ
	zRvoJa5cnOlEaFfK/3tigKke1nBQYy2jRG7wzo3dBSgBXASlkzAWoU4JdjjH9BZSbHXLB500j13
	XZmgolKb1CPQzT7MNEzaebFqiKwjnh0I=
X-Gm-Gg: AR+sD13Cq9JV57zMqDDzPN6GaT2DH8Emt70QDxtbsmsfez9Zfj0kEjKQFfIe3jimE56
	WcFqbAqjd/NJDO+6uToQc3M5QIpsAExmW2VUnjeMWLkrpjUveUbcB2mPVQc7Nd6AEqbBL/DGBZD
	2mGTAFlFG7SSCAu2D8H269N6piYMDX4jDTWvhflAsqYYzTBC6XM9C8puiNZ6cBoqZzV9ZJO6c8Z
	1zp1PPI+QGxLgGsVaZ75+e1z9tJ8paOi7rQrHA/+wCyBcDrOV9h888b5N9kyZHaBKk9Qsw8dYJI
	rx6e9XSgZp04Xh/Yct/qIHfrDDn3xQvFcUqwxrKoze3KuRg=
X-Received: by 2002:a05:6512:3b13:b0:5b2:a4bf:a6d2 with SMTP id
 2adb3069b0e04-5b2a4bfb325mr984015e87.39.1784655105089; Tue, 21 Jul 2026
 10:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com> <00e569b5-df74-4310-a33c-446005bbf11c@nvidia.com>
In-Reply-To: <00e569b5-df74-4310-a33c-446005bbf11c@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Jul 2026 12:31:33 -0500
X-Gm-Features: AUfX_mxDSZpN1kXD6VzEvzKdEpxZEwRYkIOo26zcNA6hqg0upzJL6q7g-N-D4IU
Message-ID: <CALHNRZ_0++igjSQBRo-LVW_bvyu98x_4DXjxRSq0kCNxMaqYKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision B01
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:46=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 18/07/2026 00:19, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Tegra210B01 has a separate set of skus and speedo tables
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++--
> >   1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/teg=
ra/fuse/speedo-tegra210.c
> > index 06c2bcbee5734..699751f4bd0c0 100644
> > --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> > +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> > @@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct tegr=
a_sku_info *sku_info,
> >       sku_info->gpu_speedo_id =3D 0;
> >       *threshold =3D THRESHOLD_INDEX_0;
> >
> > -     if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> > +     if (sku_info->revision >=3D TEGRA_REVISION_B01) {
> > +             sku_info->gpu_speedo_id =3D 1;
> > +
> > +             switch (sku) {
> > +             case 0x00: /* Engineering SKU */
> > +             case 0x01: /* Engineering SKU */
> > +             case 0x83:
> > +                     break;
> > +
> > +             case 0x87:
> > +                     sku_info->cpu_speedo_id =3D 3;
> > +                     break;
> > +
> > +             default:
> > +                     pr_err("Tegra210B01: unknown SKU %#04x\n", sku);
> > +                     /* Using the default for the error case */
> > +                     break;
> > +             }
> > +     } else if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> >               switch (sku) {
> >               case 0x00: /* Engineering SKU */
> >               case 0x01: /* Engineering SKU */
> > @@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegra_=
sku_info *sku_info)
> >       speedo_revision =3D get_speedo_revision();
> >       pr_info("Speedo Revision %u\n", speedo_revision);
> >
> > -     if (speedo_revision >=3D 3) {
> > +     if (sku_info->revision =3D=3D TEGRA_REVISION_B01 || speedo_revisi=
on >=3D 3) {
> >               sku_info->cpu_speedo_value =3D cpu_speedo[0];
> >               sku_info->gpu_speedo_value =3D cpu_speedo[2];
> >               sku_info->soc_speedo_value =3D soc_speedo[0];
> >
>
> I am guessing that this is derived/ported from some kernel that NVIDIA
> has released in the past. It would be nice to include a reference to
> whatever change was used to create this.

It is loosely based on [0], but restructured to not change nearly as
many lines. How would you want this referenced? Something like a
'based on downstream 5.10' blurb in the commit message or a direct
reference to the commit somehow?

Aaron

[0] https://gitlab.com/nvidia/nv-tegra/linux-5.10/-/commit/8555ef4988d3b39d=
91791794825c354b3c9377ba
