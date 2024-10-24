Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055D175D53
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750627; cv=none; b=fQ1YHhRCjm+Zm7NBIv0dI0LqB9/7LPtPwqsOF8zPeKGRwOXgDLRuI0tsie1oMiSu6DEt/O6GrcDrGqQQke1odPF5fp8VPXeli18bKzzdg0GJ1jNg0C2JHas9bF7MOUoU5xb5NZGQN8G55BKHmZXBy0Rg7nkKkvuxBS5fMKsAwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750627; c=relaxed/simple;
	bh=beUOJwjq59gvjOg+j0hyEZL5iyRhWmXytQywp1xo9Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeG12nzlljxHLpSJNCBzBH1CqSbtvbesWt36tSUPFuc832mP+s/JfxDduX9kX9DLhrAXEQTcUmvZD/4EnnLLk9OPQi9cQ7s9W/O4V1Rt2nSxGp28bXzjD3/1MeKR90CR2qDJnqoHsZl9VMm0+maTVBIA0cQBd7g17/QwGZHwS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IzXwnNNb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IzXwnNNb"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso313179a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750625; x=1730355425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
        b=IzXwnNNbyYwfHPTThI9keQNoqa8QunTpsUXmMewdCGxXs2SQR9WIZAN6pivUMv2KC/
         shlBnZx+AwEzUuQds2aDvEutsuj7kUu1Pw+4czYOSuf/XpWxdBnppN168cRVC6+FEVXy
         05AVveqo3luTH64PPSlNNGdeKBCsLOAlKi19T+4AocTI8i48j8gfcCUX82lDP44U64GG
         jKFY4g0RmtFQyMENfq/MNpaV/trEhj9uyMVf/lyPLoKqiKNNbrqjWCwaoh2lGFtLiT0y
         wNytoGJUtHggVnsh8E4m4UhmpLMFV1FYgGs5VVaJMs0UJkixNQI1UpzBuveVJ4drFIQi
         C0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750625; x=1730355425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kDqeaAprBXUkM4Fq1Ym36ZhnawEXTDWt16M3cGZQYI=;
        b=YZAeY67gIkkY1EzDIwElv7ciOG7PFtC1Qs+gYdXjJYDWTZjpLUPqQu/y8KYB5tPIpv
         kiEPuEb+hxfkVr31/LiGcsHIdvlfz+WtACmtBXgAGs4/kwwCuIWa2s7G4XBE7a0NnrEq
         7jgvxg8c7NBJ2iAUbKVSKcH986OUqElSRANdyHhAQWKcmu7fyTOKe0Iz1SWDuY7cdrSB
         /jDYIVo1WG2qlGEk+e1t8CA7O8ok00txxJ3UHgu7x4GPdOUInBiiqJRwaa1XaYoy2CRJ
         PFeVppwHTgtKTaV+ND3jO/FOc2sd3WnHHhJSS5QY1KC4J2UdIxjVJn1P3d4SoSSIdRIf
         C/rg==
X-Forwarded-Encrypted: i=1; AJvYcCUl/8ya40ibBpNzO2d/FXzPsaUl7i/sWi93IULX2ExYATR0RDlwBgFemTnaJ/aTPJ8JUCcT6zsoS+1DJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGnI4jNGeJJycgmzcUCpUWp3dGAK6NhTr0oehzhnf1YiFBeMo
	Hm0M0UQjlsDHx3Sm0FZK1uTZacDgwk5K5Yyv4L7xiHw/cocOz9Em9PC0rTEyFjUxHxRpjMOnxjR
	D/wu3/wrOkUKNhFFSlTrwnoyteh9cTMGB77It
X-Google-Smtp-Source: AGHT+IFcCYtp7nVgkoJ5rzaztD8OtipNso126UyODrDbPTgNIyDaB+s9edBYS51aMEHDl37/TiPH24OOcDTayFV74a4=
X-Received: by 2002:a05:6a20:5da3:b0:1d9:83cc:ef90 with SMTP id
 adf61e73a8af0-1d983ccefdamr1940597637.8.1729750624651; Wed, 23 Oct 2024
 23:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com> <20241024061347.1771063-4-saravanak@google.com>
In-Reply-To: <20241024061347.1771063-4-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 23:16:26 -0700
Message-ID: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

Can you fix up the commit subject prefix to "driver core: fw_devlink:"
please? Don't want to send v2 just for that.

-Saravana

On Wed, Oct 23, 2024 at 11:14=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
>
> It would make it easier to debugs issues similar to the ones
> reported[1][2] recently where some devices didn't have the fwnode set.
>
> [1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
> [2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index a4c853411a6b..3b13fed1c3e3 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device =
*con,
>                 }
>
>                 if (con !=3D sup_dev && !device_link_add(con, sup_dev, fl=
ags)) {
> -                       dev_err(con, "Failed to create device link (0x%x)=
 with %s\n",
> -                               flags, dev_name(sup_dev));
> +                       dev_err(con, "Failed to create device link (0x%x)=
 with supplier %s for %pfwf\n",
> +                               flags, dev_name(sup_dev), link->consumer)=
;
>                         ret =3D -EINVAL;
>                 }
>
> --
> 2.47.0.105.g07ac214952-goog
>
