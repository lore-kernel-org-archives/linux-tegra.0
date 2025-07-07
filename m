Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE111DA61B;
	Mon,  7 Jul 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879906; cv=none; b=JnHh72My5s4mbP9KMu4XRLw2sNpsm5/L0QnbC5y2M7a0jejeVO6TyeheIqsHfa5JhulhcohFbAEd3n+MoUKgFV/VAyXjN/HrDJvnNgVHxg3OD95UztbTcAs5T3TaZ7wa6oSqgagJmk0dectG8wemMZsfQoLJQrY/LmAggCMSgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879906; c=relaxed/simple;
	bh=OsbU+JWlkJko6AeBucieqGeCprZti8QpcIi0q3kS5WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tMsuIObb5LIFlm/STw3YgntlVGomNbOYKxXt47QuMYaVyP1amDNaWqi/HFTgja9rP0Jzbg2wLbn3FC6Uz4O22B15Nq4HRyGIaDeuS+JCfhwsaqFR5OuZHHgDwOt8jhAyIK9lvGYOwpTRznKS8YlzOw534DI8UXurTVLTkZqn87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=BUxUMpZ4; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="BUxUMpZ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=56yF/zI7i6sgqCq8VI4vVeBeXQpKc4+9Sjf8ASmThTs=; b=BUxUMpZ41VghoI+Vz9XXRZu3fk
	4IKlVayPb5Ns8jQ2nDmw9D6pa+TpLyLpmzHTfPTNjT33I05j2RgN6PYbS36GKPqI1pmY5RIU4/lZm
	1px5hEMyp/uE9gGJGh72q81jAQ6OwmYntvt6zQ1uPXsz9FwLZLKLbJ3HTZLyRtAkpRTAWxfLyd4aA
	nV3JHK9ueyewZlo6/56+ZFeS6nsuUfnR1SjfJaFAe6L+SDkXe2i2xx4UiZN9KTjuveXMeyFpD9a4W
	jb7CqUX90RTl7ljIQ7QFQbjlaFq/8pYrtjlaYZD9cAa76kXLq9Lt+qNEiZyQ6O0xcVqABr3ytlo6g
	HK2bn/xQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f] (helo=senjougahara.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uYhzH-003mee-2n;
	Mon, 07 Jul 2025 12:18:12 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Mon, 07 Jul 2025 18:17:39 +0900
Subject: [PATCH] gpu: host1x: Fix race in syncpt alloc/free
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-host1x-syncpt-race-fix-v1-1-28b0776e70bc@nvidia.com>
X-B4-Tracking: v=1; b=H4sIALKQa2gC/x2MwQqAIBAFfyX23IIaYfQr0UHsVXuxcCOK6N+Tj
 jMw85AiC5T66qGMU1S2VMDWFcU1pAUsU2FyxrXGG8/rpoe9WO8U94NziOBZLkbT+NnCIbiOSrx
 nFP2Ph/F9PwA03d9oAAAA
X-Change-ID: 20250707-host1x-syncpt-race-fix-e337f1e2ea28
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mainak Sen <msen@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mainak Sen <msen@nvidia.com>

Fix race condition between host1x_syncpt_alloc()
and host1x_syncpt_put() by using kref_put_mutex()
instead of kref_put() + manual mutex locking.

This ensures no thread can acquire the
syncpt_mutex after the refcount drops to zero
but before syncpt_release acquires it.
This prevents races where syncpoints could
be allocated while still being cleaned up
from a previous release.

Remove explicit mutex locking in syncpt_release
as kref_put_mutex() handles this atomically.

Signed-off-by: Mainak Sen <msen@nvidia.com>
Fixes: f5ba33fb9690 ("gpu: host1x: Reserve VBLANK syncpoints at initialization")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index f63d14a57a1d950daa1a5864613d7f2fe4d04aa9..acc7d82e0585e83db2da82933ada4c817114b16e 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -345,8 +345,6 @@ static void syncpt_release(struct kref *ref)
 
 	sp->locked = false;
 
-	mutex_lock(&sp->host->syncpt_mutex);
-
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
@@ -369,7 +367,7 @@ void host1x_syncpt_put(struct host1x_syncpt *sp)
 	if (!sp)
 		return;
 
-	kref_put(&sp->ref, syncpt_release);
+	kref_put_mutex(&sp->ref, syncpt_release, &sp->host->syncpt_mutex);
 }
 EXPORT_SYMBOL(host1x_syncpt_put);
 

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250707-host1x-syncpt-race-fix-e337f1e2ea28

