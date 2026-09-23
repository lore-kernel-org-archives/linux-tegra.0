Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96979492E5C;
	Wed, 23 Sep 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173955; cv=none; b=OVBL77PFKUX10beFRef24CuVGnxW95jBMUG5N/61kctlUDpN7dF5PcyIGnWrZo8ipjmBH3XvsEj0NNmDn5rpswzdLpqqSfNudF2IBlH6UJFKBAk31297sTvN/iUDkVACcsghY/8USSWtxlVKf0f0fAime7d4DEK2wCU5SPLqWyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173955; c=relaxed/simple;
	bh=EdsXPVl4Iv5QMbLnqOM+E6hfvlUN90rF0l/ZtL9fy4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAf5LcQcF1JMuOyVNZ9Spf804a4CdyXcUOxrCy6RQHXwpyzndB5HiL8q/qTjCkRXcNDwl74mmQ9YqhtE73fwRbh43paG8/Q2WNZ+pKm2PmO5fDPj6zXJad3ITIwOOYUNVGYK3AJD86WvxpXYuWz8DRQEDQ2AXhTJxo30yU+geMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=QFy0RTn0; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="QFy0RTn0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3E8476000854;
	Wed, 23 Sep 2026 15:32:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 1eqcuSnxvh4L; Wed, 23 Sep 2026 15:32:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 614A46003C28;
	Wed, 23 Sep 2026 15:32:28 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790173948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdsXPVl4Iv5QMbLnqOM+E6hfvlUN90rF0l/ZtL9fy4g=;
	b=QFy0RTn0NF4W1nKAW8uImq038Lje1kOCWVUGXP3a/mhMxLScTWsHpI+aalhy6+3MJjl6MB
	MyARBFRx8bC6AiFvRG7YSjgktYCyR29vtgVYuNjytHzqs2K8Ym8qtAc5rdIIU2eERUnYyI
	oKNfH1TShCTQyAuKJCm19UwpBJ9l+cHuBqsFSInPJQqOLP/P9R/i8T2fdPBEnqWqXmbugl
	5JEftMWDBOSK6EWEuZB07dJGH6C3HXWMpxLJdcZYVTtmaEjCbSicVyo4V4Mxy8wYF+AC40
	vckQ4bFlD609cXZR1DkgXk6Cud+q9wJfRD5h/8B+PeqpwlbdFhbHnod3g2/7oQ==
Received: from diogo-gram (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 10A74360132;
	Wed, 23 Sep 2026 15:32:28 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: diogo.ivo@tecnico.ulisboa.pt
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jonathanh@nvidia.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	robh@kernel.org,
	thierry.reding@kernel.org
Subject: Re: [PATCH v2] arm64: tegra: Move Tegra210 AHUB audio ports/endpoints to SoC DTSI
Date: Wed, 23 Sep 2026 15:32:23 +0100
Message-ID: <20260923143223.11786-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903-smaug-audio_ports-v2-1-aeadeb500145@bootlin.com>
References: <20260903-smaug-audio_ports-v2-1-aeadeb500145@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Gentle ping on this patch.

Best regards,
Diogo
