Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1916DEB9;
	Fri,  5 Apr 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326186; cv=none; b=VAEstJPZEKN1R34MkklffNcAl8E5IFy5Yee9lGpmp2vYVay/pQ9RNTgBCuYVOWipO5zdsOj3hizCf7oDBWQaRmk124KZEInlTiAv1dMkyt2KVwOQNO3XilrY5vnX6GQLshhjsxyD8quRxhUS7zXDipHYht80KeoYXS3i+kDq2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326186; c=relaxed/simple;
	bh=YOdKqFDrsi1Fjssp3xYa5FBcFqqzqUTLyDnqBlSVIB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=quYYMKs9Oitucu2nz7GHDdQiQefRudr/6X8qlABeMw4/VpFOyYd6vxbtGJUedSgv7l55erKnckypviM61lMeM0pHHjm/cq6yFdvBjLp/qldtLLihymBDBDO+kyQzpCm6l0pwhRX4ICdxKggL4dePJS0bPVeIu4Y29WuwS7eJnRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=DJE2QcvR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="DJE2QcvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712326181; x=1712930981; i=marvin24@gmx.de;
	bh=cu9QTW0NzTbLWv+TYfpuDtyw7xM6QSSSxcfmJHx/VWw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=DJE2QcvRjbe+lwmdkIss+tg/FM7NOTECuO+oWiABGJYoq1IABV3I9f+yS80/CMRd
	 vIjcMH+m9qNzEtn8u7DYYFTRYdh8/C8Dp0/nkmmLk/a5+ojcWpjMSVq1w8WXmrp+E
	 4gUtX906gdsdu2mE/UbJNIEmqZyk+Ta+05l1OGtBfl8gTx5RxK4h6RQZlAXvTdWZU
	 r3ikS1iV9JROvqkd+Bg4IqvNmiydqmYPy9Pg96ZpR1y1KrygTNtKHNLfwNl/xY2yt
	 2/QtzGd9FBPOGxJtS5u3+6x8TCZ8U4TW+glO+FZIEKgXka0QQWA6TN2eq8tlKiuDC
	 RmFQQuSOwgsYYqp9Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1snKSO2hTh-00uWZD; Fri, 05
 Apr 2024 16:09:41 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 0/4] Improve robustnes during initialization
Date: Fri,  5 Apr 2024 16:09:02 +0200
Message-ID: <20240405140906.77831-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v2M304d1rqh4Fri2ypPmG1ioswYo3lFyifmrfvN2H/yv6vB1s29
 Z5bJmAabM4sOe94ifybNwqXxwSIr+PvN+EW28YWPKU84xp44wg8KU/UZCZk9LCnGefHpU06
 E6K+rZq4f53Ap1CYWs6Src2JB3syXJOzmVkPvNN1PQYmqQ7dzaSQsiyXdqN/UIcFIfgVVSD
 G6ZopTgKE8ApDFD9qrmDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uoWwnj3grQo=;TDW4QMmSFkKedsw3bW+JefLKcvh
 F2/vo6fGsbt/Ywf5LThxYB2KFEAISek9na8obwt5i3CcFYNq3NJMzaBDqBRpufrey3/1xevIw
 m+tIkEQ61rD/I0V6CdPL1LVNjkEqI7Sk/wgBLzlLSMIJQOQsoougFgwVnls8zXj/ulgPedzXH
 ohvZzBjwPR0bw4v7V74l9GPvxV+KZZtSWZBcocHPM5ERyKiVLoT2LS3qWIBnJv/8KPDjHm1Hf
 BgDksq1DpIqz9oIjXYTSZA9PQ6V0z7UgCeZJ7jjGIGOEYMJJa42JcdAbmVwJodRBdLZe5n9ba
 4vMjya2vwndWaSPWI4NlwmknSKpWybWBtmWIwLc3NTS9Wpzy7vlzRGf6A8t12csz9FbsKD5Ep
 s9MdEuB7+8L/59mk6vTRYS/y4zbJy1x2y9cBoLGZLWreGgSSStNQvayWa6oWRq+hCLfw8wWqB
 ulzCeWZZLV1rI6SAwKe33BoFn/cAeCwywANvt8sSdrk0Bikp2hqyY4PQvYpQtyzi2bB5CdBLF
 i/kpK3lDeEsZh40itFmrZdyEiQzTJBmK5dgdYXUIMEDvccMarmUxJJWTaSdtnSbPQ7ZQ97EpX
 MfJECigr3t3eq1yiWjd34y+uJS3hPpEY2niGKHQmu+FTEZc3XR+7IBzS8YFKVNdWygdtoroNo
 bhBctiRr3d52z8f3VwygsaKrFJWu6BWXW+X9d1nSqLVXTFeyv+aALUVEXSm1k/FWupNkRbwxJ
 KpGwEatmPHVdfgmnTTgchWPWDsgAaREvo8EPEcUNcoNlnt6oL2vBgt21zLPK/lm4kpL0YBFxk
 9luJmRAmUiareDbI//51QQjuMZc6wI5I98HMLiiEysL5M=

This series against 6.9-rc2 improves robustnes of the keyboard and
touchpad initialization with the goal to eliminate the ugly delay
it the i2c client controller ISR.

Marc Dietrich (4):
  staging: nvec: make keyboard init synchronous
  staging: nvec: make touchpad init synchronous
  staging: nvec: make i2c controller register writes robust
  staging: nvec: update TODO

 drivers/staging/nvec/TODO       |  1 -
 drivers/staging/nvec/nvec.c     | 39 +++++++++++++++++++--------------
 drivers/staging/nvec/nvec_kbd.c | 14 ++++++++----
 drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++---------
 4 files changed, 53 insertions(+), 32 deletions(-)

=2D-
2.43.0

