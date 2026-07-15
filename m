Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F027441600
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115608; cv=none; b=b41utRRV27+/pS1L5hZdSp58O4UDTLZvMbdQoAhD9P4BYjvqhd3ar489lKRAUkDcuNDJigpYU58j74w4WRyTwaZFDbqheRYMm4wxngsZUYd+nJMhCoTkIdKNQT1UQWk7a/Rt9PLrhYeOiEEgq6hyx8MeeoE2ervm0XonCX/mjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115608; c=relaxed/simple;
	bh=Bd17ANsm/TkvuoHbXAlhTMG4qlVSaqpwnTVgcOYX+ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t30HzgIX9wnzD118QOwPd8B2tfSwynhD3CZ4Bxs27BzZZ8xHLjaAdcqKxV8SzOa4ggA17qTigLH0tWJm9rLlTQOvc3yq/ul51Tx64AXowsnDVCCLqJrMFHqSeLJpB+7K768EhLxcQBbuVaFifagn8gIBtTNqDx13GXHg0K18GME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rr1BJDkg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rr1BJDkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A771F000E9;
	Wed, 15 Jul 2026 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115607;
	bh=Zh/MPaPUfC98Hn1L2r4+vsqo4zGsfx4A33NeL5sO09M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rr1BJDkgaNC5PyDDi7LpXgKoz9rBijJG8ppj8dS+/CeecN61OWE2dp91cGrFNnGxS
	 0Gzx73Mdj5QJZu75pxureKlpUeEbDqkugU5NzsqpEluEydeTSE05PEvTaGtdiCKKzm
	 SbEszpmdjosifPT4JpeA5K1a8nduMtGubakQ7I0pLdie8iZEWy1i4u7IoLIYbeYDiX
	 mhH+C2aNKg3pjFfenZoLHg5GitA3Sm30rUm/uq4IVrsndErP2EcKnCVnZ+qvT3kDnC
	 m1STbc9851m03OpHPmkHpyq0XdY0DJcBK8Y6PUY8+tGwytnY/EXndjPGS/2NFephch
	 qCI7isEJs2gyQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Don't register sys-off handler for multi-socket devices
Date: Wed, 15 Jul 2026 13:40:00 +0200
Message-ID: <178411559211.297065.8842798855092658484.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715111037.70970-1-jonathanh@nvidia.com>
References: <20260715111037.70970-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 15 Jul 2026 12:10:37 +0100, Jon Hunter wrote:
> The kernel does not permit a device to register multiple sys-off
> handlers for non-default priority levels. Hence, for multi-socket Tegra
> devices, registering the sys-off handler in the Tegra PMC driver (which
> uses the low priority level) more than once fails.
> 
> The Tegra PMC sys-off handler is supported for all current generations
> of the Tegra SoC, however, it is only used as a low priority handler if
> everything else fails. For example, on Tegra264 the EFI reboot handler
> is called to restart the device. Therefore, for multi-socket devices,
> skip the registering of the sys-off handler to because this is not
> critical.
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: Don't register sys-off handler for multi-socket devices
      commit: 74a161d20ef60bb8db333a5203284796429ecb99

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
