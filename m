Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E732B9A9
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187914; cv=pass; b=nb9xV5prN53jsaPMD64gelj9aQZmpvol39jG5BuTH7Vca6WAvJZauhrJ4zqlA43M4g55t/QaqtAA+Zk5oH4tv3mBpHy2GggpFRzuyRrNTv+G95mrmn+5CqTZ1M4zc8prGyfrqMiYfpb76Tn8lPBH59QhqR9vfD/jfcx8RSeE3y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187914; c=relaxed/simple;
	bh=jE+/jUqv7pNoCfzauPI8lFa2VQ2OKNCvpXHgcRT4LRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2q4ZMzrmxDhHwni0S6czd7nhMBDOCv5vnBi0alEQEu7E4qYYEHRd4etbP7PqKoUkAiOAjRFhYAaqy9uKOf7yGAStIN+EbRLqivG1dpEay8yU795QQERfwDbMuKNDhByaDdVhd7H2qGC6qzN5eiAIQGK4tT/hF+omE5H4s1Cozo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQT7y8zJ; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQT7y8zJ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4233e152457so923497fac.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 14:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187912; cv=none;
        d=google.com; s=arc-20240605;
        b=Wi/9K58V+/R+SARjGxdhTUrdSxyTfKkY0I6KQkyVOiwdMUJTGmHzqd3XxJ5kdCDdsW
         NB+OGE3pRKbZwXxsT85mcaFo13ZdxS5gEh1lkeR1OxEDw1ZkY5Q7ug/IGDKOLK1PDwyv
         LDB/CUK4yDRPViIaNs//f4b8nH9LgegZ2elXsBlkcj1PliNTzfZQHDgs0X12MNwgLuMA
         NPW+/a7OeOZi/XEFC26iitKJpZiSFigqrkEPTFH6sNIHmp799z5OWlPYqWiTOyepUA3s
         08+L95/lkCrLKv7E0glBrXq00eTmbIk5JOuDmLoKJ7d0lmjyWxthNy+SbJPUuhupCd6B
         ws1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        fh=cpv4nNBAXsX/JNLUCw2jEp4C5OK8T3PXQSFoOMdBO8g=;
        b=DyG6l7G7yn0y2mf33WZrTaKDMHUgdsNeDXBx1u9tP1xpM+ASjU++xGRN2yTTGwA5Gj
         UPHnSEZcsKlpFtuIfeSvqwHD8Syy0xsty4pqdfoxjWg0MtW2h7JP9hW/OhnE0xY77hg5
         GtFkPRTchoD64YdqbfuDesd0x1X7KeHyCdtXTxA+XEaVGKiV6mOtGuPf7EjJobLeL+zK
         Co5mdPTXW4NaHZe44quPNp3QFueeGOPHFtWSfZzoIu9aB3iN3xY/f0fm2U1K/CfwSIk1
         YRor8apHsEzrytjfL0IFuK+pPD3m9wA3nZejFcjH0hGuCxOba3Yg+5bbE0TLwm48tIDJ
         sMkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187912; x=1778792712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=UQT7y8zJUNngkSy3gAzw+8rnMY8/4vXj/C4XUhtCXuZKbCwGD1IWospAmNDp/u9H9V
         cSkI/H6ZBC4CzjZu2TDCmDKKSEQPgRdM8rrTSnu4gcJGMNVEYa1+bFqCs6kuPIERcSwa
         AI5AdSSbFFPiTo5Ta0VV2TpmL2PewmKgmzqYVBJvyvSs34Z8C24fdEmKzUX1zT1EIqhf
         xivwaVHal57PDDpLd83JYYT312jJRAWhT5qJAsbEMizoQuSjfDJmBf0IbltnBAGDBuZj
         F7en4wISZsCo8VHYNqRg6vWpT7zaVBcibcye+4tXhU+mKTNrVJEPWfZJooijv/Leu5zy
         bbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187912; x=1778792712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=oMDBLKOnIYTLH0Hh8CySg2VUtdIMVc/rSJgPEGwE2S1pNRs50kxqG+l+S+TsnWxtHS
         1XayWQOFwH7qeyiWuX2dSz/drN1ndPxooD+LkRg5yseni6itlZkPvIJCX81Ga4Zk0dB4
         CJQbbRYnS39wG9TW5y4Fdg1oL8kZmDNkfpDxOw/jbBr0GjCv5YdAWQ+sFRpFrTMqUI5K
         QH1VxMvJoWBtO1ADINVzAk+ImGKEKAVlhff4eNVVyKKd5yJJ+rwUksLeM45wJ3eOeHOl
         dwDSBJbIH6QmZvyIbmStncZaBaMSVb829LjDb2KNUaPVai1EVIxdI46J+7+uQnxUnFYo
         TLvw==
X-Forwarded-Encrypted: i=1; AFNElJ+CJzgRcT4G3vpBnsUS4d6DEVle0FF989Ixpg6Jn2t39TN6OL4QqSAQXTaUk7kLpSOuThWKs0rDXm5ggA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/mKfdCaYOgyJUAKuUGKCtexqJPGGWI438UUr3zr4jeKSYqdt
	vO1kllsXQA10yPNIfs1ojpWayQD1ypYLXj/ktWjrGOzaF5c+wvTfwkWJGM7fP7IKQ8NZ3zpPBhF
	mPEDwcq8pYIe/+4fjnEN94qsRCwsEECY=
X-Gm-Gg: AeBDieskswilOMfHezz3tEbsuLb9vBDo/gM9FvFY3Do7AjeFkdbcObAAIeFBoETFjFU
	2nhCmfdAD/2bhaC3Gc7nRvJtmTfkvBmiFdinXSLyd6EpN7Q8tzrSnSRtKrMhc+mzxgrfmGqeyTD
	deFeRx73nUbt0a6ZmUxncUwMFrL9FaDdXTsTRpiNLSEvpDFY4TIyMemmNmpKvoDRmy0HCXKVUM7
	VF7gu1amiqEU1QwQUyczGqq5ty6IoiH5dqDehvtJ+LSy+KczIyVztKE0Dac+7HgRL5fQK8CVqWx
	YZMyN6A1jkNdRO0J8DIngfzHXE0Ud9pdO30LhQ==
X-Received: by 2002:a05:6870:9120:b0:40a:605b:518a with SMTP id
 586e51a60fabf-434f64f0e2bmr6401085fac.27.1778187911702; Thu, 07 May 2026
 14:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com>
 <20260507022213.29290-2-dennylin0707@gmail.com> <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
In-Reply-To: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 7 May 2026 23:04:51 +0200
X-Gm-Features: AVHnY4Jo1IyTHyb9HmNlTOZ-S9HjOMOViUseCpdHPNPhWjhasIYCpZvP3cqqYK8
Message-ID: <CAPybu_1RvjRQ5ySkJum3AzTX9-bxmNmkcMMK7Q-Q14tZPSQHnQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: Denny Lin <dennylin0707@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denny

On Thu, May 7, 2026 at 6:06=E2=80=AFAM Denny Lin <dennylin0707@gmail.com> w=
rote:
>
> Hi,
>
> The media CI reports a missing Signed-off-by from Ricardo Ribalda,
> but this patch was submitted directly by me and has not been handled
> by any committer yet.
>
> I believe this is a false positive.

It is indeed a false positive. Sorry about that

Regards!
>
> Could you please confirm?
>
> Thanks,
> Hungyu
>
> On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com=
> wrote:
> >
> > tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> > signal an out-of-bounds index. This results in a large unsigned
> > value being returned, which may be interpreted as a valid fourcc.
> >
> > Returning 0 is not a valid fourcc either. This condition should
> > never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> > access and return a valid fallback format instead.
> >
> > Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driv=
er")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index f14cdc7b5211..456134a9e8cf 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_=
vi *vi,
> >  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
> >                                           unsigned int index)
> >  {
> > -       if (index >=3D vi->soc->nformats)
> > -               return -EINVAL;
> > +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> > +               return vi->soc->video_formats[0].fourcc;
> >
> >         return vi->soc->video_formats[index].fourcc;
> >  }
> > --
> > 2.34.1
> >
>


--=20
Ricardo Ribalda
