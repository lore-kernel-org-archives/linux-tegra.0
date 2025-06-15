Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749D381C4;
	Sun, 15 Jun 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006327; cv=none; b=sU8xnij3JmyvEbizwmQkzblg5Ehskjun/XzZQ6DFphVgMtO9TfwrcHz4lNxUJ9CUUS9guNQM170xr2Dnl88WXqrvVc0OQN5AbKBhCBKl0XFSNJkzucy+B25h4AohMCIAfWQ2o96izTpEptyoqhE8GdUKKjeYI2ZtHKVvLvOnT2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006327; c=relaxed/simple;
	bh=eQhy7wTqmA7Th7Sg0Iuj5eoKYhPZYEf/yoxdoGc0Wkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=boC5tYsgwTRouP/lgCJFJPH6V1wcDf4kawXWnd56A6mBcw9fuRCOlxlORgDBEhbQmme/N6OmWeUBq23FgsnM3BKcxL5bxDOQS7hIS+7FIfdKiD0b5kE4Ky1Wala33B/Ko/ljYPl+9LTTfe2jIIEjPJ1mU3YteXB0lD6tsLypDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/qzwb0D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/qzwb0D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C14C4CEE3;
	Sun, 15 Jun 2025 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006325;
	bh=eQhy7wTqmA7Th7Sg0Iuj5eoKYhPZYEf/yoxdoGc0Wkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C/qzwb0D5z/ffIt3Pa/cpHVflVJPIsj0Lg0ZUyQ47dblRO4RqLI0lkkR72hoETsSE
	 qKvTAaXjLFfLHTCUb95YqfbhqY0xxKckdCMTyQ58NR4+y2s2rGl5DLoWDSN1B7uQrY
	 mEIXNojUZLFYMkR7ZpbwYbaYKleB9Q3AwHFvzgbikUKPsxLRRChTgpCxMHjk/XxYT1
	 Z7doCzYxKMzdksPTxciYyS1fkJfuVW7UMlQCuXPxPZIzdxrXesUtpaP4FH3RRh5NIm
	 s0GDV5I4w7dWpBLklDG2RUVxxDeoYmVCo3MqJo40/O12nWtOL1IQecq3c5mhIcFB2b
	 Vir1aVL+h04iA==
From: Vinod Koul <vkoul@kernel.org>
To: jckuo@nvidia.com, kishon@kernel.org, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, Wayne Chang <waynec@nvidia.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250519090929.3132456-1-waynec@nvidia.com>
References: <20250519090929.3132456-1-waynec@nvidia.com>
Subject: Re: [PATCH V2 0/2] Disable periodic tracking on Tegra234
Message-Id: <175000632281.1180789.12546166906023856282.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 19 May 2025 17:09:27 +0800, Wayne Chang wrote:
> Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from trk_hw_mode and disable
> periodic tracking on Tegra234
> 
> Haotien Hsu (1):
>   phy: tegra: xusb: Disable periodic tracking on Tegra234
> 
> Wayne Chang (1):
>   phy: tegra: xusb: Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from
>     trk_hw_mode
> 
> [...]

Applied, thanks!

[1/2] phy: tegra: xusb: Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from trk_hw_mode
      commit: 24c63c590adca310e0df95c77cf7aa5552bc3fc5
[2/2] phy: tegra: xusb: Disable periodic tracking on Tegra234
      commit: 7be54870e9bf5ed0b4fe2a23b41a630527882de5

Best regards,
-- 
~Vinod


