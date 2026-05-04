Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5713E51D9;
	Mon,  4 May 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916888; cv=none; b=Zind/5ThTowQsY9xH6zHQ6ZWhwPgx4dD2OTAgCUWeTEFKA+7RRnNTeQP9pX3wpdSn6e8p9vgm2MeTCJKOdw2EpgdXIyv3BY7olBXa38BrJj8N5YFiZcMYAVYpjhqMSjG6Pp+W9iK3xPQY9RVvIzBobi//Issm+B3cu+ss5cXa3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916888; c=relaxed/simple;
	bh=hnhXDhfI9DIXuKSKpl8xbQqsHpRmF7aoNO7xAcsksgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNFJLd2XH7jvLfCv5BDpY54ZZ0ruOusHuzCXowTYnHWZE9GhvNR2DKVNewfhPNoS5w55dJ74wYuBioofg1hNnPf070vdfQiKF/qNt26xiD+J1Xnht8ePurwmtoUe63lGv/I1X97jR+vAB8fpUg1xuUfwmO8R6z0Um0sLI2Jt+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKX8MOQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKX8MOQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E84DC2BCC4;
	Mon,  4 May 2026 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916888;
	bh=hnhXDhfI9DIXuKSKpl8xbQqsHpRmF7aoNO7xAcsksgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dKX8MOQKd/RICEZzV52FdTNlh1IzD78A/kVeX90d5bXnaNIjsZrXIEspvnPV36ZRE
	 HaS/3m3XcWXIz/mNMMNhdXQ3jOCv/htOhsfU2qCqDBwaF6MZbzvoWZ6e3UCQroUKmQ
	 IU0dYkCSfbgtsLWDJF99kJc5GPP0QH3tHrymMAqKwdFlxnnEs2sqtJMqeVUKqtBVDL
	 /sxlDAsTG4en0Yh85vMqEQg9JEc8/1q4FaL85UYWrE3dd6ooXvJ3Xadxj+bYqHTbIF
	 r9paneNxEwHLORCQuZ5OLnavs33c1Pq5Sl7qrKRMt+/lz7DNB19qVZQqvLr8k6iNkO
	 Rc3RhC2Hm4OYA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260501-memory-refactor-v3-1-69fb1ae1a7ca@nvidia.com>
References: <20260501-memory-refactor-v3-1-69fb1ae1a7ca@nvidia.com>
Subject: Re: [PATCH v3] memory: tegra: Deduplicate rate request management
 code
Message-Id: <177791688690.723206.2850289224860595092.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 01 May 2026 16:00:52 +0900, Mikko Perttunen wrote:
> As is, the EMC drivers for each 32-bit platform contain almost
> identical duplicated code for aggregating rate requests. Move this
> code out to a shared tegra-emc-common file to reduce duplication,
> and add kerneldoc comments.
> 
> Based on code from the tegra20-emc driver.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Deduplicate rate request management code
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8879cff7f86f82e8922208668fb0f7227e4836db

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

