Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20168221D93;
	Thu,  8 May 2025 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738924; cv=none; b=TpZ9KVNyy8MLVmZDtXtVaIcGOZgABaMpwMoot/ptd1Crncm4vFC9QgKc9ad4GTlmqtJch7cVZUczyklN/Fu4rdEM/mYzXVIGaa2XVlIpGoerMUIZctUelf2zkKFcuHJObn37g6PvTTrKtowu+l1cqJ7k+Em0LLe4ZIEM/CGrvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738924; c=relaxed/simple;
	bh=EWBFvjdnOdoxhdIEmmAGXksGhvzynAbLrEf+nB/Livs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjAgFqVL1bI+nYaW1yaaFMFDDgjgF+LAcIXp0FA7LHNI36qEzBYf7UT2C6Sw8T3u2qV1szDgQcp0+64sV8YbrjJe502rOpO10Xvc80pKJssHMTpY1ek8MVvC/5abo0KfYn121j31z4FFwbSzcuwX06egxOMuDKEpALRjrfPrHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If1PCeHq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If1PCeHq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so188089866b.1;
        Thu, 08 May 2025 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746738920; x=1747343720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfYVLc6BGMOVryu/ia2E8TfwPR9Hmho8hFKR7FjCmCg=;
        b=If1PCeHqg7No65vivObiG89mj+7NBVG0LWgqvGzXNBXsVwSsqBhzC/FsBObwlGqmFn
         7Su0b/boYtxbTLukrvsFxwrssANy47fu1kg2J3OA1vy4MnFuC4BOSP1Qy5wuHXpBqSvt
         /4FwCR90oTESvziYN+mJLbkB6EdPNsbyIFNrC2aa0IVzfQPzqdbidz5UYOPhFEO9CgTd
         73U54xxMMb5vdRDE+ukgQOtov31JtGEHEHcCy2oUrNAjHxZzyu0pTbNrCyZA2fAk74OU
         jzzTqZvCNWhesp2pkaS4bupnqT7GauN/P6bdvqu60ItjKdBc5plWiwQCxVbsIq76TBMh
         J+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738920; x=1747343720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfYVLc6BGMOVryu/ia2E8TfwPR9Hmho8hFKR7FjCmCg=;
        b=T3HytqSYGNBA6Nwtg02WUYpPzFT2R7vZnn2O5D/MzkindiVBjI3MQTruZDVQKvcWnN
         KJ73MUR25JBlsE1LmcPNR5eT5y9x00gs72R7MrZl2TsVK21AThV+tA0bAih0qCv2rUTD
         yaW/d9k/M8+NYKdJOjf+AJttRMntFlCJUh79la99n+ExNoYbEYQdLR62eWCRt5LuU8jR
         RqWW/6amIA0mF9VTixDzfdJfaW2uoaV53ZYKdFE+H3AL0dBO6Uucakv9zOpNyM11rTt+
         iME0lNIy+cV2W/CUtMoIqRzx84rSkNawQJCUIvY7xd7oa/ZDHN9nMb+bdMEA4byznd4j
         +FjA==
X-Forwarded-Encrypted: i=1; AJvYcCVMbKH+HHQYbLIqV1cz5IzimYTT/fkN1W8I4UhuTUeDZsJtdBuNU7bfhBoOy7EXagSEPCPEc/wF95wAWKY=@vger.kernel.org, AJvYcCXjSO+1lZyrEZSTWPGU23af3PsO+yZ6a5blCTQhelTJdwHKDJXGpDMXCDW45gQbPM1F+OJoen8yIRfvh7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQmOzmm/k6hMpqC6gXtYL4s5RXDiu6yn2G5b+KBpXs3z92+kS
	4BQKhM41YJvI2/4mBaxkO2rwpYRbkLrHrJtxEjKHGEOet2qhjfQu
X-Gm-Gg: ASbGncs+6HndjnSQZLRZl1fBdw20woiW8WsiszKMOycp1hhKJILe/2/GVV7b/8JjfvX
	an4x9Eez1ODocEhWinRkBN7aPHjSFbYVVPL5t/RrUDcrl0u0MtuQ//mSVud7zn+aUUJBfFBmf7s
	NxU4oOgvMjedXVsi5R3k8bphhPnlSfnkjLNuS4Oyar7ko1JPj8AdrPmZRa3mlnJHR8pMoyovVgZ
	JO+GuRv6noqSzIdNnf3vM34r/iBbN+IFmxsup6kApQzG5tSmWu8fUtJxa/7upKkVGOLsl4SUXwC
	PBAFsXdAQS00ir53UQPC9US0LSiAQXLj6fXvyOjDclgO70XEoxSfZlxrpVnLm7B9iFVFejjHrFl
	UqrGX/AnPj5/LEPOuw06PcgLuj6uaglTl
X-Google-Smtp-Source: AGHT+IGkykTdS50dHzf6xiCzsLeqjOe6fJtcxAhMftSh9zDs01B/+V0GsQ3YDjZ0oLGgWoTbEwaKUA==
X-Received: by 2002:a17:906:28ca:b0:ad2:1d12:fd6e with SMTP id a640c23a62f3a-ad21d1301b5mr28272666b.17.1746738920032;
        Thu, 08 May 2025 14:15:20 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad21afc1c2bsm32009566b.175.2025.05.08.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:15:18 -0700 (PDT)
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
Subject: Re: [PATCH] arm64: tegra: Bump #address-cells and #size-cells on Tegra186
Date: Thu,  8 May 2025 23:15:14 +0200
Message-ID: <174673890825.1569748.8819625394051728607.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com>
References: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 19 Apr 2025 22:30:31 -0500, Aaron Kling wrote:
> This was done for Tegra194 and Tegra234 in 2838cfd, but Tegra186 was not
> part of that change. The same reasoning for that commit also applies to
> Tegra186, plus keeping the archs as close to each other as possible makes
> it easier to compare between them and support features concurrently.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Bump #address-cells and #size-cells on Tegra186
      commit: 9362175259281231e911aaeeebda833931aa5dfe

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
