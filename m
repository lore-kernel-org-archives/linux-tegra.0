Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BEA25A652;
	Thu,  6 Mar 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288235; cv=none; b=H87pa1MurhL5xL18TMd6bOZ6/RMtzMGaUcC0thBNeYOrOcBsAef4aqJjfy0h7szv7f7SV5oUf4mrR9wY9Kl4Usb20qs7Sd/nIsdTHnYy03ytdhm32b37RSvuCLw9XDHLZ1+pGQgpM1hoyVGmqKdSPhP0noaxIaTUMPxVeFJFnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288235; c=relaxed/simple;
	bh=oV8hyuLlA5PGqTkENu/a9ltQ1UmevbTI1lsTJsvT4nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5Y3H7+WIjF/Jz+VR1w1ejZjDG8jx1zFXetjwPK+Uvd1JRMJhQMKvjMP/6fgWGsn/EqDkpSeZY5LfAROvfby9aBtNan6RqVJOh3d9pl6jF5rzBG/QXCkOdgrTE3h11MY4otVnzW1SExs8D/0CdIjpMpCmKVKFHPYK2CxHLrYLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZBT4JZk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZBT4JZk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bc48ff815so7176065e9.0;
        Thu, 06 Mar 2025 11:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741288232; x=1741893032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjrt17JBvJuhNsbcwVa1ka0lA6TlmXZsKVnB1ivDePA=;
        b=TZBT4JZkPwsMiGEfPxibjb1glvhWe8dFXIAoQK04uDHaGH5Bxt8lIfCMGeO0TSb1oJ
         hBuQjjbcKi2UjROIvQqKzc4q783KFmtFgGJxD8n7CANlhQ7YgLv6nWgS4Qpv1l++vtbk
         CfFhUVy6Dda3vtF1QpMppY1VJkKwgRFehE/XRNjQfvDj4Pjsg3Mp0dh4Kfwj+mZdoq1V
         MGvYTA7kkTW7cSygmGHftpJN4IMFvMmdqm5IzQ2kfipOqOc5nRtuzNHyf9VZCGChg/i0
         Hzlfa2eKdQvgHZ0eZHg7hsYVHpve6z5xPZ1RcAtLhOfCLe6u85xm7zxnRQGwpU2a1k62
         cJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288232; x=1741893032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjrt17JBvJuhNsbcwVa1ka0lA6TlmXZsKVnB1ivDePA=;
        b=f/XqgNY+qfH0s2lSXjGaI+tyb/Kjcn1VwOawgusNjrsNChdW7ZUEbCM8BZfYrbyKVD
         4sQ4mZdC2+1t92/1vSCF+dv9xilYZyFvvBtPTD60mChm9Mp5E00J5uO3I4gOdU4TMpU5
         ct4Uj7Np8QzG1/y2TXj9/Jh+N7yQ+hyJMMsr62IL27HusMu2X3kDQ+9XC1qk/kuX2+Ro
         IqMih0iZCcabtMxODKxjWO/l12q7kHe01Wwn9d3f/U7D9upEcBzvwRDyGAPlG0nclh8t
         f9NERgxwa8yTS0CONxRQpHE9i3ozm5khlj5u/M2HQQ4UD1o34QgiPWdKRSs9uC05OMMf
         Z1NA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Pcd/Z4jCqNB8JAOXvN2hLdRg23H951ndJxk+UdOJvoHqXG/oDl9dHq2WxIimVrteXAsLHT03dGqVN4k=@vger.kernel.org, AJvYcCXnlq/Gy7o1BssYYCdUZQ1dlfDbMdGV/GMq6+zoK5MakSSYty/nABfy3kNkGErR+xehtqNxMm1tigACkKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL0dCM8YFLGgzYwu2+azUelRdxIojSoj5v8dpedByqACIgirxg
	C3chtGAEcVMB8F/lwBVP9IphWX/5vEnJUESsHG09gBqkh3eNnp27
X-Gm-Gg: ASbGncscZSInzy0RKTadZbjdRftJH2E20u7SxaeijX2kJtm455YVLNsqQJEzBkBCcLP
	jJ1CF1jez5AD+LvgzjCFFv4hmhYQBeh8hHK7k7MHbRGcctYMqzIhJS4aMtxMJ+EItBv1FLpvZX/
	iOo70M+7ab3as3KY2FazbUWCbRorcypnLweRZ95pCPSjmqi8+PD5lhMC/TV0UdJ5bGdnhD9vDFk
	ydgzrgCxo8sroOwykcfXH2IAiJedj++p3H+zbooARZqusUJdZ8+AmPBpaLfj6MdX2bq1D2egIo6
	4buoMO5JCm4TYaXIEtDIKRHq4uMrPtrdsjZLoyxs+O/jQtH2QjZGK4EYJB/pC2lbgGzdxYSocVp
	roaVFT04hg1iSIRrSHMcZ7hUEGMHeZwxsKbvO
X-Google-Smtp-Source: AGHT+IHl5my+4Jw09Cr0qE6JdlC8og7QhNPFlC4yTy6FzLxXNp880EZuro7EiKsKog1QP0e7H+TucA==
X-Received: by 2002:a05:600c:6cf:b0:43b:dcc8:557c with SMTP id 5b1f17b1804b1-43bdcc85609mr31000225e9.13.1741288231597;
        Thu, 06 Mar 2025 11:10:31 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42c5b33sm60765615e9.22.2025.03.06.11.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:10:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: tegra: Small hardware enablement for Jetson TX1
Date: Thu,  6 Mar 2025 20:10:27 +0100
Message-ID: <174128819704.2033996.10633125430100883471.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
References: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 24 Feb 2025 12:17:35 +0000, Diogo Ivo wrote:
> This series consists of Device Tree changes enabling two features:
>  - Using both TCA9539 GPIO expanders found on P2597 as IRQ controllers
>  - TMP451 temperature sensor found on P2180
> 
> For the first feature some preparation is needed:
>  - Patch 01: fix the enable GPIO line number for a regulator, freeing an
>    	     exposed line on P2597 expansion header J21
>  - Patch 02: add voltage level pinctrl information
>  - Patch 03: fill the TCA9539 DT nodes for IRQ controller operation
> 
> [...]

Applied, thanks!

[1/4] arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      commit: 67aa377b37f90c6fd8f6e9ede68e1e11f5def2e9
[2/4] arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      commit: b9dd925d67d2d50667a2f3be275996dcca03e485
[3/4] arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      commit: 8f4897dac543a571a3dab432a3fcdffb12661f14
[4/4] arm64: tegra: p2180: Add TMP451 temperature sensor node
      commit: a2d23ef4c179aebdcace4c2406b798cdecf05d35

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
