Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47925B30E;
	Sat, 20 Dec 2025 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225367; cv=pass; b=VE0iAG/N8GFw7uoXsOAJ48jfn2sbFMW5CBEMnd3WFtgIW6oTTYzOC//zWD3fnzH5ZhhsttolFSKAQITiWgv9qcj+idNp5eSThKCAdbsHbZUdGea0c3xnWRfdZhdKKRTYHVXGlqFJUysdpqQSCKmyXvmTrpBndGvRveRNylaT8yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225367; c=relaxed/simple;
	bh=T6aWBzT39qTLvMNKP9hKWThQPSTdagZRXfpb12qxqvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rs5kOstUs85yyKx+L0ZgxlmlI/kvOmMbfPeKJgvVvJys3Uu/RC37EULwLBbpQsLbkaMOGlpLosFTfhvHh4LFKXkd2r7O7WWVkQqcpQRh7ggLTxKN1NTpR1lukwdjAArWkKn2adyn0f69e/sayZZCY4xRilG56w2tbfmeHeTI1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=DnIAFoY8; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="DnIAFoY8"
ARC-Seal: i=1; a=rsa-sha256; t=1766225352; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=S6dUv+xN+oxi1PiJAWP3VtSGLKWYu37bvZPahF1uNd1VehbSlYe9vhHqZVKQud/HdlR0C2rLIRsRhsKPbBcckXNYkQCFlLyyv3ZQQzJyJqWxfHkw+IxT/AmiDux7dgRNbbtmoBEthcOo1y9aE4vmbilfkuYIioSof712ye88wFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766225352; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rvtEM/cp3R19JpomKWwe6CGPOEWSj+CfYc4z6EuVXYE=; 
	b=MlaSwzM1xLtsZzTZwsx04WKYsb/UL7EJLU99ikE74NQii9zQfa9xvLirg4El+FA5Tz2aVP+Vu0ieKu9h9bGZsm6jkIgonf+mmAA+/MDznrLvZewGZ7SeYW2wC/TJmNvs3VNdig4JJMNT+rX0qZ/vnqDsxR87D8JixBAMacEX7bM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766225352;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rvtEM/cp3R19JpomKWwe6CGPOEWSj+CfYc4z6EuVXYE=;
	b=DnIAFoY8TIN1ntCJ9+gqkjnFN5S7A5UQU8kyoVv0RjspIEX7Scam5cdKwRBszohM
	+ue9tmpgOk5oEbsD/p5llC2G58d5hgHlhkzhjPqC//Iqw6Pu4arHGj+Bt3CpMI9A802
	vTMKpqR/wdpW2xF1SLPYspXF/MsxHL/XKAH6cffk=
Received: by mx.zoho.in with SMTPS id 1766225351870511.8530313020009;
	Sat, 20 Dec 2025 15:39:11 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH] staging: nvec: replace short udelay with usleep_range
Date: Sat, 20 Dec 2025 10:08:20 +0000
Message-ID: <20251220100849.41214-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Hi,

Replace udelay(33) with usleep_range(33, 66) in the nvec IRQ handler.

This avoids busy-waiting while preserving the required delay for the
first byte after a command, and follows guidance for microsecond-range
waits.

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..6ffe5e8656d1 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 66);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.43.0

