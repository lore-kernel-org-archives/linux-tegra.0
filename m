Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA0379999
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797058; cv=none; b=XwVsS7dogCsCp6MelMm2xN5oaZlfFyXZmwbYRaeiYKsZBxg/Gm2/x1OpL/ixFKZv2lBzrd2vAI9DIoKGXW9UHPv75C5SCqMvYqV+Lc8hlnEuOOPVcWpMlSSfohs7uD4GkofPcbhQl8+0F7ap+jefhkRL1liwghw1aBr0bi8PouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797058; c=relaxed/simple;
	bh=kFoVyTMkyFn4pbXMTMOvST6cf5WTQ/PPBbZDBHunAIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGR3wAxH77utHfhqJMZCsVdtD+UzoUS9VRTzEmub8YKXnlJr14KE0L1LZEeA6Z+UrMdW3ENjDkpeePoPSSEjLeE4CTNi9iFbnLJsFNWTE6tylv+rij/SYWoprMf+XcQ9mgntmrqc6nHlMoN5QoGTefC1Qgd4Q7ingcEThtOq2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3YmLtxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3YmLtxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78735C116C6;
	Sun, 29 Mar 2026 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797058;
	bh=kFoVyTMkyFn4pbXMTMOvST6cf5WTQ/PPBbZDBHunAIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3YmLtxdwDDgWlDbmWBKnqV4hnQyybEDJMveoOKUIqNFkYFC3nqXvRHGTuiR7nofh
	 VRQGWpFLEjdVgrVUfqXQfB1NV/a41GVmTmHB54w8+MCK4RE439Q37M1OKI4KT6GrFn
	 DgvEDEJGLy64D5mPOPczZ/aNdrFLFlW2EX+H2ztm+SQIYdjt0ulCXu6/mSx3ZRoM9A
	 0Fe7eoxknTOU8udloLkBUSQO6ZjH6OrQfXWIAYLYVIrbMGOeoq0FhzxiKkOJxjYRZG
	 JfmD2nMPoHNJ6qVR75MXR+fYNau3ERP/809Q1gmuOeUF/ow8GrDA4ffDKZTL2Ylx4O
	 zHb2ia9AX0B2g==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] firmware: tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:40 +0200
Message-ID: <20260329151045.1443133-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-firmware

for you to fetch changes up to e68d494b8946e9060e60427f365107194f90ba0d:

  soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP (2026-03-27 16:30:54 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v7.1-rc1

This introduces a new API for the BPMP to be pass along a specifier from
DT when getting a reference from a phandle. This is used to reference
specific instances of the PCI controller on Tegra264. The ABI header for
BPMP is updated to the latest version and BPMP APIs now use the more
intuitive ENODEV instead of the non SUSV4 ENOTSUPP error code for stub
implementations.

----------------------------------------------------------------
Thierry Reding (4):
      firmware: tegra: bpmp: Rename Tegra239 to Tegra238
      soc/tegra: Update BPMP ABI header
      firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
      soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP

 drivers/firmware/tegra/bpmp.c |   34 +
 include/soc/tegra/bpmp-abi.h  | 4573 +++++++++++++++++++++++++++++++++--------
 include/soc/tegra/bpmp.h      |   20 +-
 3 files changed, 3725 insertions(+), 902 deletions(-)
