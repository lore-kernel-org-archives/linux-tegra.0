Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8581528FFF6
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767369209; cv=none; b=iO2/cypF65XE6L4NjqDqo75aHf/VzgLvJsRwe0bO1lrxFKOXROZnVXlN6OklP/+kiV716aI4fHG+PIqoKDnXV80pNbZSTYKFv8Dv98V0dYGTEFVK0OZObPDhKb9KhxHlr9LpCzBVIVoUBQtndvghh9R1gdOAW3N8GKHhKLFHYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767369209; c=relaxed/simple;
	bh=k+ngzHxkn5MYFYlg0gfMzzkSE4lr7ZWvme1Vz6TFLlo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RtZSYJRhwFBwf9G7QupK8B3vau+8FYeKiV7qKwQL+GelLG8ETxQWfQ2TbAi8tYHCdjIzzdQhakY5zP5FKpEmEcRvHd2xPzmrEI2CiVF974iFNcGUk/ogrlfmjYwzPt39x4DTu1G1mRsAhejchNiYz2XA+RqTpBKxD5m1kp6uI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A1u5Ptr+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A1u5Ptr+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82134C1C3B6;
	Fri,  2 Jan 2026 15:52:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46FF5606C7;
	Fri,  2 Jan 2026 15:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D475C113B071B;
	Fri,  2 Jan 2026 16:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767369204; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MfEK2g1j0oovEtEL82YFmPrUmFMZvfTNK/qZ4cy7bXQ=;
	b=A1u5Ptr+EcLCFjE/tGiuLvWPYLT/nq1IeDfopVjxkEtkaQChPU6biz9lFoyI8Q+ZyDv35Q
	fYG6gSZoTZivYUF28LzehOtM+AqrCkelgvWvKdyTcdO/fnZgoSG/mXCTuoA2ZtV4Fxq2hC
	a3VwjrAooPL3l+GXNpaG/JyMXV+cCPIao2UbHZju0V1o6zvqLPkBlDHtjougWCBoZE3cRO
	puKRtf9H98nMa/DKGwuRG6kGN25DJdoNpzTDvL4TfAeVsQwXrTCt5Lyb0PpQZLfW9cKEIK
	4g2Lfq2ZKWFXdY9deDWGPADLmmyXR6O81uFG4/mqvYvYw7A/oc6FWsLj+tEoVw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 16:53:21 +0100
Message-Id: <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
Subject: Re: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC
 declarations to headers
Cc: "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Sun Jian" <sun.jian.kdev@gmail.com>, "Thierry Reding"
 <thierry.reding@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 2, 2026 at 12:44 PM CET, Sun Jian wrote:
> This series cleans up tegra-video SoC data declarations shared across
> translation units by moving them to the corresponding headers, avoiding
> local extern declarations in .c files.
>
> No functional change intended.
>
> ---
> Changes in v3:
>   - Wrap the SPARSE warning in patch 1 commit message to <=3D 75 columns.

My understanding and my knowledge of the common practice is that you
shouldn't wrap lines if they are quoting a single path, log message, error
message and the like.

So I think v2 should be applied, not v3. But I'll leave the decision to
maintainers applying the patches.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
