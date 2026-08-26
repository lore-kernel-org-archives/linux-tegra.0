Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E5296BD3
	for <linux-tegra@vger.kernel.org>; Wed, 26 Aug 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731989; cv=pass; b=ey72GzmMXev+hUqCM3g44F1qKbdd8GueE1NFafTluhXYsFpmF5zqakQFKFhMDfWfgIX8kcIgpR87JwV14nWiagkaQ1InidhyglrRIgnAlR2A01w76+6f9RsJQWTbLCljEkl/fMzK0ctgyiy3JpbUXgJxfW2kfTD0rVSUq+kIYNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731989; c=relaxed/simple;
	bh=DP/2gqU3fyId2g2cAS1ww7m2xwj996soZxme+tkBNoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TykgfbHicpA2CF9XHu3FtNy1S/rE6uOfo4TbTVXLdR9bBK5SVcNQ2HggKGQOv9VewanTKSbN8Fs5WnFx/6kXbzUZsL5nd9XqQY2F4pJjqt6nR/QyLTpDS4/P/0YPscb1tsNrOpDOw7UMe/VfiOeCrOxxJOpOCdsYElKt6UY9Ipg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHOFZ7If; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHOFZ7If"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c70d73210so989958d50.0
        for <linux-tegra@vger.kernel.org>; Wed, 26 Aug 2026 01:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731987; cv=none;
        d=google.com; s=arc-20260327;
        b=D64BUCXktNnChxGdTjfH/B6TKuQVk/BsHDezFG9UrI3IhhJzBo/syu8mLxd2Lwaedp
         rS6ehVDSy6M0knxh7WRLj+SSzI8doERf12YMppNexm0/HTjVO4xc0Ppc4ohDIE6/5mfX
         iD1zcm3mI1yQMQ+B/aXht1ZgXuIov+/Fi+4u5zved7jPAnnVCyZXz5UvzEA/ddoefcm9
         ILAEOki8V0eNFPmLgEfMaf1j7TpPUNc3vqT7dwyyRftO5SHbOcTz68bxDqNRYTbw6Jq7
         WAe8QID/ZpbOI5AvjclPBxQ7MY7KmX/RqmCyFbEnkBm5tyCyaqI2CS+W96GB5Qge8m/p
         zkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DP/2gqU3fyId2g2cAS1ww7m2xwj996soZxme+tkBNoQ=;
        fh=FkrKUR/vxFj8z20U0+AxC0gqYeMW1oqgUfpZAfFa+t0=;
        b=qwtxWr1Q0pXC4P5inU+yMd00Z7/XBEgy0qAeo+hXCe3517pMyxZheGZHItU4uZf4Mi
         29GiB99RsqdKkfyIaV7KDvZY3yQJbdvs0P/NmAhhMNr6BMFghvHdJB+i40ol1thbmTE2
         92XGZCtcB3Yw3RUNlGew6YA6Zs9TcgDRjyT0xt1fPexT0+Q6o15PJUnF6pQERoe/2mLS
         CEri70tkLroe/OJ86WZ0jRcqyT02ey3gVdEXx6eVWyXsIfqhACVxKxqFx6jR7URwiSic
         PU90InG58F1QYBZ8hRwqd/Qsxd/OCCHAg5/sACJm14gpxdGDQzvCM28upyqbfjjyGiVM
         wCTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731987; x=1788336787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DP/2gqU3fyId2g2cAS1ww7m2xwj996soZxme+tkBNoQ=;
        b=HHOFZ7IfS6zQdN2e2BwiGcV5yfkupKzSerCPU4d8fmgVrK0ivCb8lwEGYzuT1kZEUT
         meAkg3WnPpsUKbfsU1oygT3g4PgzawlJhIV9YhWcqx9XTj4YciucBZ9YKdp/vX65l/Go
         pJ//sHzh21MJ9j5SDB58drAT87j16rnDw3Rvm0Koe8YAYAlsrkbzG+xZLTnbj4MpSj9r
         wq7ZVf9ygEjtW/jtgvhjXqnEGwtiJqN/5JIdwM8XJ1Z5vtNDwxXDFle78efOPr31sONd
         1LtUBdN415tYqxpH/CrMtpyMzE6OCxcmhupPsNDSHHzRiK2onoyihYUfRJyBKI/MnzHu
         7ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731987; x=1788336787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DP/2gqU3fyId2g2cAS1ww7m2xwj996soZxme+tkBNoQ=;
        b=hLI4m871WmZqWkRprqcg9chjar53DhFVy0IDgNY1vXv9u9TfFz/xF52U2ldwtgZRWq
         yCFq0WrlGvPiF3rZXY3ylYTf34mhwnCzRxf8E9pAYk+Vnx1ijoBS1rH1OqKWRwgZYcb9
         pfqD1VPbE7B18Bwn7IFO6pb9THyHwqCi3Zy7BJmuV64p7y5cfop8XBXmk4ahRwGWz1kC
         9zFCd7KDyX0P6krXlDfrKTAUIxNREzsd/IBwQrMlufxJQjTrbr1vnAxAd2vfD81dj7A4
         9L6DCd9cYAuCTKHo2yM18z0Ugfi+db2QDPH8K3G4DpfOW9U1xHZUn0SqPMZO5MJRjyyV
         F+4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWgvekFAP5BYkvStGrGVyxzxF7qndWyp8Ee32M9EUfxrnZOhPYcM8aF/8HapjL9b3cnHW4aaBc+5L+1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lhaX6+2Bt0OtM/FF3wtjyeVguhLVDQZdSUfg1H9x36HuoIR0g1
	4cfWQY5dfD7VBehAgkCDGxXDhWEUtAzapn+SIWYPYKvuaX5wIzLPPFHHlRHkRYccL1c8nmYYJ74
	GK6uG89cW+po+M0sO6Rt4gPi0LhgTUHg=
X-Gm-Gg: AR+sD11rU/89YdBn2aIwcYa490aGiGM7h5wk1APuq5a3qTIXPVitB9mvW7I0Wzcwq6f
	hYqUWFE3TsUCG32sdimg2aIwuM/BSs04ImNB+Ruzh6NxwwVrsCPDDP0K1miQezG2f3WDxCfjCmX
	33QFqlwcpWnY8zze5Ha9gsk9Tt4kMAdDJP+BYpdEH91FV4HdT8KxWDcTnv3ydPMtpHztCuP7JAl
	XVFazlDH8eTS1vn3xONCW47WG8RS2vpxVsYqZxf6D5JdfmTIV2nBnYnMOxujkNRKu+cCLISSzDY
	y7KxdBgBTO+vk6oP8+6wqZzOIP05TKE7OeTvds+lIV45T/58
X-Received: by 2002:a53:c643:0:b0:66c:486c:aa07 with SMTP id
 956f58d0204a3-66d257632b5mr1226829d50.35.1787731987131; Wed, 26 Aug 2026
 01:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808142217.2893936-1-lgs201920130244@gmail.com> <400c3d0a-97ca-4c76-909c-0c09d534cd41@kernel.org>
In-Reply-To: <400c3d0a-97ca-4c76-909c-0c09d534cd41@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:12:55 +0800
X-Gm-Features: AcwNN1WiakOYjCu3-MZaTlXfcEIIF1SEVa43x_3CROHSyWNzCBcShiqF2n9BY7s
Message-ID: <CANUHTR_Sr49S5JwGE_wzTFed6weW_8MMo8o+20vf=bZE3Xhc-w@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: gr3d: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 16:22, Guangshuo Li wrote:
> > gr3d_probe() calls pm_runtime_use_autosuspend(), but gr3d_remove()
> > does not call the matching pm_runtime_dont_use_autosuspend() during
> > teardown.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped.
> >
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the driver
> > remove path.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
