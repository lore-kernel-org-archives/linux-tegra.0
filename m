Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4533A9FC
	for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000903; cv=pass; b=JKl0up7Xe0eFwAd0aNnCUKHP7oKPR5lS/Vk8kNOhsTrdIUyjqpnSdasQ/MAUDSxOfH5l6PIDAX7wY97l3mNF8GClJ+xwUWHqMk18ywLK3B3YoZN/esWqZdPeVK4xxV9DrkuRwWnqrZK5sOgMdwRUYT9zP+3gz88GkWxCo3pSve0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000903; c=relaxed/simple;
	bh=/V/2gMqRS5FPFXxg4scfs09vLyHI+onE5AML7ipVNY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPb1QGB0JRpmDQ5jBv7DEQu/VUphiYXDT3CqmXTeKWzy/dCguuSCUEdcBK84quWFcpKynYWAlWhKc/bsWH4+/UjFgw4dC8ysK+PfA8IzWIGGLUgMCjd3ay9ZBBlqlnJhAJ3lNantBPkZarA0szHvdIuBXWBcbyBfyZmd4e7Pg9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXRSfurR; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXRSfurR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a4113ab355so8379678e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 13:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780000900; cv=none;
        d=google.com; s=arc-20240605;
        b=W7NdUj+SDtlt1gOPalWNznZAQo4/EA1nkHTaLAxOPMMuqKQ80IyZHnbuvB3JAvxSRc
         PdAi198kup8gptFJ1KUsXTBugQ58mGMNJPJuf2l8FJspqlMn7X17ch0ciPIsc8yvMuhd
         MVzAq5Lf2Dv+eY+zZ0HMlvqXK7ePIbQRoAq2i4UxO2xq8KYcLCv41EjPVC8Ct4KLVqsF
         lAqXf9LCcba+Tp2ExeZ79p2/8894KjuQRJ3LNMT8l4v43Tc+2l4TJml5yWoJUQ57Ng3e
         I+4xy6BbYOrcCTOAFhbjoI1zdYkvo4g67WSXVvbBAZmkAmJTBcEWOHDV4VqN0CiRFfof
         zukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        fh=g4cAekP5Bkl11DwEX3xUV2HXov6AJ4n7A25Ehi8ECf4=;
        b=hHz+t0Vn+fsv996N7uUb7H7CsO7tgvo5zvL+vxO1iY1WP66/kk6gUWcrlsIfbKLpTO
         BnmK+KZrU3vRcfWlKGs3Cot8p3iRc/nhmmhPf677BVikwAKTiB5EWTETqEy+bKd8vXGe
         BzNihoZOBq2lVdMhZEDY9wzfdihgB6x47PeCGJnmlDWzug40yqsdDoXjBQyerYRj25QU
         OZVNtEZb4ElHUv3v+CEB3Zf+kSK1aMKLAwr7IZEZXd/VYEe/dXvK3/QyiDi45sv8Uy+q
         /+hQrie4H1/Ov2wPNTClKzuO0y1S6wNHICfvyr7kP1RAO4XdlVQ6j0WXESAABalzGuZW
         yjtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780000900; x=1780605700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        b=EXRSfurR6CaTZnFZi82fHB94SVsVkw2Vkm35mdyGNft8/BNZevRnVi6NJrMc86GdAw
         jgyn4/VG34/joBHw69Yqey1P4gqUG/ipNbr9JA+YNc0vZLYQsk4VHzClWxJuvf5uff7d
         INV8c39Av2qJEDH/yVHBaAKTl696JSz5VWZVAD5zg6pnBoUgmMRJOnqiUig2HgfXY6Z+
         gpy7nC3GIgmtpQUAfV+BJweY6f7s0UihzldbGS+xAc7okMQq6bAJoN7Eq+k3eCqcU0co
         6cSfNHZxfeGubjamNKzOPvjB2DyTX6QeFe0nMc3N4RUYzbh+iWYGWdTFnl2xrGykp5XR
         LAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000900; x=1780605700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        b=QaxAVfBPQB452fkVlmXYgt35oy9u6WlX/2+quXwn/+lFFxSSaNVbfUrWw1YCNpi6mD
         EuGCZgF1xVvuCzpcBePKthexri3B1WeakelaZAHI55+bgLpJ111nTMhlYgPPTyKIpgVm
         64v3RmW3IQ0SHDK4ToM9KPMnLfS/11jBaCfekNYyF1gVN7cCxq9vKoKOwb2yDRGfvOAk
         1ZBK4HI2WlR8PYwT0IXj4ViOAqXKLj5nwX9sg2AfjCU3eRAi7ckWzcZY95qaVVfDDJab
         B1bCWeJ/b5/J1Pi9QyV6NUXvhW4Vbaz21ot3Ph8hl3J3rQuQZ6U+j4qKBFguoKsvSWN/
         VIWg==
X-Forwarded-Encrypted: i=1; AFNElJ9sOCYN/HKtNtrkXhTtqdbISUjyLoTZRoqWNwibt+rDiYuYc7/GIH88ZCboFjJIn8VYkhdI+3Ss6ug1Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8I0M1yjrN3oS/wjbtxpCSL2LECzKOC0TjyqIm7lOwmPdNQ2cM
	WSjCwuBzuy3I+WlNIUzcEmznchh78DmX0J8rWDFyiUzZF9JlXA2fGU4p6VbsEp6wNeflAzyljg6
	SmbEGfExA7VZ3rXXKLhkmNvxy7gS6yFc=
X-Gm-Gg: Acq92OGYJORZBI7ICokoG7kATEp9WIB3dt86GWXpAxsn4kbYWDWU7VEQzBlis8Td24o
	HZJS6sAH1haYpT7sAA/Eezz1hcMAlVryN8JxTq1RPbzzm2h4cbAjTj5QG2weTF+HJyzBXwPYaV+
	Q0W+wizpt71nkou+BP+w0UBschIcma0MalJi7afbd/q9cnsbD81kTpAIQbkhxZNEahgZ0VS5vop
	VCRbLbhCSe5t0TqSSN8uzkEUko2gCfcVjLAWl2gMkWoJpjC5a3dZJXM/VXXU2rEutUvN5uLrVzd
	GzEm7p67Hc2VdD+BOork/6QZ4qh+RttmEyGj6tpbF03JFg/wlzcGy9m1l4N0qrkkTNU0rZi285l
	eOWBlIKJkUbn439CNIwBNZdcl5C7IwRhGXlltUxNV9rWNhil6Ycx6QMCyHTIG1lT/I4N6
X-Received: by 2002:a05:6512:64ea:b0:5aa:100a:8315 with SMTP id
 2adb3069b0e04-5aa57e5f1e4mr131153e87.45.1780000899756; Thu, 28 May 2026
 13:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522015856.741656-1-rosenp@gmail.com> <ahimtheMu3fjdTf6@orome>
In-Reply-To: <ahimtheMu3fjdTf6@orome>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 28 May 2026 13:41:27 -0700
X-Gm-Features: AVHnY4I0Sa39bxDLuht7mH9rJl6M7jPB17sD3ve3oU0X8lJo2v4KmfzovqXgKns
Message-ID: <CAKxU2N-CboLr3X4_5eZSMeEEyvA8i=OT5=YJ71A_zzc7TK9aFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:35=E2=80=AFPM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Thu, May 21, 2026 at 06:58:56PM -0700, Rosen Penev wrote:
> > Remove open coding of the function to simplify the code.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  sound/soc/tegra/tegra210_adx.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_=
adx.c
> > index 12371f895234..a2c28369fbc8 100644
> > --- a/sound/soc/tegra/tegra210_adx.c
> > +++ b/sound/soc/tegra/tegra210_adx.c
> > @@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct pla=
tform_device *pdev)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct tegra210_adx *adx;
> > -     const struct of_device_id *match;
> > -     struct tegra210_adx_soc_data *soc_data;
> > +     const struct tegra210_adx_soc_data *soc_data;
> >       void __iomem *regs;
> >       int err, i;
> >
> > +     soc_data =3D of_device_get_match_data(dev);
> > +
> >       adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> >       if (!adx)
> >               return -ENOMEM;
> >
> > -     match =3D of_match_device(tegra210_adx_of_match, dev);
> > -     soc_data =3D (struct tegra210_adx_soc_data *)match->data;
> >       adx->soc_data =3D soc_data;
>
> Why not just:
>
>         adx->soc_data =3D of_device_get_match_data(dev);
>
> ? That saves you a few temporary variables and since you're not moving
> around the assignment needlessly, you get a much simpler diff, too.
Because soc_data is used later on in this function. I'd have to add
adx-> everywhere.
>
> Thierry
