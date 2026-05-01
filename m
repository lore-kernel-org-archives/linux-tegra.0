Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA12C21C7
	for <linux-tegra@vger.kernel.org>; Fri,  1 May 2026 01:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598113; cv=pass; b=i8K5dlth3bQvJrnaW1JLEs6OHypPZH8KpFr7M61OWjzwqUKExXzA1I1FQhDDlkA50bqOYfGF07to0pm84b2CDANbnaNNSfrzPB6KjpPQU85Dl4uiSn7e/ROqVJH5/RzZXQTmzKWE6Sn+O3OctfQ7i1mldSb7U6mkLf0f1HjC9Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598113; c=relaxed/simple;
	bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLFoDcoppG7Cdx2ZT08sMqHjWyH7t5b5YWWdTqJD7zOvo6lNlCBhJvyTTJEVyg8cEHJ0dwkY2E1wItGnPDdc8OtqqM7/OdB2JUDDxClXJUzJcP0dJyXFhJGsw4IYmkJQHnE3u2e1o17zn8DiRlr4Y+rflSneA9cxaw4B6P+tDfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1kE6gNP; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1kE6gNP"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a4113ab355so1620907e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 18:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777598110; cv=none;
        d=google.com; s=arc-20240605;
        b=bi5zmw+CzkSmPPt4lz3Y6o7Q9+BgYt5L1FYerP7rtfURYa11/ZtRAUZZAAdp9A9nQ2
         U6yY3K7BEP8OYl72r+9vGfjoTmduo0njt2zwp48/E/y+0tQSF/EgB4szTVtKWyWc1u2l
         Bd9Tw/R6JWXS7hZGb/vlfHI5OKTOVy5GB0hOKt9lGGumKIxcs+/FZ0lOuZ8cWIlo/jIr
         jjmxYe8yivqSwd89s7iRb7fFKPmAxxytqRfvy1fmmWMmNa48eFKHOJTFH5x85XjzKnba
         jE2lnDxQdQWBiBGFBVO3hhbpaUKrVFFUAYuXCAizkB3d16ig5QMM8inoTfcb96EpDyZ8
         dwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        fh=TSWFL4wpUbKnGkF+TKep8DhndsL2/iTUoVrrl9MVeuI=;
        b=clzmQVk/qSvs3DEZe8FN8zPDuaM6IjRG3+Mttpi+RgFtkt3bhgBK497CGmCIxlxVTf
         FJnkdjgGWo7DXQc1X0zYjhYKbHufm8h+0+GHZav4yJv2ifR4fRhTwd58ZvAxI5GPqhg0
         rTbibeTLvfC5UMwHBqENfroaRiYLjjOmZI4Fd5vBoDcG4saBEoz1Ze1H7FY/g/jJGhF5
         wJbD1k6V+PDTNRh8X8TF6ht8jGJ7my0b0JYz6TcSpHkRaeRHMVP93Z21uewJLN8IJXQ5
         tD3c6dSinPYsQEvOFgzWNkYovDqfKdnrTK9i7H9WxLotAdpcI2lC6yAIkrRA/WtKph9k
         HYOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777598110; x=1778202910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        b=W1kE6gNPfxldCrlmNXJIeRm8HLJD342OSQO1lH6nKgDEPFNx1SkTWX5uYeHSEV3I3P
         evcLiY70NRrNztoHbuNJthUzlZJ5gJvqXQ5C0jciSfPFNxwNGwlMxMjhUYSIOEdcIVLv
         8yIbidvU3KaoLFw+U/NvcKmmMu65rNfPKa232pJDNOxzBQUM2Jev+UcaIGskswXtCWR8
         Ve6vX3wbc34obpbl1eOwa6OQBZ+hQg63WGp5QRAvP4CPaj/mSv4roELupkProxedoRwQ
         0DfyG+826zTwXO7Ivh0JiImrTSYZobbwRpmBS7G5MEeNvPaBj+rdJ7wNN9TiQY8zuRsM
         PltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777598110; x=1778202910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        b=c9en7BgWblKZAd3N2L9/Jsf7Rpewuf0iFLtRDNxJhrXO0h/23aT5wmBOL6g5SNv4Yf
         LOZy81OdX8w99cRbqWAwaDdfIbgUc/9gCjkALnp8rFq+ePBrtdu9Tjo+1ugN9YjZOBvH
         uSMnS/HaWxbA8K22WTNZK/CHxpvIEQbot4HEC0Ow4YXU/4IiC1X8xjzb4KF6AsUAOlOa
         Tbw8920JfupCYfqvXr/gn0eu5vNaIpQuS8BmIYekGmY+o+sN/tpisKmA7QyVtYsBzc+7
         JQVMJGzYogQAKn5YgQ6+eA+OjRgSyOxmaIGuQeuAWAPzvSVZWO6bzyuZJ7pKv4tJ1xAz
         EXpw==
X-Forwarded-Encrypted: i=1; AFNElJ/vlmpXfsHUTT5L4FD4gSvYX3Rm03I2Bzy3VmkFJKT2EQKmS6UEt35ei2vXkU58JvUNBm0WEc0JjAecFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nFgBC2rrb/6PQIjY9AyXfizXzhSg+kjsa68z4Sl6m1s/Mfm0
	zm0R9hcYeyYCu1juaCNxcrEIAjKIHzJ6XwcTkkSluBBOvjPcdvYH7BMKWv804JGvZWw82HNrRFq
	9IbnQd0dNUEop2M19WVGUeIq7ob9fkUOVhb3r
X-Gm-Gg: AeBDieuXubIAe2WdBOoTQxkJJkbyQKwliz+N/M67eDz+POqXRbcv8/FbnwbuKfLfdz+
	mXRLxIjo0D3tGfzEkdx/Ew47AQAFoYtjaIQBBdAHbjGyUTjNHdWtmlRHYX2CnAFcqgFtJ92Sv8g
	qwyPWiZlKSnVfmLb3l9xZUFEMQ1v2TtuQbIrB8CwzZIAQBj3HWy2yrpYGjTUfJEBzd0gqAQsoOS
	SMGezf2hCd+yxtgGMEZu0xd10XjerzcT683zJ6RMjcfYCSq88sPYgd0JJJ8Gs9YSbk27K4Khllz
	00RIQo8KPi+jBKCuVYHo6+wpvgIHKCk/X1AHFEIeJgx6L9OhyTP3RoMMZSKw6qS2CkEKt5drruK
	tvIzPDHQqP0gpRX61/8leIT/WGkEkT7uX1NT427P/lj65n3GG81wLuWIl9/p4AAJzFkcZ
X-Received: by 2002:a05:6512:3b13:b0:5a2:b90d:9bb5 with SMTP id
 2adb3069b0e04-5a8522d8199mr2150167e87.29.1777598110255; Thu, 30 Apr 2026
 18:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430214202.58405-1-rosenp@gmail.com> <afP6ayAbxtTq6xaJ@sirena.co.uk>
In-Reply-To: <afP6ayAbxtTq6xaJ@sirena.co.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Apr 2026 18:14:57 -0700
X-Gm-Features: AVHnY4KJj_PPFx_XiTlTc5dud7Z3CoLFk_oPTNDVX6T1HaAb2jGtfETjZDPhn6U
Message-ID: <CAKxU2N_FDFnp=i2Ur70jHbs1hOUMPAkWNXuuju==P8+wwfsHUA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADMAIF: allocate with a single kzalloc
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Apr 30, 2026 at 02:42:02PM -0700, Rosen Penev wrote:
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> > Consolidate the allocations for capture_dma_data and playback_dma_data
> > into a single kzalloc by using a flexible array member at the end of
> > the tegra_admaif struct. This reduces the number of allocations from
> > three to one, simplifies error handling, and improves memory locality.
> >
>
> Why is the changelog for this included after the --- as something to be
> removed from the commit?
Me being careless. That is, it was written after git format-patch. Will res=
end.
