Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5D2E7BC9;
	Mon,  8 Dec 2025 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231778; cv=none; b=Ni77ukl0Qak5Uugfu3dZd8E8odVIesnAJMEcpdfH7u8zk1xkHC2GgPpNbcjirB9tjyFEBNsno0aZkDffS4DpKY/sevsHwrC7Zvv/GMYbRMpSW1cwUjeMKve8CElCSjaHtvrLOX1nFxj7nGy61aHQ5wC14xSTb2YX1MACxEGTEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231778; c=relaxed/simple;
	bh=p3sg78l1Rmo9cpHzmTNgyENt0ymd3EOPwxRutKTml6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bm28BOvep8nS2VFSqvlq56FkrxAMXVT7T+/tAZ8NQL7NZhu3DOaA6JFLJb4RBwPl6foWzp6GceXWtlMPGVKjLXmLE35F6ZEvtRy35XgpIYAZHJIDm5xRqmXAyMavNQovIQkwz7qhnXn3enOaujEcsUJ2jgzuugtDOGUa9VXHA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b5YDvEUS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b5YDvEUS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 257D4C180D1;
	Mon,  8 Dec 2025 22:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1AC4606DD;
	Mon,  8 Dec 2025 22:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C45103C8D5C;
	Mon,  8 Dec 2025 23:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Z6XLQIPaEq+Nxc+Cv2PclK3uy5FDDYP1taw5UsNqkeE=;
	b=b5YDvEUSH70h4yPmATFM9NyVPYlvv07FU0Y1H2efa4IpejTAOjgKZNE4aYtS14rUGjAPjU
	F4L9FGCysc/LzVO0VbYwgQQOxaU0uH8Mk4lnm65/i8LWVR4J3htEdvUD0Ubq6Mi+HvDZvz
	Tv5Yj2aLILnzbjIjWm3TPRPhcNJN6NO/kpZa9xTQSXfotMBEwUWZVD+1t7Gtb1sgGKLjXH
	/I/xpeUkaaAlPwpSegIkB6ysVv9cVrbWU9RuOvy79pY+RhcgBgZ1STNlIZIqWfUM2BW9Cy
	78oSQu+/NoqQnEn3Wgc6WtDEsLty6ieTgBDSw/gS0CiZHSlhnDZxtEmbxjPuaw==
Date: Mon, 8 Dec 2025 23:09:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhi Garg <shgarg@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
Message-ID: <176523152347.342815.9191977208772431822.b4-ty@bootlin.com>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 10 Nov 2025 08:35:44 +0100, Lukas Bulwahn wrote:
> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
> 
> Note, with the changes of v6 to v7 of the patch series adding the driver,
> the content of this include file was moved into the driver file, and the
> include file was dropped from that patch. It was simply missed to adjust
> the section in MAINTAINERS that was newly added with that patch.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER
      https://git.kernel.org/abelloni/c/40d8123ff749

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
