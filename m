Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD87FBBC
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656319; cv=none; b=cublnJE/b4OiVNmUoPBGYog5/kLuu814aEEQ0XN8Hf2ULJ+kunbym5eOq0JM8krm1SOwq9UKf6kP5VO+IraMhvzqoVSOWlBuPWydoFHjbWi07a/0ieIhfLQ9ScJxYPZqpAKkxbVt7suNamtSCStKM+cvxFCoz7AIkMbJzcICBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656319; c=relaxed/simple;
	bh=gj11ZvrbBhsrVPF3eo2W1hemj5XBftLAz6jyq7k+1e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uqj6a8kRp4AMXp1AWrRPQzjADU/FoflGTVAfFZpgxxufMsPNuo0InKwAB4fEBwJB/0tM1G7zjtpAScLqoCy1X70bMDM2tc+alxrTbAXCZLSeGJVaL2o9QNjKenOGLwNX9MON3q3dwVa6m9v7Ee2QApvE8LB4K6TJy8MXUtgzGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=MtRFwmSx; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="MtRFwmSx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3227E60022E3;
	Tue,  9 Apr 2024 10:46:47 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 7s50JcZHp-tq; Tue,  9 Apr 2024 10:46:45 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E913A60022E5;
	Tue,  9 Apr 2024 10:46:44 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1712656005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xbezFVZ+FOlhHrNZwkPjsqCHjYwh8S3jNZ7nJXrK4AA=;
	b=MtRFwmSxdzcp8BzK9yKVyUos/VahxbEPhcZzrdCSfQijiL+Gn/iG1RNk3r5k5sxkYZ7A0L
	Fz7FhT9P87TKuliNSRSoIkIS1/duJ8iX/fg/qFyd8uJJgyRbz1lwJODw+6vcyos9WqrPwg
	zqIcHZcdOZaFM9HKiqeZJhintvXlBz4=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A15F1360030;
	Tue,  9 Apr 2024 10:46:44 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/7] Cleanup Tegra210 EMC frequency scaling
Date: Tue,  9 Apr 2024 10:46:23 +0100
Message-ID: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series consists of a general cleanup of the Tegra210 EMC
frequency scaling code for revision 7.

Currently the code is relying heavily on a function, update_clock_tree_delay(),
that is responsible for too many things, making it long and confusing.
The general idea with these patches is to simplify this function and its
surrounding code, making it more modular.

The motivation behind these changes (besides improving readability and
maintainability) is to make it simpler to add support in the future for
frequency change revisions other than 7, where we can reuse a large
portion of the modularized code rather than essentially repeating 2k
lines of code with minimal changes.

There are no functional changes with this patch set, as it is only meant
as preparation for following patches where revision 6 support is added.

Diogo Ivo (7):
  memory: tegra: Remove periodic compensation duplicate calls
  memory: tegra: Move DQSOSC measurement to common place
  memory: tegra: Reword and correct comments
  memory: tegra: Change macros to interpret parameter as integer
  memory: tegra: Loop update_clock_tree_delay()
  memory: tegra: Move compare/update current delay values to a function
  memory: tegra: Rework update_clock_tree_delay()

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 427 ++++--------------
 1 file changed, 84 insertions(+), 343 deletions(-)

-- 
2.44.0

