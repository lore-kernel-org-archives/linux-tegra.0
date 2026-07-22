Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEBD47012C;
	Wed, 22 Jul 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708616; cv=none; b=Mz7nL5a7GTo0RskRJl3yHErDJ1bw8yB/LEA/zoUyHtzbx48jaJRz9OvIE+FL3hYtDmmbMFcT6s7SRPZBbHz8QzHNaNNjoBYqzjxek5DPlJ68xZGr6RmDST92FKAVuB0gK00WiZyQ8jlO3YDHqwT0BmWXpECFuNUBGFXgCiYjC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708616; c=relaxed/simple;
	bh=kcpGza4VCAh+DAZMhYgio4xXeOncg0h186tx3kJfB7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+VBgmDgi30ofCWD73U2SPE5m4vuhPMMAmuucET8Zcx4WSySVRqdolsPjxdsg1zfO75ug8rwTiSS1s7PsHuaEXeEP+1Rt/g/5msGqgpgz5UwxbEAvgVruawIRES8Mmx5gueQ16KJ7HR8d2jNwBjW5pMPuD5KpF2oZP8jB1L9TbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/Jb9GJs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/Jb9GJs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735B41F000E9;
	Wed, 22 Jul 2026 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708615;
	bh=A14ppm5s1tdrlsW/OlHvzkknoaEf+T+jw9oz7qfeSvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/Jb9GJs/idWGsjadocqbEp6fF0jbCsip9MABnnd6HtnhvyGdIsSr1hkRxIHVvH9K
	 RBbCEtRciFzLvXKQ43w/l38tbNC29xgYOqSdXImJ6SiwF+b9cjKPWejq/fDhFfpPw/
	 2RV8un8hXB/myo5CkB83QDucwlPp1MVd4hbDanUa3jJLdkDWeBbcNeQhkAKMEC+x3Q
	 2ArxToAHEDeMqTjSoeeMY2kGzM0F2N14Xb7HsmBYhhaSomANRe9j+yk6em6B3lCBTK
	 eD7svQwQTV98imDn5ZNpjEBg6sEIlMHlxj6URBOWl4no5j0zYaIMwVVGA7G6OUAf05
	 exXHnJq01ONVg==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	james.clark@linaro.org,
	yangyccccc@gmail.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	sdonthineni@nvidia.com,
	mochs@nvidia.com,
	nirmoyd@nvidia.com,
	skelley@nvidia.com
Subject: Re: [PATCH v5] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Wed, 22 Jul 2026 09:23:20 +0100
Message-ID: <178467005826.101695.3006121587111968763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608234135.1856911-1-bwicaksono@nvidia.com>
References: <20260608234135.1856911-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 08 Jun 2026 23:41:35 +0000, Besar Wicaksono wrote:
> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
> in WFI/WFE, which does not align with counting CPU_CYCLES
> on a programmable counter. Add a MIDR range entry and refuse
> PMCCNTR_EL0 for cycle events on affected parts so perf does
> not mix the two behaviors.
> 
> Also keep PMCCNTR_EL0 unavailable to EL0 direct counter reads
> on affected CPUs. When userspace counter access is enabled,
> avoid setting PMUSERENR_EL0.CR for PMUs that must avoid
> PMCCNTR_EL0, while still allowing direct reads from programmable
> event counters. For 64-bit userspace CPU_CYCLES events on PMUs
> without native long event counters, reject the event if the only
> valid direct-read path would be PMCCNTR_EL0.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
      https://git.kernel.org/arm64/c/49f2413f9b55

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
