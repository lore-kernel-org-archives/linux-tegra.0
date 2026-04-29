Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFE3859E2;
	Wed, 29 Apr 2026 04:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436429; cv=none; b=EUUy1vr8UH/z3yJTgtAg70/9LluWEYSaKVGnvTLU7u8iP1TEEgT1vTbWWykqJktzYCaxc57xdGh8l8Qll1AsW1d+eSreMeGOc8toF7Ah0HXU30WcUUYUBq43jex7/whik5sqPSc1g1R+RjioPqeKpF/txS6wEkr64agd3/H2utw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436429; c=relaxed/simple;
	bh=USJ0+cRmunuLt54HmeoCaeeVG6X1G37RdfZY8UkUAso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GZYlTIT3SohlCn8Z5Y8CDeo7x6p2vR0G25N3NW2l72BcJCBoalWcSmue2MttxApTsmKdjVgrc2kFabIJ6F/l1M5ZXup0kXax2wz2ZA9JC12/YxIZerq6hmVkgLl3enD3O4Y+ftljAq6VGpf+gWOOALe5o96/osgj3PFyvrsMc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUGqAwa5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUGqAwa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B21C19425;
	Wed, 29 Apr 2026 04:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436428;
	bh=USJ0+cRmunuLt54HmeoCaeeVG6X1G37RdfZY8UkUAso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bUGqAwa5621xDyUPf9Hj5pU7WE0ISPoSXE6OqcQl9647GWqJuX3z/74Vifq52beDf
	 bFQ+QQ8lvBlUi+CjZVmsfMZrZSWfmECXn45PuMlwx/slQyD7t2JlvOi9yoZClglA4i
	 p+tlP4JzIn3s5X6/LdAFSluxyp6xXELiKkE5pSH/4LZfqqVRJt0WPyGbO0eKqhFc2e
	 92oETFFmKXYeLhEbyvfbhwOOoVBUwvk3KqpfN9GmhaTLhP3QSZ4hQD0TuKvfvRnmuV
	 U77aDxsut1wH6xmWcfr8g5GvAnwS5FWlb5nOywMifLVoxPRkZegqaBOSrRFTp2MXeU
	 gAqJtZnioPY2Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Anupama Kunkulagunta <akunkulagunt@nvidia.com>
In-Reply-To: <20260428051216.2746030-1-sheetal@nvidia.com>
References: <20260428051216.2746030-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Add S8 PCM format support for MVC
Message-Id: <177742890949.363516.14048311665636522512.b4-ty@b4>
Date: Wed, 29 Apr 2026 11:15:09 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=USJ0+cRmunuLt54HmeoCaeeVG6X1G37RdfZY8UkUAso=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YcIiBya6NQcTJtwWwHSXExYAkoGaTNPfiL/i
 Cyv1GLbD86JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGHCAAKCRAk1otyXVSH
 0LdMB/9K4MI4PBz36bQrlkHl7uKu3RPyQilMFaYpENU7OivosJv3NQtzH+EIXQNzk08V7P1FMw+
 5uIQmubZefdn+iW9YqKTM4HUbQp51byn9ZJIJw0GFZnEz63q5eARXKDqWopwbSAT4WB/4qsttAi
 asUZbaquhBE//9D/J/sVoqHaiEO/df916v+C+7TbPqXVT4ZnNo2wJ7Y77HVDeMj6EgjA6i0RDlE
 0H5k3O/v8QNVIKT1PlcbtowaTMDt/9Ab9a/OLlaMR466ahgthYYBZ2xYmFLfw4lcRZ0ufcPAx4l
 rcCx6kmCmbRaIy1BFu55zS+TbhTUZd6RfkMRmMNRrCYkfIRu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 05:12:16 +0000, Sheetal wrote:
> ASoC: tegra: Add S8 PCM format support for MVC

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: Add S8 PCM format support for MVC
      https://git.kernel.org/broonie/sound/c/116c535ea477

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

