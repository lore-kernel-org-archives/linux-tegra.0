Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747B41A8A;
	Sun, 18 Feb 2024 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708291570; cv=none; b=aGjE9DGI4GGvjDqfcb9CVoAmmS2hjrYictaX1e+UyBvUQ/G9+JbeV+Zv5d7uhpNdaz5jrSb0Z4DyqxEa9ckih4Cwe6BsUKK6ORliQN31OyoEE7H2ZSKAgKEcOro96COjj3e+ruWALu6skR8m3lwTWrPUQ9EgBkpQ0/pb62MqCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708291570; c=relaxed/simple;
	bh=oHabz+QaeS7ln1pydqTaksVkCKcvK8RQ6gDHqVzzjaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kuX/ofz5wo174OAEPLOp3n20vt5ps4s52T+8CKp1kCQ8ePqnAVP0yBpUNIUPmxYEEQFehkWDMJ8yW6ldoR3M7RGMqAumGsJ4uBkPvxFJNhzTYH0u74rdMBtoySpQwNjEF6++uCC6sd+/xOjf1rxU0JelumdDcSkRopyTZ0/jQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=uJmKheTJ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="uJmKheTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1708291564; x=1708896364; i=marvin24@gmx.de;
	bh=oHabz+QaeS7ln1pydqTaksVkCKcvK8RQ6gDHqVzzjaw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=uJmKheTJLOiyfWNejWlhZ3SiftnOpHe3FcRyGkq5a+h239VTlVNe/7HNc/GQYPMv
	 cb8RF9jpjNLxAtGrwNYIXDFXkr1LxoYQsAelGZLch44IVz3J8isvG1flNokRikiFS
	 T4GHPkAB06P/KUpsNq07UEk5FaLYrXVnnFOCwDdw2RjX+SwmLmuGpL5CAKyP1l1Mp
	 JymCe4f79iBD6BsgH6MDvX3icaWR5UqFYhVr0+Rc0Yh4RIemmMcqPlCeozqGaA0Xd
	 LH+m9eQ3ecCAILP1K0QkbGE9BUzuBwB2fuG3DQhFInjPmVgxoo5zZ1xy9s/5vUrNv
	 MRi+Yag5AusN2sWjLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.32.14]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWigq-1rQhlc2CUK-00X2VK; Sun, 18
 Feb 2024 22:26:04 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 1/2] staging/nvec: update comment regarding udelay in the isr
Date: Sun, 18 Feb 2024 22:25:56 +0100
Message-Id: <20240218212557.22836-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WvzJHFd/gQdPcviZve2RYyvu61zmXzkJ8vv6cYBPy609+52auem
 Tk4xgBu2/Dr2H01hN+RZFInJQh2xfy7bcosINvWtjXMvQdeXD8Ey5jMtrQjKjRjKImyZCmb
 sLKDJDZDR1jUsj9NGnDvfIL/G1fBhov5wXBfIfIwPmaTsA4HUEjcpixjzN90E2O6i7TOja5
 Rgv9UzwWFyzE2iSEqhbyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:olL7hLwXX5o=;JSgw1R/CzMvQJ8fiRJ7OwBERtji
 S/h7i1u5hbf+6PNeUQ0iX85oi2u/K0EaWo+PXMQoQSQs4beEwlssPiOPEXmwiuy1dcCFSheI1
 8TK4eE6/oWAFmnQqb60SHoO5s6H+o38mJOAzkc6/5ATGkIT5j00Ks+6yqEe0Gz012THUi1cIS
 LAepLJXc0qnrwMJnah7yhUYK3hX93K7A3tDhn3qMq0wDLlXS02CfLnTf7lyPwpnehnEHZe5xL
 s49xFCe8q4kYgXMxcFCqfsHP7KI7rdt05Orrsdr52ciJp4Bo1GWo8ZsxuGAPmOiqmDAN6w+na
 gzfvjOfX+K1mckfx9WjUay8Vy/RqVy7GeTiDbrWgX/HZSFLlTQ4hd1QRnUmIFbu4sWEuNGtKw
 NDOI/FQ4uw8Yo6eTJQ6TiBL6VTtrmAcPYeLL9+FZU8WbC5MttJ7Hh5yn309UWa6GRchIE8TPT
 yDAfqFL93IcOO6j0PFtA2hYelUzPKntZg2/Y/SlBbgCUKzYa9FaVZrQ0CzkTMi2rzwbm0JDID
 LLsbIBkrWB9kE42BYzSq4hv855XS6Q8174XAm46EukOwtYLUf9UBGgE7Ub1LicGCJe45+Glt5
 KfMzIMyhk0pitAWABsVF6IcT2hnIKE4RjmUHxOY64r2xPHVYVwUzWbKI5VY2AYvRFxjLhf2sD
 eXQUHmGRnCEO9GMirQ8wL+pWnP300dwcutMGmEF6mxmNtw+QUpmJoC4+5QVlcoat4T9lzzAjw
 WUmwmE3H/jN8zb8n2EXbePLjfLxMK5C5w4eZK7N12MNKy1FAyGqwRkxmSwVkUlAl1L7b9q51C
 rpGGG5RgIpzmLJOvd75Zaa+A8YlxmkpSp/I4muQXOgqs8=

Update the comment before the udelay on how to replace it.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index b3f114cb00dc..ec081d81a308 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -709,10 +709,11 @@ static irqreturn_t nvec_interrupt(int irq, void *dev=
)
 		status & RNW ? " RNW" : "");

 	/*
-	 * TODO: A correct fix needs to be found for this.
+	 * TODO: replace the udelay with a read back after each writel above
+	 * in order to work around a hardware issue, see i2c-tegra.c
 	 *
-	 * We experience less incomplete messages with this delay than without
-	 * it, but we don't know why. Help is appreciated.
+	 * Unfortunately, this change causes an intialisation issue with the
+	 * touchpad, which needs to be fixed first.
 	 */
 	udelay(100);

=2D-
2.40.1

