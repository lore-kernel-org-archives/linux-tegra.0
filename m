Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B93290B1
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125771; cv=pass; b=h7XbA0wWkMeIJWP+C8agOsHd0Rg5+Djhrr8PsQejhmwd6VTdKWKc1B4bb6Lh3dBkFfBqRDApGlj+Sdfje+YbFjisLsmEdRPVZObATt7V5HSVbZN4TqJEAvwYjxFRklXSzN1pK/8VCYcW9+C0WQ3ZAkWmtnR53gva3mSGMjKSUoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125771; c=relaxed/simple;
	bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzjHUYV8tcYvt6nxRIbvQrAXNTjkNmQ3RI+PDE7rEFeWzbvWUvoQPIQRdU7W84BBGeCnyRizD9qtgQcQAUQvcQrq4eN9GGMNabcLiETTmndA2j7Mr/VtU/fQUyNgA2qL2w1Blsq0wFtGFA4bimOPLDxytwlWdjJWgqnuFuwlTvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/teeb/D; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/teeb/D"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4398f8e2837so938388f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 09:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125769; cv=none;
        d=google.com; s=arc-20240605;
        b=Br3UiEhYSEnM3zL5nyJ3JG8Qn3StBhwkOj1bghoG+Kq2FKs5eLo7TZoFz99Zrfop9B
         8/52OBSRK90TSDTwLt/jVH0fh2Zc6fvhjY1ujIOnL/+wiDkeyd4mPfbNyhZLibwRe9+r
         vtsbaDggwJ30qWZ1MxNIZeUgPMwSwlV7S8mOtskdijDv/xVC0gFdaQ+NJVbJM3hOHXyC
         2aHW64gegnG4wO5Q1viqbJqn6VVk2q98zVvMcq1iImxoDXaVn0CHaombvF4D9eqphxgc
         1cp4j3kkGR+H6KyZp9Hdbv1YvKW1dKhgDfpKTY+EN+U8jHEJDB2I7JfEcZgr62W+Hc5U
         E5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        fh=CmfVQMyq3dOJRJKjJG3uNFFAn8sEBB4dv9FJ3I0ODfk=;
        b=IVqu+doJzpay6j5T9pZofKpur1a/hWgnTS2iIZ3NwUrwIK6l2j3ptwUpI7iRlPq3lZ
         pWp6DuHvjsU81y4iV3ULmQOceIDpEgWo8m2gfpx+3xGhdisB8aQw392POzcmwpCLr70O
         4sQgFwa0jN2sr/wgQ6rkcYX9XsoqcAAhd9iRfh6ylbGYNPJDIOPvINEGVOZ5nckaJ6T8
         XNp4RcOlCiQgA+bE+I6syvSpOLamdNOzsRbX9P+s6gg5LsysmA0n2ysJXFHgTC70PrzX
         Ke49+WX949K9owbx498y1RZKfOzboheqeb3hXcjgjHKT6NRK5uxUlnXRnK7UbrY5liiP
         RDKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772125769; x=1772730569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=X/teeb/DlbVa88TzVFhrMMbwiTpnNTX//6csemlmiSvVJorHWiL5x2e3zVI9e1qtuK
         eWd/hyf59lqjaODiSnXycAed2m/8+LANoKbOWDUVbHB5OxszzOs43kan9k/BCjRU3SR5
         +KPVIokUCBhCeDhO2v7HUhof9r4h9+TgeiDDzSTB0T7F74iWg+oZJgcSfbkWMAxb6s+X
         sX8LFxUeIHDKBuG3QjdFZz5wz0+cUwln/WZFQWx0Wf+/asGN5aL0onLi/tga8L4MLjlo
         ZGk8r78ym6MXeVH72ZmI9hdmArRff5ry7kiE2IAR7Gh8/y9HEWaWYyhLCwL+r46MZPRH
         yi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125769; x=1772730569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=mnv0TlzWMpHUNp4UlBeTdssr3FV3ZzzW9fxyKsh/XGgmaXfnpS2HQ28u8toGZz/F0V
         MpmU4ECV6zK9EqeR5EeQHgviVCuaQ8418P0+Lzy6o/2A9d/TWqDg3vt1FbF7YD/lvKWO
         mjNp3pXdzbxiiwnL+cZPBKM0HR3eF6NYtVRarYGIc6zx74RiNxv9JH04QPvFqja34bFu
         hTXi70+fmwiNQBY+0vEUwwLE9EV8qnD0TnVebKcsQZljxWgAx+kbdAFo20YsC2V6M7nP
         gzJEFgGD/g196YUrAS+JdgqdOEn1rA7ZKvdnSjR/hiZQBbsDpwsTAzAX4J7FUEYohKY2
         JkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdjTKqyLfEjLYFISBeCwWfoYJcfb8m8xfRwcQoF0cTAZRF2oaSjCe1o+EZBS0a8s+rddeymkFmjrV4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uGZhcIHrquZAuSa1uc1uNGWpvzlRmhd+0+/E4RB5QPhWqpM2
	faR4GWES0KlK4bCYmAwnLHJeTg9zBuiR2DlB34OBrsEIl73hqfjfI0zyicOMiduJ8e1laYUat+5
	ilJjfTY6G1sJge2ETSA/nDRAGPhvhScU=
X-Gm-Gg: ATEYQzyzicdbS8mr6bQYjww5ytevba+58yOv53tBSZYd3w+BYqWGNhmgKWG7FEpR8IJ
	Z7q0Bmu6yVJU/I3R2naYq1ry8iGRi4D/jFtK9N+XSFpU349IXPrtYVGH1Qoda4WVBa3whvlHd7u
	uaRcRK7ldkTes9+LOz2mxnPHmT6nNsnJYQzqF5Y/wN1JtxgQojWABZfmLzfkDtSe3AarHexzrX/
	zsOjJQScOBw+salL8jTUqE3ximoqmhwO7I+j2b6CQfKaJgVJDzjh11GN/+h/2sRksKPKIVxv1y/
	/k51g9OL7y8l3JsNRqU=
X-Received: by 2002:a05:6000:250a:b0:431:c73:48a8 with SMTP id
 ffacd0b85a97d-4396f17b061mr36791168f8f.29.1772125768766; Thu, 26 Feb 2026
 09:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
In-Reply-To: <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Feb 2026 19:09:17 +0200
X-Gm-Features: AaiRm532NOiD6_qJCcwIyPfsUO4-fF-YWthyRveATlcMfJkzAmg60rnRqSw5Slk
Message-ID: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > Convert existing MIPI code to use operation function pointers, a necess=
ary
> > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> > that is SoC-independent remains in mipi.c, while all SoC-specific code =
is
> > moved to tegra114-mipi.c (The naming matches the first SoC generation w=
ith
> > a dedicated calibration block). Shared structures and function calls ar=
e
> > placed into tegra-mipi-cal.h.
> >
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paralle=
l camera
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> I wanted to test this series on top of v7.0-rc1, but applying this patch
> fails (with b4 shazam). Can you rebase and send a new iteration?
>

kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
