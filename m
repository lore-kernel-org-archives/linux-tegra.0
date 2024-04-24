Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159DBE4F
	for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 00:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917302; cv=none; b=Iud5gnFuD7PK8NkDPrgvN24/T1Taj2fgQpWUQWOUthuQXWjmtIIZkVkgpLkmrENWl9TBxT20VSr8frDzzLSm5LUtm9Xkbx2CBVLMTk3z5pUSDy6X+AC3dhgppY4+OY4D/l/fTBZbQ9SBhg6n3org77OoHVpfeLRR6Ouv6yTwoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917302; c=relaxed/simple;
	bh=2lT28vERDCRi5gr20Y4YZMGGpwzIyZ7BWvJ2WY+Nd7k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cObpiuSb1qVxvLNbRSYvg9MIZBLIBpXaR2ekrs1kNd8UJyRNcxF/8kRycj+P/c10ehd0jO+H96svMY6IM6MWVIBRXo5esDtSnArzO4U+uYvhCSDHTzzShfr50qfEhLTtOm4WjpkIi5CBK9aqSNDGqasa26QJf2K4qfrt47Ea0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id bedb557c-01ce-11ef-abf4-005056bdd08f;
	Wed, 24 Apr 2024 03:08:15 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 03:08:14 +0300
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
Message-ID: <ZihNbtiVDkxgUDGk@surfacebook.localdomain>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>

Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang kirjoitti:
> While working on another cleanup series, I stumbled over the fact that
> some drivers print an error on I2C or SMBus related timeouts. This is
> wrong because it may be an expected state. The client driver on top
> knows this, so let's keep error handling on this level and remove the
> prinouts from controller drivers.
> 
> Looking forward to comments,

I do not see an equivalent change in I²C core.

IIRC in our case (DW or i801 or iSMT) we often have this message as the only
one that points to the issues (on non-debug level), it will be much harder to
debug for our customers with this going away.

-- 
With Best Regards,
Andy Shevchenko


