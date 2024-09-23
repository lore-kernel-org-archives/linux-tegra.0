Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C7198830;
	Mon, 23 Sep 2024 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727121886; cv=none; b=LCIbJttbYFspZ1cHDDx1GOK1clwYZnISZy3r5kTx9w0cui/8UTaOzCes3TkNJXmF5iLh0VYfUOgkAt42TJPmvT8bphH23DE3eSc8VQSe23gi/0JOYMlkgMr+aNvh1rW+VU4vwzgf5laWiLVLMiyMuoFfrnF9OTiGaSPwaqikppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727121886; c=relaxed/simple;
	bh=ZRHI1Hfm5ZxEGbRNykHoz7TMiTcy3t8/wOqhuSAbZRo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mX1XsNA6w9NJ47xVxFQvBVpyIZ1tl+V9wP2I+JZuYWkkEtPvpd28mlQwgVwdpESAM+31v1t6CjOicFCmYA8Pn2K3sktz8fNJizS1r0PnCsgHLjjJi2sf6BjRMgbbnXa2dt18Jve6aiWOuyJGq7KJNmLkmeBsKNgNWEP5nL1Mh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ALfZhqoX; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ALfZhqoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727121868; x=1727726668; i=markus.elfring@web.de;
	bh=NyPHHbZJt1HoUZRiEgs1U+YNuccocLd01ZpmSfeY5RU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ALfZhqoXZdWlkpwUpO5jd2zyGQb+kNmoSM0mkPaOdNDq2iuvGbuK5QTga4edS5E8
	 Kg3jSgBtoQjw7LuDeaqmhnHHzZgFPhG9SYaS/WbsoSDozJnjR7fSC+CQCJf+zFV1l
	 xZrf6wYXO3BgCT4QsM8N6USMjWlL3lbMeVJWGXOz75+QohgVtEX5sCxSefRondXMq
	 +d+LB8pFz6RqrPoL0AHnpUrVdsujj1CYPHr6nSykLE/wug12joHUhs8ZsZlfvS6f1
	 CQKj0yFUSOkqJLhpcJrPgb411p6L7Fn61eVDy0TWPGa7/TG4cMrS3igOCbvUreSQF
	 wZub1XcmgNE20xezCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzCA5-1rxiTA3moF-011JJo; Mon, 23
 Sep 2024 22:04:28 +0200
Message-ID: <86154518-3338-4370-8fa2-80a8b0e10302@web.de>
Date: Mon, 23 Sep 2024 22:04:25 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] phy: tegra: xusb: Call of_node_put(np) only once in
 tegra_xusb_padctl_get()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LQwlz/kX37ShGSCKg+wsmk/jy5QFekqlLkEoDC2C3n6lj3Xnjou
 EKLG8jhPmkzaNK6J1fBYRRP2X8vZRqDaqi1zmYYs8ZZ2MEgAulmeSdRNWk5lvG8AsmTrC3T
 UCoTud7osP8h12SZaYl0Ax9F/oV5aglHwebeGfcbwhSrM4GgPT3BktKUM+q/85IaViOwGoc
 0sRPGahvH3/apimupIhAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:84K41IAe/FY=;YAwjXj4z+47HErv9+7gsXYuIAeD
 t6AOlRx8gIajBq8ny9tmzZK+aOdvJ8ryl+ZG10e7bal6lnpQ2hbEVN43V9sBNmyq0ZwRQ2Hxu
 uQjpeabO/dfDJ3QVlYbOr7mEdqMf2XY43PHtZxgP1xEjT5lIRb0IE0zjz4feFjP5boM7wmV8/
 R5hkbq3aHAhqOS0y/lsrmpn28c+LrUgH/ax8FEi2l3XHhkz42cELWmWBqZxBl91iNPcxFHqcO
 X/xXMvtX1B1XtuaPKV8RJtFTKBJ4JmKz6fsyzJu0MH/c+IySif5VTx4xb+gfAa3PvvDzhHgIJ
 Y53G9PPu4Fkrbgw6INVkYYRYRwOuc47Lx4TwJQvrekDANIvsmtsGajD9PdawRb7arDyp7z0/w
 8XOtNOwiRLpRFfDpwweNYIYw4lb8R79+Akm88jUYqr3Jh3BExNJTvAhL6dZBCLvVMBEK5EcWK
 etSijjq38HgHi7RALk2tZe5CiBB93oseCnBL86k1iK3X9sZgXfNYOtuIm2PLRFHxS/Dee+r8h
 PcNkoe88uJZQMeHpPqb32N3fZ8KRFdxvWuz3Smk82EMBLtBO1ogtJGD5vkO/2LVGbXAo+FyYc
 JadDEQfGuaOqhn6NPz6/1aAVnfWfsBiLFsPHHPiRDvSuk39mAYnx4x8xjU8E+2kFp06m5eyeC
 +8WtQgiI4nuNW5ojF8fTLQvBYsjMke2N6yeQdT7OtsIjL93zli2bNUnsD8z+knNhTgAym5iqU
 s799SR+SA3RkEkmq0BPqNRLNYh2+8yyKcHdJ3CjGk8qGndnfC5wOAR6PErNrfZ2Gt7N/gJpMz
 NYs+q6GJJb8VIFwfIRvbUOfQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Sep 2024 21:56:35 +0200

An of_node_put(np) call was immediately used after a pointer check
for a of_find_device_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/phy/tegra/xusb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..1a912ed52416 100644
=2D-- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1345,12 +1345,9 @@ struct tegra_xusb_padctl *tegra_xusb_padctl_get(str=
uct device *dev)
 	 * only ever be one per SoC that would be a little overkill.
 	 */
 	pdev =3D of_find_device_by_node(np);
-	if (!pdev) {
-		of_node_put(np);
-		return ERR_PTR(-ENODEV);
-	}
-
 	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);

 	padctl =3D platform_get_drvdata(pdev);
 	if (!padctl) {
=2D-
2.46.1

