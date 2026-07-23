Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282945D184
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821926; cv=none; b=WQwsESu6dgYy+VHDfEJ+ONUuKVpCPZ/DSPcc6ZkdKbm3d3AZ48OEOEBlEEBBd109NO+xuSWs1fgWu3ofgecBxtLWeYZOLEVHEKHqzxgUyif7wMCCkIVMYiQCym18HX5zS0VucU0m0J8OF/YhTlKm6A0FYiPCnTt0Lzrx0h9v8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821926; c=relaxed/simple;
	bh=BjrUfjq/MjDeKu8VuDeSCS2n4mwqGRre5zkgY1xB2aM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=EaplLUGK6MM08DUuOBj+ePymTvaozczdyFbdtO/S3GS4dYJDChf/EmcuY/vI6BF4hwGBWjT4XaVdOIeMxkCt531nNALT5mHkcZavLgiswHeGdemGTHDmv3Zjf8zlgqyddDTD4Xoxk54OjRXt1PKVNlh2EJw3ZGwcTWo0BybQKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JHliCg/3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JHliCg/3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5B8F1A11B8;
	Thu, 23 Jul 2026 15:52:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FECA6038D;
	Thu, 23 Jul 2026 15:52:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B09C811C11008;
	Thu, 23 Jul 2026 17:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784821919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BjrUfjq/MjDeKu8VuDeSCS2n4mwqGRre5zkgY1xB2aM=;
	b=JHliCg/39OgWSf9sRMaZTt5N9rBOaXPdLxeAuqiA32mrAzMDK+Conn/zSIk8BrAESow62n
	XEgxZP6c6st+03q50oM72qqWajsiYm7fQAH3Jun9MfNw+QDqEYEXLXno0tx+S8Wl3AvZCO
	zO01B7AKWmz4b++2AQhrhUJRmI+D8fN3cWd+XuGFizg+B0aBvK39CdDU9T7BVqmS38VBTE
	v4fZwRlZYnYAxESbSoyEq5c3xGkRg0DnACkVNbio4sH3+tavwr0ZIIt+WaQ77gtUm732YV
	LdJOGKM1D+Hu2MUq7JL6XfqXgO7s4JK8qD+GwKJ9ric2mU++/9hsFo615w5N/g==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 17:51:46 +0200
Message-Id: <DK62K8A5CYEJ.1JR30M4BEXVYN@bootlin.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dmitry Osipenko" <digetx@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Hao-Qun Huang" <alvinhuang0603@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thierry Reding" <thierry.reding@kernel.org>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP
 parse errors
X-Mailer: aerc 0.21.0
References: <20260707150326.554689-1-alvinhuang0603@gmail.com>
In-Reply-To: <20260707150326.554689-1-alvinhuang0603@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jul 7, 2026 at 5:03 PM CEST, Hao-Qun Huang wrote:
> tegra_vip_channel_of_parse() initializes np from dev->of_node without
> taking a reference, but its error paths drop one through the
> err_node_put label. This underflows the refcount of the VIP device's
> OF node when endpoint parsing fails on a malformed device tree.
>
> The only reference the function takes on np is the success-path
> of_node_get() stored in vip->chan.of_node, and that one is already
> released by the tegra_vip_init() error path and by tegra_vip_exit().
>
> Return errors directly instead of jumping to the bogus cleanup label.
>
> Fixes: e740d199cf0f ("staging: media: tegra-video: add support for Tegra2=
0 parallel input")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
