Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA203F6600;
	Mon, 27 Jul 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150620; cv=none; b=QIQ+QHwRTfA/hklLXRcFervIxuWnbnbaO3SIYU1NYiF/ahUQ8ssT7q+kLrLfgUKTJPJpEHKsO2IimX+ES1ZQfSyZ9QjG+/sd2D4519nbFQ2WtMWDmtBzeUJ3cGiLE8YuB+Zv640OU1cFgWa5SffFjNLjzVg92icZd7I6wGoOdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150620; c=relaxed/simple;
	bh=pj/kO5vSLCP64HfMG7K8Tgy4NwexuNapehAFw3xZ6o4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=luNsPHaHZHv0DZ7Aht6BvAR13j6b6HXkbBgmYFFWrbRn0kZj2GRgxp+pDcGaFlInyW5+y0zU5Mj/nBJltZk5R6qu1O8TGpKnItVdYzL0CZOe+aUnm2zHVX72Jpx4sXN6xnvzPl8yYh+FLlXlLQ6XQiEi3Ayfcl8B8i/eohzM0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ps2ERVp/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ps2ERVp/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FDB51A1288;
	Mon, 27 Jul 2026 11:10:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B5A9601BE;
	Mon, 27 Jul 2026 11:10:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90FC711C13260;
	Mon, 27 Jul 2026 13:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785150610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pj/kO5vSLCP64HfMG7K8Tgy4NwexuNapehAFw3xZ6o4=;
	b=Ps2ERVp/CGSsVQDpNh4IktVr6nJ/Har02F1fp56jWbu4VNb72JVEhcLKI5wWjbZNpSkUyL
	Wqr2j77Uhuacp7GE6emIqowZBRUguLirP8vsR0XvzuFtShGSBgFjQHVUTY7fap/LOq6qZh
	C+wPBMwzmmpK3gLKXERKLKsJqpsDuQtonJUvcmDeOpGo0CkXLlqI+D9h6VaqsPzkkrwjZY
	uvkoOav4sMMAeWfBUwMpMK76jnNBVS5rWzQFrre1gS6/i5oqNKHiPuKxSnOD23DFBesptr
	Ym3AQeuf7NFChQGUErdvO7I6zQCRi4VOr9IeoFBcwYhgqyaEKYhrlvMXXD/ryg==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:10:07 +0200
Message-Id: <DK9B2RGTKZE4.BHXZNRMJ4PWK@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on
 skipped last port
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Hao-Qun Huang" <alvinhuang0603@gmail.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan Hunter"
 <jonathanh@nvidia.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
In-Reply-To: <20260707152425.571254-1-alvinhuang0603@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Jul 7, 2026 at 5:24 PM CEST, Hao-Qun Huang wrote:
> tegra_vi_channels_alloc() iterates over port nodes and skips those
> whose reg property cannot be read or whose remote endpoint fails
> v4l2_fwnode_endpoint_parse(), leaving the negative result of the
> failed call in ret. If that happens on the last port node, the loop
> ends with ret still negative and tegra_vi_init() fails the whole VI
> probe.
>
> The same defective port earlier in the ports node is skipped silently,
> so probing succeeds or fails depending on the order of the port nodes.
> The CSI equivalent, tegra_csi_channels_alloc(), returns 0
> unconditionally after its loop and does not have this problem.
>
> Use a separate variable for the per-port checks so that only fatal
> errors end up in ret.
>
> Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor=
 capture")
> Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures wit=
h gang ports")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>

Do you have a real use case where ths failure happens?

Also, mixing two different return values may solve a bug but makes for more
intricated. I'd rather second a fix based on moving the whole foreach loop
body into a subfunction, and make the foreach loop body as simple as
calling the subfunction and handling returned errors. This would fix the
code making it more readbale.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
