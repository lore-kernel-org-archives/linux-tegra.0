Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727646D577;
	Fri, 11 Sep 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117778; cv=none; b=qlZ+mrz+XcJc4FSQwlj5moIG7Ou3UY5+UJDYCIFJqgk4FU1xVHn664cDCXI+MzAjGWscvU3IyJPw9yOxLucdkQ52vEuODZVz27ijsGyG4Suq5opVZToQ9uzSGOXuuxsz5PIFrr48HXAffjmFLLg7URCAL0PVZAuEyBmH1Q0ozwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117778; c=relaxed/simple;
	bh=t+6MYxy5XUjX01KpC8TpqcYswDVyBlb/TK9KQ1ZJYVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FD1B+B8H9Q4mM9pzbrHpsVjH8c+i3E6brRADvkcyetYKc3U5szjVw0wzMCYUZwhiW7X/q3jW22KRMZXyuze86mfRngC2seEAlsUgjmRZMRZKA6lbetErrdRdsD8UEuH58U8IYWN6rM5U6nhri1sHvXEXefn56EMb5Xq1It4Nxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DSrRpMzo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DSrRpMzo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57DF31A01AD;
	Fri, 11 Sep 2026 09:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24DA5601DE;
	Fri, 11 Sep 2026 09:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5556811C7AF8E;
	Fri, 11 Sep 2026 11:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789117772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t+6MYxy5XUjX01KpC8TpqcYswDVyBlb/TK9KQ1ZJYVc=;
	b=DSrRpMzo7xommH6ljF3n40eJNp4XkPIlSTnxYdGK9noi1maEjPYXHwbRBMJQlyifjzSK9/
	OIJM1vSUZQWh5eGnUsmf7KridG6Y3f5lk5k3s1++gtzvm/aPAHNhxj6bBHccAghi6hSI0Z
	U5rUj/t0oe1S2TpcRMVagB65Vjjc59OyYzz/FODdv6v2j5MVX+/m7t9MyC+isQw3SpZwq7
	8D+DLBC82Gvc00XvStT/u28NAMGJkU/QusWmjSMxhTQ77O72cS4LJ8UgxxKwA+U31Cdjcp
	d0V4UO4PuyEmfZtPDicT7LOHM3eezIDw+jsib6AWDgIWLilFWBlupjm9kwcXig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,  Steam
 Lin <STLin2@winbond.com>,  Hsin-Yi Wang <hsinyi@chromium.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <87ecf1sa2w.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 10
	Sep 2026 11:57:11 +0200")
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
	<20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
	<b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
	<87ecf1sa2w.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:09:26 +0200
Message-ID: <87tsnwqhmh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Jon,

>> spi-nor spi0.0: probe with driver spi-nor failed with error -22
>
> Thanks for catching this early! I'll get back to you with a proposal
> very soon.

Here is a proposal, please let me know if that fixes your issue fully.

Link: https://lore.kernel.org/linux-mtd/DLCD7NN2IW82.33ISZCKO1E7UY@kernel.o=
rg/T/#t

FYI it is only compile tested.

Thanks,
Miqu=C3=A8l
