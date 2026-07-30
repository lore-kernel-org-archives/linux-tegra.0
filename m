Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B943DA3C;
	Thu, 30 Jul 2026 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422572; cv=none; b=FqTqhY4b+LuXbfKC7sRH494msvoAs9HZI865OLQadqc2cdRX13330WioKqSUzQey3lYs6GGkHTywmSelHJ1dXBxSHK/IIu9asHZeNMml4d8ejjyjmfyaGAj/3UOnDRN28vFy1v11Afod+FQjbFB0ofqHhhoGg8XJLTW1NZAYBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422572; c=relaxed/simple;
	bh=raGtQMl5Kzbv/Jv0rXE9k1IVL6lHEKTH0edEoshkc08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+hEvNxbvznr/5M/G0rMn0q016a/yESk7ffm+gSu6plgy3HflGHZQOIh4WyKcgtZo6VrRFR2hmPOv+jzTQ/Irk0CYxk2EHk2aVcoZ0TDiJd9JQSBajW2+IfC+Fqpj1q/06uEEiIp/9RsK2eAbnmdMKFPeBvB50G/EnE0G0iJ3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dzchbbPx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dzchbbPx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 716431A1323;
	Thu, 30 Jul 2026 14:42:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 448EE602B8;
	Thu, 30 Jul 2026 14:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63BF011C15D15;
	Thu, 30 Jul 2026 16:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B3Xem/yd6HxdRrGpt5FQHo1+1rP6Hx2c/XYOfq5hXmI=;
	b=dzchbbPxKMn58sxhDW2/1rbG7yRh2+LuNtjeSqJYJArQfhmH04HU4fRUGFjq2cFrxlxF/q
	NThYMHk5+E5+QGQv6VZ9o6y/iWCQ8rlWOiFJmgNzL8aNbmLg8YokqKqTOqhv1JcXhXnuoK
	ILxT9+Q3E7jLtlv7Lc7eXYcjf5d/ITQPyx1NFLvYxoSQx4Tan/jSg0sEUYQ8xaMJIdu4FH
	/P5woihU9F55wwh4pyOKiZLQP/qa6AT3s+qERz6Hmt8WOtgUnFHYprAFdANNrAjbuYd5L3
	kPyiA6MoPqISedoQYQljEBmZJvk8P+qMeCHNLrez4coPDcPp6X8yWo6++Ilk/A==
Date: Thu, 30 Jul 2026 16:42:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 00/12] Support ACPI and SETAASA device
 discovery
Message-ID: <178542243604.1793527.10239518847754179179.b4-ty@b4>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 28 Jul 2026 06:59:42 +0000, Akhil R wrote:
> This patch series adds SETAASA device discovery to the I3C subsystem,
> enabling support for SPD5118 temperature sensors found on DDR5 memory
> modules. The changes also add ACPI support for all existing DAA
> methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.
> 
> SPD5118 and similar devices on DDR5 memory modules differ from typical
> I3C devices in their initialization. They use SETAASA broadcast CCC
> instead of ENTDAA for address assignment, and per JEDEC specification,
> are not required to have a Provisioned ID or implement standard device
> information CCC commands (GETPID, GETDCR, GETBCR).
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
        https://git.kernel.org/i3c/c/29593f94a91c
[02/12] i3c: master: Use unified device property interface
        https://git.kernel.org/i3c/c/f1e00dcda80f
[03/12] i3c: master: Support ACPI enumeration of child devices
        https://git.kernel.org/i3c/c/c5cc24aebe83
[04/12] i3c: master: Add support for devices using SETAASA
        https://git.kernel.org/i3c/c/46276c855815
[05/12] i3c: master: Add support for devices without PID
        https://git.kernel.org/i3c/c/9885e8c54210
[06/12] i3c: master: match I3C device through DT and ACPI
        https://git.kernel.org/i3c/c/95bc66704fd5
[07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
        https://git.kernel.org/i3c/c/d3aa6f594db2
[08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
        https://git.kernel.org/i3c/c/581cca59b5fa
[09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
        https://git.kernel.org/i3c/c/77de3d43f74d
[10/12] hwmon: spd5118: Remove 16-bit addressing
        https://git.kernel.org/i3c/c/89eee0b30226
[11/12] hwmon: spd5118: Add I3C support
        https://git.kernel.org/i3c/c/f76be53203bb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
