Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB407233735;
	Fri, 11 Jul 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752246786; cv=none; b=DyzBY6qVD3W8XTVJor8gTCtYlNfotqGF0J99WbCEmauRG3i2QXrYpMcXAdMa2fSuX6fSpIrPz+xJ2K2H8zZF79BiZlLKQicBJvgoeQfQoNNrW3t1wNJ7XJNB8m6p6k61QAl/jWeLSGovn65e/5DIAmd2pyOWgw9nabClhW6dDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752246786; c=relaxed/simple;
	bh=q/RB3T4NCx2mfktuCajttlN1cebWGHKE8LCUcHligxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbXOHSPdce8ejdNtwsFQ+hAiKKpwTceweE/TjfDQr2ywUwZBKnYf5lO4QZ4i3vvrLf6UV5mk5YEYFDJGBmAuLOMsf/QC1chxcywpDUI5s+Keg48hDGJLzhzxJfcX7BPKT0DBlB4paAal27Mn4EZrML7cEFzTDDxWzH7A6S3M7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDRVxxZA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDRVxxZA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1187536f8f.2;
        Fri, 11 Jul 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752246783; x=1752851583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXJpzlNACVXWafUvsi+X5T2XzAH4b/rfmaXYOvRW2yE=;
        b=aDRVxxZADzI4M5y+iI3ts11Kka9Lz4s/8XXCKX/OcHyTw2PNtNJjXeGU88kmPSRLlS
         sFtUv9bPmZvz95P0wI2EtchXLGEzqOIzb5S9DMsPNztYFK2gZPHpsD/1+qY3tlpah8Z4
         cc5CAYQDrVyYENEgWRKldymdmoFjXxD6HS4SW+WyPlkEciSOweoDFsDbNQCgfQZI2yQx
         qahXFWp6FhBIulHVJasV6WzpbmkfckXa0i4uicHZpMSFMIJw3rZx0bBZGnHnhl00OkaT
         P75eKQzcu0dxR96Hzvxdq90E8ckqutS5KLzeccyvKGRw5DCGZooOF6uR3a2U1mTBUeOf
         7qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752246783; x=1752851583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXJpzlNACVXWafUvsi+X5T2XzAH4b/rfmaXYOvRW2yE=;
        b=AJi2Cd12L/x/zioC6szp6o/vVI69NKXjdUTO56vfG3CsJyg4v04x6HqKRgpgOGgSYo
         wDG7U8Tu4xTxog/hxej0UpBWQreHYyEOQo3WUaWKlzGuZLi/VRU/drX2pu45fRB+1O9M
         PS/2UgSWHLwrkSWsH0dzRZddh86JK3W6hl1Ud7ZS+MtMXIeP1Jbmt/viybQzN9XDeLHg
         vAeo75C315jhmIGhqYrR7Xfxcc5RJ8vrLfQfyBFkPtdolB3Q1tKXIt938O+vYIXr0znn
         GQYeTDxdYAyEjQuyjHmACETtfIK5sAg5hEBkueVq3bP3bBxw8MDV8A3sRAswLBqqPk1U
         LgXg==
X-Forwarded-Encrypted: i=1; AJvYcCUe6Y3M8fGu8X4e4PEJ/MjrhazSS3ySZgzrmFtTwWZ2uMfc60LGml0jdX4ogHWWefq64fC5Li9W4sTIiW0=@vger.kernel.org, AJvYcCV6AXq8JcsXpOasTTL+NOGdzlBYUcJcwlteW//auwZ6xFtfkn5F5Vi1vf5JGR9gcvksFYwlery0HbdV6K4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CESlWLzTr7n9M437kSOAdE8yI1lUuctbjAoOnNL2VROTMFg6
	YFyzfLHxLnb7RxHWnTEG2jAfJCHWpwJZ/ZFwVt+/6iKMmOdEN18kQGMw
X-Gm-Gg: ASbGncvf5UfaNvy2Tf6//rdM5nSs6seE9X5a9c9fxYYROMls9LPerPl+u1qTWSbLt64
	PSWskE8sXOqUkf9QgWvD9c7pt/njoOxZSSFoQ7nmfu82+kHl5eKO0eC+wEI+iON1KsaM0UEO/Rn
	npv5vD6indDkhifnzap1/Xe151ISsNWzuD/9evpaLFo6rTJZ5J8aZxmkM5rQeOv7HTLnsR4DubS
	LSg7TXooI1AUYyntJ4sCTEHN0BVWde82jQHuR4UDxkN13Yodfrs2YS7Wb+DfmzWlU6bTFMX24k7
	rmA5Io8Bl/YszWConNxeRtYYKS/NWuXQBrCezaNeglydw1PyE65amhXBTVFBc4HX5DvCLMevVOe
	XmeqYNgaaFAcRX+6UW36Od/l4OO9kvIfxDzb7ANXGPoovMfUMYhHsi/Mrllu2PQnXHRIALAI8CT
	MxZXbi44EMfaze+A==
X-Google-Smtp-Source: AGHT+IFOTiocf3bWWwb3sZqqqXMFKkwzRjlS3w64CsnVh7GxOlw08mXVJTYF0IRmpYr7oQ+jzhLyiQ==
X-Received: by 2002:a05:6000:e06:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3b5f18d835emr2549650f8f.42.1752246782911;
        Fri, 11 Jul 2025 08:13:02 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d77asm4814537f8f.58.2025.07.11.08.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:13:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
Date: Fri, 11 Jul 2025 17:13:00 +0200
Message-ID: <175224673040.1549549.3672790381996460184.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250616073947.13675-1-clamor95@gmail.com>
References: <20250616073947.13675-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 16 Jun 2025 10:39:45 +0300, Svyatoslav Ryhel wrote:
> Add a device-tree for the Asus Portable AiO P1801-T, which is a NVIDIA
> Tegra30-based 2-in-1 detachable tablet, originally running Android.
> 
> Device tree contains "mstar,tsumu88adt3-lf-1" compatible, a simple bridge
> which was submitted a while ago here [1] but was not applied yet.
> 
> [1] https://lore.kernel.org/lkml/CAPVz0n1udjVZY3400hYMY07DjNKfOt4bwpW6He6A4qo_3pXtqQ@mail.gmail.com/T/#mb50632e269d89275d97c485037da8893239b5410
> 
> [...]

Applied, thanks!

Thierry
