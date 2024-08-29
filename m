Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004413A1B5;
	Thu, 29 Aug 2024 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945908; cv=none; b=E6z6Vwu+jeyLWmigSpdbIiWyj9AhzH3KtC1mnxRKgRtjFM+H7MVTGOkYX+6lwL51szUyVUj/StPV64U1od5Ahf5atv5/Fwd866cNeMae20jEJ6QpfbuA1c1DMIV4EjamDq1CmwS6ZAhhmHu/BInlxaJDrq+IVko++2rJQKBU4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945908; c=relaxed/simple;
	bh=PaGGy67adiFibLvbBmxtYZHei3cfHIB+Imlr125VfVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBbz/N5wv9/MssD+bjMbNsj1iO8cqwY3Z8A+I+jiPaBIOrET9tg2IUaPHR0k9QUekiCBEOLBD4h79cN0FDb4LpuDolSa0Jzyr8rpkwm3Hf7T+r/0E6GoNHKccacCR7VuOO03Z4Lh5uY+z+QKF39Jort+yXJDPCsY9dfO5rzuZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx/2mGOy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx/2mGOy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3718cd91185so474836f8f.2;
        Thu, 29 Aug 2024 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945905; x=1725550705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFDS4ecO1nncemRhrwENZOBI9sm9ekDPuxSh94IQTKc=;
        b=jx/2mGOyeJgTTo1wPukLjvIf8s2ubJfoeqxPjiw60XfWPjhWvI9GJcUq7B6JLedKJp
         8sTFbPJ6LGSFmdD33VFRomtzLuNnsHToS84xV/yYrcVR2k2JoEswg01lCMJIuxX0BrcT
         Bh9S/9mhXqDPgnal+x6KOmpjg3HzEWvfhLjq7TTzGbk9/LD10aYuxFF4CM9yw5M9j7ru
         LnKSDBiZs75TtuyfBw+01rTUQ1szasOfh3HcMB1F8dJ3Agv9hyHHmtQsC5ICrZ+gdq0J
         UcdGYS+UNQGr/2kMqcMjAkfIvyciJnt/BD0zw/U1hOb3uEyzrvRJtEytPDCBc2JhjtSm
         mccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945905; x=1725550705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFDS4ecO1nncemRhrwENZOBI9sm9ekDPuxSh94IQTKc=;
        b=O6MWupTQEROEqixkNdGhQBBYQX4NB3O1D9bQAQZrgb1QcM8cZYxvk0QEcPcmmio5DI
         R8Kqvu3QmTEquEQRGPTLopFytjf5QnxKpBCwrww7uzsJHgMp4FgDRNiittbqE/9zeqXa
         EkItAa0vTG29FJCSyOmJG5PT3FTkPXTvzWYFc4UwQr/ia3ZUU7Il0pOwt7jbeCVrv264
         dzT7+5axPyC10JIO5/q7jW0sgMHWTIeNJzt7J4shphkHaUcKy8E5/FpJuqvXCQstfJhi
         hjWZvPfMd1kS7/bTpxhqf4AJgMst2syqONH1SsFKCgjm0SCJgZVq0Dlhb7NAWSla0SOz
         E4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkakZDox7GHmy2V7wTt8YEQ5vcGtcUkVe8qArp+o0xbImgfeFNstyKT3SLi7cz8q36JKGs09idB0LS4NE=@vger.kernel.org, AJvYcCXzAMtW0gWBkMHXwCYmpR8QCRDLrOQXL8CijKDAMm6lQVuCQpxXUR5sVYBMHYIAUIF8TepPxvrSjr46mds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDOOaNLWthC6fR3Arj2VdGrsMqOY/WAsGz5yflXuMC11pmgES
	/SRoUCAcak+Ndu6beoNULjCVC5zBi4tQnJ6ZaHeol9c2551IBsse
X-Google-Smtp-Source: AGHT+IGKu/6RwCKb3MWUCxKB2PMCOXK/MKElurLFEQ6l6Sj9iBASNOCQZvBFzEn11nGNMEQpZvH7ZQ==
X-Received: by 2002:a05:6000:acc:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3749b557a2cmr2421975f8f.35.1724945904636;
        Thu, 29 Aug 2024 08:38:24 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb37efsm1709686f8f.109.2024.08.29.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:38:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tomasz Maciej Nowak <tmn505@terefe.re>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: wire up two front panel LEDs on TrimSlice
Date: Thu, 29 Aug 2024 17:38:22 +0200
Message-ID: <172494589680.1304567.741368873322088967.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822184555.20353-1-tmn505@terefe.re>
References: <20240822184555.20353-1-tmn505@terefe.re>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 22 Aug 2024 20:41:02 +0200, Tomasz Maciej Nowak wrote:
> Pins responsible for controlling these LEDs need to have tristate
> control removed if we want them as GPIOs. This change alings with pinmux
> configuration of "dte" pin group in downstream kernel[1].
> These LEDs had no function assigned on vendor kernel and there is no
> label on the case, the only markings are on PCB which are part of node
> names (ds1 marking is on power LED controlled by PMIC), so generic term
> is assigned as the function.
> 
> [...]

Applied, thanks!

[1/1] ARM: tegra: wire up two front panel LEDs on TrimSlice
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
