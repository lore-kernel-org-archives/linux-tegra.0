Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108433987C
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386000; cv=none; b=IQr6fFF8/yQJZOi0aCeyctUgBa9fKb/z3nPeYVAdJHq7xCa0MwWMG0RGuQYgZD+GecR85RAadYsjCwB1CPQg+ogY6DEl3TMUebp293VDvE8DBRUfftJEey8VjHnjjDUe4aGvFCKlsS/itEAJ9BtuzF7UdelafJTfnezoxG9+C+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386000; c=relaxed/simple;
	bh=nYlvIjN/vI1uSydxBC5D1E/w7aPnXwHz90IQ3TgTx0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELyv3XBrmMmjifnf7yRaTH8Glelhq2SVQ9G9I2L3YuMiOmw70gDeYxlco2TFjPN/8zSBLzOnvDtVwG4/e5QpiqNr9Lp5IgKXbMlbiL78wNnbp3gjBA/WxqoZk5i6JNp8kxg0JwRNi6azHWxJstdkYWAdVVCHYOwrrgDFuRbh6bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=aTBzuKF+; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="aTBzuKF+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 36F5A6001416;
	Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Srhy9q0CohV7; Mon, 29 Apr 2024 11:19:46 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8C6156001422;
	Mon, 29 Apr 2024 11:19:46 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dHSi4Ua53336TG8hHwkSnq4/HDY6QEuYI57pe/Aoj8M=;
	b=aTBzuKF+EUiphwsqVzbfqpB2NVNGbWGbGBHU3uTCTXQ+twaRx+fVc58Xf9ttlvMJwFaqkN
	jjiN3rDCoEOoM0OT8KqxQCXQ5dndmCHTesV2iJF9NsA7MRTWHdXSqzUaoGPFKvy0rEcw/w
	t+XwPA9KLzvn33Timx5i108V9+U/Bmo=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 444E4360083;
	Mon, 29 Apr 2024 11:19:46 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 0/7] Cleanup Tegra210 EMC frequency scaling
Date: Mon, 29 Apr 2024 11:19:23 +0100
Message-ID: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
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

The second version of the series can be found in [1]. v3 contains
changes only in patch 02/07 where a variable is renamed in order to fix
a build error on some architectures.

[1]: https://lore.kernel.org/linux-tegra/20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt/

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

