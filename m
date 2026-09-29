Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D324E430B
	for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702562; cv=pass; b=HPYYXmLTuLbL2JtFpkxiJ6bMflWZeynagYTNGszRgJTgVlrjyz1gb+Cp6WiyoMSw63fc/PFBQjVJ1RT7jbqIzeaAqvVEGj1OJbj/B1ocGaCWm/Lc7OcmWJd2H7njsXvhayE6WY4U9BPA6dzPQ9SGXFsWM02j8P62RAHUYPMa6bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702562; c=relaxed/simple;
	bh=eXyEWE550+ycqkkgf2Pb87Qz+oDiZBp//OZdYRPDZCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVI/EYpuR+RYYJbg/mhss9CNncICRugy/6Y1BmZZo58lGSVUVWZkI1O9zOyHsQD/tpBFkbYGztHVwmxL6E6KbujYwp7OVZCWOSv8PEUPrKlVW0I4E+2X03ua94ZuS6wjL8zGvFc7YiD6spg6hNQiJ1DEsfej6HsdWp0WkDLuWUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON5ZjlVC; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON5ZjlVC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba31af822cso1037061e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702558; cv=none;
        d=google.com; s=arc-20260327;
        b=NbonaDYur2ZSWk74LpHDdJqTceTrvOmEqFqRfmRQRoYDa8yJUv/NLCiax8nQQyg0Xb
         vCa6bmnM6Ey7Mt0kF5hPm6kToXbCbhIHeQQSvXH241FQ0Kazy4f3KhaZRUi1WdVhNAsD
         B/UjT6V7917XD8dL8RXZdwfCKUcVVFYwlcPbEVL1s1b2FfG3mS2I7a6Kbg+tXrfEmZb+
         sqITGGX0X7ORJNK46c1FEMBpTVWvXqJbQHbqOV3rtgTPi4o5ym79hCZ2aa8gwLvXlsqg
         7Z5gkuiLcmpmEi7YHhDPk7yUiqMKsOeZ2MiiKh2XVQKrJ93l0erTOtZLp5HPtYtVlhk6
         twPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        fh=ZeW8YO6zh3BNij1CRQSp3lakdPHbSOKcQxtj30QatH8=;
        b=o3Yg8WsEW6aDIIydF13yMQ3FdKAlnBXJjuA+hJzBBJcqfQqHwIf4k0dv/fdm0NVvtm
         SJ2ZWzbLrHNtKJK/oPZ5d7wMYe7M2L7BmEP8TweW4kSzdH9qjovNR9loqZq0khaVkKXp
         rEjr2M4pf4rGBaD2NImuUyBaUC3EsYRvqeUB4MmFIg+AsncgaWNdOWvOdTOhucH6vYB3
         MLD7amPmNiAqC8te5gmJH/2Kj+hpM9+yimBRc9OKMVryfyiSYBQ8ITR/WCasWtwv9LcG
         ob5CVOR7HUmpIJvBhBTmL4j0xhrIgQ2bN7zaOqozpZhj1bit3j1t4yMGFR1TldAqxxlk
         d+Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790702558; x=1791307358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=ON5ZjlVCqB/TYA5/JG+HIffUcoeWHrUc2YnR4RgoPO6MuTy4TVUSzDWTA8NW4GRVbl
         nygA/N/lNdMooKu58birVRuuHjv/jD9/SPXvlWO+7UtXhImZzyvHwy+EJPKFUiRsVRSB
         JLHTFE4v5Am8GIq0NyugClwC10zo2hQ6+1lPwpGIoqlbOD0k4KdQHogxTBHGk2fBRGzV
         uztfTA53KoFVgec9MCIRtY2KsluAdRAbUVgvc5evHqe2NQZ5+mZdnD/Uu0Lz+HdW9wmy
         fX4Z62p8IhCk+Ssh/y4zZcujA4e6Uw2u9D6PK0Z0479jvsVv2m1NIinONx4GrcxZTPnu
         IqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702558; x=1791307358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=C61/tXqkizTVEtPpD3x/IElfdnM50xkjE2Im80wVcT6O57rHD4F+LYNH2e+mtdcAYW
         O2HtmIHQtTfXOHEnQNKe3DzIftu6Sfir/vSIP2rHF+/+SKkqmNegp4AUI2NgLHW5/KUt
         mZLvYl9xJ0o2gC8JN1uGE8wcTOvCHLCoFHjYN4WP9QuYWFrA7sMKP18MixhBOOtTJqCI
         DTW5A6oeX9bQ3tBms1RmeO19CjO5qhf/UMsqMgT+NcIlLm4h8LqCMRE76P9dR6AI3OEi
         rv+3n4oNlT5WGsEWEJE/yxhiOLfcSDGZL9ILbMVnGnCT4mnTjLMElM4BW/2itkF6dDmM
         IirQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2xKoExyda8nF0OU23fMmt/1jwRQhsc+u8bS4YSxnW6vqSq/Exi3hBFKHXZ1GyMNutS6RGBY3mq+7yvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI64yL21MGIZsWYZ96jZFx4bwQACLOEmASoHWlcG5DzQzPSGGki
	y6hHAKo/u5ntZ8+AyFuHF4YlfAeEUaUEV8c+3dDJ8av6xjAENLfhP1TU9pZGAuYjfD8HTV0Y0qo
	UobArxe2BlGLRACM0EklUmEaJO7Z2hxM=
X-Gm-Gg: AYBFou2M5bxx7gyK+I3SC0SoTY7gWJXXLqomzbEmMxgFPG/IK9VvF0FPX+JFzwhrkz0
	jM5VY4GH11nDIn4ubhkCVNjLWxRtOXXXkTWcAzu4RbfVYmoATR3q5/HtszLZ9bvW+hfhcrAnN5H
	6TP50yIc9B1FFCvra1rd2yIyDKWj/1GvXSMbufpagels4VuNn798rWmo2O3cwy1RsYdulyW84cm
	RTq55QcQ1KUUsEI/4+uiy+2w4/nTKIbZZW2NdSm4XZ3Edavz/a/yIrkqTGzFQY1xTMxpR+L25Q4
	gloBK2EXnQXUjcci/AKXUpvsnDHip8+SgzMuG1t20SbbKpfZDVAiNK3QZ78CrNYnjI0dXndTwyp
	aMn94HFV3h5VddWoYWWM0bSxV/8DU1C6P1rTvIz4cvjMO
X-Received: by 2002:a05:6512:2348:b0:5b8:edb8:fa41 with SMTP id
 2adb3069b0e04-5ba3beca9cbmr77162e87.46.1790702557344; Tue, 29 Sep 2026
 10:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-tegra194-hda-sdo-v1-1-f7a636a07a58@gmail.com> <aruc3qx7izFQYOhC@orome>
In-Reply-To: <aruc3qx7izFQYOhC@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 29 Sep 2026 12:22:25 -0500
X-Gm-Features: AclHuK9LkfgEQsoTN_f-0RfKykcFSMYOYJZq1Uw5H4JV_On6s3wU6oygXAoVMzw
Message-ID: <CALHNRZ8RLs6mXkYiZ4qRimmf4WzpWpnJ9racWTPH__Op2Nk8kg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:12=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 02:24:19AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This workaround was originally added for Tegra194, but no longer gets
> > applied for it. Commit 615d43540043 ("ALSA: hda/tegra: fix tegra-hda on
> > tegra30 soc") changed the guard to tegra30-hda, which worked because al=
l
> > affected archs had the fallback compatible. However, commit 7f0ea5acfc1=
9
> > ("arm64: tegra: Use correct compatible string for Tegra194 HDA") remove=
d
> > the fallback compatible for Tegra194, causing this to break.
> >
> > Fixes: 7f0ea5acfc19 ("arm64: tegra: Use correct compatible string for T=
egra194 HDA")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
> > ---
> >  sound/hda/controllers/tegra.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Maybe we should move this out of of_device_is_compatible() conditionals
> and into hda_tegra_soc instead. That would make the checks for this a
> lot more consistent and robust.

I received a notification from Takashi Iwai that this has already been
picked up, but it was only sent to me and not the list. Not sure why.
But looking at -next, it's already there. Not sure if you would want
to have that pulled back for updates or do followups later.

Aaron
