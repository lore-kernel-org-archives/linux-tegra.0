Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628A37A84E;
	Thu,  2 Jul 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006336; cv=none; b=tPmM7UyUXLI86UwXlU6QSejvxkktvNWxKA7TULe9CY61I6AxF7uhTp2mprTtQr6F2RG/1uIb49QMXt/XHjN/lbl9XHFTf75X4T1hqQAQtzNA/sG+Fso/TUzpg/SLSPmQ/SaWw1eCqAEHiBuNANgKAUBiZeoIvrLqjgP0nQxeSxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006336; c=relaxed/simple;
	bh=+cGn/g6vlxxoicm4aGN5PKiJ90qLv0h1llZMltqCYuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pMTH6d7wOsylRnozQ8j9Sn95IPss4027tzHXDVr2dHd31vpBBi1qW1BqVQmh/kvdoEZh3gpCRr3JHP4HWs2x51u8OYWQlhgkBQnORfcSeoo7qtUwhJYVzU/hqcfojGAJkLDJMtFbWDnd/gjkBziKmaPsnYL+ydVTV3a0ShmEkfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQPj9UK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQPj9UK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E981F000E9;
	Thu,  2 Jul 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006335;
	bh=SkFOU4Oyw7LYLPAfVqtgnDjfsTBzuUdC4zo1Q4spOx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YQPj9UK2pOkhB8RDcHuXW0QbDJbhBpl/OLo4rsgcb7PkoDO1QJXiMLqtfE0SUVv40
	 UL6BVRrDxAk0o5MMoG8xnQ/0Qlm7wbShq2PhJ7b1qaw89ETLwZJzqUkywna8Q9EHrD
	 9S8z7to74FPFl9x5bh6IpH1Cu4JIB7B+3+g4TUbj9CL+75ISLidqWEAYl3t5sR4sLE
	 3JF1+8M+mojiCWWqRaXyMlAqloQq5Bfou/qbyZ1YDUraPuAG8C1803p49UY9EGZUtN
	 HZs43qOxi30mrWhxd9XxjK0rx/6KPyQlL8rIUu8f7INKqrwRt6irAhL00rE+HqB6Ql
	 Bq3vxONR02d6A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260609212531.22044-1-rosenp@gmail.com>
References: <20260609212531.22044-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] dmaengine: tegra210-adma: use platform to ioremap
Message-Id: <178300633253.735405.8595624907524864073.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:12 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 09 Jun 2026 14:25:31 -0700, Rosen Penev wrote:
> Simpler to call devm_platform_ioremap_resource() as it returns multiple
> error messages for whichever part fails.
> 
> 

Applied, thanks!

[1/1] dmaengine: tegra210-adma: use platform to ioremap
      commit: 95cf38ae309f21b651fb7b8afe267eb3c84017a3

Best regards,
-- 
~Vinod


