Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0CE44F57B
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978362; cv=pass; b=i47aTo37haxE/uxH4762HCJ1C1JO20kXcmeMzGMMQA9YNgscbdHWb7f8X/YSfM+KP274B2FFNmRa6vFk8Xl67VAntnNpUYLfZwOGVKZzK4TRgoZ4Hqde9SFPrXHoPlJIe+qJSGv0PRlDOdYvZ4ct6q2blJkWiTyrdJO0e4K1WBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978362; c=relaxed/simple;
	bh=4zQQq5eKKjqi9TjSvjMNrXcJkXocK5JzF/OCYT9LqTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCKQgcABt/D7r0h2T0n+kRrjffjwYNjtkNOE72n3N/KVW/g7KwfuJ+IX6xeffjjjkxqOC2G0ApqqTMu9SCxeFqmMsiPRXhjFMyfBCtk3e33YC1L6aOPmL+xtLX7NH4CQ2YKTIfJAfd0LAdCbaVHf+Q0a3BSmURuSYzo+i3UXgy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCkG9CFw; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCkG9CFw"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4aae3147so1751643d50.1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 01:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978360; cv=none;
        d=google.com; s=arc-20260327;
        b=a/FydjjCxo5tcm6BAl6ndma6CbHQCMIEeuWo5HZ4o7fSThPwzoymSz8KKsrNrCMhrG
         hrCiLOMhIDWf/lWRpjBNVI19X6s2L/yjg2PopKgBXtFDAbXRqRsQ66Mdacgvx7JQO1zg
         vBRC+cm+Nn8PeVjyEH0qA+oa8evAuNUTeO1CFvA/GkeNid0r3zrJ7Ab79Hikl7wkbx/u
         Sy5pL3+G7DXM1/eXLtlghpnTX5WrNtbQxlhu6XJZOPWXWfnDz8RbL1kmadUr8qbYsuBy
         BPcqc4ZuEVB0byCsolLE6cOW2OHY85LwevBk9ygHBuHL0PwnVV5TY2zpaOa0sTIAH4bv
         nCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        fh=CxBXzrUP5k4AXtwpiBhKklodc8DAyMn5PnUx/tBNXSo=;
        b=KDXP04b/Ipxu/TSn1YdQDpfCRGw8TSQa+gCBu9kbahpveNTHM0yE0NxHYlChdcW2lb
         Nyg04e1DlOgydFhu5VSyevPU995l37bJ42iG2m4KTDUDZnURMayUpgaWTUwFLdAOdOiK
         gKyWkX3hXpcB6FGsUs1vvn2qZJaLNN7yv5KHYR7icF9ONa8GjXR5FxKnxcRG0f4L0xjk
         DFqI/VI3WPUJnTqma+yKNq/RMRbXZYljVimVuLPLTDAa3rQC4kOSustzCfa/lnZbcx0a
         G48Jx9tgv1J3Uh0Pt5Tds2xNUWu7Bi6SSfMysZBw8BUlJYuB62b4+EcZGj9nPVRGePul
         VGxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978360; x=1790583160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        b=HCkG9CFwd8B3YTzjO9d2LghdoR6zPGkRVXBK4hwBIdSLTiccoARdEGtFAPdj96fidM
         Ey3DGL9hWnhgoRXqK5I3NbpIEtu/zeKRx9wRbl3upFdmXV+vZ/Pxcj7Xafz5D3hxUyvE
         j7Sn4yF0Z2y9garqZQaKMBHE99M8FmQFrlMzfTyxQ8pSNEPDSpOlXvZMdxIou16uh/6m
         6ER6FTT7rMW0IfDfHvOoNXIYK/mOxheFYng4Rc1A2my94ty88PcSTM7qwkZqTY57Pl5l
         LYYHplOP8LyGjiMBnwMu4njICxc5d3Iqt24qvsWGlBoGO8c24XgJmyzLTvY5QtPT+t2F
         SQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978360; x=1790583160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        b=GoNFX2x+KOP7uPH6vTPEG7WMbdvsAu9C+qBCKjBNiEGqAUXwGzYB90+2d2L1vy/9dk
         PZFfDJfo5av0iu+pJ8+r0F+t4JHo1I0WPnsIYxBoskNLD3NPPgTV/0R0HNZVqjfpTxNi
         HM5vziNutbxbHgK+Ev4se2Y+vuf6bRrrasuVmgmdfR7tdHzMRQCnZXgH2J/UVNqL5cEl
         k7jTXP9AITRalZamYJEUVZ6hK+qKYG6FQGjxZfGhF87Sc36GFUARmYtbx7npDKSVdB84
         1gq8DtIFjaD2WMBV5IpMUnH84b1JXABJpo7kJl2m+8A0Nw+eeoBusyMORb6JWUB+MAnc
         PeMA==
X-Forwarded-Encrypted: i=1; AKwUvBwebjMMUyFVBnsElqNWgk3RB0JeINK2FOaKjv9Cpsfk42/XzbV1j7yH4sd/KIlrCEdtF43PAgNIqpkDCw==@vger.kernel.org
X-Gm-Message-State: AFuF++nX8X06NMJCKYi+iR7q9EYhrhQYdCvsCZMt/5e1l6sPwsrP70Kr
	EaF30xQLsvb9CdDa6QndRzRaP7bHW1yrB9CD11Sg+bUJIWaNLu5e0/DXpHxUqBrYIHE8AkkbOJU
	siRTitgfJE9M2BAEIRQ/4Q0DA6oUhRmA=
X-Gm-Gg: AYBFou3csFEdJiadfqPichdJS5ckPjk2ruzGVAAdNa8yuH+fgrTPLzDk+qM+Co5c17s
	3qXMc7TCGQenpFQVlb5v+KxWhufuCAfAjiGbR07RypZdHX5ibL1xPsEqofXRlXrpnLt7NHZ9aXK
	EWE+CmC4j5hW/JBb2qN3ijopM/Eas0wWdBYLKlaZRSBHXKuibnCfGPyyOJsMaeYAQ/Q0JATp0fw
	DIHwccqHx57RNM4jSB9kDVvK3Y2a2onvywqGgMX78/LRlLneZBfRPTBNuobz3400f+/dMKE8nCp
	gpYIiu9fuXhYcWA0+dfqvR8gf+V7ixQvRSQCTd/HZYnhg3BkfEb37Np8Dg==
X-Received: by 2002:a05:690e:12ce:b0:671:70d1:d6d0 with SMTP id
 956f58d0204a3-6717fdfb97amr2457382d50.66.1789978360315; Mon, 21 Sep 2026
 01:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913120227.1559129-1-lgs201920130244@gmail.com> <UqvaHP03S_-FFGTtKijH0w@nvidia.com>
In-Reply-To: <UqvaHP03S_-FFGTtKijH0w@nvidia.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 16:12:26 +0800
X-Gm-Features: AcwNN1XgCXWlbGX--RVpkbgMM1GXMuJYBg88G-h-KhzxE_R154h9ZeFi1-ayk2A
Message-ID: <CANUHTR9xhXwfAmk+OTBdLyUjd5CXZm=aMQuEkH3nwsxd_tQ0Og@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix runtime PM reference leak on remove
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Osipenko <digetx@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Thanks for the review.

On Mon, 14 Sept 2026 at 13:39, Mikko Perttunen <mperttunen@nvidia.com> wrot=
e:
>
> On Sunday, September 13, 2026 9:02=E2=80=AFPM Guangshuo Li wrote:
> > host1x_probe() calls pm_runtime_resume_and_get() and intentionally keep=
s
> > the runtime PM usage reference for the lifetime of the driver because
> > host1x is not yet ready for dynamic runtime PM.
> >
> > The probe error path drops this reference with
> > pm_runtime_put_sync_suspend(), but the remove path only calls
> > pm_runtime_force_suspend().
> >
> > pm_runtime_force_suspend() disables runtime PM and invokes the runtime
> > suspend callback when necessary, but it does not decrement the runtime
> > PM usage counter. As a result, the reference acquired by
> > pm_runtime_resume_and_get() remains held after the driver is unbound.
> > Repeated bind and unbind cycles can therefore leave the runtime PM
> > usage counter increasingly unbalanced.
> >
> > Drop the usage reference with pm_runtime_put_sync_suspend() before
> > forcing the device into suspend during removal.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP suppo=
rt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/gpu/host1x/dev.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index d2c64728f804..bb6a1647e4db 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -729,6 +729,7 @@ static void host1x_remove(struct platform_device *p=
dev)
> >       host1x_unregister(host);
> >       host1x_debug_deinit(host);
> >
> > +     pm_runtime_put_sync_suspend(&pdev->dev);
> >       pm_runtime_force_suspend(&pdev->dev);
>
> After the pm_runtime_put_sync_suspend, the device should always be
> suspended, so I think we should also replace the call to
> pm_runtime_force_suspend with a pm_runtime_disable.
>
> Thank you!
> Mikko
>
> >
> >       host1x_intr_deinit(host);
> > --
> > 2.43.0
> >
> >
>
>
>
>
That makes sense.

I'll replace pm_runtime_force_suspend() with pm_runtime_disable()
after pm_runtime_put_sync_suspend() and send a v2.

Thanks,
Guangshuo
