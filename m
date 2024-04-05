Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DF16DEDD;
	Fri,  5 Apr 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326187; cv=none; b=N1SW2VwRWb3gWT8Se57HVQSaU7VzDbQRATVfViv+eKLs+DnEtfVDtSnOluPtiL5Tuzq2z4xkSnsPyGMXfcvuh/cjNm7bKee0NGjQbg+bRIiWJekRvrr38hwrh3wEj5tAPB/Z2nnT6GosvnLZDgWAy8wsFPFg5sBCGWsxFV6BMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326187; c=relaxed/simple;
	bh=sFlm1yr8QHBMC+fbR1n42X3cTsM+zkDTCoOOBneR5W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNZfE4BKIdYLVsGmOsNCHcRIgmXQ+KaGgsFZRZy8MNkBuzzbSsHenuPYjqixYcvnsrb53UvnqN+0nrOBs6MAA4MRggrl/fsrQrJfL/3FvOsxkVhqpUDbnRcmc6LgT0MLg3KLtX6VKQNVrWuMdUqCoQXByUKRGxFV1OhIqh1DoOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=GIpR725s; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="GIpR725s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712326182; x=1712930982; i=marvin24@gmx.de;
	bh=T9RmlrBoBBqGuJ6qhTMJOlWL9+8tVpgg41ahOo+E5Wk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=GIpR725sXvjW2qejkpb1e6aR+1uRyiey2m6lff8Dft2LT2GKVHojyuUF5cM1/NHz
	 0VrGcuv3F2E+SqOjCsjXzSmP3upXhcXSuyqoeDvRUy2WbIakD5ynjGeC4CYTzLl2M
	 5248wGRD1r6aReUAtFCq4pXm9ksRr88F2yiRwZcCUxpPLtC2+huiJ4ohJO1vRT9Ic
	 WWK0asJyyKYn6WvwPWpArYD3YVHf4UawtfQeNLLBlwAuikmTDsjHRCWxVJp7GoLSG
	 JMLNQsqsUcZ8dkkVWD5spca+R0UnC/rdfXNcGOZ1kzwHDsz32htei9GLoD6dIiOm8
	 wiZuNl+t+cYTA8uRVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1sK4RB1hFT-00RG6D; Fri, 05
 Apr 2024 16:09:42 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 4/4] staging: nvec: update TODO
Date: Fri,  5 Apr 2024 16:09:06 +0200
Message-ID: <20240405140906.77831-5-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405140906.77831-1-marvin24@gmx.de>
References: <20240405140906.77831-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2zpc4AYeiB+sh2YrXpe7LGi5R7lurvdx/jJW6ZMO2VsqXFeI8cW
 pIB6WLni/2mxKGv5f7UrS3rq8mdzDaxbdcDayhm6VT564dFafrF0elt2YIhFhrhaLOV0GL+
 dnbI2X9qaSHZ1l3le4jd3w+JedcK4a1vW4yQ4mYzY8o/8YXkroQNH4x1hcCTO2EMUx04bge
 e/ATbzUgNJegwT3oF98dQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6c08LnNjoJU=;PNiSb6HOLBl/DNkcwAHSluDMOGt
 FQvgcWl00aK1etEQtMMVkNSlm9XnJq+6ORydiXWDfAHBZxk41hzMo2lz74WdExC+8W7fEIde4
 x7mxFbnc49GgSDxk0pkvzPBe3InhC47GEmt6IVnfHfRuZjZ+68ifJT68qDiGNvuBDwFE+PbDz
 ZHztTaypCiw2rTBsV4P8HRbB9j10bWCkMPQWVxYPYLC0bKEmdR6NQYOm0e7Wr9R4bS7NidUP6
 29qN2a7WQvLOEdwa/mHwSi8flHmdseuADUEg9WCXZ+PZI4Mg+7FSn8nnFIX2PHVisQqpbF8N/
 5x6124O9IL7WYovs9NIEmJcwI3Vg5zGOVfmgPF6pK6J1LBEBpe6f5zQxmZX+VVYNarI8PkJ/y
 IzRCjyuww02Qd4JZmQKfxSprw/DEXrKiQD8OGM+meAtWk+mswHjjtsbOMm4qN0ll+sVrM6dof
 Vbgm2A5PpnDLuU3xYMS3cWMD3GJyJkMUphJvn+pUasiUfmxetoR/ZOQQRTcmH+yctVN4Taefj
 eEoQoRHV/NtRuIDegZn9qIdyX6RCgvkcEisz5NQxW/dFWz7Tqz8kuY3z0zMZttUV7vJX2PClr
 VnyOgUPhdRyUdy+EatV7+ivCHaDnmUfdliJnWVL2k4aOJF1XhwMTP6/j/sOEdu8QYuPM1dA3O
 MasE5BcLT0SCLB9fKJEHIIy+U5ICDB4THBY5I1EtYRqBWodKzut0eCq0mos5fi7OYPRMyqXuz
 D2b44SMg9cQcfEpcz1Pf/90xRfLcicLK1rQM5E5jSsAN3t2e56lbgj48JYEmek7HJSclXF66K
 5qqIdZNRvbdqSKyeI1uObsoABwnSHaXHnKL7IGq5OtOMI=

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

