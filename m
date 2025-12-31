Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176241D5CE0;
	Wed, 31 Dec 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189716; cv=none; b=dC4qtkKQ63MVKnmeNKNML3csKvJvrD6XcGsTrRDUiY2h3958NqIMgOOfSYRLhMEYH3Fa0DDQoBmIP1WPWujdxzFlLvYRoahgLAUf82eGRo0yTVmoMV+pPuucL+ULqPNzkwDvTg7xfBP2QdO8CDUWlsOhb0q2OkWzDdtPscdmpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189716; c=relaxed/simple;
	bh=MrdC+S6Q5UTVebmPDQn6P7Fsba69aYP2EHKXkE0hK5M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Yql/R45QQf8iM6InB/bXz6Kh8RVGaCFjrQ0JkA/EgsQ+txe9GD0+SQRM7awIV/KwsnUqG1LifuXfz/omFeFreKRAHaW1W9ZDjiZBXrrrd4OT0HfNehRfXtJWZKgTQf5vpzjUoFSa3DcdekOJCsL6BdnJu7uGtRw2pETrPN6KhgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HMeiPScx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HMeiPScx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58B48C1AE2B;
	Wed, 31 Dec 2025 14:01:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0BEE60744;
	Wed, 31 Dec 2025 14:01:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BD18113B0768;
	Wed, 31 Dec 2025 15:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767189709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MrdC+S6Q5UTVebmPDQn6P7Fsba69aYP2EHKXkE0hK5M=;
	b=HMeiPScxao3i+BzkoL1hVFyhodqmveyX4/TbQhNnN1v3fEXuTmUCWZh8n+vHOWkU73YdSa
	UxAJcjUpsZeIxRouqZPd3pLEDytMQuivjPKzHyM/Bh6LRGMDy5RLT+hvBJmGKQjhaAzROm
	xpxNhIW0hkp5ysobbojfPTPeSAr1dZ6/QyKOMFd/2JOyh2AeTeIsQSAvj+xACq11pErGm7
	N8fP84dbmSfPhYE74umqawVxl1WqQISWXdEMC/sLnKli0MugEt+zCf+x0DnmhNqYw2rwMv
	DNpacad53tKYt/z8CodKLWtM2tL1DXbkszciMeIyPUmKoObeDkV/BuFbZ+qPFA==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 15:01:46 +0100
Message-Id: <DFCGGVLHKG5A.LNU7Q3W7B9UL@bootlin.com>
Subject: Re: [PATCH v2 1/2] staging: media: tegra-video: move
 tegra210_csi_soc declaration to csi.h
Cc: <linux-staging@lists.linux.dev>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <skomatineni@nvidia.com>, <mchehab@kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
To: "Sun Jian" <sun.jian.kdev@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-2-sun.jian.kdev@gmail.com>
In-Reply-To: <20251231123955.277384-2-sun.jian.kdev@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 31, 2025 at 1:39 PM CET, Sun Jian wrote:
> Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
> The symbol is referenced from csi.c, so it must remain global. Move the
> declaration to csi.h so users see it via the header and avoid extern
> declarations in .c files.
>
> SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning: sy=
mbol 'tegra210_csi_soc' was not declared. Should it be static?
>
> No functional change intended.
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
