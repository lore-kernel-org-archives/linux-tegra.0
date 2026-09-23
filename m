Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86584772B4;
	Wed, 23 Sep 2026 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199693; cv=none; b=lUJuoekOk+TNRE0jZ9WVqEfZXU6afzR7SsBkqcH4puol9p4+JvKSm1QNTIyhlig2hvy7/ewwwBNNMkAsAf5AeyhLy1yu35yCuKYxIm4RpYV4G928PWNoBpUne8TAi50fZD79Ld80yjT2ZlEhfblmY3e0elLvAd2ffvjZTU6r2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199693; c=relaxed/simple;
	bh=cxytcft0MIEYnG/UmdrJFQL8zdA/67vEeLTKOBIRh18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dMbTOJAjRyhLqagUoz9f5QizFCkBVUbzYRyP5zCECGCgGI7EGkk5rJFchGVhSeMrSuR01TUs8VLa9eRPGuq0JkS8aUyreG+UwroPrexHguDeqlIpZmf87DIB2IuWrT0DjayqeGLniYN+6dnkHo/r5vpEsaySTH8uf29DBpljWJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiGLT2NX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiGLT2NX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AE71F000FF;
	Wed, 23 Sep 2026 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790199691;
	bh=563gk/yiaP7ArWTAW31zhh8Y8A1e1BfEsJg4wlQSISc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KiGLT2NXuI4bUCnur//46az2PKnjF4hJA/LgXkFGKvRIBAdKq4hYv8d5xjy2bQx0M
	 pL9SAAUKVoWMDqvzcTHKnmdZh+EYzgpu1N/zVODynfwNbzA9HaGrof8I1/DP4Pa2Bf
	 wFnjCXERayDccIRGuxOiaLxcPd94IGaUC5GE7aNpUNmKlRBF4ykW9C6/YACdHjId1k
	 dh0m8DHxdSgORe4Hm8MZfUSeoV8+Nl5+g8ZE6ePEgx1TdQOadiLjzyS+pfJnN8Nr8w
	 L2C2AFMNMpGcYzgEOY2X9BQ1ighTudRwStl4HNXaUunAntI7N9eYdpm3bDYYnyy/rk
	 /IU5/eNTpWAmg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
Subject: Re: (subset) [PATCH v3 0/4] regulator: dt-bindings: Tegra coupling
 DT conversions and cleanup
Message-Id: <179018558597.322763.10393128777680346815.b4-ty@b4>
Date: Wed, 23 Sep 2026 19:46:25 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cxytcft0MIEYnG/UmdrJFQL8zdA/67vEeLTKOBIRh18=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtEeEHEm70eqqKSXfknvWHM2+JnOHlaD4cIQiW
 biTLzC/8uWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarRHhAAKCRAk1otyXVSH
 0EeaB/9xZ70qXjYZAww1XceXmFFoUDL3CRE7G2UX6fWQzOE+6Bhr3aqo6eWpKXrodRxGcf5NxQx
 +Oo3IVN7UoSdRQ5SVkJwGoqPjo3YKRPupAUCvLWBga7eUqdxil8lyvT8bndFrXAGlfCCSr6dJsY
 qNO0Q+peKlUGKFJpeeAfLrOYkPs/T6EYby2vQealkfTaSSHnz5bd+fxMz6Gzm8Vwh8ABcsHJn/p
 e7AiVFfuicMEAe0ICfSSHw/CT4aeVendNRuyt/UQnqRc5IfCYe8gKPfk0Qf1Ul4V4oszu/fU2ld
 j08hV/GjY1Tc9Qx8TfxZ+nSdbZaSkxWqAUlS62ccw/LptUJg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 19 Sep 2026 02:31:21 +0530, Bhargav Joshi wrote:
> regulator: dt-bindings: Tegra coupling DT conversions and cleanup
> 
> This series adds a shared DT schema for Tegra regulator coupling,
> updates relevant PMICs to use it, and converts the TI TPS6586x
> bindings to DT schema.
> 
> Summary:
> - Patch 1: Fixes existing TPS65910 validation warnings.
> - Patch 2: Converts Tegra regulator coupling to DT schema.
> - Patch 3: Updates Tegra-related PMICs to reference the new schema.
> - Patch 4: Converts TI TPS6586x to DT schema.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[4/4] regulator: dt-bindings: ti,tps6586x: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/05a3330f490c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

