Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D522D0620
	for <linux-tegra@vger.kernel.org>; Sun,  8 Mar 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772956914; cv=pass; b=qOP7SKe+0pMvIzNt8zhPxz/HORJwmUAkrlF9tWUjYrjQHqyFbfKxQQLBlP7CiQa3PRodJGWz1IEAXql2KomTBWTodA4HXSwTM6ZL8RXN3ext40aWXG0SYgi1AwlUnntX96pcxSxvBNCnbywF86FcJIK5JCpk4IzdlHB68bFYznU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772956914; c=relaxed/simple;
	bh=e+JWpxUFxincKrOFEbSflBir7bHI79X8q1wNTBKiq+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G31szVFI5KVtkVGPuxQSoXsfLlbo/Vc3+g3OAOPgPAMmgd9yU0ymWrR4TBBbhU1H2N/GA7DcRCj1FovEsXbUT8IVWVDKy8m0y544zfMJJz0MivHlGj4t0Sr4zvdcvTKTish19C3lMLO0kVP9ga2zuXzoB0DW0LUmzSGKlC3tZTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7986fb839f5so92283357b3.0
        for <linux-tegra@vger.kernel.org>; Sun, 08 Mar 2026 00:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772956911; cv=none;
        d=google.com; s=arc-20240605;
        b=B60DkjyUbJZYTQXjkTaMVx5iuWoMvlwqZulLpf80pUCsHLu5SIFCWQOJddwJvQTNiN
         mn+dbCb0dHN8+6lw34Z7qvy9NVMbRnd3lpBAch6u4LwdeATt1mgcIDgKuC5W90ciseSj
         Zp236sYmu4+kW/UEJjqedvP1JQxuUC8C67gMcKSKaNq3K3Kv0WiSdRrLmj4n5QvUlTxa
         63P2iTfQ6rPtz6jigV2Ac1l8XD0YOF4v4Q9ImoTFnDvUjv4K4QW27rnGeq7zm5paiW0r
         5K+zhP++4kjUw1qiqOAtcmvKoW6+GqohXr1z/ymp+scy0rk/+tvbxcQDO/0lQb186H9M
         YreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version;
        bh=GOWP6zSnxcF+tsFTisgMeGRm8WIPpUWzrAQyegG9FEw=;
        fh=jJeKq1tlmzjebyvH+dQ08BWEs9mz1uTvTSF0jXKohLU=;
        b=IlOh3d6xff1O5iPjGuZUG1MmRSYRtGPhVdpBk81VR8o10npFcAHxOtti7y64s1YIrs
         HY+mFLcEkq4lsTc36pPjM9WF6PzVzW0zGg26g99Vk0H1Of703HrwZUPhJUd+UzSX5t5V
         WuRM/NF9LXdQVBcbv/rk2zsxcTvMgpMjmFIVhnroNkdZhnpghG6x/YhlVxHX3rKmxEVE
         SLV+0NxfueLYflIn2wXQ3zQIPvUCMrcBR4dThINZKM2At1I8ZkgDHmWZmtQJr3WxLUWB
         Y9D81m8BcjZXWhzuCc6X350PXtFZYU+w4s91lXbc8JxFLcW+7dq+48Vj4TzET3VxDL35
         Fr5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772956911; x=1773561711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOWP6zSnxcF+tsFTisgMeGRm8WIPpUWzrAQyegG9FEw=;
        b=mg106jxLnoraT7GXASOJ2StSLlrDcOxLd07xIXf9Qw16FzfouA4Bxo1RBCC/y4WsUI
         k6DlWQ1Zy7S22QIioGZohyEVykO4wIeqylSIEYzN7wp5Jo3MBDW/nu4fGL/o/4QXeVf2
         dRxXpuvbsSYuWzk5C0rgXeDy7STcBK0umMYk8jDI3ch6Z3wK3VdB/NKlyV/2nJrKeltb
         SMDYg3W0zk5I8uMsEbpxhgZYG3H9zcU+OC+zE0wi3f29e6hvJxAImAK4kppcISQAWR+e
         FlMn94El4yxHhnj0XwaFvXs7XQ1KeaUpbPkC8caOaY6lLV/q+sg810Kb+88qCN8sgeCQ
         GUmA==
X-Forwarded-Encrypted: i=1; AJvYcCXMhb35aZapUR7Tozsoe6dkjfKMwDigwj29P4s0wNB7qGwBVYwWHW9GUTATxXdTp0uL7R+1QoFXNI/7rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+xsgh6A04InYXGWDOO1+Coy8ecDnVtfaUiTeCsXHQrBJNtZ5
	0PkUyUxYl9sLaXH+0kyhEjLPzEVJJnCVdr+TZhQ68wX6jr1Kjij9jJTdsLE2+M1FtMjhhP+49Y2
	WMw3WA7HE7+b90SdpgmOprsQ40FT71ZM=
X-Gm-Gg: ATEYQzwUgX12qSn3hFLmu4VmVkfXr7G8859Zez35RqtYyJdK2MdVuYS/6SsQMy6/yUO
	2RlS8AYG/IJvrd2WrjlZ6JzvVbj5wW1xlsBkgBJKwucEMyTmd7qIkrL5lnWINMgBCyhnutIJB2/
	TOVxVKwn8K1OKJIZohv9yjctjxcWaqM7d7oXKoABrAueMvXZ385kxDksN+FfTpVPdIj+l+IbceE
	LLS4gGvu1gyu/r/qr6k3BhGu9ybsBZ/+zw1SX5YjkWVQM0cd4pYnoLxur1SEoCwhtmi4t6AEY4f
	70XwMyaDWA==
X-Received: by 2002:a05:690c:dd3:b0:798:6a6b:5af3 with SMTP id
 00721157ae682-798dd746276mr64700047b3.34.1772956910640; Sun, 08 Mar 2026
 00:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185423.77786-1-clamor95@gmail.com> <20260126185423.77786-2-clamor95@gmail.com>
 <4b98421a-9e64-48cb-9726-ff34a5b9cc76@gmail.com>
In-Reply-To: <4b98421a-9e64-48cb-9726-ff34a5b9cc76@gmail.com>
Reply-To: myungjoo.ham@gmail.com
From: MyungJoo Ham <myungjoo.ham@samsung.com>
Date: Sun, 8 Mar 2026 17:01:14 +0900
X-Gm-Features: AaiRm53blAKzXa1-IVJRNtnVNQwzPeE9ufIH8qWoEmbaU5kj6Fs3pMXVHGeWD2k
Message-ID: <CAJ0PZbS6JhPOMNP3fB4biiu3b32jF-A6AMQ6M7usOEG0B88JJw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] devfreq: tegra30-devfreq: add support for Tegra114
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 3=EC=9B=94 3=EC=9D=BC (=ED=99=94) AM 8:24, Dmitry Osipenko <d=
igetx@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> 26.01.2026 21:54, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Lets add Tegra114 support to activity monitor device as a preparation t=
o
> > upcoming EMC controller support.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra3=
0-devfreq.c
> > index 8ea5b482bfb3..fa83480a923f 100644
> > --- a/drivers/devfreq/tegra30-devfreq.c
> > +++ b/drivers/devfreq/tegra30-devfreq.c
> > @@ -963,16 +963,22 @@ static int tegra_devfreq_probe(struct platform_de=
vice *pdev)
> >       return 0;
> >  }
> >
> > +/*
> > + * The activity counter is incremented every 256 memory transactions. =
However,
> > + * the number of clock cycles required for each transaction varies acr=
oss
> > + * different SoC generations. For instance, a single transaction takes=
 2 EMC
> > + * clocks on Tegra30, 1 EMC clock on Tegra114, and 4 EMC clocks on Teg=
ra124.
> > + */
> >  static const struct tegra_devfreq_soc_data tegra124_soc =3D {
> >       .configs =3D tegra124_device_configs,
> > -
> > -     /*
> > -      * Activity counter is incremented every 256 memory transactions,
> > -      * and each transaction takes 4 EMC clocks.
> > -      */
> >       .count_weight =3D 4 * 256,
> >  };
> >
> > +static const struct tegra_devfreq_soc_data tegra114_soc =3D {
> > +     .configs =3D tegra124_device_configs,
> > +     .count_weight =3D 256,
> > +};
> > +
> >  static const struct tegra_devfreq_soc_data tegra30_soc =3D {
> >       .configs =3D tegra30_device_configs,
> >       .count_weight =3D 2 * 256,
> > @@ -980,6 +986,7 @@ static const struct tegra_devfreq_soc_data tegra30_=
soc =3D {
> >
> >  static const struct of_device_id tegra_devfreq_of_match[] =3D {
> >       { .compatible =3D "nvidia,tegra30-actmon",  .data =3D &tegra30_so=
c, },
> > +     { .compatible =3D "nvidia,tegra114-actmon", .data =3D &tegra114_s=
oc, },
> >       { .compatible =3D "nvidia,tegra124-actmon", .data =3D &tegra124_s=
oc, },
> >       { },
> >  };
>
> Acked-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: MyungJoo Ham <myungjoo.ham@gmail.com>

--=20
MyungJoo Ham, Ph.D.
Samsung Electronics
