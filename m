Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD8C4E3EC1;
	Thu,  3 Sep 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450140; cv=none; b=umSZwKxrAG4nLXxNJBzRmqET+xs/0S7BCHXtocVHV9EBLvIh5JqR6J2bdhISFDN3EurNQh6+qRbczdhZcYGXt73ibXDY3LmgmCFLONdsMesT+gbliDHaJ45BBUmwIEkV+bd2anDA7Yw2zd5HCO7eUBB09xhkR0fin/TwL1dJ5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450140; c=relaxed/simple;
	bh=ZY114NPCijjp/00AgobEMStIusDtmvV76rhBGJ4v4c0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=GjEEFXVN+uOB5f82bkZKKdVcT2UpvlEIC94f3sI+CIRya5GjrAKNcF5q6iix8GWXAGA3pkVttJjyU74lOWdTW4Vx5mmKgoSoLswo/U/49bMO8Nzlt63YNpP5EDkUtLF2vADuB/L+etRnkgJfbkPt5HbES8CaYyYM6rT28bh8vzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZONWW2y3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZONWW2y3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E80C24E414ED;
	Thu,  3 Sep 2026 15:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBF3E602B8;
	Thu,  3 Sep 2026 15:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62E9511C7A332;
	Thu,  3 Sep 2026 17:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788450134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZY114NPCijjp/00AgobEMStIusDtmvV76rhBGJ4v4c0=;
	b=ZONWW2y3GI6zQzbfOTRbhwcZEq5FPYfJLwAxuDiOluaQkN00HTFhyHCQZSGLdlrScK2J1i
	BRdh0pEEyETJ+m8TLTvAFVyqXYPNewicgPgW4Jpx1z4/vcQanHlrrbYcbyLQxjNTpXfPmQ
	12RdHONULPJRni3+3Wqs37GZ45pH2faIugS9cgpqQJlN8S9899CgLbjVfqmggQOhu2I+iM
	wLNu0ZS2wQBqJazV5v8a+/YEJsMvcnENGFaMeZOiJO3XPaB2O/g+3TGG6ziuZKx9E8E7G3
	IrlHMZBablDUWZwPbXo5EjjjOLtAHLVz5dzrfTmUL9Lht4YHRa5Kj7HUDlDEOA==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:42:11 +0200
Message-Id: <DL5SNS2DPT1J.2JKTUMFT0YXZQ@bootlin.com>
Cc: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Aleksandr Chubuchnyi" <chubuchnyi@gmail.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: add Tegra CSI bindings to TEGRA VIDEO
 DRIVER
X-Mailer: aerc 0.22.0
References: <20260903135058.2598642-2-chubuchnyi@gmail.com>
In-Reply-To: <20260903135058.2598642-2-chubuchnyi@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Sep 3, 2026 at 3:50 PM CEST, Aleksandr Chubuchnyi wrote:
> The tegra20 and tegra210 CSI bindings are not listed in any MAINTAINERS
> entry, so get_maintainer.pl does not match TEGRA VIDEO DRIVER for changes
> to them and reports neither linux-media nor two of the four maintainers
> of that entry.
>
> The entry already covers the VI and VIP bindings, and csi.c binds to the
> compatibles documented by both files. Add them as well.
>
> Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
