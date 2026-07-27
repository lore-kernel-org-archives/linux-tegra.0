Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F73418A58
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159270; cv=none; b=bkWYmRLYItzuPzxhrC7b/tX5yS20jvk1IgnNJ0dF7HJxX7kXVFGU2mzDki8jzsFhZb5Ql7YWtgyiuuQ7vrEKbv6vP6CiwcKtqdZ9jC9Lk2f8q0LebAM8kjacyhYJ6Sw/Cu1KV0FtrPnqwozXHHpX7t5ogHq+cQtHv1PMEELIInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159270; c=relaxed/simple;
	bh=8nCC74OizPibC/VmYtaMPSzN+yTYakaPlTbJM80iJz8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=o0uJhphY7FOaxmiXvkWCCB7or1wqz0JFKGrX2ihJt2+nPDNDcX0kHmlbK3dSpUMpBe2TorYOfV6Uf5omvA6/JcJ4XyM9oI5PcnZG3prFmekXHs6S4N9xQKGRRyarydrCc5yyaeXdsjE1xRWrkhsAn19kpASsZtqS5tqXE7Aq8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qJTkWcYM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qJTkWcYM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C536D4E40ECA;
	Mon, 27 Jul 2026 13:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A468601BE;
	Mon, 27 Jul 2026 13:34:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB39311C13417;
	Mon, 27 Jul 2026 15:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785159260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I6ymMscZuXDmnMu0xXwCDGg0OdCFa5YfwRRztwaKfKQ=;
	b=qJTkWcYMohV8KiTV9f6VrOhta4xlpQginYR+u15Db47qm6wM7feR12P8aPBrpe+rDDZkLT
	96pNjf5FwFMFnsNEL1JYbsBAWoHTZCOADvymFWqPqUc2FscE3+5r7MCx6CgfEImWJDM/qO
	VfkPpot0zXzvPI6TtD/zCCvHx/Nh+PrneN5pnyJWFh+4HKIYVQoXMpmOwkR1dAq8mbuDbb
	UWUzLb5UK2gBqj/9Ap82+/KeyDEQ1NSMMSzsJYxdGpB7vR0cxaSOcgHSpJmM/4qcI3t6wj
	ROdb+FvXUFMrrzRfqtm06mDR+xWOd61SuOeNuBBjW12zcALasLu2FFRyjJsAtQ==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 15:34:18 +0200
Message-Id: <DK9E55N7Q4TH.13J7O5HNRYRZR@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on
 skipped last port
Cc: "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Hao-Qun Huang" <alvinhuang0603@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
 <20260727204307.24353.alvinhuang0603@gmail.com>
In-Reply-To: <20260727204307.24353.alvinhuang0603@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Hao-Qun,

On Mon Jul 27, 2026 at 2:43 PM CEST, Hao-Qun Huang wrote:
> On Mon Jul 27, 2026 at 1:10 PM CEST, Luca Ceresoli wrote:
>> Do you have a real use case where ths failure happens?
>
> No, I found it by reading the code.  I went back and checked the in-tree
> tegra DTs that have vi ports: lg-x3 (p880), nexus7-grouper and
> asus-transformer all link the port through to a CSI channel endpoint with
> data-lanes, which parses fine, and asus-tf600t has no remote-endpoint so
> it skips on the !parent path, which leaves ret alone.  So no in-tree boar=
d
> hits this.
>
>> Also, mixing two different return values may solve a bug but makes for m=
ore
>> intricated. I'd rather second a fix based on moving the whole foreach lo=
op
>> body into a subfunction, and make the foreach loop body as simple as
>> calling the subfunction and handling returned errors. This would fix the
>> code making it more readbale.
>
> Agreed.  This one was already committed to media.git/next on Jul 18
> though,

Ah, I missed that, I got no e-mail notification about the patch being
applied.

> so I would rather send the subfunction split as a cleanup on top
> than respin it, which also keeps the stable backport small.  I have that
> version building here and can post it.

Yes, I'd appreciate that.

> If you would rather have the committed patch dropped and replaced by a v2
> with the refactor, say so and I will send that instead.

No need, thanks.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
