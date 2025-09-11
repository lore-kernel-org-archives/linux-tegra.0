Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C832E6CC6
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757627907; cv=none; b=bJSHoktRrBfPwMgvsPofuZwwz4tTxZl9T04ASB8/8/wzQVlKwYW06JTRmILVwHCqa/LP1VnzxL1RRJob7JyWrKm8HZ3OyEfTmwq1yh22Ueq5gM7rni9zMVCY5Vd9egzb0114NnErSu5B1fKJJNz90otiBb3ZcLBYkALKz7rUwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757627907; c=relaxed/simple;
	bh=0W0ugld9idsCY1TcFykNGEpN8ggbtVo9qqVnDRaPVfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVqLh3UXS6Xo8eqoMt9k5AtW6DBx5JqnPrw3k8B/h12mLFC9gSOAbUGOqHtuo71nw0pPl1yXoDpoYjeIyIUD1ZN/aQ2IhP+MaglpkDDi/8bAM1TqYlWLURdSpMS2mo5ZEetXCNIE979wIxYxZlr3oGdTt7Vg7eQN05rK2tuKFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUugf/LM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUugf/LM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-570d0c280e4so89624e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757627904; x=1758232704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W0ugld9idsCY1TcFykNGEpN8ggbtVo9qqVnDRaPVfw=;
        b=IUugf/LMW81lUnB80lqVmkTjpVcoaOn4cwoebCJpu0+7TFI9jzSZQI4sYA5ZwA/a7a
         fhU7qCiaFmrUOroZm2Yzhn0MqDXhbT2C34MEQpp8z7rLYSW2LeHkiwV81C0eptMJLgU0
         4wISo6K/PJK7/Bzxh8oOqmZ0ha+2QeDswsXl+puoXVe4kaJLqKoNaum4/a1TCl/Tjhaz
         104NnatvFwpKoFbPLPaCRe8yq9np4/Dn02jX8VFX8+Zs8/N98hgWmjCDsL936ZdF5xbc
         zTNgbz42CUJ1HL0ukE9DqQC7P4GFnwVs70aFXLXhVBneRQs3hypiPxjpAzwAdYj8/pxh
         diCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757627904; x=1758232704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W0ugld9idsCY1TcFykNGEpN8ggbtVo9qqVnDRaPVfw=;
        b=U52+YRsVAAyai8ioir5A+GoMqn4TOvnqpdgShLhAxU/xw9GEmsnjL2ITdBTa/U0YzQ
         Dj/UiYlnnROtq1Nyzv3boHyUmbsmYji2VnX3+NUR+lYuH9EVBOiFarOX4DEQwNuA32Fq
         cOsmrKtZMCMqYlv1Nd+RJV+QPdkatBLk5SLx+KsCS6XRidbaESihmRiIZgRTXfXk625V
         aiszfzNFdrPkJ8u6b1mSXWX4rQUPt4/Tzhc8mgP6Seserge/7dV8RV27iUTSxyYoYoPD
         ZWYnbKiHTU9XxaQwAlY2WOFq9XHu6Ipn73thlZgDx1K8HURdaeI0r8vEQdDOMYHtawFm
         2zpg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxWb9dqo2ecnNTeF/n8RJXo+JPLXNALKxNcZVVA5F6zL7maOUOXfIX6uavRLuKHqrvDf/sNm7uypFrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4mEtxuyjAVgwxXjSsiJBP0qFG0EVq3poKL8teIBQAlwtcxDr
	Zz5rTwHNd0PRp89Dwsy/kR0J63tQZACtaNbiytfRSYMuzN0VjWr7u4/4WZBxA2rJoLpC8zm/m6w
	av4B2tV+jWiCqCE597HVRTPwKKxbzl/o=
X-Gm-Gg: ASbGnctvelO3c/GdxAh1+QIMN2lxiw68pnG+dEN0dUeCGRmw7CMGaR/zZqQNsNqExVc
	Gy8SMKszQ4xg0aI244hxsri5HSpQPpkgkANK5KkKeZxcPgtuO99BwuU6qVge2MKtGT16OA/2uMB
	JU6FlsYQeayYBBUWWwVY7buf28giigY1wmJ+MCBW3o7km79u+kufOjDH1AcMnKIsNJCC38vCcav
	03uP6w=
X-Google-Smtp-Source: AGHT+IHQTRZCuL6gZAI5xA3kq+cJ/rdq4B7A7fP2ET2XUXeBi2OlT5Hdl3FKWnoKQmRyk/20azMJBe31VteTWRfnTLs=
X-Received: by 2002:a05:6512:63d1:10b0:56b:92a1:387 with SMTP id
 2adb3069b0e04-5704a105ea5mr326155e87.7.1757627903918; Thu, 11 Sep 2025
 14:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906-gk20a-devfreq-v2-1-0217f53ee355@gmail.com>
 <eff194a2bc0bf5f59d6fb92ea5913e2343589178.camel@redhat.com> <4777352446cb5fed094246db526f3d6f09729736.camel@redhat.com>
In-Reply-To: <4777352446cb5fed094246db526f3d6f09729736.camel@redhat.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 11 Sep 2025 16:58:12 -0500
X-Gm-Features: Ac12FXz5J-DcG25Sbjvg1ZaCJ8cUj3WY-nLpRDh4VK8xggBzNXlBd14W6PGpg_A
Message-ID: <CALHNRZ8UWL4FX_pQ4AsoHOVyUU7N3FAkd-DBS7vqfjpPjKd-_w@mail.gmail.com>
Subject: Re: (Can't push your patch :( ) Re: [PATCH v2] drm/nouveau: Support
 devfreq for Tegra
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 4:49=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> =E2=80=A6Wait - sorry! I should have waited until actually trying to appl=
y the patch
> to drm-misc-next, it seems like something is wrong with the way that you
> formatted it?

It depends on the gp10b reclock patch, as stated in the b4 metadata:

> > > prerequisite-change-id: 20250822-gp10b-reclock-77bf36005a86:v2
> > > prerequisite-patch-id: c4a76f247e85ffbcb8b7e1c4736764796754c3b4

Aaron
