Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489840801E
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021573; cv=none; b=YEoM8jfSl+Wxyqwe2SETeTW8mW3zRR8eMBTjepQCsfLEMzwyRzkD4//MWDckj3kdpPYGj3JF/F6l9pkR+DCndzZyiaE1sVa6UueT2pLd30VF+LmBkXqaHkTmFdwAK84Qtqj0W0uX7rykpzcdIPB9W4ueVGgRcN4XyNUdT9SQUr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021573; c=relaxed/simple;
	bh=g+guUpnlFGWlDp3JZPCpARR7uTIE+bVPAD7/mw2K4pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uoXSc7Sie44BelE8Mhz7D2chWaHnzt6Re4cdKbT13OuFO7hicpDcJ9BAagUPlUG5vfLVQ03Jgbpu7O7gO/j5OZ7VYaudPkF+A6kijQ2gPgsaKuvVVTRPUH1QbM+ZZZvhBwM2KljHaC18hquQl2pozTKey73dF1ISVvhFKq6c2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiDaTlWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiDaTlWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5861F0089B;
	Sat,  3 Oct 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021570;
	bh=gRC7sv/ntCQli2SqA31OFgYH6Rektc4dv0GKEnAAlk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QiDaTlWZShXnzTqnNufBr7CVhLkaVn/W5gc40FBXeMD41bkT7g/JVWnfpA+BejnVA
	 vCZ2iiLmhMddzlIaAPMPs49P94sJD8M+gv7UAulJOgJ7Fkv2xINieVmZBWK3ndPQEG
	 ICtUlBTtUMzgrSgXZoYldW3gjeI5t781H9SJThJ/jp1emMz+GgWy0R2U8DfUKg0bLV
	 UIWzQK7g3mLVSPIYPSsam6etmH+hnxvSYm787f/UTm7q7iMLUxXaxR9J5PHAOmy4iZ
	 DtJUyIJIsfsslJaQZnynX8j0GUNm0x2fW0DmCMFWIMZC7j3vg1nl6fu2uyOazyKDZZ
	 81Lv74xgnG8KQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] ARM: Core changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:17 +0200
Message-ID: <20261003095924.1370238-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm-core

for you to fetch changes up to 7b6c372ee6f28435e9c793808933258dd9938bf0:

  ARM: tegra: Fix Trun -> Turn typo (2026-10-03 00:06:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: Core changes for v7.4-rc1

Not much to see here, just a single trivial typofix.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Fix Trun -> Turn typo

 arch/arm/mach-tegra/sleep.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
