Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464323DB659
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334561; cv=pass; b=MsUUtLGRt0OtOdACJmvbBTb/DrdVFgWC3MO3iMsGqVnF1VIGmigae5uJFVqQL0WbDa+MOlj+IbJFoM7OpZK8TYIwxQp5i+r3QO47OojOTGTbxuE7Ig031SpRpRJHOBkbbwF57doDNkPL7kTc+VYOA/JN7W3p66DbYY9cgAJ1hHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334561; c=relaxed/simple;
	bh=pfBvUOdS3L0k+70ikBYfESRf7kE/vFfSaz/vCBw39yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMUQf2jBbibcTUTwhaBWu1nFtjkPMLHxNouqGtjZHy2k4u/s7nMIKFMW5OhSJigj9izwj/9gTdSfZXoqeADbmYBm1wUT9IwpykhijfNK//vZx42fJDXna4Dcw1TCp58GFH3vTTur9yjDb2IhuMWrG7s7YrPl6nOXXS520GSf5co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWNUX6kc; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWNUX6kc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-668d9dba217so1786862a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 23:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774334550; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5sSXO0eWH91mMSabuNxYCT0e8x3Mg5Xmt5B2T/7pSxa/uRB93XYKe6z5zsJ2+m3H/
         oU5tcjLD12HlaA8oxJQWXMTnGHonHadaxDd1J8aBEif/3Gv5I5bDbXtbSGZTE++OiTPQ
         eNR0rmDoWW8l54UGn+6zAX8819QMweHfLnwZ2O+08rv3z3EKg1aTAdOWIlzbQKcvXdsE
         svZjPMrc5ZlNiosw+JNqG3pW41A1LspGET+lVN5rgHhwF526OwRkfQbN0G8mbR1d/lH9
         4b4+NCr5LFFl6N3h1cBzCzLPKWhfupZiBX8arQjpht6Tk6t1pfrVHmyo8p2G3lTQrDz+
         FS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        fh=7U3NCUeGWcPipzRxW7hoOHYgW+4mUJzEDqqYq3PYprY=;
        b=BIrCArTmBCSOABmB9bekj/50Pi9S01CU75O77FRn/WrbH+OAdDl3wmWlG3BEqv0PU1
         wDOPQn3fepfQ9jRPwenuuHJwEbMumNmU2htKxH8l/SbB5bAFFDcITMfGRajqxLB5rAjc
         SMbR21FNc8W3Cp/Qb1jgA4PEk7z23gd2ZI+0ixvGPN3szhzMILXjESU3U1OCl7BG2Do/
         DfZv/Bmxer9C2W01G4/anr2vqeNIi2AmeklWOEHcFAXoY2Tv8IYf/anEtd6sOmXegsvq
         YkkZHIR1azjpY/NXhHSUg1OKLN5VkbuWSdFkmj1x7lTplxmUD+ACCKix36uvChAfvH9X
         wX+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334550; x=1774939350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        b=BWNUX6kcF6gd9RYxmcpaaNevmHMw2ZXOlV4In9kM9Bok9gMX5xWZUVvX1mygOfvERK
         LUu6afP2QRW6yIfEUdI5QykIXyZcYy2ZVmtZpoU09YgaCvcV1E9ukm85fKrw/Q/5kBb8
         V4N9kGr0KupTjQThGULzXAzzUvpA/AmFGj9jDwxRvquPEOIjiGJEsBvnF6rFZLP5SwB5
         frzUEVRV8KlU2hEjlSRyDKGTWVW0UdTiDrAF/xglIDY/MgugG7SpN7W61TfpyFvE50hv
         Q08tSiAmHT36VVsaGsNRLB2zBKpyAWqgUSpSrVkB8gw+2+acT0fuhbTIo1ePcrJIhp95
         EiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334550; x=1774939350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        b=ZwSacBjRp3CyN1hSH0LePYAd8jhNc+68Wazg7keixcN/kiJbUzrt8S+5MfTzWt5S/X
         xu/hv/Ymab8ORZliGuNJIyKVNCIR83BlUzYQ6nq5e2mliDMA7kSTFYal2OD8TcZh2zQE
         gjH+tqcsyEbDAzAvFZ6/5nGw7Jrh/vB2yb+HfGYo4azpwALTTo4kZZf1NeNzoGkfmRTZ
         bbTUk6h3/Fy/gVejUxmNCn12u43B3REUHtGpFrdyXpu9BE8s4jk54j352INClFffktDm
         yhdC2qHsk4z3ypI5uBbwIsmgS1ZdHU18SbCZXQ6z7gcP1xtzf1Rc/yCFGME8J7NiKSJT
         v0nQ==
X-Gm-Message-State: AOJu0YyJsmbS2hbLTLYM4Rqcclfx9MMBn5ZFrpLyHXhrocTuXnNSwflU
	CmG2pGogRJVy+Tei0FA/TCWA1rtlGdZLev7sfWRWm9v15bBS1GIuM8MviI7WCgVDMT0rjjOgRKj
	H5Dded0qCzO6Q9+l7uedEFg7ANYbTSCTZTw==
X-Gm-Gg: ATEYQzy0dphMudLAIHzAgX8JsUwlPAnixh+DnrHICYdTy4LMYD0qEJZB7Ntrhy/ZQa2
	dSmiaH9QJMt1i6VkUamlNeW25g3ORyEP/3PGmCIdOy5Ne3XDen1sVwH+vnIvhyZ4JjxKMUI7eDj
	yzWxAF3exA3CzkMrNUtwziT8lHNUpbdyUS5SMHMb/Vn3IVk8JF1OYUmv77scB0KEo4CsQK9MGF/
	v/L80yAI7eV6ZixAU/3HzIObgHxzearbAbiWHBxYzry6e+0d51ZyCq+nhF3Ymvj9mDJAbQCG6zR
	vjm5nKWEhmGiVDU5zFtdik5WLAOhCF7owWdknNVQW3mcbO56VnFJ3Jrib2MlH/7QmektacykdLu
	5FI+YXw==
X-Received: by 2002:a17:907:2d0f:b0:b98:549d:8376 with SMTP id
 a640c23a62f3a-b9854acccd7mr671723066b.17.1774334549994; Mon, 23 Mar 2026
 23:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324015722.12507-1-rosenp@gmail.com> <2776817.iZASKD2KPV@senjougahara>
In-Reply-To: <2776817.iZASKD2KPV@senjougahara>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Mar 2026 23:42:18 -0700
X-Gm-Features: AQROBzB_fGTtplSzK9mI89qLMudwBTlbTpWq_K5dPKKnRhiin1Ti1gHDWVHCj9M
Message-ID: <CAKxU2N9E-9HLCJfGYD_r+qaW03fLz9NVW=RWuPvotCbSxv3ueA@mail.gmail.com>
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:01=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
>
> On Tuesday, March 24, 2026 10:57=E2=80=AFAM Rosen Penev wrote:
> > For this driver specifically, there's no arch specific stuff needed.
> >
> > Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
> > CLK_TEGRA_BPMP also depends on TEGRA_BPMP.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: also build the tegra clk stuff.
> >  drivers/clk/Makefile           | 2 +-
> >  drivers/firmware/tegra/Kconfig | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 760d9643705f..334d5c522394 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)          +=3D stm32/
> >  obj-y                                        +=3D starfive/
> >  obj-$(CONFIG_ARCH_SUNXI)             +=3D sunxi/
> >  obj-y                                        +=3D sunxi-ng/
> > -obj-$(CONFIG_ARCH_TEGRA)             +=3D tegra/
> > +obj-y                                        +=3D tegra/
>
> clk/tegra/Makefile doesn't separately check for ARCH_TEGRA, so this will =
cause
> much of it to get built on non-Tegra platforms as well.
Sure. It builds fine.
>
> Cheers,
> Mikko
>
> >  obj-y                                        +=3D tenstorrent/
> >  obj-$(CONFIG_ARCH_THEAD)             +=3D thead/
> >  obj-y                                        +=3D ti/
> > diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kc=
onfig
> > index 91f2320c0d0f..ae21f460807d 100644
> > --- a/drivers/firmware/tegra/Kconfig
> > +++ b/drivers/firmware/tegra/Kconfig
> > @@ -3,7 +3,7 @@ menu "Tegra firmware driver"
> >
> >  config TEGRA_IVC
> >       bool "Tegra IVC protocol" if COMPILE_TEST
> > -     depends on ARCH_TEGRA
> > +     depends on ARCH_TEGRA || COMPILE_TEST
> >       help
> >         IVC (Inter-VM Communication) protocol is part of the IPC
> >         (Inter Processor Communication) framework on Tegra. It maintain=
s
> the
> > @@ -13,7 +13,7 @@ config TEGRA_IVC
> >
> >  config TEGRA_BPMP
> >       bool "Tegra BPMP driver"
> > -     depends on ARCH_TEGRA && TEGRA_HSP_MBOX
> > +     depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
> >       depends on !CPU_BIG_ENDIAN
> >       select TEGRA_IVC
> >       help
> > --
> > 2.53.0
>
>
>
>
