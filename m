Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC03F4DF3;
	Sat, 25 Jul 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997177; cv=none; b=TQ0GD8GZaWIXOSdh/Q3qqK1GnKsz/g0KDLZAebHawwE0Mu+/i17vwxeO/TaBqcub87Sx39L9PA1dFzfMaUSYXka04Jm0T2OJMLB0nh0hcsNq8x3uVH7Sr0iLWQv1KB2VsE8k8UUtXNpwTVB6coDttXOmh1E5DicwW9diCxHYgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997177; c=relaxed/simple;
	bh=+PY3sdTH3L9CEkYJHZ407s39euofR/H2HhdAFTLKjaM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pwiZi2qttsKrwdVearSVDBuk9PDhV0xghX3aFQjUu9JzFJbri8Cu6tYZFeqvVMQv5CpctnEfJmagP0IPJFWGyStNdP99uOIXwBiwPyWmnmhh7WuaaFj0ova1vXDEj9mZ2d4/h95RMx4BVohHfEZ8Ip55W7Hmi01npVq2ioT+zDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOQzaVNZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOQzaVNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FC71F00A3A;
	Sat, 25 Jul 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997174;
	bh=Pr0x0vJNcLlgRmL28gz7fWohf9n6u8dicVfCTydmfxU=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=nOQzaVNZ1Vc99yNB+lwrxfSI5yNH6fJ2kPq+BN8hUQg05gDcmo40JAQDGbRKdU8q8
	 +nzzAA9kUIiTlHgUECL+JteRDo6h9u4UQFKvJe5vrajf63xaIB3ZIbDL8MLPIDC+7l
	 zQv2KNAns5ufdhbR50zkGKY1cC2wwS+hNBZT5QfbT47WARKM5zwBd+jW0W2RrpycfT
	 Y1rEf8kIaJmHGhnz8fUzUrZEFZg7fh2tuS/GoU+UMlndzG435gehISSBSHMen4dZV1
	 E1NOwRw1jAYUQrho2QEEZpZrN6mBXuD9WJ6QVTowdrbvtWRWMQEMTwzaC2rXf4lKqr
	 vJEmMqGhdcBfg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101757.340149-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101757.340149-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: nvidia: tegra114-asus-tf701t: Correct
 trailing whitespace
Message-Id: <178499717160.107055.17561995104215971979.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:51 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 06 Jul 2026 12:17:58 +0200, Krzysztof Kozlowski wrote:
> Drop trailing whitespace.  No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
      https://git.kernel.org/krzk/linux-dt/c/6a5a6cc5e9ad5655186ff289f21db532b44e14b2

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

