Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05A13E41D
	for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2024 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475901; cv=none; b=DgL1ccg30D7JWRI0ha8QwZRlxOOkb8zAwKfGNZqerP94GzyYINEhbhsjuCAYjIP68U/BS5sWMxmJrk3+NmjtLGOuSw5E8qILzqXHWH7DExJmvJGkWBTRwAYkjYmZVHeDfncKXFO3VNKUAY0GoO7HnqkhXYlcKQLDuG+0d/20X4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475901; c=relaxed/simple;
	bh=3f9bLd9PwryjScgQDzUs/haQ4ZJ5r0q83rdRMs/72HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHI+e71pVditFZctn4rrF9db39KfBUDw7B84F173XGTiFgfYMgTdiXcJAhgpKYbyHR+iLVpdRzhKjqMkhZjJxHy3FLiVQHcTTz/pLjGMJqAgk52H0RSGRtp+6v0+rhQc3A9Dlm4gmfcBrQ3Rc7XhlyoJC2sFaI2rycQiWdr3/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=Jo6dH85z; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="Jo6dH85z"
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240916083809b6e6f2a3400f6e1843
        for <linux-tegra@vger.kernel.org>;
        Mon, 16 Sep 2024 10:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3f9bLd9PwryjScgQDzUs/haQ4ZJ5r0q83rdRMs/72HE=;
 b=Jo6dH85zJfwk8VUNVa+Fy5jyD5xLseSV8FH7INZcWn4opk73/+UGhtMmYmIzZS5JuLvfFx
 NgtsmGqA4qEeVElWySNYH54HoKMIV55mQEgMCkEmximpoPF+NJSzdh5AkHaY3m+RZo7A8h4J
 bqDu6UJ33aQUwPXYvglXnpr6w9pyJttfEnsbnFuFm7b3u7BQPJnE3UZjsLJoW3fRLlYKIUlw
 Cf3hKvIVLQKuWGJqKit1AMYFVPwUceCNveueHK4Ao0SEzKAmWDQOLBzuDn+d62SBstvr56XB
 Ry//7lqVIE1q96YzPpN8eUGZBD7FxRiQr/5XlaLf7mSqF1DFVdgO13Sw==;
From: Diogo Ivo <diogo.ivo@siemens.com>
To: diogo.ivo@tecnico.ulisboa.pt
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jonathanh@nvidia.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	robh@kernel.org,
	thierry.reding@gmail.com
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Date: Mon, 16 Sep 2024 09:38:03 +0100
Message-ID: <20240916083803.12364-1-diogo.ivo@siemens.com>
In-Reply-To: <kbz72jma3bj7dnfnvdjo6m5yqrvjwkvz2gtt6bxpezkslwt3kh@a7wqzkssdfvf>
References: <kbz72jma3bj7dnfnvdjo6m5yqrvjwkvz2gtt6bxpezkslwt3kh@a7wqzkssdfvf>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1320519:519-21489:flowmailer

Hi Thierry,

Gentle ping on this topic.

Thanks,
Diogo
