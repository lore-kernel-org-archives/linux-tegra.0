Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B321E0AF;
	Thu,  8 May 2025 21:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738511; cv=none; b=L/Z43k+Xv98E6GT/qVPnp188j1lcPMnkBbTDNeP7FVABJMnhgJtqf9/QCDOStxVxBGJnAFLO1DGVO+QDiPI5SgT0gHF68T7GevBp+J6O24gAXWBkWYchlca62SoKbfCGPTqKNljBgbxjzQYkNEa305J1v4Npcz3SC8Vy8tMS7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738511; c=relaxed/simple;
	bh=sSh3UlRruF1zdvBbJ88hPL/r57RJN/FG1Nf1hx5CcFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mClYJ0YWlM5zWxVSN2iQ4pgz+2yjKpMNztnTqrYSsyXHsWqV7Z7L/MZiaB9V4QIfZiwMMIUemwT9VC2XT1R1OF+h/Zr4yFBCiFdrtABCwq++S7N2L/gfcmik/8dcZohmO/znggr8iMZUPmWsYBiEVMg1zOZtvv/OEaoiKPdhoqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DY2GVtc4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY2GVtc4"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso290033066b.0;
        Thu, 08 May 2025 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746738508; x=1747343308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8E2OTrklV1CT8+lIctUYvo1JeSW/6ehZQ/r2K/Nmc=;
        b=DY2GVtc4S/rIlSiO3HlA+zByfCi3OyxWdBBGfTx+32/wTumQx+0fBIJ2frzJC/lMqo
         nDHZ20lKpoLHCTDCB18Q6CR0qjIwq805Ap/WNoBjGaTnxDLfYj9lIj0iw0vxwvmWN6Eh
         i1svVrOn0x+aauRFv1n5fSpMCCEkaWTH91GspNATxiafnl+eNLij385PpQYhXDX0yMIm
         ebfZ0v8svtCsV2wy366RwoztD5cazSpb2zr+umkz5satql7HamgBYtYfw0Fl6w/IBupM
         VThX8g5TjdBgsuV1lEls28CziceQAU25EwqKR9A46CUec7cJm712SFcTJnSBm5/pVMxc
         x1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738508; x=1747343308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh8E2OTrklV1CT8+lIctUYvo1JeSW/6ehZQ/r2K/Nmc=;
        b=Ak8H1P2wXP8QTTp17CTA0MXpW/1KFkj45jv8fHmZx47Dm7uYEYo2ZSm22Gyfmt49Dq
         1MRFhfnBTEceQtLOjPvTLFpA6nTeAmFHBn23zgPosTUK+sPawQYNj82WWnxSDVXsatBJ
         jWOO3pETF+gfiQqPJ2S1QzCnQeGZQoTjxMYl98PlGP21dkVTHm+gz5sZ2z7FGmFav3mO
         NymjzhDnbNFE1qV3qhr31WS9/xcZphcsLFrcp4bAJWoTjXOefDbKZyY2RVtvdHt/tytK
         r9gMXmXyCMp0oTTkexG6VLohw6n48nlrIJjW1IeCYG7zPSdGaY6BPtDhfdend3/l8rXG
         53Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVldptVeev3caYN9Na7lNwhSMZX8lO4zKIXOe4+nTmpOoBMuemTlzDn58ra9ZGcQHNtOpi/hZD82lUBryU=@vger.kernel.org, AJvYcCXsSTg8QymCAI2IkE6imzbRs8GJKDoMOvC7pKQwL982kuB1tyARjTTeU+di5KSMW7RODqSGJaf1wlFKT5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YySoLBUIxkCc3/9c3sVJL8Q7AiQgcjw+TfRLCFST+thH18f6LQz
	Xn+pcDy8vFo+JqIAbMa0POH1E6X4zyZF4JdVyv3B8Dm7LyY5ebOu2KScDw==
X-Gm-Gg: ASbGncuOmF1K8/GofDJeUOvS6aGgr07vIlRUsy1Ck+vsQYJbUVSPpJPQYuEMCBoHPYl
	ZQnrAKcyzjuXc39bisAQv3FMrojLf72W0vyWG0ZGeNkNOLNBfv3f+KkbDktJAmpzopJJmh/w40j
	B7iU0OQgY5dKKXyMhI9JythID7Yx04DjBN//3Zs+MFLjt44F5p96Pr0b+xMWlQy2FR0/wSQuxEg
	JNBye/ZxLD1t+lqAR2/r6krB7L6vj9tRX/OJu/6wsqHPjTHS35sHQfeEmnH56XEIM/V+O0csCSn
	JcDrhaQjG6wi+25sGQNSzDKQWeIXQ3D1fdUL/SgRXvf1gw7giCHR8A0kIuJF9gdNIoLYeCTzzix
	xl6/b/yxO4qLHF6FqcOTla7nyPTepsNjn
X-Google-Smtp-Source: AGHT+IETGDDtUGrG9k2RbXZdbP/78mtsOXiATeb6D4TevvfXBuiLGpSkUi/snj1y9hf2kdjVh3EnIA==
X-Received: by 2002:a17:907:2cc6:b0:ad1:fa38:9e4 with SMTP id a640c23a62f3a-ad218f6ee1dmr112553566b.26.1746738507643;
        Thu, 08 May 2025 14:08:27 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad2192c8508sm43581866b.9.2025.05.08.14.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:08:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: p2180: Explicitly enable GPU
Date: Thu,  8 May 2025 23:08:23 +0200
Message-ID: <174673849358.1568857.4837060567282332844.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420-tx1-gpu-v1-1-d500de18e43e@gmail.com>
References: <20250420-tx1-gpu-v1-1-d500de18e43e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 20 Apr 2025 17:25:17 -0500, Aaron Kling wrote:
> The gpu node originally was explicitly left disabled as it was expected
> for the bootloader to enable it. However, this is only done in u-boot.
> If u-boot is not in the boot chain, this will never be enabled. Other
> Tegra210 devices already explicitly enable the gpu, so make p2180 match.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: p2180: Explicitly enable GPU
      commit: d1b72547610497ea4d0917214986cffb752a8710

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
