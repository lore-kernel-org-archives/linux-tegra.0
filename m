Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64B44B674;
	Thu, 23 Jul 2026 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804449; cv=none; b=kGPBtdkrNXDIN7mZjdBe+XB6IOg73FCPJ4OClwKdXC9NVWM/+Ss5M9N/TlTICnJhwacTpD4S6bMB8KFIN/0Y/g8+bIUx3A/A86TYoSSLKPLTo81m5zBTQee1dGJekJ01MhBIdHQyWZBoDIEkW77+fqnLEI87XTZb1VCS7DQsFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804449; c=relaxed/simple;
	bh=5tHpdguQ+LQex2K/Jxi+lCWRf0hP9MNozg/QyPC+nIY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=unpzIHf1T7yGBFDtGw1Taaw2WdLLvTMqHauhwwOfEop4M//Zes+WpnbDtlBMmwGp95Ng5u17YC9qO2lD4nfsMq1KScH61A+71WWWAX5yBIRLcAG1PyhZe4Ccr9NGyvGFKxgEhoPm7brYvC9lSUWCeI8q4e7oh5IBVOcRjJBCHmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldQpQ+QT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldQpQ+QT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4FF1F000E9;
	Thu, 23 Jul 2026 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784804447;
	bh=j1y5g0G1gSEZNiQSYFBy4h5r2IOXr/edRpz0vilAmR8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ldQpQ+QTFOx/TiyeCMIilQN7qyGT8o3oDTRjvgFErq1Vnhev6vnCLhz3KUizOLtH5
	 HNpSk218a5EK77ytWal4B0A+gWwNPs8Uz4LMP+St0I/yZzA5m7Zz0y5+ytOCHazcz2
	 T9u+01VPUbfYps0U7+j6KoAhFFHD2YdQgegO/TnWqhtK8G2fANwrXU3AYWt5SGlrIV
	 UG1GjSuL21Osa7dtnP+XfXge3DagAyCSygofRuHyNZZ/1DswURY63pHffyZKv5dENc
	 C0Ui2x+aLHHaYMu8b1Erv/sDvLH6VjwMJ43wHO9XK9+HYUtadLayweXPIbETiXyN0/
	 tB+/Fyqwnv/Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56904380DBFA;
	Thu, 23 Jul 2026 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: enable the MAC on link up for all
 supported speeds
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178480441614.2227840.11864736200731366487.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 11:00:16 +0000
References: <20260713074911.30090-1-vadikas@gmail.com>
In-Reply-To: <20260713074911.30090-1-vadikas@gmail.com>
To: vadik likholetov <vadikas@gmail.com>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, andrew@lunn.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, thierry.reding@kernel.org,
 jonathanh@nvidia.com, vbhadram@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 13 Jul 2026 10:49:11 +0300 you wrote:
> stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
> stmmac_mac_link_up() is expected to set them again through
> stmmac_mac_set(..., true), but it first switches on the negotiated speed
> and returns early for a speed the switch does not list. The MAC is then
> left gated off.
> 
> The speed selection is split into three switches, keyed on the interface.
> The generic branch -- taken for everything that is neither USXGMII nor
> XLGMII, so including PHY_INTERFACE_MODE_10GBASER -- lists only SPEED_2500,
> SPEED_1000, SPEED_100 and SPEED_10.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: enable the MAC on link up for all supported speeds
    https://git.kernel.org/netdev/net/c/9c99db3a2080

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


