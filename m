Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780018;
	b=tVKaGKUfD1TJryxzET9kOfsQtilWZcsIaX4GugDj5QOHB6KlSTKlKAnttYyUolQpekxa
	 qD+k5l06n2QwxblytTrGt7om7hPOR46zQ3G6qGFqO/a7SS+t9apMzFo4FiOEZpbHcjHJj
	 k4FvMLuJ/yiSYfaHRGrdnPM+595SC9nYY4bbwUiCQDoOlnTg//mKt2ugXAh6HQPWZHfP3
	 OQNftZ4jXPwWmmZPQRUMe69rzWkjYK1GHSUgznaHg4XGoo+hPY9aRPQRtP3QWkMXHQ+G9
	 C2Udqe0K7M9Pabtt5oRH3aH593zj3FF4GmRiClPc5mJ57OTsnYjNTv5NEZwaj7Ua1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780018;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=e0HufnCrbwkRENqaUTq+NEd0cVHTOVONsuicA0+tDCo=;
	b=syx5alKkRpcchlieqNEz3tNBAInATZVjbjmOnNYjGEKF40kOHLFMGhvULqQIaceOTFGG
	 EX2G24vJ8eaRSYjk/KONIBE2jKk3GptGqmz/jCUMRajnhxC6OOatmMuvufLVI2LTrv+38
	 rdxPD9qcDLDoWm46unkeMWnTYFDFAprWrokKl/zV4l4VVuKh5jp/xbfxCBbO7RxPCgZOF
	 mgev0EcNhxhm19qyVyxMXOF7A7CC54d1MKVVs1N4qRqhdjDRaxSeskDgJcMx25P5HtfBS
	 goZKfluB8prgWngPjsgreIb3R5dHGbA4daKvXBzrIYfaClKwao7gw2AsHaJ/iUXHWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YImThQys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018F606A324;
	Fri, 27 Nov 2026 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YImThQys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372C11F00897;
	Fri, 27 Nov 2026 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780017;
	bh=e0HufnCrbwkRENqaUTq+NEd0cVHTOVONsuicA0+tDCo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YImThQysX7k1kghRoNxBwwJoK3K6Rv54lPXl8BrwPhuqSIWXig3PU+IUlosY3g13s
	 Qqet1DYQh4dPdq/UAIFNE2BsEu3o+nzrekFUUr4aPvGH+qV3CZidLa1zhXjmCIlubF
	 NfRo/iDbj43YG6TOORgY7nQh5ihhmgB7ZbeApqk6bo1NA7CUgeZZzAGObhge4wlUhQ
	 0kbxi8kFvEzrWrae+ruTBS/N6A4vK8TBsGbiKyOQ6i/Xwbp52X+l8Py8oiG1wKTfja
	 jkfjBxCCtSgilRl23Iifhin5TLZeabMVGXDdQP8/QGutLSFFKg5Y3xtx6Pw2W+a6Di
	 NR9br28eK42UA==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: tegra: Set has_per_pad_term for Tegra238
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106-tegra-phy-fixes-v1-1-b53911c20b77@nvidia.com>
References: <20261106-tegra-phy-fixes-v1-1-b53911c20b77@nvidia.com>
Date: Fri, 27 Nov 2026 17:16:49 +0530
Message-Id: <179578000996.13164.5620056529810127227.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=434; i=mani@kernel.org;
 h=from:subject:message-id; bh=7v7ZzyDswjHlWG9YeCVAqF0yGhyS0CCamtmJzUvcHRc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCW2tT7Af073hCd9HHjD8e+gsM4C0Zagkvwk4G
 YBTWPaYSAOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawltrQAKCRBVnxHm/pHO
 9agTB/9w3/OlGR3HvE16ajlvdAWOnvByjNN6UhXLBmOnTn6y8aZbi7BC8tIOjRwRk4yUqTiQd2/
 36Hg8m9rj0HJJzX6ZZmuPWhLQQqWEGcyzE5F8JGq3rCSYu/bHJjzyf7vFknUnQnmJrsmUSendYF
 IhPqw2dgNV9PkSlK+UTFciSXGngCKKf3dqqnN0101UI1KbsSo7B4LciT3ZFn1sVvjFPFaZk+YQr
 0SC1vuR+H4x4Uj1kp1nV0WQyEgqLJg3qvV4KqyD3T/e8PLvI+bmOwW+Aq6Xir0lpePkSUYBkpfw
 CfhnrNcpkpEtPaOl2PbuYgAhOnDYEhOnS8tt2SlD+GkkjeZd
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-06 17:05 +0000, Jon Hunter wrote:
> The Tegra238 device supports per-pad termination, but this is not
> currently set in the SoC data for the device. Fix this by adding this
> for Tegra238.
> 
> Fixes: 8f56fdf3d8cb ("phy: tegra: Add support for Tegra238 XUSB pad controller")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


