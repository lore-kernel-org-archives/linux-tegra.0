Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2F1A9FA0
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021309; cv=none; b=P+s8iwkoplpS/uBKJ8QhaP+EcM9Q56cc7Zh5DLwP79Mcw2n82ZSQWvHiklpVavXag2BtRxg2nz688Ab/2mn8WPWgxwbYGV2lxzGBuB8vOV1dIgQou2XOcAGizmouMj7yF9wh7wk4gLf6woPxtXWzY4aFDzLiCHH9oZQZdLZjQgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021309; c=relaxed/simple;
	bh=310rowxUYBt9DTgJfv02UgGLgemAfbaQHLrW+eXuPW0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h0qzMX7YyPXOPYOjXcLpAcvhQ3T/z80C3AEEQvp9NkSGe8pAsdtf7S/kvg1aKPWxdVYF9Xd06HmHkH+mUREyzfh74rsMVB14tEHEf20zjvb/ULV4q4Kub/XcA5WH7EYwMn0Fb8Wko7HLwn/sVoTytPVuv74jINQFLY+gJqsyO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmT3xio9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmT3xio9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F381F0089E;
	Sat,  3 Oct 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021307;
	bh=PV8rKwcRKEh0b+cTNhRBla7SbKxO8bHXM9Umtgo3gb4=;
	h=From:To:Cc:Subject:Date;
	b=AmT3xio95qEp8SJcfk3O/P1waMVMB1JfPeSsdq5rBc9nW+Ef3+jjgJyVT6te3/qgQ
	 n4Kfvo3NCqIQxZn3WNSA1vyxjAmLZ3bV0/oIL921ZJfJoJ2mZkPA4YHtPeBHoNGOAU
	 C11JiBJWUlN4d8zv9wsUYBNBVrGBLk3+FU39xEdCAA1jpD0JwKEJTrhp+MQyXzHAeb
	 aaszQqNY2rdGsJqZQEdy+Pw1r6Wave9XKOd7RXdj8CWO4io5XDO/E0cyGzTXCSY2CC
	 Ow1vAds/2DU7a793FnNWe2wFs8UJf++gwoc4ArsFHJNEXmDbTgUjx92XBjUnw32dll
	 Qg7xiAf4TFa/Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/2] soc/tegra: Fixes for v7.3
Date: Sat,  3 Oct 2026 11:55:01 +0200
Message-ID: <20261003095505.1369507-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-soc-fixes

for you to fetch changes up to c5c95dbdc9011a56359df4dc00be829bbcc0b036:

  soc/tegra: pmc: Fix uninitialised clock rate (2026-09-10 14:40:22 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v7.3

This contains two minor fixes for a missing newline in an error message
and an uninitialized clock rate used during suspend.

----------------------------------------------------------------
Jinhui Guo (1):
      soc/tegra: fuse: Add missing newline to APBMISC error message

Jon Hunter (1):
      soc/tegra: pmc: Fix uninitialised clock rate

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 drivers/soc/tegra/pmc.c                | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
