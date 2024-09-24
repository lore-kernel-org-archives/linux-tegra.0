Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E41AAE39;
	Tue, 24 Sep 2024 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189113; cv=none; b=AKWg5WjCW7AwZkWc/d02rPxQT7Z9LJ9ZfyePNRGWrFY6naX5pRiewaIcH4wrhN042GEc5vmc0KGoDHYKN3TdnnQVvWVB/0pR+TNBLLjfobRi7F3lFUeqTAXymeTW3TdADogdsgQXCpNoSF82teX67dIBWEP/NRSjy5mJz+csIl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189113; c=relaxed/simple;
	bh=q1EaNnJlbGXL0FIzmVECLNBv8dKya9Evx7EHpiqn5Lw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=QVJ3GvUSQibbE7joo1OzlQM/LxMWm9zxigGQEhtdWSQcolXrQC7YRid6Z9u9W3Icl/3DCUzCtLS83HubN+kW+c3BWuTdz/eoWLNAF98jYj+07LWh/xCsAbyUO1rfLVsDI32QR+qH8tV7ZWMM9LzJCuYeCEgWs12zjToa0RP2yr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6m0iUcV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6m0iUcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD89C4CECD;
	Tue, 24 Sep 2024 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727189113;
	bh=q1EaNnJlbGXL0FIzmVECLNBv8dKya9Evx7EHpiqn5Lw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=i6m0iUcVRwsQt1ik0r9h/VnScElKcig6o56Iu0HnMEwOzyKAG9c+lKwor/x1jJ9ua
	 cgSsBD76yeCG8vPwVpXrkwCAyfNosyBNMB/zGVvVwpeaFzNaxB8nVnAZLbQKhgvzX9
	 TwJExmraI2xTZ/ZCfK0VIRQLPAmlIgcjmdeLXt2cXxDpeXJwQhaHYrkU+mwiR1h2nG
	 ejPZQEuZdQ1rEQFAFpD8LGGXEvuPGrO1IcrAgvslGMq7njSZOALNRr7oiiSYWhG2lp
	 6xyW3dJx/ykbwEdumv+0VUHCOVmIBV+ycIhL9pHEytMzBL5ErtyAvQ1+xKRa8TSzt0
	 SzDGbhtsIMdrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B316E3806655;
	Tue, 24 Sep 2024 14:45:16 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: helpdesk@kernel.org, pgaikwad@nvidia.com, 
 konstantin@linuxfoundation.org, linux-clk@vger.kernel.org, jgg@nvidia.com, 
 linux-tegra@vger.kernel.org
Message-ID: <20240924-b219307-abf6a41d04cc@bugzilla.kernel.org>
In-Reply-To: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>
References: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>
Subject: Re: Bouncing maintainer: Peter De Schrijver
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Sep 2024 14:45:16 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219307

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

