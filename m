Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90714884A;
	Fri, 26 Apr 2024 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144601; cv=none; b=Cas5utPMB7k4lKvAtzmO1D3VPoc404j3NWradILp7/l/g4G8JHugtf0a+qahiY9yjd7j0giZCEb4Fh/9D9r9aDXeDNcut7vYY07JP4UlMyz/yaid2OrSb9bFOUruRRwO6xH563NRs1dk3Ra1etBNjD3bMwq6Y7IYHyigSv60jRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144601; c=relaxed/simple;
	bh=qP6pqzuqSZBOAgFlOAo1lLR1TvGuL4gXEIOzqdXxLUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzDBD80EdGDZoEe2dTpCopCW+J6QDi+ImA8yQLISQJw3IwAd+SvLMGZuM/PDcudAqu8SrRAhjput62Ejm36456PKjHzbprB/oLErFJ4TgJLj413scYbpdRLq9h3ig5sAv5ZY4bR2AtwnpeX0h93QOLfgxFawZKfInsBP5N1iVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSjkDyos; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSjkDyos"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so5788064a12.0;
        Fri, 26 Apr 2024 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714144598; x=1714749398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwWeHv7sOd5BZg+rt0KI1JoN1amvg+ZyKMVqvEKfLZo=;
        b=MSjkDyosjyptNpEx4Jo5Kupdb3eOqh+c/4OwXRvrnsqhB5Ep2XgMGh1dSUdip1Pf+x
         I2K53t6MV7XBjNkIId3XPPgjx2aBM5y4P5VKiw/o+v4f2LectV2bJM/cyb2TYJKU+X6c
         amfq4FGjDe/o5dJkiip75P3jstusrc2JUNy70z8KsqR2LIh7gD24Y+RDb1CyM/exa22M
         6I/q5rXacK53Ts3Ku4LV7Azhvzu3GJPn6FmxcpfqGdt9/KD0rymOBh6OONnA4LhW21Wj
         EpPuBvLggERPyidTf59FyLrB/wx7pgW9Ea0YbjzeB8vUjzx9mY2q1HJzVOMoaNKPlNDi
         xONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714144598; x=1714749398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwWeHv7sOd5BZg+rt0KI1JoN1amvg+ZyKMVqvEKfLZo=;
        b=whckFDJRboVaE0gCCQAvxBIGcdgyTIamtxCI4wq9U3BowHKwcQUtCpNAUw9Sr//t9v
         XPcRC2/gaCukgnjkPqJy3urB8w+Hf/HdrHQBw6dPzZn9gfjHozMzUnphVoySbGOs0lTL
         KbQ5G2adzaweCkPqkHiFFM4QAz7Ff0EVxSUf6MwLq28s0ZsJh2L1Dh+mGBHq2ayktWt6
         QkyN+zSs4wQroJggWM/waZf4DTOqC40TEHxTDSy6bW3RYFes60Xfb9gAYlNmlSxXtc6f
         ksqRb/LJPz50R1jzooRsZyTThTDhUph19FBacIlR+JFsl+i9GJ9mOevdkMDh99tQQnWo
         VJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNqQ3y9pesbGlK0EbwiH90AtSIjF+qT+7DIeTI3hWammWqiytDmFZwWAcFMlv1rUk7Z2u0cjetjFx1BI2eI9Z5wPyLQPhwu74v8w==
X-Gm-Message-State: AOJu0YxnlvYwkngXcGBi28/WflwhuFxCs4SGsw8l07nePxOt+/Z7b/kF
	4+H7pSvBmx/OGMo/HaIKnrJJdcWx7mOj5JB1MDb4Ws+PhmsUnr9y
X-Google-Smtp-Source: AGHT+IGcQa70aHZBefWDpV2b+m2720hiuuwhBpFvSJHK/vj9ZXyYxeaBn6LgqXefT+ktvR3GULMyEw==
X-Received: by 2002:a17:906:2292:b0:a55:adf5:e698 with SMTP id p18-20020a170906229200b00a55adf5e698mr12684eja.28.1714144597668;
        Fri, 26 Apr 2024 08:16:37 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jr13-20020a170906a98d00b00a4e03823107sm10626735ejb.210.2024.04.26.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:16:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marc Dietrich <marvin24@gmx.de>,
	Nicolas Chauvet <kwizart@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: tegra: paz00: Add emc-tables for ram-code 1
Date: Fri, 26 Apr 2024 17:16:33 +0200
Message-ID: <171414457816.2296048.16440856886619328129.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240222202142.129807-1-kwizart@gmail.com>
References: <20240222202142.129807-1-kwizart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 22 Feb 2024 21:21:42 +0100, Nicolas Chauvet wrote:
> The same table as ram-code 0 operates correctly on ram-code 1
> 
> v2: rebase on current kernel
> 
> 

Applied, thanks!

[1/1] ARM: tegra: paz00: Add emc-tables for ram-code 1
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
