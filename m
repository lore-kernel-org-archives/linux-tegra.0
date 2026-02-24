Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85413C918
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 04:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771908592; cv=none; b=T5CYgaH2Bz6/bbKN1yEXHCDJ85UiuA4d5XCys8jJQbz+BC8+H2xK85k8nccfIR3HezGKbYTFsFI6iIeuA2hfUFtisnuV0CTMMRlUuJyw8+tA4iSn6prfbNjGZhCivL1fcpVIXw2ud1Ka1yR6NGyX5d6qHbuoFRFs3QrhBHK6YQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771908592; c=relaxed/simple;
	bh=TfowHEYZX7cajamHNWl8arL/Dv+VRy4rmsoFcmYLnTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGVExQC4trUGti2uMyPFfLJGsOKsidBWk6umwSxyK7Mj0+wpjuPunxuKw+hTum96JMIUKpPqC8niRv/+6xZSv8D9CzPSEsQvagmASkRWs3pbgPiK9OHcDVWkhSbysiTsJJXQXWrSXQQuFL6apRPGZfZtdb+sSWmeJVVgtnIMJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqwaMACh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqwaMACh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf43014d0so35084265ad.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 20:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771908591; x=1772513391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFqnBhWK01miB2tsrhsuRriulee8yMWlKiYQhJkSAzk=;
        b=UqwaMAChXLPoobi0W/u6BapLhF4M/L/utYVztalMrw+0hLYKGsf+Z78PhcMUqnDmj4
         DEhY+BXj13M1kuHc5LkQVkmOm3jzrcUpKPhn8Q4YpP5azlaxVn/NBLIzfo8aUEDA74oM
         C+thrZN27YtHT6dsmU92DbU7UTrnWadydvW+46fvhvQLNV9BDPJZTsyl24Vk3EkmK1oK
         85Wi0l4NgNNXg5JL7AM9jAIqMSItsz++RabJeiYJu9PkXSPgoV6zS7RB4ixVolxtqRPM
         o5J37NZSwoTDz6JuPjdqXiLImaeqip1l1Y8caXsCBJiN/RJwOO6F8lsrLqB1CMSqJ8G+
         NLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771908591; x=1772513391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFqnBhWK01miB2tsrhsuRriulee8yMWlKiYQhJkSAzk=;
        b=qFrQo/zA0vHea8VNOOz5s8NjitmAOlylsAzwDFay2jgEaDgb0ehWlphrOJNA1NEM4i
         2BYCGX85N28O517epSKe26ImpQf+s/ZQIvGT2lZQKJD54nnMST3ZXyGFmsbKmCqvCGgy
         eCvZAgZ2zUrli7mlWRSjnLGuZeUx+bgUhRDirxi4xz4KiQt/4ZKfXa9DG2eTvcKOjKa0
         Ekq+sCnMTOXpQYP1b5K8SE5rZlocOw0RTkDqmyvGNjbyRuEH6Z4gfs7CIX9dUzlUdy6f
         9259gdHTs36y1tHa5YORrHoPl5W5if6kdV9QWbW37GETbq68k2FQmrIUASPbAryJmGt5
         BbQw==
X-Forwarded-Encrypted: i=1; AJvYcCXRZKiHlmTn518J5kCxZp5vvd6ktLG2BZXgMssmLFxZCU0DbyMcSNFoh1fWVsk4VYaWPN9lOLFHxIyN8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJFz8+f2bib95bmYwBePDHNy+FGiVuMoi98tiQyNtkoZgWGhs
	X4huxgY55TmV/znkoLJQqUc9sfZFoAcsVo+Dlq1D3nbe05aCnYNr7OtX
X-Gm-Gg: ATEYQzz6TnoBZwkTRmXvelC0bbmL+1aO05mZmFL9z7Jr4p+hfNu6mqHs10twTlBlJB2
	nHX8ghC4e10cZiRfotI+VSp7Be01g+X2bvUwaDdleWcTAQop1H3vddqk0v/EwT4ywpiYdGVDAVv
	K7DlcjQsZfBwd2bzGf6iMQKJDfU7egtWoxyOeDdsuSg8WeAdmX46Ofk+47Zmm+jh45KaumDWgD+
	SC1w+l2TeyBGPLpPh+8dExkng8XKUa4kP0+bsfrZq6YVdN1EEJ9B/Qwfpx3x8Lt56oNcITX+Uh6
	agytH4NHRXm6N4/A3lm7sVxrut4F8eAYR5Rc+M524awX5la4n+0H2RYDVzeh+Bk5sy9pcD0jk7h
	ynulDeNNPMijT/AVQs3NbwsoAEzTGosxGeHhoWZgnk5Ow9lVNO3drkddsZy3MmUvRDT2EPi4pW5
	mNfWVMO2kQpI5HDh5I4LlNMaolhXdXrE8AJusP9jaNmSq1L+Q=
X-Received: by 2002:a17:903:2c04:b0:2a7:95d1:3c0 with SMTP id d9443c01a7336-2ad74450ef3mr86111395ad.23.1771908591002;
        Mon, 23 Feb 2026 20:49:51 -0800 (PST)
Received: from localhost.localdomain ([183.96.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7505bf1asm91567995ad.92.2026.02.23.20.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Feb 2026 20:49:50 -0800 (PST)
From: Kibaek Yoo <psykibaek@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kibaek Yoo <psykibaek@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec_interrupt()
Date: Tue, 24 Feb 2026 13:49:46 +0900
Message-ID: <20260224044946.54022-1-psykibaek@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223143101.76552-1-psykibaek@gmail.com>
References: <20260223143101.76552-1-psykibaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line block comment to use the preferred kernel comment style
with leading asterisks on each line and a trailing */ on a separate
line, as reported by checkpatch.pl.

Signed-off-by: Kibaek Yoo <psykibaek@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.50.1 (Apple Git-155)

