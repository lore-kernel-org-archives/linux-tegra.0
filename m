Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60649B20A;
	Tue,  1 Sep 2026 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286884; cv=none; b=oRhmE9nySV0CDtNn+wSwKm35MACKnclPxEwuDW5M7OXr0NZv2tGNOofJYkjQ0DsJyEKOfWZxBCV6akU9e/W3PpDLWrSnyzYTYPpH4RGhrU0crdiMQmDEefUMqxh95aVT+B+eSyNGkzVc126IeuA7JU5nY6y76TrvhLRUK6R0vA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286884; c=relaxed/simple;
	bh=bAIuJ0bN60Yp5MAQdshxJb2GfflKYaIMRMzMgct36DI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKLQlTJQVX3KRFsynRPquVyYcpS9eWvPcfOT0+WocgYtjhHY/tX23teAzWZOjdStkDhWCuLyrufMvF8nEZc2/QikYY01z0e+9iIXfu4r9SlT4l/Fvbao0itqUuswbEbvijGhRq1CLYr+40rwdCwwFwura2h19i08uaJWV+SszEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8k6CxXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8k6CxXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A940A1F000E9;
	Tue,  1 Sep 2026 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286882;
	bh=ILeLoDPcho+isQ7/8Kf/Md9oEKWn2I1oshvHLK0IWUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l8k6CxXoJm25a7wUdpPHu7PKcHXtMFZm83lyVzUsPj8bkUHELY9A7Ya3RlWLuR2uz
	 6NEgGmT+qP1v2hWPUDSJz1UD3Hz8LmmH2O5b91MMGv7OetRO+5sEkms1Tw9AUQ23wY
	 DB0eOx7R39sGWxzp+2gQLAeGBWOJZpVldPKGkne8jwhc76tV+G6mYbdJTvUeejQ8+C
	 HN6am6jiPEi2Wyyc/5/kDxDjI6lc9Chdhx/LCYtfJXw3mkJVrv7VKx0wXcORJpo1eJ
	 n7PCWHuVYqcpKU6NubLuDxKK5m0s4LLKB4ZFT2BwuXfQpKqh6FPuCfj6EOCyjUVzvL
	 ASzB00+cQ0l4A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260814205018.39015-1-rosenp@gmail.com>
References: <20260814205018.39015-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
Message-Id: <178821335461.439600.18387458872247553181.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:55:54 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bAIuJ0bN60Yp5MAQdshxJb2GfflKYaIMRMzMgct36DI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxee4gJEeslnqa7AUu91iP+/AmCFzcefkyEgI
 SlJGh1Mc7yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXngAKCRAk1otyXVSH
 0JktB/4+dpZ8cXviLffhQtCkaAnLcbXWClfaS2QZ28aaXdgRSUAhR6ZZPx9bRTkoUQ7OEV4Db+I
 sTzpNKYFsWl4RMDHhcBk+wOpZpnnbuRsDY7dDnmZ7o4qclhZMEVWPyQmTMnG81H9Wagz5CQ3gXJ
 75pCzegTPS0ycUfUD5BLx/nfzJ00jPVawe4rGVAZU0OeENy/zK9u4Can/b7nld8eU7pqrZCPrR+
 GLm2iSSJRir3DmOfR8f7jfJlhKo4dp56bByllP/vXNfBiHr3MSQkVgdPgEPz2xZnOCw3f+byHhM
 VhqSQoi6wWbLc46FurhXabOGPlLp667LwlltNtI7JUGq5Pjr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 14 Aug 2026 13:50:18 -0700, Rosen Penev wrote:
> ASoC: tegra: ADX: convert map to flexible array

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tegra: ADX: convert map to flexible array
      https://git.kernel.org/broonie/asoc/c/caae0e2d1718

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

