Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7A3EB108;
	Tue, 13 Oct 2026 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889074; cv=none; b=ioNdrM7ZhTX2TlWvwyzW/9jQa+UM7rs8XwGK7/s22yMRWNgPTSZgf35AUiddupFZiUUd9vPzvGIC4M+Yr0fWMOaIgpyYzWwnxbwtA7KAJb24rLJo9+FHpxVVMaRU4mPhiK5CCm+Cc5Ylq3EXw5yLCW+Tl/FOoGrB0yfJxnz8yXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889074; c=relaxed/simple;
	bh=PWz3H5OfT9CtXzT6pNFaGrdlicbbZpyByjymJSM1I9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFxFJZt4iFL5h0wYYURw9Re42RQfcYTY7kYrG4oqe2IZHtFPyJSWPyEahglnvywh8B/C9t1tDyyfbZXa6OwmSrryOg40l3TEkl+j2gdUaW/Wn1I3CqOSDiBCPDt8cN65hWwE7qlAZCQnRkPDNUU6cl/5xz+FHPpJMiPJvlgwrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iX4pQWPb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iX4pQWPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49DC1F000FF;
	Tue, 13 Oct 2026 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889067;
	bh=e/YWC5GU+iDxE92YoOekJT+1e2v750KWewJ2AZK7Woc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iX4pQWPbbLr5xGqP+MCgCgUdG00ojrL7a5bhRrM1T6oiyLJ95hpI331mrdTw77znq
	 A1k/16Gya67mGxhTNroc9WX1ImIPdGz5LGyqb40ixaZEPptfHT4vI8dOx9/CuM/cfW
	 YxHzopeCWEgubO7tCPwJgsq91zJZXO8CZLFrftGAKdX7Kg+TPK4Ic200LyBZSc0EOF
	 4lnMrW/nW2VLcuwhaUyYzYysNAwfTRcwug+sJoukghvs2jRUneZOFXHf95MuzBFs4q
	 jjjf+cupjCgVIvZwPZtxM43fcfjfDLWDBV1+b3zN5S7RvVPuROmlnWTAz1JXkTVgLT
	 T3Bk598VpNRrw==
Date: Tue, 13 Oct 2026 12:57:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Elie Morisse <syniurge@gmail.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Devyn Liu <liudingyuan@h-partners.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: use designated initializers for acpi_device_id
Message-ID: <as4OldgC6mnGe-r8@zenone.zhora.eu>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>

Hi Pawel,

> Pawel Zalewski (2):
>       i2c: i2c-core-acpi: use named initializers for acpi_device_id
>       i2c: busses: use named initializers for acpi_device_id

pushed to i2c/i2c.

Thanks,
Andi
