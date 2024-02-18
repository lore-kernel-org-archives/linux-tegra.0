Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74401D689;
	Sun, 18 Feb 2024 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708291569; cv=none; b=iE7XSCHiK2P8owyirsnaOu1e8ZDq5xon4qOln0InWs9+dyTChEfD23+9SW/qJbSRWzO3XsRSzatjcfPsnewvyFHc1qGNCRZ8Yh1SlKbiWpJ5pNqIsoFFPlOYBh9iDj3Y9KP77dfXRV+4I5uSl2WF+vmqp8rJ6nbjOu1V1G/vSWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708291569; c=relaxed/simple;
	bh=B8vzMrUJ7KAD8E1fxA9rtAVqCBM5B0C8Ja7z4Tn1Tb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y7TfKbJEQ/u1XohadidsQdA+9YJ2qj/m4XdS0MKup6HfZu4H4iqnJId5ZMprWkXRTJxDXBYMBDvYQQjupwE5NxagLIxOrSRiLdTYh/xfZ/z/Qtn3OaD5u+WZBc7RuhS05nGrMNeF/wzP363zKMTANCPDb2v3kKNAzjmuTUeILtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=BhhUDVx4; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="BhhUDVx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1708291564; x=1708896364; i=marvin24@gmx.de;
	bh=B8vzMrUJ7KAD8E1fxA9rtAVqCBM5B0C8Ja7z4Tn1Tb4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=BhhUDVx4xmWb5AAwL0wasGBcnlwwWhtjwulScSIWRrjG7UbZMkr+qzMTb/0zy7b8
	 8Qd7weMWiAgwDP5xAoSOWStiQ11qt5sm73Caqgkiwxou05YMM4c7cFSkwSGpfaDhO
	 lC/VdI2+7qrWd5rLpZbUJpkuf2oItVJmK+fQ2DtGfSPyhQVkwwmJVA7hd3TGfyjZs
	 HzKbzClyv6h075Vcxodkgqg31U82MmVD+9BtMTZDnIDlNL+zQ3gat3445hwmHy5S0
	 DGzok6/vBx0JlwlmkzdchwFoev5R0+8M1aSbOMuDWYP06RjOyuHr3HVmhoZKtUTxz
	 ccrE0T3AcLfwsppf3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.32.14]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1r5Eo92yNN-00btyh; Sun, 18
 Feb 2024 22:26:04 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 2/2] staging/nvec: update TODO
Date: Sun, 18 Feb 2024 22:25:57 +0100
Message-Id: <20240218212557.22836-2-marvin24@gmx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240218212557.22836-1-marvin24@gmx.de>
References: <20240218212557.22836-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zvdK4daQGFUMDSGgmHQ/W0PK4wk1x00HUFSa8LibTJ8XRCV1Bpf
 w5fvzrh+uDV6zlMPc2SdhZGGdxgkrUr8BEtW7R6/8TBVJ1CP7jGbN3y6rkI72dWhZwaAQrb
 wIXW8z0VFEqnvrF3Lfhz/n7FSEDXU99zVoFYkV7oWzOZiIX483kFYGqsHnwWN5J7DYPkVo0
 URD1FfW8Xf2n3p4n57WuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EMkgyQqZXbU=;zliopkMyDoJaiYGDR1r62qgqNxc
 TE+uS7zHaHO8MXG1wzmrO8Jmsu2Ws9B3ImLJK4cEPdgrqV/T84wFFQ5OUEcOzJsDiBPBejHz+
 1oKhMA5diufrQoMp/cuaj8Z0qiqBBpYvsjKfjYqnEi+DuqureqJ4LLI4JOxgpWyLHAVTv/k7b
 6jWaI7jFEiZ/4IUQXjQQywNjyU+Z3nqG54zUJq0Mgrv68lu1AUiLrexLlaePkhwwCvfcS1vik
 feV4HYsGxenWQkZfH/ouhNJtNsFdd1Sb0EPJuJjmz/E0xORSI/AB555xIz83V8/6ttubF5SZ/
 84338R0HolIJ+/ciIlLHjC5jZQKXIpiWX3Mij9h7KZS/wXbTCkVo3M4KLj2TI4OELPDiSdx61
 xM0CPQL9vjet9bINLsnyKRTvSfdutXNrJaW57DhbJ21tWhySVfsIwr7Ci2AYTWMWP/1J4AfKg
 9PdwSogexfx/nDV5LOYZ9e2+GdeDYa1E0qo/AFsU3AckL9KcDyP2kjbrMxui+LFWqjcaVLg33
 c19t2qrIV3aUrVzBSbm3OcvqX/h/H6bPAhevnf7/kW+T86JnWd0el8egzLiE1wEjogU36NYKr
 BOkvLBANEDvjMxy9soEu9nMS4KawQCUPzvN9hPxsSDqmyitxAqJ2d0V6LvgKxL/6p6SYV4E+X
 z6+xTDm6lBvcXGfwFkMW5B6HHQgbs1IWBTMCE8x5CCpOm7CeJ8hsw1nXeV6xaHPX2JiYcctdS
 raCrFxMNo2wKnVbB/TmeTrduayDEzq43ZdsIwxyvySHci81vspxmqzH8GfpS7/k8q9w7CNSuq
 gUQLwIzLZMZg0I9J6z9+PntESI5dHFnw/zLWADC4E9+iI=

replace old/implemented items with new todo list

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/TODO | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/TODO b/drivers/staging/nvec/TODO
index e4d85d9b4681..8afde3ccc960 100644
=2D-- a/drivers/staging/nvec/TODO
+++ b/drivers/staging/nvec/TODO
@@ -1,6 +1,5 @@
 ToDo list (incomplete, unordered)
-	- add compile as module support
-	- move half of the nvec init stuff to i2c-tegra.c
-	- move event handling to nvec_events
+	- move the driver to the new i2c slave framework
 	- finish suspend/resume support
-	- add support for more device implementations
+	- fix udelay in the isr
+	- add atomic ops in order to fix shutoff/reboot problems
=2D-
2.40.1

