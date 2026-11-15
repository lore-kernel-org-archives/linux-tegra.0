Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775542;
	b=nu/GUImo0DMmdmCZSII3FDCsKOtY71ulwpoVarQFW+OGq9r2Il/bYmsKWRDxO8mpWGB/
	 dubm0slhTgrlqffWlMI/iv+UsVrwDcDJNV8Vd7wsaf2gWQaznt7OmzFeJXTt9SYs3mqbr
	 pa7C61UGVlvtbDcZ232qr1ED/+NiQfnxRNdg5exSlb5RMoVK5dEYMFaKGvsIgpPADm29y
	 8613JkRc1cSQD7CwqV2JqpJaf/JczZGxsqn0LiTPsaNAqptSJNJdzmnuVqaB7qPOofUsp
	 ZY0/p96GSlKBop3vItL4YVjQyLt8pL/K0Bqzndcoj9DOdbvrYNtzbDdpOJFeL0xHhwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775542;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=eTMmEzSNVk6r688mBZiXPNERsMBGgWKiIc1nUhSF8qA=;
	b=nLTo2gu3oqN2VYSmygmaK9xI0dvYFGhG3TadR9RORS6T0u6PbCy131+yrENr1u6WBr6z
	 fYtzyYJKpjKeMNInsFzS2ISvHmhcFEt3vcjFL5cwOPJHORRzOQH8iTMVilAgflHPU4YSi
	 FkfybgKyW7Hb/Z6lKekQ0Tm8q+kKffiqz+ewFUaawWWNJd8KcYM0n2hHCujVNXZGCiVVb
	 0fF+RYoizDSnBAJf3tBgu/V5qS6GgpUv42VumKumAquzV0pioxiMBBcU4hxSNoB6Qzmuu
	 wzeJ+Smy5KQPOkRIQIcAxqn7SNB2u9AQM0ayfkwu7LMF1NEXq/BIDCUwXv9kA5/Ybug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KJKwneNe;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F2606A329
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 20:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KJKwneNe
DKIM2-Signature:  i=1; m=1; t=1794775540;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:dTwTbc3g3Y7i5u/ae1/Rl/Mt53p7
   k5w3DOZ5U35QQokkezlYGLhinY4Moie4ccF9meTNngbUi44dz1ULm/080obC/zuyDgMk6ZkaqYB
   HkujdynhtnQdGnI1mi7GR9234tAryhJQ2EAk1ImU7aBPzvxHgrPXTYeGgEUsPH/S8OFgnup3zLJ
   ZazEMYkVM1PBlOdN082k77zCPdD0a9b4RY270mEpdlZqvczk36N+oHSZIH9JMWdnHTLyef5ySDx
   Kp7R+IDwjQYD3dWm5h9P2c8HlVVcrVJc+sc7DGciCGYNtPcNpT7E16ToBmDxk5eSgkOYv4maHsA
   ln0lkICLf6OANA==;
Message-Instance:  m=1;
 h=sha256:
   4I3OjRUn/YQ601j5BIaL4teeCvbkZ+JqoNNNzMEkIqQ=:
   RfXYkpD9/Mlmq/FJWAE6ciXtDNWRDUkJuoT86QVIU54=,
  sha512:
   ulWMR2B+ZIFJ9u6fQ0C3H+IcpWyeDKwd7xiHGFRCeYfiXnEr1T5FmNdoswK+p3yGUiWEyb0jHPFqTy00GlA/rQ==:
   CmaDIdzXO/cuk2AKUZyp/7WGmHhltVjnSllLMJz0TOYUlLwFAccvkYqdbIZsqZv78geSYQwXzMi6OVoBcq5R1w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794775532; x=1795380332; i=marvin24@gmx.de;
	bh=eTMmEzSNVk6r688mBZiXPNERsMBGgWKiIc1nUhSF8qA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KJKwneNeCsWrVkoh6uNVq2rjvMXbvac/cv9pBx/YsVjfgVAcR5ciis62B4zI/WHC
	 F7FVa80VhxlYTFlqKMMLr6FSbMo6Nq44IrdwOxveLkrzgV2lu9fl4i0EUE9Lftx6a
	 OBppaD8WdTCAfA5QGSvj/lM1SUAT6u6dzftsQb6qGjHTlnS5yVAWSVHycMB8vxR9z
	 1v9sFXn/U228UWsXlrOe3lSvz3bemzJvOIUxMKmc6rJoeFh0NuIwYpDbLYWSGuL9V
	 tXwc7OEjQM013NwoZFxlZRryyE59cg6Wjtri/47+cwxpBsbeb2nT4vSEHiZ6dX1pU
	 w6TgrBgXt5cwRbMX6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1xHijc2WFM-00E9UM; Sun, 15
 Nov 2026 21:45:32 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH v2 0/2] i2c: tegra20: add target controller support
Date: Sun, 15 Nov 2026 21:45:20 +0100
Message-ID: <20261115204522.360063-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9DxBZZWA3wSZfcZ9nUWgP9ElJ5AjJXMTUGepJjyqDoq+TcCsxEn
 trH2+QsB5H5DeVYjSAm2RU8vvsRkSMx8Tr8TGEZcdtt/WfN1kQud1pOrmw/BOnxaG8QjPKl
 xVhr6236tS9ZyehvaP2+MNUVJQ1YcuQ+hjUUmNvuiQlKnMtR3qsyQ0P1YocvoOWR/EvCjz1
 Sm5EackdGHjCgRQ8I3kEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j1kTTkZS7FY=;lHfChCpts2Y4J3iOLqyMnKB581f
 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
 1YjRkRUiZQ==

Hi,

this series adds I2C target mode support to the Tegra20 I2C controller.
The driver is very simple and only supports single byte transfers. The goa=
l
is to remove the NVEC driver from staging with which this implentation was=
 also
tested.
I used a separate driver for the target for maintainability and extensibil=
ity
reasons, in case support for more Tegra SOCs will be added. The driver was
coded by use of an LLM with a few adaptions by me.

Marc

=2D--
Changes since V1:
- fix minor issues highlighted by Uwe
- removed NACK support, because it is not used by the EC I tested the patc=
h with
- do not access the registers or disable the IRQ and clocks again if resum=
e
  failed (noted by Sashiko)

Marc Dietrich (2):
  dt-bindings: i2c: Add Tegra20 I2C target controller
  i2c: tegra20: Add driver for Tegra20 I2C target controller instances

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  27 +-
 MAINTAINERS                                   |   6 +
 drivers/i2c/busses/Kconfig                    |  14 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-tegra-target.c         | 351 ++++++++++++++++++
 5 files changed, 395 insertions(+), 4 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-tegra-target.c

=2D-=20
2.55.0

