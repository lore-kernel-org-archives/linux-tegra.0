Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9727467E
	for <linux-tegra@vger.kernel.org>; Tue,  9 Dec 2025 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254196; cv=none; b=CCPk0jP7u5nTcngQjBpITes8ZXyJm0oD31ksmAyESLsop3Th5xIUNUydbNuCc6CUbYTyNRWx3X2JFgvFcg7LJpzjPRM1abRVEbq9FD5XGDof0wEc25UXT+XcZIiK+GWY56k2gGsbzBjIru5o7/toKSo8FVDEZni5kupgTQyK+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254196; c=relaxed/simple;
	bh=2t7id9P+w0ywpMUaU13aVj2ha6bSkJLXmXTZ5sMGfQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZYh7hlT3vAMlzD54KVJod+jyGG059u7KF/jGtQWcONZdd0Qu6dbGkWFV/Lt4ZHvdLoqRwbBirTWMfjs5BOpZYi4myoYeVRnQXjnbkt6bikknDzABr8BFxXMkR9mVG4THrmBHWUzegDCwBqVY8n/80gAd6XWLU/DzGIuLJNJUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxCUB9oL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxCUB9oL"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so5806832e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Dec 2025 20:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254192; x=1765858992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xidum6Ax5Dt0//wps6VgEDCvik6XGzu3SF8WxrOIsrk=;
        b=QxCUB9oL22/LUXsmgd1m65lYutPZDfEBGzisEYA8imGoWigri0QeL7qbuqogPwGcij
         wRt5FtbD7bzEXoPSM9Gq1ymHeR6paASy3FXlsVsOmpvyGR35GssiPOeqIIbBA8FlcxwP
         PNyzEBgJVEQzkhGq/atDP1k5eazGQZ8n7jtvl9tG1vlCd11aAjB4LM5t6++5GK3+3bzv
         O+AZUU/8D3IiIItimFdX95VAZ9RjxTzg5navMo51l9t4Nw/MVraPLOT7ttnIFX/jAu2D
         2KkAt+2IVOXvDg97nD5DKSAatY6QY0D0Kd7JxmR/uNJwgeCPcIpGRnmI+m0546H0LkgZ
         TF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254192; x=1765858992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xidum6Ax5Dt0//wps6VgEDCvik6XGzu3SF8WxrOIsrk=;
        b=HF4Whz+sTcbYkNCu/FIAurQYf1n4T/vW70djBtkT8R4iEE2jiS92FHsSPKmoZpAqTm
         e6Eu3ggk1rMLwQTvnEBZcmOFZNGSiyJyYAAjfcPLsbPrHwQ1m9H66qfeXRepEQ2OZb+H
         ZzrK78hEuaqp9tL65mqc4Ez6EzLruVPdn/j5lk+TxxhZha/kSxg2Ud1wac9JKFhUYf5i
         cTDuBX3zJz4TwpsAQtUCeHFZWb+OiVlWPy/JgS2waiAE7ED6wH1lV+d6AQDkjfb4wWW6
         3GXG85w4ggevL8354sLtTRzykJkfjfueN0LELGZeBCD+hf4+ozYNh7cr6AJpL6886TQ1
         365A==
X-Forwarded-Encrypted: i=1; AJvYcCUgtrgn02FO0lo9PAHXW9668p/80g1Gn/yXQQv77l2A60ZgLoa8pqMP0w+11uVO09urCG2eIku8zcd/ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx620LuW42MCPLZXrwW5vpAGH+9A3EgzXye5og5nlOlElrYsGVI
	1tQ49aM5PQaA62T8zYTbcvimNBViHoL6TVTsQ0rZmPSkO0xKUxOx2t9GlCEV5Izlztvjn8vL5UA
	ibHXW4b5rw+f7UpfVwLLqvQ/MXlJ9NB8=
X-Gm-Gg: ASbGncva9S3iesj+8QU29ZUx2+KG7Pk5DknYNjP3g/YvKlsrqfgsFUVY2CqoyoiHViw
	cx5+3H7kLZxfgE+lIVHMFvVnJSjXfSbDeBlhYi6BW6kvRXAAw8g7tfrE0HfeL3zV5Kdz7L1mhY1
	ExEz9JtuVfjxKKfjiSJ4ds/DdvPFN2rJ/PUt3ez5olBUrm0XYI7pLf6gQ8ttBDh3Az34+P/QIay
	pU2CMPZoMCom8tZIRAWeYAXkAAXNrQcvkf8BMCwJNofAaDAIsWe5YhpKDZo213c6nH0840=
X-Google-Smtp-Source: AGHT+IFBCioYeN6sYXPWCKblrghcpnAhZODyEAkggpUZZxCCmgnDzmxZVGfICMVC50kni0lsvTcYWEicDD3bxlITNa4=
X-Received: by 2002:a05:6512:3ca4:b0:592:f115:292d with SMTP id
 2adb3069b0e04-5987e88da5amr3420881e87.6.1765254192213; Mon, 08 Dec 2025
 20:23:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com> <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
In-Reply-To: <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Dec 2025 22:23:01 -0600
X-Gm-Features: AQt7F2pF_-pQQg5fEIgQmcZxfxWQsfQP15gdzBUZUGGjmEBsB58G_YNRaH-Evns
Message-ID: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Jasper Korten <jja2000@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail.com> wr=
ote:
>
> Hi all,
>
> On 11/4/25 19:12, Aaron Kling wrote:
> > On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> >> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> >>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> >>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay w=
rote:
> >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>>
> >>>>> Without the cmu, nvdisplay will display colors that are notably dar=
ker
> >>>>> than intended. The vendor bootloader and the downstream display dri=
ver
> >>>>> enable the cmu and sets a sRGB table. Loading that table here resul=
ts in
> >>>>> the intended colors.
> >>>>>
> >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>> ---
> >>>>>   drivers/gpu/drm/tegra/dc.h  |  13 +++
> >>>>>   drivers/gpu/drm/tegra/sor.c | 206 +++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>>   2 files changed, 219 insertions(+)
> >>>> What does "darker than intended" mean? Who defines the intention? Ho=
w do
> >>>> we know what the intention is? What this patch ultimately seems to b=
e
> >>>> doing is define sRGB to be the default colorspace. Is that always th=
e
> >>>> right default choice? What if people want to specify a different
> >>>> colorspace?
> >>> I reported this issue almost a month ago. See kernel lore [0] and
> >>> freedesktop issue [1]. The pictures in the latter show what nvdisplay
> >>> looks like right now. It's nigh unusably dark. When booted into
> >>> Android with a tv launcher that has a black background, as is default
> >>> for LineageOS, it is really hard to read anything. Is it correct as a
> >>> default? Well, cboot hardcodes this, so... presumably? It would be
> >>> more ideal to expose this and csc to userspace, but I'm not sure if
> >>> drm has a standardized interface for that or if tegra would have to
> >>> make something vendor specific. I think that would be a separate
> >>> change concept compared to setting this default, though.
> >> The reason I'm asking is because I don't recall ever seeing "broken"
> >> colors like you do. So I suspect that this may also be related to what
> >> display is connected, or the mode that we're setting.
> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
> Z1FC 1080p portable monitor and run into the same darker colors. Both
> have in common that they use HDMI which seems to line up with what Aaron
> is reporting. I do not have an eDP display to test or another carrier
> board with a different display out to test.
> >> It could perhaps
> >> also be related to what infoframes we're sending and how these are
> >> supported/interpreted by the attached display.
> >>
> >> All of that is to say that maybe this looks broken on the particular
> >> setup that you have but may works fine on other setups. Changing the
> >> default may fix your setup and break others.
> > Do you have a device set up so you can check? Or does the regression
> > test bench have a display that can be forwarded?
> >
> > My current setup is a rack of units plugged via hdmi to a kvm which is
> > then plugged to a pikvm. I also observed this issue before I had this
> > setup, plugged directly to a 1080p monitor. I have not checked
> > displayport. I can cycle through a couple other displays without this
> > patch to see if I get any other result. I am fairly certain I have
> > consistently seen this issue since I started trying to work with
> > tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
> > allow for a bisect.
> >
> > I am in contact with one other person with a tx2 devkit, who
> > replicated the issue when I asked. Who plans to reply to this thread
> > with setup info later.
>
> For reference, I am said person. I have a Jetson TX2 Devkit that uses
> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> additional patches applied by myself. I have personally noticed the
> issue to at least be present on 6.14.5 and 6.17.4.
>
>
> I'm currently not at home to take screenshots with and without the
> submitted patch, but will be able to do it tomorrownight or friday.

Any further thoughts from the maintainers on this patch? As far as I
know, this is an issue for all users, at the very least on hdmi.

Aaron
