Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE01DE4E1;
	Wed, 31 Dec 2025 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189716; cv=none; b=kgBwTcEDuoINaCWLo0jxAUZA9zcOAPbUacoedhpW9A3/4XJzdkgV+kCZHToGZziK6HTGM+hspORigv8KrqOLXyq7qZZPziR8hSr9jliDb3laIrPWlzVePpvGayRAEu+RdqVxsww+zgg3GUg0d2iDvgHWhTNi19l5acAlHevh7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189716; c=relaxed/simple;
	bh=uDh9lHLHY8TtyrRiLXhdYQucDWHMnN+qKhDLba7ig2M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aRUrltKgwkCfT4eGuOjavalF5M5e58pp1K3YjtDISn/6SGVyuYQfoR6BnGcSYqYjAvSgrxbimUQbsaMuOj6GREJ4m6QGZiY/oc/fOE5HtAO/OZBC6T2Pl6w1OvwzZX7XKwb76YLdPZvGjONeQ0nKIQXz6w+n5eJHM1cZVNwD8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UYJujw5E; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UYJujw5E"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8499E1A2563;
	Wed, 31 Dec 2025 14:01:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AF5960744;
	Wed, 31 Dec 2025 14:01:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BC46113B076E;
	Wed, 31 Dec 2025 15:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767189711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uDh9lHLHY8TtyrRiLXhdYQucDWHMnN+qKhDLba7ig2M=;
	b=UYJujw5Ea0Q6MDtyZOL+Luj+wyj7V+TLc0kzw8AKesh2J3AH+6gu8/igYzWQk7Ju/pHfPc
	PZmiAGFcSCRtCSqaz7c8khOnxaeL6jtqwYWC6H4E7XgWpWV+/n5mte4lmjvQbj6b2yP0dp
	d1WZ5imYokp9t7jEuLt8rRCP963V25ZidWcAJ9QgOJUtgEFbe5OEzBibX/u26VaJiCQGCT
	4fVjHi4//nFZw6Y+zN6ISDnw1lLvMatN2gY1YL2Yr4sKkebal9jBWjmFo3zpL5rWQgO0wc
	qe9n5Zbs/SYtfxjk7Pyjmy3Mh8A0xGT96xhHwx/gwGGVj2m0AyJNNp1bNGrj/Q==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 15:01:49 +0100
Message-Id: <DFCGGX67KTAJ.NPWO4JKMA9TW@bootlin.com>
Subject: Re: [PATCH v2 2/2] staging: media: tegra-video: move
 tegra20_vip_soc declaration to vip.h
Cc: <linux-staging@lists.linux.dev>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <skomatineni@nvidia.com>, <mchehab@kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
To: "Sun Jian" <sun.jian.kdev@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-3-sun.jian.kdev@gmail.com>
In-Reply-To: <20251231123955.277384-3-sun.jian.kdev@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 31, 2025 at 1:39 PM CET, Sun Jian wrote:
> tegra20_vip_soc is shared across translation units but is currently
> declared via an extern in vip.c. Move the declaration to vip.h so users g=
et
> it via the header and we avoid extern declarations in .c files, matching
> the pattern already used by tegra20_vi_soc and tegra210_vi_soc.
>
> Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bo=
otlin.com/T/
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # build tested
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
