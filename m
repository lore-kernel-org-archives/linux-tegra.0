Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A2258CE9;
	Thu,  3 Jul 2025 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562714; cv=none; b=HAh4Qz/BhzCnDpCDDVC2CkIAbXRh2RWpGL5UBpqdSJy9LQjxE54f3tT6YTx0zyLE43i/siJ8TKsr6EhFUliLgeLyZIw06Xpz+yemyUGho/n1P90vUKMrcnUVgmtFq7ZMsPyfP7n92dwkru0WRyrAn00PFMBCBUB1y8iYchY4Asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562714; c=relaxed/simple;
	bh=DeRiQLwC9hH0Pfe7J+UzbD/J/UCdYASssdvcJZ0DNgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXPXXgFf0ezwmXaiDd5IsH/0d4ov9Q91PXM/UIgHMHnuMM9pEawgn2pWqdmz5xEnqnKLI0mLEv/c8YSZkGmWQ3ZZBpasF15C6PaXatupJcKMGawtDxpkWT2loutnd07VRPMp//1qmIjywqkHjHe09Y0Ojnu5BEvRFcY4/nUBnfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJhGOhel; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJhGOhel"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b7123edb9so1620011fa.2;
        Thu, 03 Jul 2025 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751562711; x=1752167511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeRiQLwC9hH0Pfe7J+UzbD/J/UCdYASssdvcJZ0DNgo=;
        b=WJhGOheljX718ex+hW+rKJ2TGKgGW4YH6oS1AFEQkQU8rBsAMarRZPQqP3Cj8gxfFW
         sZag/ARHloKFcgO9ftR0C4XWjRFHsgHXB/WLuXNnnN8vtAyKEzjMRmhujGf6krxS3JOV
         +pDZl1p+c918tu8h6UmJUUtagBF3GsOQtpDPgKy5iNDBI2P/hTsmQqdISDMp0+DZptur
         utvRVVp83bJEs5psCnHoLbZEwJrdxx7tVrQJ/xNbdj5u5roPNbS08Z2pw23J0mks3KZ+
         iFz1phw6xp5HHJPzbJWyh8tvl/BoTa1MNQhONsI9IbAXD8rqGiXTFMffpxvmMOGTdHvi
         8dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751562711; x=1752167511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeRiQLwC9hH0Pfe7J+UzbD/J/UCdYASssdvcJZ0DNgo=;
        b=M02/FbKhh6atAK7J0IXVdMZtdO26wzGUR7Ph9fsgnz9izD0KYIIbeP/Imz44+7jRqK
         b+bV2lZxojxLMu0OmqLQDJwW/iUzO3zZFuNszjaEGCdXP6i/QnxgdGUWhebHuyyL2Z8B
         LUIk22rAVFkfXvrQMM2j+rqU2sE4+WpL2Z+xFtOkAdLmwVnWZPiHzQ3xxu5vhVqk7Az6
         hsGP2ozfPUcnMX/qBLPYYEpTrZFNNCTnvGW9V/v2VmIBoZcrAlkfMHhkdTakdnG2hcZO
         E3zynSsFQifKHhFYp8QEQFoRBq1Gg1FdGIZ1ELvvjnE7IJpA5hKkqbcI45YgHmNtkwbY
         YYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtwxJRBL9hbZ2+7NbhyHcuN+vQx46sQ9L38JQAPB/p1XpbRw59rVVXkuOfwSGcfrxHTUocMigTxxI@vger.kernel.org, AJvYcCW6z3Fpj2zaXzyj1wONLr+xT4CNFUg96OCg9u4tH0dEx/rvzbT55GIcxfyMdBpz70hjWCEIHOItUo5mKyx4@vger.kernel.org, AJvYcCX0c37eBGOl3m2Npl507FFn7uH5dR8VBWbEkaERXoJufO6YKzSwYh11/h6F6vBeKqCPIfz6igaL5aKL2uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAmZdRs8wJjGewZ5js05yCEaHm9MIXdCwCKc2YZazfhQyaH7wV
	SBV45VdCQjQ0eudec3RzzHarsL6SUe9WN+LM6o3QNb9MTkOGv7pvhF8UtrTKsalYpb92uYnN4e5
	E07LV0gvwU4+JOo0tEmonB61EUtxY0iyWjH1dKao=
X-Gm-Gg: ASbGncs6L9n4duqxpRnkVm6zUIeKO6YRYrec8gflXjTwXEpBMMUYdSc3l1uqNxZstrz
	vDhix4J8F4EaKQ+uF4AGxJoatTKpOqypnVpzbe1iu7mT63n8L4Bz7Uxj+WkXGCMnNaFjZQo+0hC
	uNgaieEXUKCw6QtGnaitppG0sYF2rwJGBTc+e9JCEPGQR/9ipHV6895g==
X-Google-Smtp-Source: AGHT+IHzT/p4DiBJb6XLRm5GxvH8m3/DrtVnGHCJcHCaOHiRp1mpq4WBT1jqf282ObG+eHZ2Yva13pFwEf05n9PaElc=
X-Received: by 2002:a2e:a16d:0:b0:32b:47be:e1a5 with SMTP id
 38308e7fff4ca-32e0d0eb860mr14808471fa.39.1751562710873; Thu, 03 Jul 2025
 10:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
 <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org> <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
 <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy>
 <CALHNRZ-r_U+ByS0FWxamv9ozzjBWdkqAh2wJOt3s3cMsX6K_kQ@mail.gmail.com>
 <CALHNRZ8qyu6wsTTnmRWtNgYL4XWR8G7TFammqTFPfHH5d==LbA@mail.gmail.com> <paksdvlwrbmdo7wg5cuzdazi4epu3oukxdavkkzoje2gw7aeuy@grsls7hp4khb>
In-Reply-To: <paksdvlwrbmdo7wg5cuzdazi4epu3oukxdavkkzoje2gw7aeuy@grsls7hp4khb>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 3 Jul 2025 12:11:39 -0500
X-Gm-Features: Ac12FXy5QPP-Xi4wccNZ2mSLhMc03q_19NJIZjoxMWPzosT8-mMWWJyImNgN1KU
Message-ID: <CALHNRZ8fOe_tQvybemvBa4yjS7JyXpAA1ksP_Dmx_9w=KXb2ig@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC Tables
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 5:37=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Jun 30, 2025 at 02:26:06PM -0500, Aaron Kling wrote:
> > On Wed, May 28, 2025 at 12:41=E2=80=AFPM Aaron Kling <webgeek1234@gmail=
.com> wrote:
> > >
> > > On Thu, May 8, 2025 at 7:48=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > On Thu, May 08, 2025 at 07:27:52AM -0500, Aaron Kling wrote:
> > > > [...]
> > > > > The devices I'm talking about are not yet end of life, so it is
> > > > > physically possible for them to get a bootloader update to confor=
m to
> > > > > the existing mainline model. But I'm just one guy trying to do 3r=
d
> > > > > party support for these devices, I can't affect what Nvidia does =
with
> > > > > the signed bootloader on these devices. I'd love to be able to sw=
ap
> > > > > out an open source bootloader on these, but the secure boot setup
> > > > > prevents that.
> > > >
> > > > I've reached out to our Android team internally to see if there's
> > > > anything we can realistically do about this.
> > > >
> > > > Thierry
> > >
> > > Thierry, has there been any feedback about this?
> > >
> >
> > Reminder about this question. Has there been any response from the
> > Nvidia Android team? Or do I/we need to continue pursuing independent
> > solutions?
>
> There's been no decision either way, but it's fairly complicated because
> the changes involved here are fairly large, even if the impact should be
> fairly low.
>
> If all else fails, do we have other alternatives? I suspect that adding
> some sort of shim that runs prior to the kernel won't work because the
> EMC tables just aren't accessible from the bootloader anymore. Would it
> entail parsing the entirety of the DT EMC tables and transcribing them
> into some memory and pass that to the kernel?

I see three options in general

1) Change the bootloader to conform with existing mainline standards
2) Merge support for the existing bootloader method to mainline
3) Have a chainloaded bootloader / shim that converts the tables

I submitted this series because I was trying to avoid 3. On most
devices, I don't need u-boot and I'm trying to avoid it. Due to
another issue on p2571 (nvtboot ignores the bootloader dtb when the
cvm board id is 2530 and uses the kernel dtb, making it to where I
can't replace the kernel dtb like I can everywhere else), I will
likely have to use u-boot. But for p2897, p3425, and the devkits I can
still avoid it.

If 1 fails and 3 is undesirable, then 2 is the only option I see.
Which based on responses seems pretty unlikely too. If u-boot becomes
the only option, I should be able to write something to read the dt
tables and write out a reserved memory region. I just want to exhaust
every other possibility before adding that complexity to the boot
flow.

Aaron
