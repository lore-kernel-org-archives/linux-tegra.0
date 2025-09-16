Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55452371E82
	for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039907; cv=none; b=Mq78yQehkJHxqdho7c69rPdRKeRjkQa/ZaL2KsVfsroIB+KSElqfIThDNF+oXQzU//RX81IxgLKdP8ZLjSlD5xN8SAM1wUsgee2vETTBvwe7rAgqfe6d+aEd3+RXAz7vI2nIZdCDfGxjdCNJPRlHKd/jIxq30zG5/hBxzmMfPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039907; c=relaxed/simple;
	bh=4bZfUcu3hp/JB4J0y/5p9andv/NKPL6V7hMbzL5vopg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBmvL2EPk3TRqnCp3wSBW0zx/fGJPpjiz2RU+KA8lcJlqLsPAqQYpn2JgTJG9tFxcD/Bb+0HXvItmawrKDgLDBtdqD6HoiJ9PBvMPHSvwbx+D3X/DKSMTCvsMudp1QpXwtnh1DKou6D8tfJ0t0SpWTDNOL8B9IS9j/MRTarfyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKfx5b2C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKfx5b2C"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so54647135e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758039904; x=1758644704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
        b=PKfx5b2Cr8wbMLdOGmQAVDpmUwQqc2ALiO9uql+bNly8gmsyRonj5IF1PBcUtSf4XO
         SZmX+3Q1qe7E61CXabv8n59ncUjfQ+kisE+5MMBo8Zne/Cw/mTB29ydqq4Jkx9MQDvQJ
         XdONhkbOaa95HJbmgAAa9pDEPhJbZb6uzttBdph6yFIvi79ruf7yvHlPGecrf4cOjTgF
         gYrvMF/osBn0jHtVzHwR2mCzWoJEC2Q2eGttLIINhsjzg59JkGPbiDWIyAJG1Yc1rtkF
         IXnIUbccneyvl9UiTebHvztkWsAiZZV8XQJvpZZ6MYZM6DWhqqDQVFybD5GFCDuQm1C/
         7dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758039904; x=1758644704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
        b=wv9JQvvWzANa83HFILjXbvqUv50cECnLhSA8fffI7pNcv7nJtlh+54fr4LPr2EZaWI
         jk57R8GC/JwIJ5kcOgd8V3nTgMYMRzeUhB3LVJYZZKA55P41bbi+AT9jylqEeo98B5//
         dN0OXrPRhMAbMitx06w5RIbbW5romsmZYBCHDheBVwtdmk6YcuvWs3H8zwyETPgpuQL9
         nT/iTvk6/hU1vTyJ7kpuXMz/XfNV74LRii+21ALiGsP0T4a7QbbXjXtz8C7cPnQ5xU9s
         AxHvRuRSsKQC42stCkpdhjzpZq6cnf0+7qqzEYC5YRkFuNF7iBKTQyMpyt6HCIrHVpMk
         cLYA==
X-Forwarded-Encrypted: i=1; AJvYcCX8JBZazloPaPDpOTv8oMjSVCENuodsxF26zQTjI/kULuQb1xCnLfj1wxfnNTT6vIEs/CSzBRoijQZZrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXqmqkUSZgJ/IQ1HUPHeyaZ2V7iJcmlmxIc657LCsaluQj9f6
	YYXfUqBRLUiWJfThiYnrU58xOoB+c4VEStzP5Sdaf7brr+ZFjFcJzUHjsU70gzrcYAn8OZje8E5
	tVah2/r6ARO5aZyzzsrLoYO8I9u46EYA=
X-Gm-Gg: ASbGncu9ZdnWVZrRouJWQd5wtR1uIJ1iuiiopMYHOjOGjE9gAPZbHRnA4a1YHc6gQB0
	ZPSQSgBKR7RcFt75r7qsvykQfZJ26pYbYL2WBv4my6q0tuxckVDhQPOb0pamz+uPNjPTo2rCTVy
	Pf5zgpFWtDL/913e+oiSwQmrcjPzcIAj2tZyID5jFCfnqD/Irgqkknd5OAN2GU35KfHBJFXREkq
	P5IQtF6
X-Google-Smtp-Source: AGHT+IFnC+ZB8Y8EWWSgcq7DryM/idg50aJ/eE+AB8zfjBLAVoKc5lX8wjY+HH9LKTM1j4AoLgwSfNow1JOz5yHjF94=
X-Received: by 2002:a7b:c857:0:b0:45b:7be1:be1f with SMTP id
 5b1f17b1804b1-45f211f300dmr100112085e9.32.1758039903439; Tue, 16 Sep 2025
 09:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-12-clamor95@gmail.com>
 <20250916180418.3fa270a9@booty>
In-Reply-To: <20250916180418.3fa270a9@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Sep 2025 19:24:52 +0300
X-Gm-Features: AS18NWDUsY2rg2kwucuKEpR6QKEKIqi67u-AOuSpm9Dlzkb81_NunB_TLA1wgsc
Message-ID: <CAPVz0n1Nvun5yBf_i3NB=kDmLfNFRjbFt1uTUW-hpLbp-h0g4w@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to tegra_channel_get_remote_csi_subdev
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:04 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Sat,  6 Sep 2025 16:53:32 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > By default tegra_channel_get_remote_csi_subdev returns next device in p=
ipe
> > assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VI=
P
> > or even HOST. Lets check if returned device is actually CSI by comparin=
g
> > subdevice operations.
>
> This is just for extra safety, or is there a real case where the lack
> of this check creates some issues in your use case?
>
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops =
=3D {
> >       .pad    =3D &tegra_csi_pad_ops,
> >  };
> >
> > +struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_v=
i_channel *chan)
> > +{
> > +     struct media_pad *pad;
> > +     struct v4l2_subdev *subdev;
> > +
> > +     pad =3D media_pad_remote_pad_first(&chan->pad);
> > +     if (!pad)
> > +             return NULL;
> > +
> > +     subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     if (!subdev)
> > +             return NULL;
> > +
> > +     return subdev->ops =3D=3D &tegra_csi_ops ? subdev : NULL;
> > +}
>
> I tested your series on a Tegra20 with a parallel camera, so using the
> VIP for parallel input.
>
> The added check on subdev->ops breaks probing the video device:
>
>   tegra-vi 54080000.vi: failed to setup channel controls: -19
>   tegra-vi 54080000.vi: failed to register channel 0 notifier: -19
>
> This is because tegra20_chan_capture_kthread_start() is also calling
> tegra_channel_get_remote_csi_subdev(), but when using VIP subdev->ops
> points to tegra_vip_ops, not tegra_csi_ops.
>

Your assumption is wrong. 'tegra_channel_get_remote_csi_subdev' is
designed to get next device which is expected to be CSI, NOT VIP
(obviously, Tegra210 has no VIP). It seems that VIP implementation did
not take into account that CSI even exists.  -19 errors are due to
tegra_vi_graph_notify_complete not able to get next media device in
the line. Correct approach would be to add similar helper for VIP and
check if next device is VIP. Since I have no devices with VIP support
I could not test this properly. I can add this in next iteration if
you are willing to test.

Best regards,
Svyatoslav R.

> Surely the "csi" infix in the function name here is misleading. At
> quick glance I don't see a good reason for its presence however, as the
> callers are not CSI-specific.
>
> If such quick analysis is correct, instead of this diff we should:
>  * not move the function out of vi.c
>  * rename the function toremove the "_csi" infix
>  * if a check is really needed (see comment above), maybe extend it:
>    return (subdev->ops =3D=3D &tegra_csi_ops ||
>            subdev->ops =3D=3D &tegra_vip_ops) ? subdev : NULL;
>
> Let me know your thoughts.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
