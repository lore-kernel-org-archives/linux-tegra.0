Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4F7EF1E
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523539; cv=none; b=djWrOd9fSBmynCkFvYcEOlXQaPUCGzhNH3ZsiNcAofCcgNUtD3acjunO/8DfVALZ76kCAoilklF1zK+BOSH27Yk6zWEjET0554J9YhIYIA/mYA/tq//SSk+D4xGQw/qu2gjtLuC8MolBnYigphbtXFpkJF4360+nOqH/lnecxes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523539; c=relaxed/simple;
	bh=F0S7wPBUytx3gOYzjC6Yi7q3IDgrWFtW3PnwnoHuauA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gu1sPNUwViMmHltxiEhZIg84Nz/PTI+auaWV3tD8pjzUKTaD6Q/CH/FYnMWOMR18i69FGBT9bNaEJpR9FRKZMxZESciltWStZ99mhUC3RC8PNn4u55xzHdF+ysbc2urptwIGsXp0t4gjiRKinmwwwJelKIGzhSKd+qA/2jzyUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=P5icrJGJ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="P5icrJGJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4E63D600540E;
	Fri, 19 Apr 2024 11:45:28 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 0PDeVE-0UZlB; Fri, 19 Apr 2024 11:45:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AF88F6003C2D;
	Fri, 19 Apr 2024 11:45:23 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttw3Ue/vbZRWMAvB8c+cW311+TodjYmNboh5Y5n7a8w=;
	b=P5icrJGJ+KEVGctyO7q6yPZRZmvszaVvcCRpdq8QmqxJRiggY0OLBJzENJ0Irrpxe+CATj
	2dso1oOYgRRjyiQegOLh6BJ3G3hSRdm2vtcM9uOFmhsOPATXIBvHgHIU2oeP57p6cAaG59
	Uo53I2nxuTw3cdvZO1HFfSSRLGg4SHw=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 705593600AC;
	Fri, 19 Apr 2024 11:45:23 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 0/7] Cleanup Tegra210 EMC frequency scaling
Date: Fri, 19 Apr 2024 11:45:08 +0100
Message-ID: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
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

The first version of the series can be found in [1]. The changes made in v2
are described in each patch.

[1]: https://lore.kernel.org/linux-tegra/20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt/

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

