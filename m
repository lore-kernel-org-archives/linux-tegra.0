Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90CE257827;
	Mon, 12 Jan 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225594; cv=none; b=PGVjil8zdNJvA17jhb3zSDdN8dXM14dnp0EtUJXNtJej8s9lNvqk+n+yaEZr1IxxgTz8MHOzzxFwhqYa2U7C8j2YP3++7YePCE5F7a0/XP++76f+aJFi6xOSklGq5X4eMZBra1sRLv9L5XSyichOTxO/NHbiNlRcZjpP6Upmj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225594; c=relaxed/simple;
	bh=8/aEM+N/WJ88UdtF+leN0xUavaTf+RRw4Q20tjYMDCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTq5zwt2L8INe07rAY1K8zkZVaSxTlMwd46akzleXFYzK68cS/jYVhbi0Wltwc9VWfcoU/e2cgyVODCc1cDgpkQB9PopmK9MKqmTZiLiP1jvrauiJpGdoB/2vbYGhhtghiNqb+qzHXHaTTdw/DyAotG3jUctIsPSwf5YENoDO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=ltAZsuR/; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="ltAZsuR/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id EFCC96001407;
	Mon, 12 Jan 2026 13:46:27 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id e0GECEQ2kv4x; Mon, 12 Jan 2026 13:46:25 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7C38C6000256;
	Mon, 12 Jan 2026 13:46:24 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768225585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFKcXE+OliUSap4yQqLacMApUbum4+mc35fmauINXeI=;
	b=ltAZsuR/TrWFWKlvz+8DLThz4rMJrAfmVj/dX9eENLDgL2zqZ1i3wTYmXUEuPwlJ101CIT
	4SOA5cxUI0Mq68zzwlNAgBl/N4+0nJaH64hSh4moFWQ6BFPumHRiDx1RFPk/030m/cCtf3
	7aC3dkwnY3jGicSzqMX7dqPAssWGZmpVSE2aq/hEQyu9Yway6cXJLMOGIXTGrQ8I/qfTOS
	nEqT4AmS6llXkoiLPoah59WkiJ7dxZRl8W9lG/5oEMISEyV7JEP6/ri/fM8kh8OXKYZGGa
	UTzIIHoeBa9JRTukyNdnj0/R2/C5xYPIF5kk6qrK6xYbYYv5GtRCCVgQYdUeVg==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 08B923600D6;
	Mon, 12 Jan 2026 13:46:22 +0000 (WET)
Message-ID: <c21113d5-cd10-409b-a4d6-a6d213bfec2f@tecnico.ulisboa.pt>
Date: Mon, 12 Jan 2026 13:46:19 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB role
 switching enablement
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 12/4/25 21:27, Diogo Ivo wrote:
> Hello,
> 
> This patch series contains two fixes for USB role switching on the
> Tegra210 SoC, as well as enabling this feature on the Pixel C.
> 
> The first patch addresses a wrong check on the logic that disables the
> VBUS regulator.
> 
> The second patch guarantees proper ordering of events when switching PHY
> roles.
> 
> The third and fourth patches then add the necessary nodes and properties
> in the Smaug DT in order for role switching to work. Currently with this
> patch series this feature can only be controlled from userspace by writing
> the desired role to sysfs as
> 
> echo "role" > /sys/class/usb_role/usb2-0-role-switch/role
> 
> with role being one of {device, host, none}.
> 
> Further patches will enable automatic role switching via the 'cros_ec_typec'
> driver which is currently broken on Smaug.
> 
> N.B: This series does not add a 'connector' node under the 'usb-role-switch'
> property added on patch 04/04 because for Smaug the connector should instead
> be under the node for 'cros_ec_typec' node and as stated above this
> driver is currently broken for this device. If it is deemed better to
> describe it but explicitly disable the node let me know and I will send
> out a v2.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Diogo Ivo (5):
>        usb: host: tegra: Remove redundant pm_runtime_mark_last_busy() call
>        phy: tegra: xusb: Fix USB2 port regulator disable logic
>        phy: tegra: xusb: Fix ordering issue when switching roles on USB2 ports
>        arm64: tegra: smaug: Complete and enable tegra-udc node
>        arm64: tegra: smaug: Add usb-role-switch support
> 
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 13 +++++++++++++
>   drivers/phy/tegra/xusb-tegra210.c             |  5 +++--
>   drivers/phy/tegra/xusb.c                      | 23 +++++++++++++++++++++++
>   drivers/phy/tegra/xusb.h                      |  1 +
>   drivers/usb/gadget/udc/tegra-xudc.c           |  4 ++++
>   drivers/usb/host/xhci-tegra.c                 | 17 ++++++++++-------
>   include/linux/phy/tegra/xusb.h                |  1 +
>   7 files changed, 55 insertions(+), 9 deletions(-)
> ---
> base-commit: a8817ff3b5cd99b0a5af57a92d1a3a7980612550
> change-id: 20251201-diogo-tegra_phy-86c89cab7377

Gentle ping on this series.

Thank you,
Diogo
