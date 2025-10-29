Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD42868A7;
	Wed, 29 Oct 2025 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745482; cv=none; b=loiiJJTVgsaT+waP83rtVAveINkyCpCbV4UH5tWG9REyNpaXoM4npHH2ZS1WAs7wnlRol6/nc1hq9qM6TL+6gcSe3iTBLFMJBy/RiDq7DM3hXyVwEmpG6dM7btY30r7FmRTMnhtdPpJg4O21Bl5Th65ypXqJ0yXGp5ojKcLBCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745482; c=relaxed/simple;
	bh=KvrdxWAGh2gYjAr+RZLd1zfOYJ/NZSuVoSG6qU8tc4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+zoL6PU3a7puMQYQqm1zmWL2oGHodvOx0D4Mgas4/ncfrR6s6rBjG5THuon2JTbNmo35L/EhmepSn739E8IH25CB+p9uXwiMtB92Wp9MarFl9i6YOiSu02BiOasO5kZ9946/MhKVeMv7n3g2AZfQ+T7EqIWghkPHAOriNM2Vco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=iokc/DQR; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="iokc/DQR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 29BF56002984;
	Wed, 29 Oct 2025 13:39:27 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id daCFBIXVt6n7; Wed, 29 Oct 2025 13:39:24 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 37E6E600299E;
	Wed, 29 Oct 2025 13:39:24 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1761745164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvrdxWAGh2gYjAr+RZLd1zfOYJ/NZSuVoSG6qU8tc4I=;
	b=iokc/DQRdh0la0ZBwziE2D3zfNahEuDw7OgVJ7s5cHldlZGVkXPwLnc5oyd8rbtAiKzZr2
	U9FjOhoks0Z5veziX7dYn+dpFet3eUqklWfP0xYGD29lsoOzL2XfdgXk129uPpLn6QyUKn
	auv3YXRVY5FS+oMN6tSk/vVTZ5eoQ9lWNRr9zVyG2FOIUtGr8+eTsBt4iDWJOKC2nyXH8A
	osJcqREeOdktRBlUC3wJY8NUtsggs+UkfEJm+1q/x5e8cLQdq6eHTFJmREXp8pbyfyaiei
	NvkH8jIwbJszdBdOA0ZxpmJDco7eZ4TI/a7YtefEADgRos0p2D6H5F9hqunoWw==
Received: from diogo-gram (dial-b1-161-46.telepac.pt [194.65.161.46])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D54C53600CF;
	Wed, 29 Oct 2025 13:39:23 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: devnull+webgeek1234.gmail.com@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jonathanh@nvidia.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	robh@kernel.org,
	thierry.reding@gmail.com,
	webgeek1234@gmail.com
Subject: Re: [PATCH] arm64: tegra: Enable NVDEC and NVENC on Tegra210
Date: Wed, 29 Oct 2025 13:39:16 +0000
Message-ID: <20251029133916.569333-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
References: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Jumping in this reminder to add a gentle ping about the related series [1]
adding support for NVJPG.

Thank you,
Diogo

[1]: https://lore.kernel.org/linux-tegra/20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt/
