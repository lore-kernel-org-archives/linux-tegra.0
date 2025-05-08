Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03720E01B;
	Thu,  8 May 2025 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737998; cv=none; b=KBrNcpnJdlg8CumYmZ5mcRm6G/1VeGBD99NQBWeYY+uUd33phABdzrC0RH69m6qRykhbCw5YxduipZCeXekiALE6kt1iTJd9vMchHHAaQR8XGbKo4RA1cURoqWmuKXN99dkFpZ9PvuopLrjKu/9AcvBCZL1cEnDBdVh96xEYePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737998; c=relaxed/simple;
	bh=UnymAstYRcrWx4ndk/L+X0blB3wHwjRJbSa4uhr7Em0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IX8IoTy3bovFmmdEjJuHHbXhnGcbZAV0raFEroUQIyTgPBrOMb1zCwIkqoW4Z5yKvR/RNr5Ccg9nUaRY3s6HrMDGtfgpHH2Htf1GGdOZwmhv5xvc9PnjdmjdzCGL3UUj3pfPzryyrIBJZUPlHwrrSwmE3icvZFVa3nFK1OMg11Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlsFoVUl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlsFoVUl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9995945e9.2;
        Thu, 08 May 2025 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737995; x=1747342795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJXOkr+3jhHxWuSur0WABxJdRS3smL59x9d/Ul/2q+E=;
        b=QlsFoVUlpNaGvSTOrQ+fc/vAGCzgiVe3QJcfSqdmF+uMQabbwCIZZTM5zdN/VHq4E2
         /+p0cgz8aU53XSYnQksUf1pZQKsheQjBfbT0qnFXIc2TPdTH9BBtjGWny6UqpFxPq+Su
         Ln4EQ1UedHEmRk42SFYXvtRiG6k7AtfpV0PabOUtAmxi7CEB4QgCwZz6jmF19uYofZ6e
         Fd+kd0gDjtvPig0Dg4n9Ps9sf/g8WgEo/VqoOG9NJ5geF6QQZvjSFoxmzN5dCXWsZLwD
         OZuZJFCwsLtIZnegrpG6CFG+cRAVmpnGHBQBAQshTlT3lpiuyrNXHNuHSOje9qMy4LOJ
         AI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737995; x=1747342795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJXOkr+3jhHxWuSur0WABxJdRS3smL59x9d/Ul/2q+E=;
        b=qpoPGVuM39K6kltlG33Y1OFE1OyWQxf6yrRR0aE4GU+a3Mjd/Z1vy4ZVVjFTjopKIU
         tGOeVeH/QUPAYFVrk8ATol8m7fHtAChhmyY4h16RW8LLII4NV20Fzj7OU5d4MjeG/8bD
         MWyI6BiWLSu+I0Msu3chxx9zsiRmnXmvnrSZeN3eIWylphZK2oYV+lU3XTvkL4rsw2bm
         zBALQKd4q23PR4o6d9Jbce8bD1CbrPANptlsHQx80nFxXHSnZleOxpkF3rOs0+mlFqlP
         9E8ChOxAyVgTErFURE7ESL+1gyn9KcSDPRl6grtCTQnwHSYXsV54yAaRMR5bQYd4xRIw
         e3CA==
X-Forwarded-Encrypted: i=1; AJvYcCViYL03bjoiQiJf6yLUpY+EmTHqPLzM95v3rGSTeIpEEFl1VKEupQyPTnp8pSft9iSpLOFVIFJF3BttkiA=@vger.kernel.org, AJvYcCWvjL5NG2TudYt7RLMVGgQEb7YeRFr5ml69x5d9DShBtczyLSaTygxgLqBYV/xYBxo2YWdls3rt1ZiNx24=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJP3wQ4WuvKWNg2gsXusDLYmDxTtva/JJqLE76o7GTWpdAy9z0
	56TrnEVxPWbIBmpjMi6G7FX5ODSNCjFJ91kqdsdCyjNDJZfx+BCN
X-Gm-Gg: ASbGncuW5hf7UPiEaXCfSvCAIUc1rX4O23w6kswu+aLua0VqpwiYp033PZQvKwicm0f
	FlZZ1PEWOCN00N/ToKKsMiZLotXmvV3JI7ID4T2KthKIwijZkpqx6oaZIWo3x9GpjVtt5/mKvhR
	DCDgn5OWXEc8PreXfU2O3Eub8oU8IBypz4pMF77aLgLdUfGtmT8YqeVje+90bjWs3QyBRCKb/u2
	ZjWvh2rSe/EryrJ6OJVI/6JSzSlUVDinJjAPv0OtaO7hrBbikICJrYreS4FsB2w6eFU6gwwY4Nf
	495EjLxNmjpvYWzFjoZZXiyyrrMz5jZ8+hs10Mhl0wxAFeW+VeyCdoVSQhyqyhCyp5RN4XQLSAj
	nvr9V15F1bNBml7q2/kL4ndypl643Z/q6
X-Google-Smtp-Source: AGHT+IGUcqxerh+T/wVsgoYuOmW5NMwA03sfy6rm5jPI0PyjaKAgg/u7btSqOgUTBpqFSduNDpQ4uw==
X-Received: by 2002:a05:600c:c12:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-442d6d3decbmr6039205e9.8.1746737994853;
        Thu, 08 May 2025 13:59:54 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd328535sm50460445e9.4.2025.05.08.13.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:59:52 -0700 (PDT)
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
Subject: Re: [PATCH] arm64: tegra: p3310: Explicitly enable GPU
Date: Thu,  8 May 2025 22:59:39 +0200
Message-ID: <174673796550.1567582.1490595643351017486.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426-tx2-gpu-v1-1-fa1c78dcdbdc@gmail.com>
References: <20250426-tx2-gpu-v1-1-fa1c78dcdbdc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 26 Apr 2025 19:45:32 -0500, Aaron Kling wrote:
> The gpu node originally was explicitly left disabled as it was expected
> for the bootloader to enable it. However, this is only done in u-boot.
> If u-boot is not in the boot chain, this will never be enabled. Other
> Tegra186 devices already explicitly enable the gpu, so make p3310 match.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: p3310: Explicitly enable GPU
      commit: 52dedbe81ee5e99b0d44321347fc85417837eea6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
