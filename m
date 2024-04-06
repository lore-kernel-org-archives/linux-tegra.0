Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD02B9B8;
	Sat,  6 Apr 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406698; cv=none; b=cg4A55pVFStRwnQpGIDi4kgqKJxWa+HKSclwcyvqWrF3DbfIRtV2j/BMNVCaeJw8Usb/0UiGHPhb3hHLE6dvSci5vIVJYS7BFIjuVBSzDa/OvSUFqDXZHG+x/rWkPtEkHC3H5Y0A2crY18oWwHRLQhps1J5LHMPhMarpOHgiOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406698; c=relaxed/simple;
	bh=sFlm1yr8QHBMC+fbR1n42X3cTsM+zkDTCoOOBneR5W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEwWn35LhFNUXxcghGjFbBbjLaBKQwoXxBiH7e+7DgGBP3omIMAZ+gOKgSEcCearpJwOim9xpN+J7JpgUrsEpMzJVVifwL59cJrJWzCwTGX2PWKHfJil6cFrfmSvzp8gwrQLEAjpOFWYI6u8PmnqSoGJaRYiOJflCGRPivV28Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=WfoZX8Yu; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="WfoZX8Yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406692; x=1713011492; i=marvin24@gmx.de;
	bh=T9RmlrBoBBqGuJ6qhTMJOlWL9+8tVpgg41ahOo+E5Wk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=WfoZX8Yuiv1sOM6Rj2Gtj7hITQAraQ8mMtqszRQHSrlkHqzpXDtr5MmNtTyK3CvJ
	 yFARnsQf66ci7iOGj25nRQvq/p5ukcqOXvewhWkVM1IeAwtaOwb7NcAJkppOppi+3
	 Q76UdsKtJnXzI5wQz3XHTXrfWY9yS8ZqkpFf7kmcM/4GHmHFYojAnvKPdVX05m5qi
	 KvxRxAivIJg0Wlg55/rgl1XLDrM+xyH6FGF6w2DDzjHkCmjrKNXPLaxc5uS9Kfy+j
	 G4SfoX7a1n+CCUoY8jQXokcxkkvNvQSdQBxlaLxqsg6htHEDyg4sGJKgqx8ok+VTC
	 9C9K621qRcnGfUVcrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hZD-1roQVh2Bvd-004lMx; Sat, 06
 Apr 2024 14:31:32 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 5/5] staging: nvec: update TODO
Date: Sat,  6 Apr 2024 14:31:23 +0200
Message-ID: <20240406123123.37148-6-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406123123.37148-1-marvin24@gmx.de>
References: <20240406123123.37148-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FhvmhrI96KdwIBa23m9XyyBai3ylAXNxJcnCEB6hR8gW4WnhHsR
 3BAojpp6mczKaSbLQX3Ps3NImIeo0eRbdiN/7UHfRAQt5ySC67/ZwUiTh4PHkRfGzD+892z
 o5YcpdctxB0TKzVAEaVJ8AYerhr0C/x8/84xSaTkrnM57MfOPdNYDbWoTAjq6UyS7RUFWf8
 OMD4bLvegjOe5Eg7Jkd+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uephw+Fw0KI=;+LgL7JZpvW8Xn7C0/+XZTgstq+f
 4j8PkujKzRme66yBbfPoVfXwabvu5j3XcivbX90EQ7zG2TNSMn84RdO5R8Q+o19kyIOwGUPht
 6B8USdbP1uXcsJ4hL2XaL0ExOg90XWPoK16msmDDCN215VVAyNB0oPZj17Z6r7Aie1El5GBiJ
 w7h0WetBAkLkQIE/Af6tIJsG5QevKLZ88/VVKO7j/0V983MVueRumbqxquxlDN981i2pzLbzl
 syUkHTfSZduznGnalgbHlpmGDftX0np/wqBA07qFfAbN9uVF8Oy70iIbB7a4HR9AjBKPxYFFx
 v2z2zgrANs6j2RCUr+lRKvBaBUKakmoPzR93B+3VooYWLD49IBXYjFHOUaS3uL1tAA62Qe+s6
 /GJSSNUMhEO6Gpnzp9czDD4NTp1qqaEMQDH3e+yAWcD3Dtwut3iS6QgrXTkSKFq4dSCS1eYkX
 WRkTAzVYEOenqrBVZnOnZD2zKX4QKh2Y68W558fvFDwtc9IdW+MS3NlynqS5Q2WOVodU6AjR9
 /DwNxc4JQOn7r1OeFRzmM7Iqg4Xvw29JKwOMPFx8KaRXLxkLIlkLoVzqzOdaFpzsFii0IoCIk
 oAszt40j+rBrbyRqUwVkD6OVacKIF5iGSi4vnUeQWsG+/Kqx1LPfP2htXeZyuRfVrZzhxJwrm
 AXRJoaCN5xUrJ94uO/Ti3/vulsiJRXsZB/CQnmWuuQuI6fX7UeAuhERtNmO0hl1+LhLAN7HzO
 3Bq0iLmyR3oaXcJlY1A3J6L9Qd7owGgT0giEnVFF7HqKEaLlWAMTiTx2z02itbTvHqBFXbDqB
 +qi4DcEJJoE74dYWSJXNF/+vVo/PUcb8eZ95VwJj/+0m4=

Remove isr delay from the bill.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/nvec/TODO b/drivers/staging/nvec/TODO
index 8afde3ccc960..33f9ebe6d59b 100644
=2D-- a/drivers/staging/nvec/TODO
+++ b/drivers/staging/nvec/TODO
@@ -1,5 +1,4 @@
 ToDo list (incomplete, unordered)
 	- move the driver to the new i2c slave framework
 	- finish suspend/resume support
-	- fix udelay in the isr
 	- add atomic ops in order to fix shutoff/reboot problems
=2D-
2.43.0

