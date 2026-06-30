Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8C34CDD
	for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2026 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853586; cv=pass; b=qxT1nzc7LOz19986MX9b/nvQ9k4LuYtSpbWGlkg4IHHgyCfUfwCQqHV52lSIHdXFT1UVWHk077/otvUIWe587rZtiiqQQheY1oblAIaYMG8tmgHn4UC2bUKUYKR2YjWw0qjJHpIbxbxt8cw87+FZlpklR5uL5G0+IYMeBxuwr/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853586; c=relaxed/simple;
	bh=mFaXjl6dZ1/2S3o232oCxEHpBK6iw6hUHR/OvwGcwxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJTn0jbWowfHjhN08haEXVdiiam3OFW1wpIZpvuceJIq3UhVyJx2zg0pCvzAmCMhOtSKISNye6PMIbUTSTNvKJhE3T//RNhf2qnopZp3WGt0qU6I7TYHwYX8oF87L9dYPMipd1RY4R1/or7MyPj6/pLqGNguQKNjJC4UxV6vxkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIC9N2QC; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIC9N2QC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec201b582so369221e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2026 14:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853583; cv=none;
        d=google.com; s=arc-20260327;
        b=jsGktcGnwOIU1p9GAeLu8Tl6O9N2OlNav4E29vZynIoFQwo1Wx7r1r2nGvCt3cAZGa
         aHWB5taJy2rA8fX44YTZNnLsOX7VjOaca5sfthxh2ohJL0Nqh95blD7gpwbc5tNxVNLs
         mlm53YgQnTiOhNrsWoOtbKl8FrQZ5Id8ahckL8uMq8/TMefLtJGXwS7HswAUhsjDE0xv
         Zms22978iRrQABPmGnckn1MoeDVQcKTpD9hfm/rd6Ddh3FYDvLBo7agxFmIWb+5FmQYR
         FfVYZCDbm/1/04cztMVokH8pI9uUE9wxbzSUwxnzDTwitGHfVqZlUM6T11NLrMMON2KV
         LBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YcF+NbaiHR14liOaNUkioRurzY2meGEqjWBbBBaTOQY=;
        fh=apUp3AmegWYfeB/0d6eam/4LHTd1rny+VE8UGw6jFAU=;
        b=O5XYOAFN+6fPN3lpnT6CitPqLAXyLefbBPPuTp//LzqLIcRqxn5BQal8G28Kg3ZAga
         Yd8M0VZun2ya4dOqBnnK7nfiU33wHobszaY+bECZd45yqeNB7sW+yu+SIwBQvL4OtEjx
         /XXLu729eiHMvSCd6iu5+pgHmIrsriNfOLeSHh4s3psTbL35VuI87dYYlbvUiXfSOML0
         6IgHYyuNGNu/3wrrhSOue4L9Lwbl2ZfzndvTVETEETbeyIN771TWpBoo9jrf3fA04f49
         tFbRbXXfBtqtH9Dg0/DvgsEI/1KJ/jyCxMayLgsSrDuQgiJXG+9dj2zAmJola2CqIp+l
         dRLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853583; x=1783458383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcF+NbaiHR14liOaNUkioRurzY2meGEqjWBbBBaTOQY=;
        b=JIC9N2QCgWjf9Khrnd/h5Mi+p9HI5aZmfbC6WCY4b72YVSlWC4ynY+DlbMZ5MYBjNm
         nr/+7KmEpfUfrPzo1CJfrhz/BTXwfSl8S4ERThUGWWLGkoT+9XSnXM0Mk8Zc74wiWnlc
         5D1OAwCGLcuUHqwkmNxQHFKaFhmU7w9nqGqCO9Xl5wfR/paxmEgfdn7jxhr0+c1eiqFF
         SUcRlhq8c2DeAHCNHBYBiWw/l9g6sRPxbnFBsbw3Mxq3sF5yqlzQJwAF3LrOl4TkCkiT
         I3js2LIyoNUbaJU9QUlqK2czk58LVonyVfT7poD0LluO1nxE1e/F75Adbkp7VzP5cvob
         6ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853583; x=1783458383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcF+NbaiHR14liOaNUkioRurzY2meGEqjWBbBBaTOQY=;
        b=fMoe5PPZMdm+lhFcMrlc4Fl1we3HGe36Jz5cIW9RAmcHj5ZGTj49u9pTwW9I9cv+jV
         nkyUtvGPHS0R6BHUiiUHFk+E5Xx+aEc+f21aJgwa9sRdbK+MneBAi+UhnUTxORqwd9sg
         Z2HQ8aAQOVFyDFwM+6Ejt46QMFnJw5OjI2Squ95PqebvqQbb9jd4MRZXvg9jHsDXGU27
         ZiQgWz7RHrvflJXjO/K/nv+ULZNvOltnRTQmcbd1pdFshWlhEsCF3yz8KVrXy/xXVU0U
         bQjG0sObrtPk8SgWfMQIl4MjNup1VKg703IkTpRqk9Gm6Of+VFd4iY1J+Mhe4hU7RJC9
         q/Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoMM+FreQXb05d8XPZMxNoIJDE2cQMg5XVRB07Dr4sujqg8VjtiplTpXtBhNGOaZ/dUgXDll3kJkcS6tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3PC0PKeI7/cxIHgvWdNL0OFsJzsnhtNMgagTL0a9Utby6zs3P
	3H1Qm1G8bs0HQh+mLZgEwIJepTA8WNDaXxc796/S6CpMZbqHv773Gzl9SW4Dsj2CRcNuL57TZIF
	nN3JK7DOY6bGeYrzBi8NaVWxYz5YiN8rpAvcX
X-Gm-Gg: AfdE7clm61GtvDh182LkHpMBY2OivTFpEoN0y/2OSShr6Q90NOSN6KHoeLj4+QS1C7u
	/85dXUPBsiWMDsL0VUnlVnlMdj+yEvvN0tEBhRLUTt+SzZYKvTDIRmgrZ95ZAH0nPEDihSVZDbu
	yGAs0gXIpqxJK/YB7vPgZaIqtqum5zqlb9TBwBi9RbRqNR1PajA/Yu1Gpep45lfqygpkbCuryAq
	Fvz04ojnpHC7m/qcidsSsJkSowa6E2fcmCQ6RAWoLi+w9NrauAEIV3XDFCIpGy4j3axL6Vl01qe
	/sJPwquOMbkOQfpY5dISXpeyEIJV3S1yeEZBPli5b45pDzRLsRvzZbqBUeZOqcYjmixGZzJEJ80
	9egQ1a8tDduYJpIfdCPwuCf0XyAI=
X-Received: by 2002:a05:6512:3144:b0:5ae:b918:af30 with SMTP id
 2adb3069b0e04-5aec10a7085mr502707e87.4.1782853582682; Tue, 30 Jun 2026
 14:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609212531.22044-1-rosenp@gmail.com> <60410a5b-226b-44ee-93c1-d9cb3eedf01c@nvidia.com>
 <CAKxU2N-DELS8D=ZFk++s-AW-uZv4gKvqmKM0gzDdbGy2zvrGKw@mail.gmail.com> <4bbd8cad-581b-43a7-b644-f6202f7aa293@nvidia.com>
In-Reply-To: <4bbd8cad-581b-43a7-b644-f6202f7aa293@nvidia.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 30 Jun 2026 14:06:07 -0700
X-Gm-Features: AVVi8CduV4yaDwoDs3ZqEzXGSkubc0ROFEm-h-J0blBD0wrnaLCY5zozxL96TyY
Message-ID: <CAKxU2N-GX5grrSm75mfAUqDXiXcQ0xMUX5Sbd7CLvELpF=QNTw@mail.gmail.com>
Subject: Re: [PATCHv4] dmaengine: tegra210-adma: use platform to ioremap
To: Jon Hunter <jonathanh@nvidia.com>
Cc: dmaengine@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:17=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 30/06/2026 01:31, Rosen Penev wrote:
> > On Wed, Jun 10, 2026 at 1:43=E2=80=AFAM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >>
> >> On 09/06/2026 22:25, Rosen Penev wrote:
> >>> Simpler to call devm_platform_ioremap_resource() as it returns multip=
le
> >>> error messages for whichever part fails.
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>    v4: rebase and reword commit message
> >>>    v3: change subject
> >>>    v2: reword commit message
> >>>    drivers/dma/tegra210-adma.c | 12 +++---------
> >>>    1 file changed, 3 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.=
c
> >>> index ceaee1e33e68..21a381d022cf 100644
> >>> --- a/drivers/dma/tegra210-adma.c
> >>> +++ b/drivers/dma/tegra210-adma.c
> >>> @@ -1087,15 +1087,9 @@ static int tegra_adma_probe(struct platform_de=
vice *pdev)
> >>>                }
> >>>        } else {
> >>>                /* If no 'page' property found, then reg DT binding wo=
uld be legacy */
> >>> -             res_base =3D platform_get_resource(pdev, IORESOURCE_MEM=
, 0);
> >>> -             if (res_base) {
> >>> -                     tdma->base_addr =3D devm_ioremap_resource(&pdev=
->dev, res_base);
> >>> -                     if (IS_ERR(tdma->base_addr))
> >>> -                             return PTR_ERR(tdma->base_addr);
> >>> -             } else {
> >>> -                     return dev_err_probe(&pdev->dev, -ENODEV,
> >>> -                                          "failed to get memory reso=
urce\n");
> >>> -             }
> >>> +             tdma->base_addr =3D devm_platform_ioremap_resource(pdev=
, 0);
> >>> +             if (IS_ERR(tdma->base_addr))
> >>> +                     return PTR_ERR(tdma->base_addr);
> >>
> >> The dev_err_probe() was purposely added to assist debug. Please don't
> >> drop this.
> > If you're talking about the memory resource error,
> > devm_platform_ioremap_resource() prints
> >
> > ret =3D dev_err_probe(dev, -EINVAL, "invalid resource %pR\n", res);
>
> Well technically it is devm_ioremap_resource() that prints the above
> which was not obvious. So clarifying that in the commit message would be
> good.
I mentioned it returns multiple error messages.
>
> Jon
>
> --
> nvpublic
>
