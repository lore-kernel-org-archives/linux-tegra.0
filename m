Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF343FB7FC;
	Fri, 10 Jul 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677347; cv=none; b=KJGibmjnnl8qJZtl3QAw5+N2aJ3vATtny8MP79kyXapm+JR3cp2annMvoNekxU+Aebz9YTSXIUTeO+K6AqxNOvSIRxhOtBILYGkNFvM9vu6tsE/cGurDx+jmXXsINC9YPsZEjRa+3V6un6c4cFOyb+3riv7s75I0Q18e4Ph1H8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677347; c=relaxed/simple;
	bh=dpP89IwkrCSY+Boby5eNr2aYXV66uMY7j4AKUwAFQpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSpeNlJ4Z6Mmh1uzKVqpOTN1EWrM9jXFh72IwTwgDQ61ugQj3XmnBOjX14dbvueF4x7SOSX8zV61pCx56+hts0/UD+Re6A4bDzOLJ7/pc/zL9ms5MVfKQjsg/1h2xXz3/yBwsjOX0BiXVMlP3P5iEVcpIkKo2mwa6syro3qT9CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1WFMmXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1WFMmXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14231F00A3A;
	Fri, 10 Jul 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677345;
	bh=iQaqxXqn28vzApdMPz4KwrKOsJTQN2cyIuhVC9UIpl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j1WFMmXTaY0PtHQIbk86URk7AajHzUCyoh+3vsidmjmZEvQ3NeLq7w+B7PNvejsJl
	 JsmtxK0oc6kE3jJMGUV8XAA9qYU1L+ZH4HLzlPzp5GaQyYL4KDxJ4DWVHiucq49d4Z
	 toCn5rvo4FdwCT//wjjBvrKnd1jvBVYQLoSxCH6RAZ3vdXm/bEBC7apNmaD8haZnXi
	 /QXhinHXPh1aPcfmFOBX34+u4OJH3Uh473xP4xTSc9nWgUsecopHay2Efv1GXFYQji
	 8et6aZ1nveFNnX+iYs7ds/xdJGDxr4YcO0j4FYOfp5r+XC2YYdNT3Fgp19eFpPGjZ0
	 5XT//WtIKWUHQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 1/2] media: cec: tegra_cec: don't break off msg on NACK
Date: Fri, 10 Jul 2026 11:53:17 +0200
Message-ID: <7e50d6027e1676650d52905cd20eb212c01cd3e5.1783677198.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783677198.git.hverkuil+cisco@kernel.org>
References: <cover.1783677198.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra CEC hardware has a bug where, if the first attempt
to transmit a message is NACKed so the transmit is aborted,
then the second attempt can contain corrupt data.

Ensure that the full message is always transmitted to avoid hitting
this bug.

I suspect some internal state is not reset in the case of aborting
a message due to a NACK.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index fe66336e734f..f8ffaeb78118 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -243,7 +243,18 @@ static int tegra_cec_adap_enable(struct cec_adapter *adap, bool enable)
 		  TEGRA_CEC_INT_MASK_RX_REGISTER_FULL |
 		  TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED);
 
-	cec_write(cec, TEGRA_CEC_HW_CONTROL, TEGRA_CEC_HWCTRL_TX_RX_MODE);
+	/*
+	 * TX_NAK_MODE ensures that the whole message is transmitted even
+	 * if each byte is NACKed. Without this flag the retransmit of the
+	 * messages after a NACK can be corrupt. This is a bug in the hardware.
+	 *
+	 * While less efficient, in practice you rarely transmit messages
+	 * that can be NACKed, with the exception of POLL messages which
+	 * are just one byte anyway.
+	 */
+	cec_write(cec, TEGRA_CEC_HW_CONTROL,
+		  TEGRA_CEC_HWCTRL_TX_RX_MODE |
+		  TEGRA_CEC_HWCTRL_TX_NAK_MODE);
 	return 0;
 }
 
-- 
2.53.0

