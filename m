Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B38313DBBE;
	Tue, 22 Oct 2024 05:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575126; cv=none; b=pqXMD1CrFM5Nd8Efra16ltKQqOUvAL/dFcCMdQfKhW5kc8LN85OKTi85q1qhsqGlk/2omGyVWbbKrfzKL1JbOiDm9QnQoQWe6fYmgzB3q+cA9HnW6cEJRoEV1sX1WSakES4BOfe0GGp3iiMr4vklBHf6womO66sBs+J7OrMbSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575126; c=relaxed/simple;
	bh=+XQ07RcYr/8lQR11wBVNG7FGw7Y3qYnD5XkLswk1QQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UzzU1I5pNPV/ZWL5jRkP4Fb1y3Eq1SovwnvnZJyhO4z6UqzLQVkfL8xUddS3wwrZq+02tcM+2JBN02oXUutRMuHmbbuRAmnmrAZKqeUSrAZLEoiEEsY3uC3vFSpkDuqVCVs58E99nG2mS4IcMGBjhoU1geNhjOrbQ0CzX7nTXCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDCxp6ef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDCxp6ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADCAC4CEC7;
	Tue, 22 Oct 2024 05:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575126;
	bh=+XQ07RcYr/8lQR11wBVNG7FGw7Y3qYnD5XkLswk1QQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YDCxp6ef9uWhUbxhj+St5pgeNVCCQCf/fqM5amEV2hOouQHGiXCIS7mw5hIKivGqz
	 RtJMH9kggK+9wyYKHDosNE2dDPOQfMhVJ93bZ5fcF94RISacKqckCvvkXGCdL+O+Mu
	 P9ZlxE8FqApCSuZ07rGt95HPLwClMAo7uoJn50f+/FvM6sR3dzJeAemXGDyn0uggkX
	 6gD/hrlJ9oy5q/YyDzjqbVmqNUupV9j10/bKTb5jRfo42F1Isx+XPybjnZR3vUZ9eS
	 tN7ElVlnLhrOrvYMwuR1xC5UJbc6VCfYpUP6M6YgJvFgfgLZMBs75xdG+jTENGL3Bu
	 bOkAOIf+T/qkg==
From: Vinod Koul <vkoul@kernel.org>
To: jckuo@nvidia.com, kishon@kernel.org, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, nkristam@nvidia.com, 
 Dipendra Khadka <kdipendra88@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240930191101.13184-1-kdipendra88@gmail.com>
References: <20240930191101.13184-1-kdipendra88@gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Add error pointer check in xusb.c
Message-Id: <172957512345.488725.7168237326292852194.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:03 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 30 Sep 2024 19:11:00 +0000, Dipendra Khadka wrote:
> Add error pointer check after tegra_xusb_find_lane().
> 
> 

Applied, thanks!

[1/1] phy: tegra: xusb: Add error pointer check in xusb.c
      commit: e70d2677ef4088d59158739d72b67ac36d1b132b

Best regards,
-- 
~Vinod


