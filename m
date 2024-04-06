Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4EF2C6AE;
	Sat,  6 Apr 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406699; cv=none; b=gZVN6wxzSD7dTJmRg58w3ssrTUsfru9vLu5UICgUPwMrri1X+75e9fTnYkFkjnqXOOYwbtQl2jnqDWYVsCaeDnOh1k0HYFZK7pz/o5fusOmKRFyRoFT9wI0835eQIwfiAr2rDP3aR2XF2Wt69XY95EeHdHZg4cEdXd2S8XAafVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406699; c=relaxed/simple;
	bh=zVBv3x0RcPND3YUQlwrFydPZKJLoTFhFO3cFFQ5L1wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tJDJZxvQ0o3h+IDlJ5nE5jIVIBVKTU5e2eKWUVI8zVTtztT6cR9J0rME9qrB+N9OvirOc90JNnKcOh6+MTFsCuaszpSbnHnqTetGaWuRbJqE3exabIcZbi8QMHdJSoUWwz4lLxCCHHusreefaWCNfqn+IjENUQkb9HVclsYcQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=rO/nwHUu; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="rO/nwHUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406691; x=1713011491; i=marvin24@gmx.de;
	bh=H/aPyAk3HsmbeVDE4IKsiPkoFUrCDzARsncyuBKtwRU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=rO/nwHUucvln90SShMm2CgxKr9cXOONXaWaAjTyPf/YNH/fIXUI8podisXycolNw
	 hPT3ZTgpxAfK7sikU2WRW+XVoXAETEAmghR+XlLI8PLTA0K6Cp/+WyzrKlmnGJ1uy
	 qHMGjCtncQz5n8vilyEKkbNXnVj5Rnjxi9Huno43QTe7klNkO0FmmiQX1vIzXWzV3
	 RpnxRClP2woVSdYYLzZ+TvorGT0KgzYHpxfn2qcGD11SqC930TYMOICZ0rtnGSrVW
	 Q19WsBdbcIKOCmAIRCOTLUXhQ8jmVo9GMcq5goHmtQVxQq4LiECiv1HP9C0USLSu1
	 ZXy2R8BwkND7ZVHw+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7Jza-1rs0sh1chY-007nde; Sat, 06
 Apr 2024 14:31:31 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH V2 0/4] staging: nvec: improve robustnes during initialization
Date: Sat,  6 Apr 2024 14:31:18 +0200
Message-ID: <20240406123123.37148-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:csW3Ohl4vYb9X6Cxq6WTOoX+behSmfj4H8r23SrRTkStY6fM+bb
 6vU1gNwsuQDjkE1tifNe0sBJ3ypahkez74um/f2+B9Eqb7dGPIfj9ciJfe7Zv6+6hcHiZuH
 zlEkNqZVw8BSbiTGKC7iXzO5Y29xJtAgyX7KsQnDQrGliuOYADr4nRkcbVuONvSv2jbDBIl
 Hfma2yZLrJSajWafgtThg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DT30y2NJUVk=;tUJQLqgUu7cJWLh8tfHBV/fqt11
 KLizMhD827bPqXcjneEr28GlpEIqIr3uq3/0VFCh4YQNhKBCbqkKH50a1kotsjCI7pa/SnI2F
 RjlxEEVzilwC8K12hs1KiBOaysA4rJiReN1pThQD2qYDVYnlohvr/y7uZ8W0wzO29y1nT/fw+
 5eT+b2u1yVkjLNIezIBrDwBep0jIKHYIzOghgtMPdYUuyP87gaXBS5HPg6lzrze6CX0I6iT3q
 3CNcewOQSlNAMNSHnKKhhFYXSjoy7yRXhL7u5fDNgAmfglJJGh52unnJ/Oth9McLDGlq5BdJ9
 i1OSWmzen6j+o3orGhOMpCLoN/7pKj0FlL1DfbkOz/GIpS6rdNlzecCDdNCbdYcuA0jHrG/h2
 1Fa50mf/uG/b2Pczq1go52xcD6ha5Iz8qsocwhDSGzD5MkNnrLNUFR0Szmys7enQcBjLvsLXf
 /QhgvYEiAKGd65jhl7ocPnCipS6W/DTzPcj6Pd9wa1A7CUD22CETjptqWeDy++9sNq/0xYA3f
 80nPPxFXXYvLbVpGEBB2SFfby8UZYUrBwBx5mj9uDRHTFrSsPEB4p9HNwnIwn+OUrsQLPFO0p
 aMLGavkopw8b1lpSoMGFgp65hv+/2WuawV/R+V9WOnyFlejbua7I6ZIOC0pTT9sd6T5IVfYQJ
 X/EPbhmhyEp10ydz4qx+pubRrf/RgjSZf3gcBj75xvFIryQa9dymDv8TOMcGU1qabodebEnAg
 uqI9xT51GZxdlh/IgUH5RLAdN37plJZXpJOAww+HK+n0UBHsvObkZvwPy+kaoGyxdIvP2ah/h
 YYxK9tUJMoMW09suPJrKaaa6pZ6frGX/3Xbn0zJpTL0pM=

This series against 6.9-rc2 improves robustnes of the keyboard and
touchpad initialization with the goal to eliminate the ugly delay
in the I2C client controller ISR.

Changes since initial submission:
- address comments from Dan regarding commit messages and function
  documentation
- address comments from Thierry by introducing responseless sync writes

Marc Dietrich (5):
  staging: nvec: add ability to ignore EC responses in sync writes
  staging: nvec: make keyboard init synchronous
  staging: nvec: make touchpad init synchronous
  staging: nvec: make i2c controller register writes robust
  staging: nvec: update TODO

 drivers/staging/nvec/TODO       |  1 -
 drivers/staging/nvec/nvec.c     | 50 ++++++++++++++++++++-------------
 drivers/staging/nvec/nvec_kbd.c |  9 +++---
 drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++-------
 4 files changed, 57 insertions(+), 34 deletions(-)

=2D-
2.43.0

