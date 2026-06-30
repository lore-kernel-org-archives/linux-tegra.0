Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D04EEBA
	for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2026 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779529; cv=pass; b=jmCSSMP1/OSjF70Y0KLZChzIpLgVYNqmr+41SXnVKOXyAC1LfjyZ3h2g58MzQ7tefVvwcAp61FWCfyWOwPJrTHUZLDWVvLd7w7YHYFG33ZhZKPY0gBK34SahZ/GWmTCZDJwjXwUzFQg/zRvUcCCO+mRk0cOAvEHDf0mf1M1hcXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779529; c=relaxed/simple;
	bh=Stv/EoGdRG9ASHi/1ijqr+t9ypiADGTyswBNzui6cls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJ260Bqf2SkWgLbw3RR7CiBz4FQ7Zffz9Am7kx6JJ+MTXIhI6cWk+uIhlYckRBRCs2tQlveQXM+JxSaZDaoiA+gXeiWvqLyYDbtfDzWktb0J9jH/rKmprY32hZSYT0n0lYDRreqRmWO5nkh09KGK9SveThuUsqM+w6p0aBocaII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANGSNIVS; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANGSNIVS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so7620112a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2026 17:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782779525; cv=none;
        d=google.com; s=arc-20260327;
        b=Ta5GelJcEnji1Z1i/IQRAqQZCPbwDsf8cZRIfdVIckiXdXJcYk9ysGoF+XI4QK9j8U
         ulY0KxlszxiSKOU6odUwgMSEwrfg+/i/EmFGnnAt4d+E2QHL+yuCnHO0Z2MKessHTP7R
         3wcAIHKrcroOM4zlXT3V+EMHeNHMJW5ww9Zhp6NvKUd4DnOOTTuAKrbl5+rUi9+1DBCN
         4YwA+wg3N7ddK9HCLJ4HKvJv4LiV6C8+FPatV8te6hC5wtNZGhkRPJIPlw5Cdm2EV7WQ
         mAnGm7aWa882/sLisWoALmtKCe75t7TXkSCGdATzqn7Cx7SHelfsmkWV6y91PfkyLbhP
         ZXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpFmbrfbWlP1ZXWzSm85Y63bTGD4RSCBbCB3/t7eeX8=;
        fh=R6P1894+6xvbAtBKsO/sUUtP9Yn9kQtyU5uCXT/wyKo=;
        b=iwEbbjKqcjKTAwF4ptTSOEbp1nO4bK3qIjBdkwSpDcLdzg4/BMAT3PUWFDhZA0gGW4
         U6FFcEvwiLLWcnRPLt4C/0G53M/IYOv75nyyFbS2iSUJDkdFJlwOz0d6J0AkF8VS7Z8A
         FX3Pu1qOq0M4Wh18ZWjI7WrPPp1KYDEnVu9/LDhsWiUxEadYAo7ipvptjNLtrynbVw+O
         a3Nd/iecLL+A5Nr1p7aUvhj4ZgZxj2BNDQXqrMfjIPtgvWQlDMZMzaE6iVzAkDcxJBBz
         pxMI/WHas0ZCEUy68l4hbiy0kXDcDxKHmPRzg/LgVAy7jvhfltfiDSdbVgWhSrHJ1q9r
         B87Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782779525; x=1783384325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpFmbrfbWlP1ZXWzSm85Y63bTGD4RSCBbCB3/t7eeX8=;
        b=ANGSNIVSWjrKq+Jarl8EklJk4ezQHFFL07EkuEBi7DSCBMr5JmtEQFaYJero7/qYwl
         JOAERtn3DCEAtwKR/XMBO9d0pZmlDmehowl1VaKU2nqV5TUdxFGCbXs1A2sFAOZy144L
         YpyEPr1S8IS5aUHphIMdSw7n0HAA0/mfuGMATdqkK13vnY61k7p6WP0xs8AvXsAXNCBx
         iMwHqf/5b1SJqD3vpFFTo2Qs9w8CIoqfWkevV4asWmpR44jyt4Z4zAuT02qeyOp4rciH
         OcSvJ6CKi3wBWcDshLYSXLUTRqYMRlQpItT8kbfDnWTk17ZjefUBoA9g0zXg+AfiaPny
         VbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779525; x=1783384325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpFmbrfbWlP1ZXWzSm85Y63bTGD4RSCBbCB3/t7eeX8=;
        b=qwJQybNKWLbaZOT6CPIIhIc/qAAQlp3plorN83yNZh3P7vF+J9vmE4VushCxZ09sWA
         Cei3h5GxjqKrEZjoQT5yZL+r4qUA+973NmnMxQ8dtm/A2tStWxpHGrxwJ90DvQJlfi18
         ASZhtcRgpd92RPYkR9ztETLpXBlfRHWGBvNNmEu0g8P4L7zecnQmE6RBZ2v2nvEOeb12
         BxYC9+wSjLw3LfHpCft7PrQYUcUfFe7h8yDiP+v+2ylS2BDEQrEIFzNmf8Uprs7n0ZBY
         jxvILc/llAaHHymFbsBievp96QBldDqU+8ykwiQBcVklmc5bDB93tZK3rmrnLjH+l9aD
         36Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqpG5tAvCzEmz85MKl/4PB3HhmIn4dj8gz8wyu7WKbD6nc/JkwFyZREDhY58vga3XlTn8PAZGQdRb57aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdgHNAy4yAi8gQtaJU0Mt9FZGyPHUsEvjtAJvnKCu5A8HCB/T
	peOgLnZ0P7F1KcS1Qa7pvtJDC3YYT7loSu1yFNKa10M4IvDsbVjTk9hgvYpbVw5wq5CUZYm2jzp
	qaUrsAE175z07QeO/+u5flqAPprTMomQ=
X-Gm-Gg: AfdE7clhG0dgrPJqS71Q/6+ga4qD64652/oRtA65pnAaZDNiVSQ5nYFSzEFTx64oRfC
	oGbzcv3n+zLgpnZTDsYZ9wzi8PjOpDMal9UdvF2EqsdBvILrDy3eYKkRYFm1OS6kSXE3+2cld5o
	bVeOoXFMY59harytuFlz8bY7LtrOLG62digbo5BXqRBJRGNmhIGkh9ybEPdoMs0LSBwtXX8z/v2
	KZgALPrrfNq186wL6mBZj0CXDJHnbX2ODZrFsPmVHO/AGkVCtpKb1i7bItMNBWwFn9xQ+bHApD7
	Wr0gZsyvy4pcfBxhulK00GcSjD3doibYS7UL7c9qAhW55VufEHkDBZxvsNhRBKmEyQ4q3yZMqt7
	0FFRrvU5Xe5XLykjT6uR6/S5NiCM=
X-Received: by 2002:a05:6402:210b:b0:697:be0e:4b72 with SMTP id
 4fb4d7f45d1cf-69879dcd8c9mr529822a12.1.1782779524530; Mon, 29 Jun 2026
 17:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609212531.22044-1-rosenp@gmail.com> <60410a5b-226b-44ee-93c1-d9cb3eedf01c@nvidia.com>
In-Reply-To: <60410a5b-226b-44ee-93c1-d9cb3eedf01c@nvidia.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 29 Jun 2026 17:31:52 -0700
X-Gm-Features: AVVi8Cd4Bft5b9XJ3dVIwMux45umBZiiJ9R_2r0zjmH4edtW8dHEPIxh6q8FZzE
Message-ID: <CAKxU2N-DELS8D=ZFk++s-AW-uZv4gKvqmKM0gzDdbGy2zvrGKw@mail.gmail.com>
Subject: Re: [PATCHv4] dmaengine: tegra210-adma: use platform to ioremap
To: Jon Hunter <jonathanh@nvidia.com>
Cc: dmaengine@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:43=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 09/06/2026 22:25, Rosen Penev wrote:
> > Simpler to call devm_platform_ioremap_resource() as it returns multiple
> > error messages for whichever part fails.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   v4: rebase and reword commit message
> >   v3: change subject
> >   v2: reword commit message
> >   drivers/dma/tegra210-adma.c | 12 +++---------
> >   1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> > index ceaee1e33e68..21a381d022cf 100644
> > --- a/drivers/dma/tegra210-adma.c
> > +++ b/drivers/dma/tegra210-adma.c
> > @@ -1087,15 +1087,9 @@ static int tegra_adma_probe(struct platform_devi=
ce *pdev)
> >               }
> >       } else {
> >               /* If no 'page' property found, then reg DT binding would=
 be legacy */
> > -             res_base =3D platform_get_resource(pdev, IORESOURCE_MEM, =
0);
> > -             if (res_base) {
> > -                     tdma->base_addr =3D devm_ioremap_resource(&pdev->=
dev, res_base);
> > -                     if (IS_ERR(tdma->base_addr))
> > -                             return PTR_ERR(tdma->base_addr);
> > -             } else {
> > -                     return dev_err_probe(&pdev->dev, -ENODEV,
> > -                                          "failed to get memory resour=
ce\n");
> > -             }
> > +             tdma->base_addr =3D devm_platform_ioremap_resource(pdev, =
0);
> > +             if (IS_ERR(tdma->base_addr))
> > +                     return PTR_ERR(tdma->base_addr);
>
> The dev_err_probe() was purposely added to assist debug. Please don't
> drop this.
If you're talking about the memory resource error,
devm_platform_ioremap_resource() prints

ret =3D dev_err_probe(dev, -EINVAL, "invalid resource %pR\n", res);

That's more descriptive, no?
>
> Jon
>
> --
> nvpublic
>
