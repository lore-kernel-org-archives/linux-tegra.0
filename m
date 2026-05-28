Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589C2F1FEF;
	Thu, 28 May 2026 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001542; cv=none; b=ST3F1MwKln/hq9cHhkrcj/ddFCbUpt/zPcUD/KynF6gszWf5Qd4cXR1oIVRvO6ejdCfX6tGBFhmJyWRmJMtVv0yWdEOshD1aZJyDBq4jkkWvcmpuzL7loOgYuEVPbwIxVs/CoNVmeRggk+USx9spWU5BCzU0zfq1tcpWfEW7ZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001542; c=relaxed/simple;
	bh=5ifrZwLIoVEquM9WTWncPwEfdCGSa8t6hv8wV3vlGnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b9pvWB1z179SSW7nIKdPP36F6dWq+mLzra7VHfhJxJI63yi0z8vQmc+9r3nHHuj3w/a6+j2s5Ww2dNLMfUbLrBOHTocn/RiNSS5o4I1Y5c+kPRTzl6kcBzaqr7QVhgK5GKw5AsIo5Ccmxys05tLxs0CM6333OFC2C+8vas4IY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ54DL13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ54DL13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D2C1F00A3A;
	Thu, 28 May 2026 20:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001541;
	bh=D7DiZFC+m9rs0TUa2kmuB/E5ONWjaeXpAJf6tk5LF5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hJ54DL13q1oyzgu+NLatQEYrbnn5y0UMNvoSy8ijmk3MPa4qqAeqCgbvkWm8O+Plj
	 FIE9oHywnasoJCt7Y0rc7VklmKIU31tlaXIKxUP1FupiR7i4aQhuYWF3X9SIPsP5zI
	 dPlR3MwQRBS6bMny9BTOcEBPhJglM6uoutZJmrh3Fa/71754sLrUA0qZJMRpDNbF+B
	 gwUKTi0T9o9G2w1Ij2Eflxn02RoqPAoO73AHT/3cvz1fiz6vM1uWL+1VEzSuU2KG1/
	 TZ2hm36E7GEchnj449ZTVFZuhRZI30Q5SEMfs856inQvaUlYREgj/TpkFDwSZ10f4q
	 7nv967GXTck8A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via MAX77620
Date: Thu, 28 May 2026 22:52:14 +0200
Message-ID: <178000152079.187267.3029370685286533529.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> This series migrates PSCI and MAX77620 poweroff handling to the
> sys-off framework and fixes shutdown on the Pixel C (Smaug).
> 
> The first two patches replace legacy pm_power_off usage in the PSCI
> and MAX77620 drivers with sys-off handlers. Besides aligning both
> drivers with the modern poweroff infrastructure, this removes the
> global callback dependency and allows multiple handlers to coexist
> with explicit priorities.
> 
> [...]

Applied, thanks!

[4/4] arm64: tegra: smaug: mark MAX77620 as system power controller
      commit: ec36d6d5960cf75bea780a639db346cac42fab9c

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
