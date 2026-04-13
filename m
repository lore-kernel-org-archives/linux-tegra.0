Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F53B19CE
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075384; cv=none; b=u92aKInPCuWsRbG+V6F4YtQub0r8cEDHczmilcNzRjbsgUGxjbRGXmcmy/q52Lo4yD6lnv7akECqE126KXljO5N+T9jBXeqlvVURfdLUEssGyIxT2QHnwwJUdM+Bh2QrA9NPFP1AhZtaGXxh1+hPt41UfqajAeOnK7yEoq/f1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075384; c=relaxed/simple;
	bh=PBKLdUulI+4wyDp2nI9P3PFNUeySMHyOOvVbWnDw444=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCw2PLTNW6T7EPEe91PFkRhhN0hl3eVDGjOc/AVmKu3jWjwkUgNODVtPRxhmv+Uevdv9MkhQP83gkwogmunXeXv+qsGDbgUyI0cL1L29drKVXIIEP0uG2U09NPldhMXFQdKPUc9PyXGbE41yhZ2hyV0ZVe3DEotfHlZiz9GfzDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7jO8Tld; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7jO8Tld"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so5626400a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075381; x=1776680181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e6stqMXmYaFiFCQxO4DpERHs9UT6BI5slx7/qV13Ew=;
        b=R7jO8TldyQRDWHTX45jEMlmQhAQBaGzAg4WuFDafDGgCcleim1jje7urD6QS56BHGr
         W2nBFkaIml9GoJ7GIedtnHuImOskv0DRVpaZyvUZDjnnemrWOCG0rWrBQmZuErAqGDW2
         RNmLslzvX/HFh1LDIAkhRWt73rvUFdSlHaGMtNWzirLCD/cLa0ISzGfbrvuJQoLAiWUY
         EHMOmjr8M0an3bwLZSxnAiVQe995sfDp3wagxoEXbZuPeWyq2xZtcNqk0ucToWTYcc45
         q3AF/t7vQqP33Qv2ufB9Up3Mgk1xWKrtCcfnv1w7kt6lKqVBDAjgh7qcSAJ1H0I7WQ8S
         wKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075381; x=1776680181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3e6stqMXmYaFiFCQxO4DpERHs9UT6BI5slx7/qV13Ew=;
        b=EiNQ5idXcyHZieoIPjBtEyaStaj7WOTD0j+LZYDzLKz1QSxuIR88flx4N2Gx37kVVA
         gyOjDJDL+HZgsIP/YBXv+asd2uc8/ConpaHZVWRgtl6Os7zwkQP3UBcuYi+Sk11eARTY
         fVaHvDAoluIeNsghUhSSdPUENI5BuKviS06+ZSD8wAqsyZRQ8UwbXlmfuiKIOgp2KnM6
         zj80BZIux8n2EuKzT+9zdlyozUjyM9ugseH17130vQ8nbepI3pQ7pd4hQBQeMap+My1P
         amPxFVwd5Df5Y5+vP8gkFYSag/69d4WOKyksip/QvyEyyvMYjx0HELwp9MCWYZgR8Nfk
         iw9w==
X-Gm-Message-State: AOJu0YzjQpE7dZ/LbRgg6VJ5aGoBl1f4UJgJGBqzgdc/YCkmfdce5mrg
	ujwa0MuJ4KuE51NLXkxcczcYGCzZnRlpFnBqwZS8UIN+r9Z+K/JyodeuE6+05Vpq2qk=
X-Gm-Gg: AeBDiesjJU3ttn0sRLWZMNECGUDUFZAbyDCA0xT6hU+Vb9StN/RcLdvhO38c3ELzGtc
	Sz6DVJ0DAY7G9ztEUSI9SIui7aP6f5Hyz/QVkb0CJ1T1sGwV+6eVVHGIl8F1fW6BwrUbPZUusUt
	6chvxVLElUvmReSzjuESBivquOs3H64Kxay1bmTj0IlsmLXPQt4WcsRSh8u2raIx874DRjS0XJ+
	AK9CXxCQAT/2DxlyLTa75dt02poECCSRlOZwBTaifUfHMwsDy9NfTuDR1hibjijOMHVZcHOlo98
	8PBEVpOnYhw3XDl7/GtaqSHmXq3YJ4D1iVMgoVcjlYKqLd/RTHBwTIZlBq7T1e5VIjXPk5QRnkH
	WATVxeySdPK9gAs0BkKaD83FZSxngkkx9VOCzfdovJbfyWyFrLuh7T6bGf7uEZkW1+2nWxGNcZB
	NRYZk5teegiYl4+1FMUFpGTrFxJpfAHs5AxTUg2fGoH2W8MHcMdXifzJYLppNFB3kMyIkKrzpss
	3kYT9QlrhHzcqRJ0+eUcaR1OSCXZmyslCqH3npQtH9zKvylBYuoD89cWV1je5/EIVH4P5pbIE2y
	uSTZ2g==
X-Received: by 2002:a17:907:1582:b0:b9a:cb5e:5354 with SMTP id a640c23a62f3a-b9d727a0815mr506275266b.16.1776075380789;
        Mon, 13 Apr 2026 03:16:20 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5af1sm291657566b.39.2026.04.13.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:16:20 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: error27@gmail.com,
	marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 1/3] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Mon, 13 Apr 2026 12:14:53 +0200
Message-ID: <20260413101453.495549-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205057.386856-3-hossu.alexandru@gmail.com>
References: <20260412205057.386856-3-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
 - Add Fixes tag (Dan Carpenter)
 - Remove obvious comment (Dan Carpenter)
 - Move declaration to start of block (Dan Carpenter)

 drivers/staging/nvec/nvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..2a3499dd4d63 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -494,6 +494,8 @@ static void nvec_tx_completed(struct nvec_chip *nvec)
 static void nvec_rx_completed(struct nvec_chip *nvec)
 {
 	if (nvec->rx->pos != nvec_msg_size(nvec->rx)) {
+		unsigned char msg_type = nvec->rx->data[0];
+
 		dev_err(nvec->dev, "RX incomplete: Expected %u bytes, got %u\n",
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
@@ -502,7 +504,7 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0

