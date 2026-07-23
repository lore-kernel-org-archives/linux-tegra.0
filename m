Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646DF31283E
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776315; cv=pass; b=t+EXOqiFml5u6WRizy7IilBfwcSiKKXhMoEhGp3MBAkPE7xbmuJiOHWQfAGBTHD3KyMOK8+Gq1uNgdBiPktSk5deFjUBMcRxGSNIvhCDuAbztGTm3penRo6EmNWlMay/shw0tjkuKPktNQun++7stH8GoMI8mGeI0GO8JcnCAxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776315; c=relaxed/simple;
	bh=+Fc3jFgKF+SzhwLi7e8pH6azf21/DfWf9SFXzI60wYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBeYjYn8mjkmieXPHe/JzTQt3nMAiMddDJmsZKR4Dm11N2FsVVocRrZcrU4RzEohKwjgZ36/NblblK2RD0cNKU5smoFZ4SsOSg2QPlIg8yNOXWmTjGUABL4IspYqw161oSWocY8et2f7ueoOJ69VehC7gnWZ3tVLZ94bmSEBbdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOmpKd89; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOmpKd89"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b01910b499so119842e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 20:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784776312; cv=none;
        d=google.com; s=arc-20260327;
        b=oPMxdvETvqp73AnRkbzstwJ49h85YG1drEWA4IhAZwTvfygVHEimq1SOZb8X/9ehi0
         wGoizLVkwrVnVBAIB6LVn5K5zCqxb17xzf+wsl5QNd15MvssvmWH5ImaA+Cd3gKnn2wD
         RrCkaBQXczZrywuOtRbVMwmJjl7JeQVDZ//yMFoGSFDVZl6Xq5tuvzSlRhNuwN7C4TDQ
         vysqn1C6o8vMQ7A/n+nVmH9ZRP5qoN3fheIqbeqYwVm9cYlPZUJNE4pMV3POPlonRiSu
         kCyaFJbD63tZjW3bygEmTl9XBaHqd3sPHy0n8pfQMO4qxxcuiVoAJxPjGtbvmMan6/jn
         e0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xybq9N8iwYV/neNgugcsk6GEhAIai6SfewcFzO6pFeM=;
        fh=q+wZ2YROSsj3R7QYUFbFNt8P20L3yzmzVP/79vqRp4g=;
        b=VuibQa/9BXEY9yqAzgVPqmeNMQCRwTAqMu65Uc0ZFxHiGDVcx/crC86TdK7gfDCz0K
         D3eJIxMKqRcfZUZa2Mzv3guoDWU1rDnwoKoR8NYIkmfD0zTNY+0yyXyJXgFLZ7Bmdb7s
         cX0aI7ad4aq0/hL4XNlrwWli/0wjL9PvauS+sB9NxZRP6fMlf6cjK79msHr8mJIu2zQw
         HR5nkCK5rFY8YTG4Y5Ka7JkEDZYe/9K9vZW6cMZwpFcSdSC7TxgqxlRafrIuxmu5CyrB
         aTsxkMxQ+yht41XlSEW1o+byrF9dW+zr4flHc0g/raIJjHUxhVhpe5BosGiyPlAx5mrX
         k2qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784776312; x=1785381112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xybq9N8iwYV/neNgugcsk6GEhAIai6SfewcFzO6pFeM=;
        b=VOmpKd89oTawX1i8/Sp7PzAWuZY5qdo01yFkM+8PhPFI9Y9eWyTBPRrALVvgT27frI
         yTgk0FZQtkSxGz/mKjoYzQdRj8AiS+7H4t8daBRlINgdgcV0xMDDs01ZOsUqaR4k9iif
         Eh9OXhmvEBBbgKAEV+tv4lt2XX0lw4lXzE/u79YGi+gXE1I4sv5lPtp4Gwpt86JE/5ex
         Llw1Dmo1LidMM/snokxj53j6i5kKQiJEafAdUuVyNqZ7rscazcRK/tl775h1RcwdYfAk
         A0aMo6FhfZ/LRq63JEe5PqgD3Jkv0OjDdnf6v4OTcZ2vaw4I1A8mSJhvHLnRbQBmDnNI
         bKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776312; x=1785381112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xybq9N8iwYV/neNgugcsk6GEhAIai6SfewcFzO6pFeM=;
        b=iM2xtvxQzetHRbSMQpXBt1JTEgTewN8riW3lZ38K8De7IyI7BGKC60f5nTCr1TeW3L
         vAn0Cj55vvc3JSTZZ8YJpFnP0baLtIw1bL4on7DXweQGnC29+K/08s5AcBPSy9PpER4x
         dHeqAZG6ohEEhcDreJT+x1GFsYMU8p1Sqb2pKN8Bb7Zs+aLTJharLAMpu3apL3vxoptS
         8n4cb5gUiE41oAyGTVNkxNTkB6QY8Q4WPtVb6ACclZKZDBbjSi3lqYFYooOHayfIZ7pK
         0IuNx6UeLxAch6oab2PHw6YM5ehEte285xTG8KuxfT5Swt4bBjWHAn+JFIwuh7eA7bNI
         Gl8w==
X-Forwarded-Encrypted: i=1; AHgh+RpK+NM8yVYQqlRHFGI5qaOz4OWfXFPD8nB6nzqutNp9d8tcH6Eq0gywG4VKWoM3d0Lfxp/ONRahDatMGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFyIHLylTgJ+BVieaaGHUjuLlFNrG5B7p+JDFGYzzPqMc7TU/7
	PoAFrpvZUmn5rRdekn39vvfFL2fsM+Nwq9gNxbEsC0nFlWQuKkdiV2VE4avWhtyslZLfFB2uDP+
	dyFHFdj62hXPKV7p13mm4NAUzqOXoikc=
X-Gm-Gg: AR+sD11Y8wwQIXEvCWzllgGjvsK6kerTB3OMg3LJ03owz/7ZrMOSAgP04To9A83XvR8
	uMaGYzc6XRZE7HZnK+4m+zB0yKo10dyiQo7xPgO8y0he8rvr6gMEA9tJqh0TytE3qifaFVPZcFS
	TApQXi7KlemHNIqGDjjeT6hzY/mfpu8EYIMflttwEX4/oev0suDiWoEQOjR/8j3KBTNyJBpDaaJ
	3vxJpDSJzF71FeC1hIbUH7bVzwUXjnQX81R+n/PdshkdRfV9upzxo/hc9CwiFQG94sC1uU1LDmU
	3Vf7Nw9abpEls8zhSv+9UZOoDH3VsQusm4Ioo6zRcibdZug=
X-Received: by 2002:a05:6512:2c8c:b0:5ae:a9ed:35a7 with SMTP id
 2adb3069b0e04-5b2b33d3018mr108577e87.32.1784776312228; Wed, 22 Jul 2026
 20:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com> <00e569b5-df74-4310-a33c-446005bbf11c@nvidia.com>
 <CALHNRZ_0++igjSQBRo-LVW_bvyu98x_4DXjxRSq0kCNxMaqYKw@mail.gmail.com> <1a09d973-df0f-4e49-81dc-2c12c795d2c6@nvidia.com>
In-Reply-To: <1a09d973-df0f-4e49-81dc-2c12c795d2c6@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 22 Jul 2026 22:11:39 -0500
X-Gm-Features: AUfX_mytkpmOg3RFc5mpHc5f-0WeDuodEz48J3-EGsLNgVJvFSPBj_Pz48YPh2k
Message-ID: <CALHNRZ-P+oGEXuhmKp4V3iX86NVSgvMLsp1dJm2YfEnffNrahQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision B01
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 7:44=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 21/07/2026 18:31, Aaron Kling wrote:
> > On Tue, Jul 21, 2026 at 4:46=E2=80=AFAM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >>
> >> On 18/07/2026 00:19, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> Tegra210B01 has a separate set of skus and speedo tables
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>>    drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++=
--
> >>>    1 file changed, 20 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/t=
egra/fuse/speedo-tegra210.c
> >>> index 06c2bcbee5734..699751f4bd0c0 100644
> >>> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> >>> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> >>> @@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct te=
gra_sku_info *sku_info,
> >>>        sku_info->gpu_speedo_id =3D 0;
> >>>        *threshold =3D THRESHOLD_INDEX_0;
> >>>
> >>> -     if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> >>> +     if (sku_info->revision >=3D TEGRA_REVISION_B01) {
> >>> +             sku_info->gpu_speedo_id =3D 1;
> >>> +
> >>> +             switch (sku) {
> >>> +             case 0x00: /* Engineering SKU */
> >>> +             case 0x01: /* Engineering SKU */
> >>> +             case 0x83:
> >>> +                     break;
> >>> +
> >>> +             case 0x87:
> >>> +                     sku_info->cpu_speedo_id =3D 3;
> >>> +                     break;
> >>> +
> >>> +             default:
> >>> +                     pr_err("Tegra210B01: unknown SKU %#04x\n", sku)=
;
> >>> +                     /* Using the default for the error case */
> >>> +                     break;
> >>> +             }
> >>> +     } else if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> >>>                switch (sku) {
> >>>                case 0x00: /* Engineering SKU */
> >>>                case 0x01: /* Engineering SKU */
> >>> @@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegr=
a_sku_info *sku_info)
> >>>        speedo_revision =3D get_speedo_revision();
> >>>        pr_info("Speedo Revision %u\n", speedo_revision);
> >>>
> >>> -     if (speedo_revision >=3D 3) {
> >>> +     if (sku_info->revision =3D=3D TEGRA_REVISION_B01 || speedo_revi=
sion >=3D 3) {
> >>>                sku_info->cpu_speedo_value =3D cpu_speedo[0];
> >>>                sku_info->gpu_speedo_value =3D cpu_speedo[2];
> >>>                sku_info->soc_speedo_value =3D soc_speedo[0];
> >>>
> >>
> >> I am guessing that this is derived/ported from some kernel that NVIDIA
> >> has released in the past. It would be nice to include a reference to
> >> whatever change was used to create this.
> >
> > It is loosely based on [0], but restructured to not change nearly as
> > many lines. How would you want this referenced? Something like a
> > 'based on downstream 5.10' blurb in the commit message or a direct
> > reference to the commit somehow?
>
> Commit d93f8399053dcf117ff56a3029ff08c0e36f4b75 uses ...
>
> Based-on:
> https://lore.kernel.org/r/7703024f-8882-9eec-a122-599871728a89@gmail.com
> Based-on-patch-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> So this would be fine.

Adding the following to the commit message:

Based-on: https://gitlab.com/nvidia/nv-tegra/linux-5.10/-/commit/8555ef4988=
d3b39d91791794825c354b3c9377ba
Based-on-patch-by: Alex Frid <afrid@nvidia.com>

results in the following checkpatch warnings:

 =E2=97=8F checkpatch.pl: :174: WARNING: Prefer a maximum 75 chars per line
(possible unwrapped commit description?)
 =E2=97=8F checkpatch.pl: :174: WARNING: Non-standard signature: Based-on-p=
atch-by:

Should I ignored those and submit anyways? I ask because I've been
NAKed in the past for submitting things with many cases of existing
precedence in the kernel that resulted in similar warnings.

Aaron
