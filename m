Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C9329E44;
	Sun, 14 Jun 2026 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470579; cv=none; b=PA7osv0d/aMEKIn7TKGceDuK2qmygDNjK2GsP53VfgUemfwH5kpyYZPYvs3WL1/RRIo+4UNrp3kRMDa58cTzWfzV+RoX9fRaOc+PPR+R4/g1jAmV4yCgvnBLcmzQvTNmqE5/bDz/O9MByjBl504Qx1NyV1eiSS1VlyO+IcXJgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470579; c=relaxed/simple;
	bh=k2TwFRVIGo3UAuKkEeMphcyHzyDfz5boVP642BqB7Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMbyAm4mZTzw6huJlVhLenF/9cxV5IrIaHgHeN+bnWltMjfRXOfjELNYA/IeD02R9G89/nYxfLLdV2iWYYulUqkijQZAei0vUXW1gcU8Dis1HzNmRn09z0DNq0N7ibrhhs027RA/ZdMtybguEZ2NZoB9FFgljGn+rZwWcNfXQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UtciRf7y; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UtciRf7y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62D801A391E;
	Sun, 14 Jun 2026 20:56:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D89E260014;
	Sun, 14 Jun 2026 20:56:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7971E106C8A10;
	Sun, 14 Jun 2026 22:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781470573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1s1sT/c6GY/MY7ZVSH3SGCUIl59lEqQG0Hqj2B2xQT8=;
	b=UtciRf7y+G/d7pfxrZk1IlUaUbXDpp2k8dQXrpLeAjNf2O8ktUpBHnQAgy52argPBpPzsK
	ePID2nUloK8aMJsFsRJA50rAKX+xuLB3wBNvdwdZAH29K6w9cZ3ftdI0xF8TKIagm7jMhh
	a4AaPWhm1RH3e0FyXX4DFz0KMr0AKwxFAbNhoqRqHhdNDjtye7kkmXwj3M2cD0o2CHM/WW
	hNRn9yS0sYXHEUZepQ9eLYnfZHGllSN/7kRptBXX5ZUkvoG9gr+UJmFFEJvSqBh/9Poopm
	acBAjonS+9lmPIlUIT4emxxr1P9x6eWxGB3JzZAsnG0UeXXqVBdQDNdh2768dg==
Date: Sun, 14 Jun 2026 22:56:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Support ACPI and SETAASA device discovery
Message-ID: <2026061420560674ab6fb9@mail.local>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 23/04/2026 14:26:59+0530, Akhil R wrote:
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
> The series enables to describe all I3C and I2C devices on both Device
> Tree and the ACPI table, using unified device property APIs throughout
> the I3C core and the Synopsys DesignWare I3C master driver.
> 
> Please note that the series modifies drivers across multiple subsystems,
> like Device Tree bindings, ACPI, I3C and HWMON.
> 
> v2->v3:
>   * Fix maximum value and indent bit list for mipi-i3c-static-method.
>   * Move I3C_ADDR_METHOD_* macros to dt-bindings header.
>   * Drop ACPICA commit IDs, keep only the Link: tags.
>   * Revert the change which proceeds to register other devices if SETAASA
>     is not supported so that it aligns with the rest of the driver and to
>     avoid the issues pointed by Sashiko.
>   * Rework multiple commit messages.
> 
> v1->v2:
>   * Added patch to remove 16-bit addressing support for SPD5118
>   * Guard ACPI calls with #ifdef CONFIG_ACPI
>   * Remove CONFIG_OF guard for of_alias_get_highest_id()
>   * Mask mipi-i3c-static-method in the driver to select only valid values.
>   * Proceed to register other devices if SETAASA is not supported.
>   * Update commit message and links in the description of multiple commits.
> 
> 
> Akhil R (13):
>   dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
>   ACPICA: Read LVR from the I2C resource descriptor
>   i3c: master: Use unified device property interface
>   i3c: master: Support ACPI enumeration of child devices
>   i3c: master: Add support for devices using SETAASA
>   i3c: master: Add support for devices without PID
>   i3c: master: match I3C device through DT and ACPI
>   i3c: dw-i3c-master: Add SETAASA as supported CCC
>   i3c: dw-i3c-master: Add a quirk to skip clock and reset
>   i3c: dw-i3c-master: Add ACPI ID for Tegra410
>   hwmon: spd5118: Remove 16-bit addressing
>   hwmon: spd5118: Add I3C support
>   arm64: defconfig: Enable I3C and SPD5118 hwmon
> 

I'd really like to apply this but I would have preferred having an
actual ack from Rob on patch 1. Also, you are going to have to rebase on
the current i3c-next. Can you do this?

Thanks!

>  .../devicetree/bindings/i3c/i3c.yaml          |  31 +-
>  arch/arm64/configs/defconfig                  |   3 +
>  drivers/acpi/acpica/rsserial.c                |   6 +-
>  drivers/hwmon/Kconfig                         |   9 +-
>  drivers/hwmon/spd5118.c                       | 119 +++---
>  drivers/i3c/master.c                          | 354 +++++++++++++++---
>  drivers/i3c/master/dw-i3c-master.c            |  66 ++--
>  include/acpi/acrestyp.h                       |   1 +
>  include/dt-bindings/i3c/i3c.h                 |   3 +
>  include/linux/i3c/ccc.h                       |   1 +
>  include/linux/i3c/master.h                    |  20 +-
>  11 files changed, 463 insertions(+), 150 deletions(-)
> 
> -- 
> 2.50.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
