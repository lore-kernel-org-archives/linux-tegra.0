Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173113;
	b=WQPDAN2mIPYC/tfmh8psVp0xBYcWsK6PEnOAw4/kcnhnmv9CpozBGU9YQNE0Tlb+8QsH
	 uwqJAqyeFZQr0+4T5gWYuTRo4jRlsns1NaPNUGsMXlbhBNBKGLA9dAwUhN4CtbudrEs4m
	 K+aYMr2imbmlnOh6fbdd25oTUKlmjdvOOzkrNa8+j/YPD61xKazxBRNLIBwmNR+P2GHSr
	 RU5C5hhGLKV/MqNcKpRJSQ3z8RsAZEpFRBikq+nbEPQ4KlhfNdcewvbn39p6FS86wDYW0
	 QTSruPZ7yUux/jMhNvBHJpQS9j6KzsOjdcLJ12+MbaocLrz7gbvUsQsVKfRi0IBwkaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173113;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=RHVPNZ41NP/n9xdkmaFNDqJeQcZ0laER1vG9LtF3l+A=;
	b=OkHE4/TjKWr6290FSyBjOA3PbQCCU1GKtr/Lgl4RjAIJVIMRuxYplSRt4GNCggpIbgs1
	 ANT+cYOYcgQAAs4nQr2wPUs7dR7VD/PVZIFPGq1ES27Lsi709PLkH/2F1SzQ0AcKnJyQT
	 T4cCE06KKf+SvdJfR2Q1UyLuUfdZyF5XD7gUBcA8cEeOiiKvomTutMXjMeZAjAjMNY+DF
	 i+c8ABKVB0DMVrO9fpGb6tcavkzr3UcexRPLUCJwXUREvSFio/abM+Mzkjxv79neGs3of
	 WS0nErVzREQrT0By1wZPwjrkFGBcVVxO98nfIgUnsA417ISSxPRp71FaCIIULjzrS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kDrIopWl;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86F606A31C;
	Sun,  8 Nov 2026 21:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C86F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kDrIopWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794173108; x=1794777908; i=marvin24@gmx.de;
	bh=RHVPNZ41NP/n9xdkmaFNDqJeQcZ0laER1vG9LtF3l+A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kDrIopWlO5DdWQwI3rc2wnJkrXPVO1psErNkkCvpI1Fo0LE/HYRwOpasgV/PtIAU
	 m1z5sTnpGtWz4w3ndsohdMjlnskNTRXb9thqlNShpLg0m+jxIptxwbISc2KoRd5IJ
	 X08BHA6MLdeARxmqsJ4UMKcaBRRVrg5WVczsekIehZcScrEWAlggluOpUXeg5yCh5
	 8rutat1+lMnWJ72WfhvUPjMymPAQZ2yZCZDRxH08mO+g7I3urTnA2SHHOa7rLi9li
	 DBWYXbq7E9Ldq78Ikmm7Bv9UGwvM127YAk8FDP/ZDTpjvnPyWIe2QVN2jGzaxF2lt
	 wN7eYzxkdiVEcqgHvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1x5DkW0OKS-00TIaw; Sun, 08
 Nov 2026 22:25:08 +0100
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
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 0/2] i2c: tegra20: add target controller support
Date: Sun,  8 Nov 2026 22:24:56 +0100
Message-ID: <20261108212458.275980-1-marvin24@gmx.de>
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
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LlnWcJV8BUBdW1SaWRS9JTz9AwfbLDYbnKR6x0IKdLqN9PBwKFs
 dSrC6MQ0YjqhXNlRNgFd5oOsu1kSkEauy4x9UVvS33/DAFTGhJvDsO7DvJTuvNaXo7PmMWA
 xcR5QjFnItSVDc8jWCOteXWaJ3cOz2z0YXYfxWCcqEbbrAX7iM0txudlsrnY/Ew08zL9R8M
 cDPkzczNVntBk8axhiAVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L2qxJvjQ9fw=;/aRkkepgLPa+Usg8J3EALZn5E+L
 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
 b+k=

Hi,

this series adds I2C target mode support to the Tegra20 I2C controller.
The driver is very simple and only support single byte transfers. The goal
is to remove the NVEC driver from staging with which this implentation was also
tested.
I used a separate driver for the target for maintainability and extensibility
reasons, in case support for more Tegra SOCs will be added. The driver was
coded by use of an LLM with a few adaptions by me.

Marc

Marc Dietrich (2):
  dt-bindings: i2c: Add Tegra20 I2C target controller
  i2c: tegra20: Add driver for Tegra20 I2C target controller instances

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  27 +-
 MAINTAINERS                                   |   7 +
 drivers/i2c/busses/Kconfig                    |  14 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-tegra-target.c         | 372 ++++++++++++++++++
 5 files changed, 417 insertions(+), 4 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-tegra-target.c
