Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2063.outbound.protection.outlook.com [40.92.15.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1D161320;
	Tue, 30 Jul 2024 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.15.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722373716; cv=fail; b=tcTJ6qoyPd8c/AskjnMFOTY/MxyVHSiHTtnj0usJ4avulncdoIzo6Hr0Qtmw+c3J3xhECzh6BkqTCN+Ce+bIE8/srHz56H9OWNBqQzYRGie6tg3stsxg5SAlP4llcE9EZHWNyG6peM1jjW9oyPa1fSEny2DZqbTXsX9dQeRtPtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722373716; c=relaxed/simple;
	bh=2suon3LeJwlMrIGrl3Ms+IbtmnWdSe+YpYeddaeoH98=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VpsodNfVPiFLkFcLk6G0KV90Rf51f66ctP2DAcRZTyreW8gPWIZdsbQk6cVk3sMvt4Sn7UEivWiYfPKpyXFHYCoxLJmc2fEUXNgqP/FCKZuulkCYyiPSW/He9uGgQNJRt9RH3v/VGAUnbwGVaPiFgKYgcaNKIfZ3b6aLLZOQHt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iuIjEFrg; arc=fail smtp.client-ip=40.92.15.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iuIjEFrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4QBy9cWacbqgTnTNWLz7qfS8ggvokw/aBTN6f3VbyO76CHQ2FwdyeqiSYfdyJ30Og8tXINdfF7A0/M9IGcq9BlXnHaCgtUekco9/7gfLA/ua18MoWD+rhxuj7qA8Psr6dgS53boUTkTz5ECNUX2iVlaL8wjTNiUZl3zVofHZ+tukg2pDJIM3gMElNy9bG5udvWM9N1nKHZGeT6leRsS1V6meWynEhATOH2/UEoAxCHA0ctiA+v/b14dorehVlxLUentrw73RvzRmikHQTRHVb3jx7eSpUf8Ixzaz3v8hJNsqQgPIwDa7VPshSMcaYrk8+MxR1suCdb5bXJnXx/Xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9mrUVB59R5bVM8C+RfV6hgsCyOEIlC6ZlnwrbmL4PY=;
 b=FoFMt+IFLniTkAIlC99UEJ7S/JshvhvgTUWJyv3Q5gL4r86QnhVkTQDP/A561Oncai1ayEWFj1hGLmEqa5Zzf2xNC/ZPCMHbzzGk0y69XAnqAM9RMVU3QPpzWsOWkF6IA3BTJAhkdWs1O8NsERgiwMd7wcD9k8g0s/lw42vK4eL/ug3020KNBLw0+v+xkHMj3XNoWk287I5pFvFhCWkdVp4klAp5hhf+56WpRwJAd5i041Xry64EiURhDbdpvqVCe3iYhC8QrDGIgfIMddSQmfE6n+xwnLwMIgavAx4r6r9+xG35TgTcyk7UKQV9aHx3DmG12gRqSRgQRgDEf98hXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9mrUVB59R5bVM8C+RfV6hgsCyOEIlC6ZlnwrbmL4PY=;
 b=iuIjEFrgSXQv/UKFnJJ7HUAaCLj2ovHmsMJ4ymmQk2BDrjx/2odwQHMLFJrNmUh9l6N3M7htMkO124njO3oYLSrUpX7z/DU6xV9PL9GEYBb30ZgEvFEq+jriuUkCJ4LXaVmF5TQdcSmEk/es1Uv4XvPmuhea+g6jgz0KHuE5d9SFkwo++dHFiz58QY8eXvYHlgmrR3UxlUqxHbRbuH/B6hRkVn9jZZ3YcVi4k91N+o+yhmfH90fRa6LWJcOaG1QD2fzROoY2fZehV+wzfth+Bjbj6gHTD/jd+4bnM/B0ZCNv6S2nIsdISeek8yWs8Ip3464FH1uSsM75zxD1UgY4+w==
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:a03:570::8)
 by SA1P223MB1263.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Tue, 30 Jul
 2024 21:08:32 +0000
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd]) by SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 21:08:32 +0000
From: Steven Davis <goldside000@outlook.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Davis <goldside000@outlook.com>
Subject: [PATCH] staging: nvec: Capitalize outputs to match the rest of the driver
Date: Tue, 30 Jul 2024 17:08:12 -0400
Message-ID:
 <SJ2P223MB102626B10E837EF5A93ED1F1F7B02@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [fAXp9/x3ZIhWtAdkdxPUvqaH0zVd1119]
X-ClientProxiedBy: CH2PR11CA0017.namprd11.prod.outlook.com
 (2603:10b6:610:54::27) To SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:a03:570::8)
X-Microsoft-Original-Message-ID:
 <20240730210812.5648-1-goldside000@outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2P223MB1026:EE_|SA1P223MB1263:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4fe501-a62b-40a4-fed9-08dcb0dbc47b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|5072599009|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	ysYryLvYfbsg75mWbf7dEfPPVqbUYCiAePPORDX0mhJa7q5jlKl3JXbaFE6hmHKjRdak2mz7GWKoVhx5k9xDmBPXmVMAxlQBrppVc24ZLiN5L/x2Mh/JRcrvdDRnJq/Eiq5wcsUXFM/RBOLs/LMJAxFdehJO0XIXyud+qrPj5DHDaG5K9LfAv3DW6TwBX5BRGcyEFFSbdpurTqlb94KIiLzfPKMJDUdvalkqalEVJVBeNunSR7+o1VEuGFKfMh7JDfZwRsToBtRO3qCZVvF2y2QYyZINLkVwBc9iKBIh+B/ML2qwutpdpH18eece35HubJO4X2uD6E3HHOTQOY5K5A/6Ib62OLo0OcuaIeOa7KI5Q3LKT0lEoXOD6a29UP5ANtQNxikeKf9x5RGtl+q712Ja2dvZrARyEAeagperlFKuQpx6U7uwZaQjQcNdn6f9QG8WSQxSPoRwN0GYy+Djh16/c83xH3bKzmPqDSww5iCvRsGdWWuzGQ1d5GpArufWkuYO1Ik+GCtyFgizMQRfL9Bv1bqhXCVwQc12bOFh8BAAw8u2bmuSRgU64GsLy/8akqZGrerXyxi3XzXGmRyAE0CgxbWNfYxmTrD0bzYasVgoOwt2pkgGEV+SwtAa8ibwGtrqh9AAIoKgO91WQoCR7A5LTK6tCkPmXC1oLyhNGENmgKknTNBB01V/x581iW+TFMxQ9T8hIxFS5h6DmKW1PQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CSly8yyW4JLR38Ttqot2CDtW8vRtYL9RtIQ0AVG5zpx9a80Dqc6jWrK/TpAo?=
 =?us-ascii?Q?Pc56P+jRgtqMMMMwx8JR0G1XxK51x4/wMpKTUMFQYgZa+xgQZJiCB6LC0vQH?=
 =?us-ascii?Q?oZ7qLNfOukr8VripaMHblPOBMG3bWYxUaayOd4x0FgyxcGq9ax5z0aK+IX8g?=
 =?us-ascii?Q?FZ23j+tq8oM62321cLMZA+W62xF3HHFcLTVBm/tjesJIV03O8rOXW9A8l/T4?=
 =?us-ascii?Q?d55MvQogVGD4sDakzC9CMBD76aAnX1mJzqum5ko4xQ4tvO9sQD4JQeJWX6cH?=
 =?us-ascii?Q?pS8VmwWRLhB+qdvlY7Vev/0EjmlGKAMeV5q68A3V34hBH33iQZt6HP6NG7Vv?=
 =?us-ascii?Q?0JTCZ1nr7fS+G7xjzieRUQiZRe4xUOhXndua+gc9YTbjNcROIzSIwitbcYsu?=
 =?us-ascii?Q?Mg7KazkqA/4iRrZ7ETWdaFvzS2pJHs72GnKVuTGrdSNmgeVK+EMbbCzndPtb?=
 =?us-ascii?Q?0vFQETvnoY1jjMfrxF6HpVZWZSfzA9I0Ns/s5eAFRmjJBjQXHwk8bUOicdZc?=
 =?us-ascii?Q?GE1d+WHak9heBLQjxSzHKMkRXV+6qXY3SwiJHZogkpBI49edvimLcKzSOYnR?=
 =?us-ascii?Q?YhC7ynLrNLSjI1lQOGTwaaWK9HElUvAUskO7hiT1DqvkQNsnSj3fUZyAz00S?=
 =?us-ascii?Q?XUaRPJ+OLcGq7H9FZJ9tACTsOeYSWyV0/BpPxR0T75d2zJAyyu44NXriH3LV?=
 =?us-ascii?Q?tMqET3zxkKbc335U2QtwCsR6wFl8eDpH4VURVDNE6OnyKh/jYETVY/OGlBHh?=
 =?us-ascii?Q?MWpEbS4ePjQll8h6yB4xfVhLhoRpg/PvUKCvxxzUaNLTqZjFIvKJADtYcuHV?=
 =?us-ascii?Q?6cTX0bJPgv7qXV5Rk8WAGe+iccrEg3B9TfdmaFCGxZt4TacIkc3Ufmov55SG?=
 =?us-ascii?Q?WyqQgzD7fSiN/B7yRgqSkxBwSlh2GnuJbmV4QEQBhwuuEMZgL0g+BmD+C0k+?=
 =?us-ascii?Q?+rymtRiee5+pEKwA+mUSDEut7RXzPNQhxH1ZV8BmYffpX0+6lN17jXAyrvux?=
 =?us-ascii?Q?6fvd4cG4+uBAtUaUeQ4YYF/xUSKQKwg0pFZ2pyAzpmy/g6pd480wSPS8oJ0e?=
 =?us-ascii?Q?gLgFoUnShImQ93+13ct4VUJdOclcyQHJiZx0GjaJEk60OWRe9xK651f+zV5z?=
 =?us-ascii?Q?rgVtP34RmGZPyJLdb0hhgyM8Lh4D/7YcdOB8lns8SJxZUaqv6CI8CqeMq3PI?=
 =?us-ascii?Q?X9iEkMd/33hYg0qSXc+o5AcP9a8dMmdBern5qx/ZuHr8au25VWdyU8H3sTg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4fe501-a62b-40a4-fed9-08dcb0dbc47b
X-MS-Exchange-CrossTenant-AuthSource: SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 21:08:32.3778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P223MB1263

Noticing that some messages were capitalized and some weren't, I
capitalized them to match the rest. This makes the messages relatively
easier to understand for an end user, and reduces confusion about
capitalization. A comment was also capitalized.

Signed-off-by: Steven Davis <goldside000@outlook.com>
---
 drivers/staging/nvec/nvec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index d09211589d1c..bf7a61f05b06 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -175,7 +175,7 @@ static struct nvec_msg *nvec_msg_alloc(struct nvec_chip *nvec,
 		}
 	}
 
-	dev_err(nvec->dev, "could not allocate %s buffer\n",
+	dev_err(nvec->dev, "Could not allocate %s buffer\n",
 		(category == NVEC_MSG_TX) ? "TX" : "RX");
 
 	return NULL;
@@ -315,7 +315,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 	if (!(wait_for_completion_timeout(&nvec->sync_write,
 					  msecs_to_jiffies(2000)))) {
 		dev_warn(nvec->dev,
-			 "timeout waiting for sync write to complete\n");
+			 "Timeout waiting for sync write to complete\n");
 		mutex_unlock(&nvec->sync_write_mutex);
 		return -ETIMEDOUT;
 	}
@@ -392,7 +392,7 @@ static void nvec_request_master(struct work_struct *work)
 								msecs_to_jiffies(5000));
 
 		if (err == 0) {
-			dev_warn(nvec->dev, "timeout waiting for ec transfer\n");
+			dev_warn(nvec->dev, "Timeout waiting for ec transfer\n");
 			nvec_gpio_set_value(nvec, 1);
 			msg->pos = 0;
 		}
@@ -454,7 +454,7 @@ static void nvec_dispatch(struct work_struct *work)
 
 		if (nvec->sync_write_pending ==
 		      (msg->data[2] << 8) + msg->data[0]) {
-			dev_dbg(nvec->dev, "sync write completed!\n");
+			dev_dbg(nvec->dev, "Sync write completed!\n");
 			nvec->sync_write_pending = 0;
 			nvec->last_sync_msg = msg;
 			complete(&nvec->sync_write);
@@ -477,7 +477,7 @@ static void nvec_tx_completed(struct nvec_chip *nvec)
 {
 	/* We got an END_TRANS, let's skip this, maybe there's an event */
 	if (nvec->tx->pos != nvec->tx->size) {
-		dev_err(nvec->dev, "premature END_TRANS, resending\n");
+		dev_err(nvec->dev, "Premature END_TRANS, resending\n");
 		nvec->tx->pos = 0;
 		nvec_gpio_set_value(nvec, 0);
 	} else {
@@ -608,7 +608,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 
 	/* Filter out some errors */
 	if ((status & irq_mask) == 0 && (status & ~irq_mask) != 0) {
-		dev_err(nvec->dev, "unexpected irq mask %lx\n", status);
+		dev_err(nvec->dev, "Unexpected irq mask %lx\n", status);
 		return IRQ_HANDLED;
 	}
 	if ((status & I2C_SL_IRQ) == 0) {
@@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		if (status != (I2C_SL_IRQ | RCVD))
 			nvec_invalid_flags(nvec, status, false);
 		break;
-	case 1:		/* command byte */
+	case 1:		/* Command byte */
 		if (status != I2C_SL_IRQ) {
 			nvec_invalid_flags(nvec, status, true);
 		} else {
-- 
2.45.2

