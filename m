Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97433E0C44;
	Fri, 29 May 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058520; cv=none; b=fJ4k5NqWartDK7o2EKyrovxdNqPRYfZdYfmfeEhHiEqFtVY9tUrdb0c+JUFkBngYUEf545KPKNTX+esEaIEdPHRGTaw3JDf340koRGeaX+jjY3klICHFyuER38fO2Pj1AcVtPDKX1NPdXF5u7dCVHsOfsNu2PE052ooQ2Pbjn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058520; c=relaxed/simple;
	bh=IY+qdBkHsef3yNkcQoNwuRTer3tatx3BwW3oJBVdt94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTtvLWtfiN72E9bJTFXwmhDbpJzJEs04dSB2KHodw2WhDiaZ8PR24k7EcST3Zr6su6fhQIXf5Jb+HHwh0NsJjVttBo2pEjwrB3Lj0YbLmuFrjCYr2ePakk84qjTqAp+2uih9cWmxAvhYYpYu0Nz7L5O3vjO8GoSdsPzyHF53Gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llpx4sDk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llpx4sDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144331F00893;
	Fri, 29 May 2026 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780058519;
	bh=Esk3CLPsaIaahs9LwO+d9yN0hthIVEveozPO6UHC07U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=llpx4sDkaWtnxV0dms2kZnf//OGq5aCDrogzWtw4FTh7LPVnotYSWAOjziNmQ4ofX
	 aEs5zcX72YwMcXmQmBrPsZc7drxIA3+LesfbpWvluss14juE0B8Kbc0DoZ719gHGJF
	 1L6DOUxUCp0zf7BwRrGSnoGKy0A7gObCg0Wet10gpH+VuZ619bPcuWNeTP29Z3GNAB
	 pZs0H9lRERO4sgtZxNFx1QZozAUf5i+AASjRWTQYbPNX52i/yuyt5PoINvlxopTg5N
	 wEbG8NMXF0wqsgteITtw7IcNgdmd4Rtt06qBjt/vgXKuRQ7GgyjElSEQusPgrvbT3b
	 p8l3bnN1J7x1A==
From: Thierry Reding <thierry.reding@kernel.org>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v2] soc/tegra: Use Arm SMCCC to get chip ID, revision, and platform info
Date: Fri, 29 May 2026 14:41:56 +0200
Message-ID: <178005851026.3494282.7384190181537594016.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260514053041.2402379-1-kkartik@nvidia.com>
References: <20260514053041.2402379-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 14 May 2026 11:00:41 +0530, Kartik Rajput wrote:
> Tegra410 and Tegra241 deprecate the HIDREV register. The recommended
> method is to use Arm SMCCC to retrieve the chip ID, major and minor
> revisions, and platform information.
> 
> Prefer Arm SMCCC when the platform supports it; fall back to HIDREV
> otherwise. Behavior on older Tegra SoCs that do not support Arm SMCCC
> remains unchanged.
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: Use Arm SMCCC to get chip ID, revision, and platform info
      commit: d79fed917b35bb689d82457200f95e1939e5811e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
