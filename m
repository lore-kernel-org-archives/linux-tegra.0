Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640635CBCB;
	Sat,  9 May 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330858; cv=none; b=Aihay3YHYjLRqoNZNd3Y2xXv06lIQY9GaO/N7NnSb/3J8Tuf91AxkKUJc6V98AuVF6wK8fNjQD4LLSJM8Vwv69ou/6rp50uve+mGfauKF9GIISoi4yWzE1ZJDaJoDrorzrbB0MgYUJAWISPx1iJdqMavuNBIYZjducoLEuB9ozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330858; c=relaxed/simple;
	bh=4Y+kOIWycy80wauOgGGe1nlqmEfikfAndulk2yAlNVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsvIRXmzGYC+R1OwW3S170ERGdi348jJZKmDEKTXg9pc7fcYNTJe7tUWtvzAb4lSB6/PC1joMBB3RzCq7ne4mMZUlm7figPN9t+0eSbY1VxkLILbnlsSIDrN1M1tMw3YJFovXE4VX4i5Ibv1EcDxsQoe/ObQbDamHaAkxSUPsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADD+Nh7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADD+Nh7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF1BC2BCB2;
	Sat,  9 May 2026 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778330857;
	bh=4Y+kOIWycy80wauOgGGe1nlqmEfikfAndulk2yAlNVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADD+Nh7IRrescfvVVCTsqlXuvgQJPieogJkbkESFaiwsOd2fIqUpK74l38qWRZtKM
	 Qxq6fB5uHCQg5bqNP+uMXTTfOHOVl4jGaQ91BRb3aHxLyrqYfPJfKL5dumgIhfU0da
	 DrtSA1HHNowVcyG3GdaQReFl/t3e2JzrxehLdwK+phPG+9pToGYKmJVtgZ/cluRfkr
	 icfnMHsVitu9LH+3VtHTTHQJN5kwFOmkrRR5kmhq3gnwnTKb/EdhOlUXii78YKm1UV
	 oRB5lT9mpu7BCOGOGf8BwgOxt+fMQf84/Sy0MDm6H1VDLTmcuKvKTtbvEAGcLONDWV
	 mzZSj5701mz4g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jassisinghbrar@gmail.com
Cc: Sasha Levin <sashal@kernel.org>,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	joonwonkang@google.com,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6.12.y] mailbox: Fix NULL message support in mbox_send_message
Date: Sat,  9 May 2026 08:47:00 -0400
Message-ID: <20260509122858.39c0b4433cc7.re-mailbox-null-msg-6.12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507055117.2466957-1-joonwonkang@google.com>
References: <20260507055117.2466957-1-joonwonkang@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [PATCH 6.12.y] mailbox: Fix NULL message support in mbox_send_message

Holding both submissions.

The 6.18.y patch you sent doesn't apply because of the pcc.c hunk:
upstream commit 5378bdf6a611 was reverted by f82c3e62b6b8 and that
revert is queued in pending-6.18, so the pcc.c portion no longer has
anything to land on. We can't queue the 6.12.y backport of c58e9456e30c
on its own while 6.18.y is missing it, so I'm holding the 6.12.y
submission too. Could you send a v2 for 6.18.y with the pcc.c hunk
dropped, then a 6.12.y resend? I'll queue them together once both apply.

--
Sasha
