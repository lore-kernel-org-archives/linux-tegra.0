Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3249BD92;
	Wed,  7 Oct 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372888; cv=none; b=DapzEl1tGA+dYviJmA2RWCgZ6vyK5wr/S4vMh+nt8NUs0SYl1bA059WUBadV4cmfcKxPOeBgSdaT5i0C0c7Wny+ktoe2lf+FiCcfqrv11jXnzJ3BQzVv91hK9HBWFR77+ryWV1dEGh2+HpoC9tXWebfu31ZY6pffX1mWVpqJqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372888; c=relaxed/simple;
	bh=Ws6UWbSyirGr78A6A4olKIaj1QOQ71/PaeuwdgTHIbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Axh/xmR35WVQCxt5HvsolFz3q5AsIdybls10Xx9+xbEqcBNb0s8T3+xKoT+bnixq73H5ka83x6jdwZnlg4eM4TNFcMJNt3R+fa+0CtBryLrplD9W+MA1T6wv4AmmdVz5kJXbK/f8iaP/qsgef7VuUWgYIAf/R2TN5GQp+Ysk7S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djlMORNO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djlMORNO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AE41F0089F;
	Wed,  7 Oct 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372860;
	bh=ICWQdx+9bafScmLX6rIhC1GY4bzyBO4kDfsgsL1Y4hE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=djlMORNOidZdcrEG0KV+L9n5u6utPmDDRyLDPab9FhvTjvmtcIv9QrNydF5ln1pjx
	 1LcSo0FcVcWRXibhNXbuHVTN1TcRaDlb3XUpl7E9aQls8UiRgvKtkCo724osPMglgO
	 3B3/3uMSECP7KsAUZjEHkG6Tl3Cj8OtvGW4YxL2659ernucfITTcVSPQJn93IvH7Ff
	 +A62H/7Ue0L2fzV1vuLLz0UFyBcb8w6jWmDsg4AzSSsRWO/lxSd2e7kow5hEeobE6V
	 16aIlE4h24x44TpvDVIJcRJtzV3k4rBw3t6H6V+9PfZOX4BZ4N7WD4mmg1eJWEOOcb
	 XRAXX31jv5yeg==
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
In-Reply-To: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
Subject: Re: [PATCH v5 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Message-Id: <179130203894.150114.7116075753773766038.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:53:58 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ws6UWbSyirGr78A6A4olKIaj1QOQ71/PaeuwdgTHIbw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxi4zq6VJX3p2Ui13vHE1qMW3TC+Bl+6RbhV5N
 U5UYK5AyziJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYuMwAKCRAk1otyXVSH
 0EvSB/99Vqk+6H5hVnI9jJhm94CuhImQktNRO1BGb0nD6bqymRjT3zBlJ3MidWlZh3lwhurt9nC
 smDUEJkIh/3bqJnMiLsrFQ0yE3TEik2gN3xcaKmtmvxyWoWrcARcZF4Imxrq/tIYh7t3WSNAuQa
 CSyi27ZGKO7itOlWXatafyyBlO5TJWXD28EeORIzyyaMTYnjiXwlTavDbYkcyMXQYGheWB3ZXq9
 QX1C6ZPWvuoGi9RqMsg8uKCUsj1XbFaE3gFNqBy4koDKUMmxnPivAekFoW1DoI7Dh3/7C8bI2ag
 6L6l74d3CF65uDOFXj7zwogLjVIxjjE7COwthJr+szfRPqp7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 30 Sep 2026 00:59:41 +0530, Bhargav Joshi wrote:
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

[1/2] regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/53063f38ce08
[2/2] regulator: dt-bindings: Reference Tegra regulator coupling schema
      https://git.kernel.org/broonie/regulator/c/27321a6290a5

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

