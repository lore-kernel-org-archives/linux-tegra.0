Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676967;
	b=Q/Yb2nqxOvBdWpGQW71t8cK6Xf6fPPCu3GSB59DkxSqTDhm1tY14mSnijRkdwAxpGJpf
	 rzlEUC8n4B8yU6DXWZ4JeBAk+V4p0sUe8gA/NTnPEQrIRertPul5NsHrCrmE+WgO8XBnD
	 yyG5LM43u9AX8apc6TWGY1LcZlC9bxLFJfWmXOEdZriAaD0dw7bov1pDEevRiVeh91ElZ
	 VzlcQR+xInpdtYWlppKCr7wNq04uMPfwwfYLSaejWrixuCpsYR1acSzc+UlPgrmyjPABz
	 qx3atov9NVoZED/nLo0c/mxswIlwwQgFE00NkE29pVIWCBDs95S38pEkIlB7ubneUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676967;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=PkmzYMQrJ+f+2RbIonUJxeJ2n2q97YNDRbeN91mqvik=;
	b=Xpg+uh1oNYY3BXKl+PWhsan6w4L1zCMXp+d0oTkT38gd4sFq5gRgcYcxavT3YTmw5Lp8
	 nLgYtj3RakcLcrdAAEogROo3lnBvUtbG1Je+mXI0Tp/qlqV1ncu/e94nMqA5tEjc29+DG
	 ht20rLNWH1K3JOQ6FxEhIMmDn7eUFzFjcgYj7E0XWqHkhTfxAVTaB7Rnik79IMDdEA15J
	 Sitq7rCyGwj3LY4+jFNe3Ur7BrfhsaserzSZbUxziWpgMll+zB1MH5+gQECDX4mjBxk7o
	 fYUdtn6s+hhRUJ9zBTmqvFsD9JHFAXhugAy8HIr82JFeqFndgTxS+ngccDmdmjSQMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vNMRetAN;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87DC606A332
	for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2026 17:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87DC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vNMRetAN
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id S7k2xppgeAR1iSHSgxOPGO; Sat, 14 Nov 2026 17:22:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SHSfx0nRASgq1SHSgxUikc; Sat, 14 Nov 2026 17:22:46 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af898e6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=3h6KpzBizPpaPHiOcEgA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkmzYMQrJ+f+2RbIonUJxeJ2n2q97YNDRbeN91mqvik=; b=vNMRetANoN4dxqqFfQ1I0nEJt8
	VdPC52+NTgVIpETzcJa6D6zkyYsKlGVJigXEpUW7qUyOhs4mpo6XqZ2gyOPzv9Act+HTwFf82He2G
	UC5o9GL+HHj2QFECaPTjlyas9gaf6blTTaC7vt7eduoqfbzy9yoEXNu2a38XcecXy14OKGm9FlOMd
	ZO0ZsEytSEtgx5AfI/dRnqcaoFUyzbbDEci7soGWTj8Mi5sNbAjwviIGn9Ff0jWucIEktH6WS6Btx
	W5RgZKX70rQvaqzyrEMibc0eWVVO2Mj7BTs7c/ysctAq7cOJqyX328+hhkPojA9g+jHzGc4Lcr2AD
	Q6BNehVw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55400 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSHSe-00000000ch6-38VG;
	Sat, 14 Nov 2026 22:52:44 +0530
Date: Sat, 14 Nov 2026 09:22:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Artur Kowalski <arturkow2000@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	clamor95@gmail.com
Subject: Re: [PATCH 2/6] watchdog: tegra_wdt: Move SoC specific parts into
 match data
Message-ID: <ea2ab23d-d628-46a7-9cad-0bbcd8722869@roeck-us.net>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
 <20261110-t20-for-upstream-v1-2-5923449951fe@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-t20-for-upstream-v1-2-5923449951fe@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSHSe-00000000ch6-38VG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55400
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 30
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPKEnP71FYpGm/rgtEaYkqPrMEHZASo1EHcjYrpLPYizIKyngDEwmBiUzUWnKGTuWpqjy6tBESua8y0lkrcDtu9avxMued3Cq0xXlLJxZ/DmlpmnTNJe
 oHPV/G5FTQ9yKYxy8O3znP/6kO88JVBdirCsyjItlXEcwp/Z8cwkHuSTYM2nNAIXSxcGPYOEvyho4v9uoxo+3u4CWnQC/vpzU1yYcdL+U9cXiQbXFjDpf1lB

On Tue, Nov 10, 2026 at 01:39:07PM +0100, Artur Kowalski wrote:
> The driver only supports the watchdog blocks of Tegra30 and later. Move
> the parts that differ between SoC generations, namely the watchdog
> operations, the maximum timeout and the register setup, into a per-SoC
> structure selected through the match data, so that support for Tegra20,
> which has no watchdog block, can be added.

This does not make sense. Literally every watchdog operation is different.
Tegra 20 support should be added with a separate driver.

> 
> Suspend and resume call the operations through the watchdog device, so
> they work with any SoC.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5-5

This trailer is obsolete. Please have your agent follow AGENTS.md.

Thanks,
Guenter
