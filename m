Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652EC2D062F
	for <linux-tegra@vger.kernel.org>; Sat,  3 Jan 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767435313; cv=none; b=uOnMWZidAJCorqzUTBaug0C6wJa0saideEkIEnC+1eYnFZei17mwqMTyBntnzIlGHhdUFGt0QPFVtNEH9DTGkJzhXmWbdX2nV+pVU1+TMaXZCwmx8Y2Y2heV05T5XaSY5PSianLLmWQtBTbFjJu+dmpF5LdB8NxisoczUe4BzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767435313; c=relaxed/simple;
	bh=VOA13Pbivn4ePewluyHa91BuOtxjo6GxAH+miwdp4vU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMiwSK/ORRVQfIeyVfWF0YXpkeW6Adk10BwvC/O+lECYGdHw5TM+/m0RyTYUpKcsFSTbsMfgmsOu1lQ0yOBV9+WT+iTcXQ8Q7WieR4ERkMejWbIojneD8PFiKRBO6K6DW/L6iMKW4TWrHwj6pPFWw3zFgo3y8qlRH/kNS2AU7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=kdMuWxnF; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="kdMuWxnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767435308; x=1768040108; i=marvin24@gmx.de;
	bh=gXGd1JqW/0868ZJm0dZ9rC3mljNadGZK3iembZUH87U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kdMuWxnFqh7BfNSs9yz+w3lpPRqpVUdn+ESzF0TpLQJo8sM3a6Km/s3ip7KZobI7
	 I/SdSyxogeDVAZz6sWSLj+3mAaxNm6tHqZSsMBFxjOnvIzcmEXIha0ZMdc/6KykA1
	 5/HhUq11FSJsoWC5BrpmI/bvAmfojsSmP0VvwU2BaPYoQLWIXuyFHc7Y0nA9B1uFH
	 dtUeyXKSnrcWioUnPGjKlG92E4AGGuI7wykejWPwyZf3ILeDTuOt8+ceenp0lJKcY
	 nnxcp2xlhLAovCW6eKUnCBqoKCLAmrJYsBc7NGhfggy4nauylBavySwiAfUZLUEdC
	 1U1I2o6BaWAp9wzGyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([93.237.30.6]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1wIxyT1RDZ-00pPDr; Sat, 03
 Jan 2026 11:15:08 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marvin24@gmx.de
Subject: [PATCH] staging: nvec: apply udelay only after the first byte has been sent
Date: Sat,  3 Jan 2026 11:14:39 +0100
Message-ID: <20260103101439.14863-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hb69BnCD4dvTj/e2eUtppFBtfCetna7jLggPGOtv/2W10n0eZKY
 8PyrwD1EufSnUfyBeBTHGZasT7Ih2otZdb4SJsg8h0hAAA9TQVSLPbz8i3v8miXq/D0EXZw
 0wtlVQGJqMCu99PV7HZWcZj72oALjFkB10fp6/d9GwjRRixdYk/GJd3/UHuUSAqzKTx/z/G
 ZeTCmKPBzsPb5aCIirFrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8mo82SWeWRs=;lDL1O7q9+SRg5sn3Sa9oWyNvJaT
 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
 dRi8oFR/N9zSD9hg/gFjm984fs+aKWV12KseEi

Due to a HW bug in the Tegra20 SoC a udelay needs to be added after
the first byte has been sent to the EC (I2C master). Move it to the
correct position and add a comment that it should not be replaced by
usleep_range.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..e9af66a08448 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
 			if (nvec->rx->data[0] !=3D 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
@@ -660,6 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send =3D nvec->tx->data[0];
 			nvec->tx->pos =3D 1;
+			/* delay ACK due to AP20 HW Bug
+			   do not replace by usleep_range */
+			udelay(33);
 		} else if (status =3D=3D (I2C_SL_IRQ)) {
 			nvec->rx->data[1] =3D received;
 			nvec->rx->pos =3D 2;
=2D-=20
2.51.0

