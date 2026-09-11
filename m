Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4D40B11C;
	Fri, 11 Sep 2026 10:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122855; cv=none; b=B/MJgR0zrOtIU3rzaKFoh+WfAFJsvhjg+mnuhWEL9xzPozasNH0UecYUVX/AqC7YCgk9zNtrYy+PFmawSP/+sS+RLkGNs7CDDk0uEUJi9OmxQkE7snI+BqR98Or1tvaRp+92lhTridHKYyVTG2n3ugcvPwQmGET56AnA+PGFNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122855; c=relaxed/simple;
	bh=+Wi/2+gj/iRlDfKm7butDT+qkNt/v8bnYE653JzVeT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0CNtLC7twyRJJgeS+1HndBIddy7EEkuBGfdmlfXO61skIz/PupOnjyaBE1U/CkdKn9nfaJIZ10X8Sf5G/mRvVr6jYamdcwnlQbkf1befQ9Kvc6YRi16IxhEkhKya4Rr+sXn0CnMfbeOhz2CxywwDXTJndDrAqgiMGS241tLibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cltanNrZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cltanNrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5CB1F000FF;
	Fri, 11 Sep 2026 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122853;
	bh=gHFTWs67fBGObb2llb1nZghXcJfn6hPZuQiQwH0ht2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cltanNrZVSOQvF0upTq7sVeykK9xdUA8nQ4Kl3lFAQ4tIDP9PGZ1b0DMvHW/El/ss
	 b8cgqnnpuSIsllKddrsXsFIjm/PZpIdvBsA7HVX2YU1Sqsy4PkGHx+pSl0DHAuC2h6
	 DyghNZeMlThZwYx9guO3T93F98I/g10/iaG8sapxJkYgstPvZZWG7WOOKwoostuS7e
	 w4sC07E0JfKY5f5E9ZYSmNao90TwVgsCiyIx6Ey9jGxVZuEu6cHKJA63MyIuZgZpN8
	 hJJZ1x6kng0Es0V3FaJIV95FpOMWFjENM3Acowx6zL4205+7KcxQ/S2q7RPVYJcUBA
	 2K5z0trkyscMw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add the USB Type-C controller for IGX Orin
Date: Fri, 11 Sep 2026 12:34:10 +0200
Message-ID: <178912284008.3590838.1903924603073103664.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910-tegra-for-7-4-arm64-dt-v1-1-52e7bc535489@nvidia.com>
References: <20260910-tegra-for-7-4-arm64-dt-v1-1-52e7bc535489@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 10 Sep 2026 15:52:59 +0100, Jon Hunter wrote:
> Add the USB Type-C controller that is present on the NVIDIA IGX Orin
> platform and hook up the Type-C controller connector to the USB2 OTG
> port on the Orin SoC. The vdd-supply for the Type-C controller is
> provided by fixed voltage 5V regulator and so populate this regulator
> for the IGX platform too.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Add the USB Type-C controller for IGX Orin
      commit: 720ff66b5a00b8fbe86715995b9697f4e955a52d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
