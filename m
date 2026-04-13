Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B847939281F
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069205; cv=pass; b=Gu2YtMnhdzHJhIRHznVzuR/tqYU1TNKveJMo9iCo8cDPJrVJZk2wClFWJnHsO5xQKLqhmCvf5s4jUAIX2PKP/34y7/NCujqiolhvyxn3GfnP6UbYbbTnkTDNjaDZu0sgFhM2LuVg5wZyu0aj6C7yRd+l45jFePY+fwYoAMsjIig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069205; c=relaxed/simple;
	bh=5RU0nj5Hybs1aPtlV5028DIT5U8+h+f963lhnIeQAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIprhj1OTPJkTVrnVrwH5h/ee2Uk9dStmP/+wbiJCXGlrd+fLzut1MRy8iqH7JXSd5qhIP+GRTaE6mdTMMV2cOm6j9HE1h8Hpbo8PPsHZ6ZOUTo+1mTr25r7gNTPK5ujH/gwNSTh6KyETsSznk9dkHU1V7XbNe7fPOHzcV5mdrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0/gIs2/; arc=pass smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0/gIs2/"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5a3e66f849dso3849762e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776069202; cv=none;
        d=google.com; s=arc-20240605;
        b=iX85oVWqDRya91OMzVk60sKLbhv+/jcYLaHa9vE6vUTElvkUgSaR01TQH8+RwRVwFT
         ywFvVlhwnAF4ZpBElyD2AtyRE8qkn/1XR/lOINaRMZUGwjomoShiJePn27PslUQZD4Yi
         uoiyEftno5KIMWu/qw49Q5TEro9RWMwZgMDkEtKDMjt14D3/M7NEOPGdBeIynaTcGEJE
         WRbBnXp/6pXymuRCmB1wWl650BnVIDjsqOd+d+m8Wbf43oPvpoY+t8hdQLFqGJxMmt+6
         g7Gar/qgCVjP5mtu86pR+L3f1JM67xxzFCXQbGrDkMCPkJhXBWNEDA9jsJn3syYxdHrj
         Z8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        fh=Yt2Bncb4rxwhSj+LpzjCE+coS2e1ZVG/G9BpGstk6qI=;
        b=gA0bKRmbtPEyXiEDlRGyVKuKr5/dlkLLci/TAdmI4UJkjZ8LcReRiHT22tve/LNkcO
         T9G8wGWx/WR2qG4om5JOJGt2GHb5YnfhxMwITu08SfyBGcBMnQdoWZ/w42Qz+s0T0aVX
         IKLf8olGqpkRbz5IMDW8zzcDmwgLMkn2zg4sC+miWNiCAtuP6uaF85rpt8S7nW0P1gGi
         jv37NU0eR9t6DKfrAaOd04k59FhdFkSfFtDEdAkGKtB8urFNmO9pb5shTUReVAffKM7d
         ldkMS/65pk3QUXlfLfRyZi3vHpMiZuFMhGaMUyM29bImAnub6UFah8wqh2VoGb5OInrs
         oXRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069202; x=1776674002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=L0/gIs2/Mb9tZi1bBm+Oc6J/iA0xndygRj3rVkQe2D6SQa5yYA7ewkiNSjPcipf7GQ
         WTLyElQ5Nx1XpqeVjjQ1rri6Rzoz5f0rskom9NvTSouJWRUgYGhBHvYo7asecEg7WBhF
         3z3juup525TRAXQMdhneZaOgbNs+VygdEW4WFJiOMFqf+XvTvIzgI/ww/qWbkcJjCyGh
         rU4VDZ/jAIfhAyxMaiGXrL35Hz+cCPMI8cuuT3E1qMUGN6fQVpKHQLa+SoeEEqgIc+Q0
         QWkSfEr7Lai0nEYZBYjlnatGEG0km8W74hx0CkKzl3d5ZbfxCiUWquWi1gJ/IzN5a2Wa
         jF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069202; x=1776674002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=nfMBffdRSYWUSbymQKBKsM5Gs2LhdFvQrT09r3dTnE5ELvhd7H180yleiHeA1xvKhK
         2+vyYV4RInMM3LOr8HPxr+IaeEuNwju8UKO67UH4oGTkg0S46i78afWZltezGm5V6yvu
         WcV8F+2ruTf5OVhMKoNBPo/thHPbba96Sl1IH6TT91xlVPPaZ9MrRTg/dXf66xeBZkqR
         BQK5FAS4F258K4KQvfSJGAy0IPaR0fp7hKYT1Sp1dNp0nb/I3V5d/iE4geqAvkFtNNIm
         5+WPI0qg0MY7N96SdZFXbJLw4tII1WoSxJXouveWE+SVXnsRJQ8P/ePqj87MzFgk8bGf
         u3hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8ZHbw8ToQudvjvxk8H6ivZeZoPIu3DHiSXxSbTpJ5ClkFQCfNIoaNpG14RbqvFJM9aHJwWCK5ZTEWsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBCXOpR0tfGrfpRrQLuYbWzWU0bSyAOJPvMTgj0VjlxW3nBmN
	Qhd8w/7VwMdTKNNBLtUiJ39wws1TrtlqeJ3QRXqkpwwqFVVCz8pp2MeqhTjk6iJbKWEKclm+qWy
	xXlt55mp0OLBDYO2ts8uoAAN/RRUQrtc=
X-Gm-Gg: AeBDiesXGLi1xQw4WG7KzZijjfUUO3ND0V9YHLba7dLW4fAZFQaKWytbBcvDj8Ac7K6
	+DDm2+rDtAZFzyplJw0iu1gzY+ahT7bH7ZRFmCMPtTVXUma0fApZd59T/BzauLUngX5db4WEYJ8
	16DOOZ3FJuXP1rZrCYAjgO16t4OjsH+5jTF+CvRnpMrZC+Wan6CAe6s6LoMaIlW4QdAlASOYoRP
	2TeoeugbA98HgidTIL2DjFSwhAiumnBgLViY9UEHjq12EZM/kPHCD+nHlhT+RACrE+w6oQ31W5s
	ZZU5U8nc/ntGXxjfUJPeA88sTujbHYxYKfgLJJnHdA==
X-Received: by 2002:a05:6512:1110:b0:5a2:c66a:d6d1 with SMTP id
 2adb3069b0e04-5a3f0848711mr4280644e87.6.1776069201441; Mon, 13 Apr 2026
 01:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412163600.29925-1-dennylin0707@gmail.com> <adyjSM70HcX5cq9s@stanley.mountain>
In-Reply-To: <adyjSM70HcX5cq9s@stanley.mountain>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 13 Apr 2026 01:33:09 -0700
X-Gm-Features: AQROBzCK_WHlyt_DtYrQ3zmGBT5e-OQtv9pIgUn1-ecfdBcx06XmgaGhc9zsw1o
Message-ID: <CAGEkeHcT-EcqFTHKybOLqUxzbK8hCB4+XfWP=aUTi1e9T5-XwA@mail.gmail.com>
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks, I'll wait for feedback from Nvidia before resending.

Best regards,
Hungyu

On Mon, Apr 13, 2026 at 1:03=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> > tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> > of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> > the PHY when pg_mode is set due to an early return.
> >
> > Remove the early return so that the PHY disable path is always
> > executed, ensuring consistent teardown.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
>
> The obvious complaint is that this patch needs a Fixes tag.
>
> The early return is suspicious but I don't believe you have tested this
> patch.  It would be better to not send untested patches like this,
> because there is a risk that the author wrote what they did deliberately.
> This code is six years old now, so the original author has probably
> moved on to a different project.  It's not necessarily that easy to
> review and test the patch.
>
> On the other hand, if someone from Nvidia wants to Ack this patch
> then of course we'll merge the v2 of this which has a Fixes tag.
> Just wait for someone from Nvidia to respond before resending.
>
> regards,
> dan carpenter
>
