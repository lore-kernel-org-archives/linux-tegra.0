Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AE13358C6
	for <linux-tegra@vger.kernel.org>; Sun,  3 May 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777833424; cv=pass; b=uGYfzkDsAtA+YnDs4Br67gMRMYDJGLTtgoqE2+OD6RIdMaWqVgpdrm251S+GMsFb6H4UU95vDeQ0XDlpMJTjFN2/O0cj80NTnjC6eo4ckpmyWf2aH9N83FfEfCSeFiBqpCnC1Rq68KKkpNY/acSVC0C5f+O6/A8FdP346jIYKhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777833424; c=relaxed/simple;
	bh=kf1aH6Oxw1VzpdkMu8DDLYL2Zj6chjXwll1Pl2BIftw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ7oajc/kSMSi3SRv6xFNhuJFVUjfea67VxNEydK4zW7zHDgFm8ceZEkpLrZJQPXRBgx6MFJa82M6Pip7FIDFQ7ocOgIygqeWGJn04kOEXKesLEU8g3LoTjhOMEXV2q0MQxgsbAnxKlkAQXV77620uNM5Y6Hz3A+/sjx6EypqeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXsBrjzX; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXsBrjzX"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f00a567cfaso488203eec.0
        for <linux-tegra@vger.kernel.org>; Sun, 03 May 2026 11:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777833422; cv=none;
        d=google.com; s=arc-20240605;
        b=C/b4ZtzJWbWn+ZS1PynQTUdmPNgUWg0sfkGdZf1xXuglyUo7lNoJmsezlCqOFfGv+Z
         9EYU4JwaTN3Suy+rr6ZAZmdUeSxJdrWXl1RfBe12PPlGXqo6riRWNl6//DL5PFz7I3DX
         oZfSNXQCKnHnz12ilxUwa9F1rvGXOgMB56gg+2HnhLrUxE04rJDdtzZA1Xh6eYfXdeDq
         4P8Gzwt/CDJuunoVC9hNrvi/RlJc3nUTxooqbF4lLCmZYtoU3k7L2VRmuD3l07UNPkUt
         YOJcYSx2oBwJ9rvsh2AMw1SXDy70Bju9ixNa025+iZc+0iazFK3L+7OjLMFoT8UuOqUB
         akzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8DagsZ0dzvLRGip3yJmsVrNVksXrv0ekQfgv6AKROE=;
        fh=2RaNxfCG/MjdEv5vNcY1Z5fN8OTFzujJcZOFd1WgaqM=;
        b=ka1qwVWST1gjbsNTACULprp8J5U1+sF/Yk1AgVnp83+m8RToefXy9IXB82hYvUE3T6
         5O0xJrNj0L5Co6g2y89KvKFLgtRXwSdV9/7axcDxKTssIf+dTLhDiSy/KdU5GlOiLf9M
         mol92Jv8/eOc/py0Rr+AP5J5F+8Cs2T2n6sdJIB9Xd1C7rs5fzRiWPgPc8wgVVh65SDx
         TkLkEwhNv4l9pqJQ69lK2IgVEfZ8DSyVaCB9xK2Dez5a3jo6eYj/eU8cDEbhGlwuPJVt
         oPgQPVB9P/F6HoNgPb5wpTDW3OC6wRZp7W9RrsclidqDSzyNjSZspig1VgZ5wJeMo/zd
         RwfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777833422; x=1778438222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8DagsZ0dzvLRGip3yJmsVrNVksXrv0ekQfgv6AKROE=;
        b=HXsBrjzXGEXLpp3hlQyF7PrKdfWcb4oXvCXl8KVsm9TPo9rrbg67a5hKwQOGbe4vP0
         L3qbccNxsgtuGDHciznC5Tn+Wp5/hN2rAzJpq2ByGEAmmzmU8siSThSp9E0GbprKzzDt
         6SOcs2pXVomgvrijkNv61+u+v0uJE/16nXhBnJVo4Fao1JnXq3AipfEu44c1/+z3o9EX
         Tt8WqwEF1U3t3A885dmHF/7ek2mJYlFXY7XQoEtAIvS7hLcAINnPDfiu1Pss7e260Udc
         9XFiGBtJfrJFrq/Eogsxy0t0aSqEDbTgjBmuz9Zr6y9i3CwNOnMKPHhD2cFPA11C6QkH
         sUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777833422; x=1778438222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8DagsZ0dzvLRGip3yJmsVrNVksXrv0ekQfgv6AKROE=;
        b=pp5rS42PVLN1dnS298Lavw9VdvUGM9WT4M95vE1eGaG8uyZ9BtSncPOlfxGIQDa95A
         gEJIsDYNRy0OCIJ6m3nNSUZgv6XZIpEuKZiaqfIyvll361rQzzrC7sMoQ97bC+Ody8bP
         klyYuLx+660W/xgwg/pct3Sr6LqGvzrRk0SYpARzcV2tWCuqIpPQFII85Eh1Ufe1npwm
         Gz9R934zm9rnILdl+/V1SVmdauaItMjvE4sPcc8Aas+px/QbWFCqUNPjA/QqHP7cqp0o
         XBu6nxtEbQ4Obvs8+IS/O9REMxs24oQ2a52ixe6fPTX3NJvEbU8eZLZgUoGp8BVUrujX
         bLsA==
X-Forwarded-Encrypted: i=1; AFNElJ+42BnJwL5+zlZkSFB0362nScFZ0sq7NGl8hQAtYkFfkjlDhGRwFvsm2H6GVAqwoqKmL+BRntmvV/CKPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTvSigHn0pRK1NnQonKGDrIp2xQW73pmenOayRm4KsNy78vcc
	Aw4kGWLcsvOdOVwczOSsPhVV1aOB6lU5WTSiTaEFsDRljMh4bG4pTUCXHjozE4obdthWuiYkM+Y
	aG12vJodKEQ2tc9XoJGU3hIg2wBe25QA=
X-Gm-Gg: AeBDietGRNPHIfW3SiebKSDdgerSi6LOzlzzaJHcynNjkCJBL7H7XZdyaNr3B8NWEtL
	Nph1oyyC9k3KdmYj+4PWS05MD3Ij/zgHbC2BbAB2bBfdYdJN7Dyj1y6PhFrV/UBksa20nFwj+i1
	R2pewCCCfbD9lDFgG23Bb0jObZOSO6JOSuVlasFkU7+lL6wFp2GGxy786vP23a2gi+Gbniw/C4C
	gHPsuaPIU0BGQ+cwWuiycxFru643U3JPp/QbYv4FIiSRERznrSgE+gfNmiywTEvf+PzDmPyzdR7
	0yXn5uYN6+08EcimYzE=
X-Received: by 2002:a05:7301:2f8f:b0:2c9:ee15:a0ee with SMTP id
 5a478bee46e88-2efb1ea49b4mr2558521eec.12.1777833422205; Sun, 03 May 2026
 11:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503163842.213489-1-clamor95@gmail.com> <20260503163842.213489-3-clamor95@gmail.com>
In-Reply-To: <20260503163842.213489-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 3 May 2026 21:36:50 +0300
X-Gm-Features: AVHnY4IxuDT5wqlWTthor6a-YxW_u6JTlPuE1JJHX5m6jXfJ3pVQZVYx5UnP4ak
Message-ID: <CAPVz0n1N4YHDPW=gsUZWZmRZbt8xQB1V8JWn6cyM75fo7H020w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
To: Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, 
	Thierry Reding <thierry.reding@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 3 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:38=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Ion Agorria <ion@agorria.com>
>
> The current power management configuration causes GR2G/GR3D to malfunctio=
n
> after resume. Reconfigure all PM actions to be handled within the GR*D
> probe and remove operations to address this.
>
> Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 11 ++++-------
>  drivers/gpu/drm/tegra/gr3d.c | 11 ++++-------
>  2 files changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index e4148b034af7..ffcd076b5831 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -100,9 +100,6 @@ static int gr2d_exit(struct host1x_client *client)
>         if (err < 0)
>                 return err;
>
> -       pm_runtime_dont_use_autosuspend(client->dev);
> -       pm_runtime_force_suspend(client->dev);
> -
>         host1x_client_iommu_detach(client);
>         host1x_syncpt_put(client->syncpts[0]);
>         host1x_channel_put(gr2d->channel);
> @@ -286,6 +283,10 @@ static int gr2d_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> +       pm_runtime_enable(dev);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 500);
> +

Hello Mikko!

I have used same setup as in VIC. May you please take a look to sashiko's c=
heck
https://sashiko.dev/#/patchset/20260502124055.22475-1-clamor95%40gmail.com

I do agree with statement that pm_runtime_enable should be before
host1x_client_register since this same approach is widely used in the
media subsystem too.

But I am more interested in your thoughts regarding sashiko's
gr2d_exit situation reasoning.

Thank you!

>         return 0;
>  }
>
> @@ -367,10 +368,6 @@ static int __maybe_unused gr2d_runtime_resume(struct=
 device *dev)
>                 goto disable_clk;
>         }
>
> -       pm_runtime_enable(dev);
> -       pm_runtime_use_autosuspend(dev);
> -       pm_runtime_set_autosuspend_delay(dev, 500);
> -
>         return 0;
>
>  disable_clk:
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 47b0c6c56bfd..cd5554e2117f 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -109,9 +109,6 @@ static int gr3d_exit(struct host1x_client *client)
>         if (err < 0)
>                 return err;
>
> -       pm_runtime_dont_use_autosuspend(client->dev);
> -       pm_runtime_force_suspend(client->dev);
> -
>         host1x_client_iommu_detach(client);
>         host1x_syncpt_put(client->syncpts[0]);
>         host1x_channel_put(gr3d->channel);
> @@ -517,6 +514,10 @@ static int gr3d_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> +
>         return 0;
>  }
>
> @@ -578,10 +579,6 @@ static int __maybe_unused gr3d_runtime_resume(struct=
 device *dev)
>                 goto disable_clk;
>         }
>
> -       pm_runtime_enable(dev);
> -       pm_runtime_use_autosuspend(dev);
> -       pm_runtime_set_autosuspend_delay(dev, 500);
> -
>         return 0;
>
>  disable_clk:
> --
> 2.51.0
>
