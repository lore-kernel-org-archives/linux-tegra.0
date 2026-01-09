Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770E26ED3D
	for <linux-tegra@vger.kernel.org>; Fri,  9 Jan 2026 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981192; cv=none; b=CzkuHd1kZ70yP+Adny5KucpN5KZpgzXMlrfdgexol+5m73DR8W8HE9b2awnnrI04hrWNc6UAkheu5p7JqqgoDmYqVGyQ4R4Rz5i+Be1qirWqj/FgqEIv60OLzIxOmiW6Yx9+wmknAOzx9rKuEwv7WPCWX+qr5L4EwpChEq7sP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981192; c=relaxed/simple;
	bh=Z/LefxQhDxOS05TUk63yHR7hOc6LFlX4nfV9XCmo5yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDOaxAl9WbJhF6AlgCuOPra8wAsyCQLKEoe4cjT1OYjjBFSzXYT2UImyeQPH/NH2UrZkhOPx8Zcj7kKyE7L5H92o1vnIGVydZ1/8fWEqKAnmervaSTuStlODbCZDPMq9vTJpbuqzW3H3AdrpPH33Y6S+C9u+/EK9FcBEjUi08Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHWCu8Bx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHWCu8Bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767981189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JCV5pbjrQIxVIgwZc8Ps0PqRe7zc0Fp/D+kLwoqANlU=;
	b=eHWCu8BxohmQliW5wa+kGTV1HuzjAjDB3OEJa4dqFPfPIilxXsv0lYWlz0V2EM2AimDzST
	uQ9kg0Fyh8a7vfCnRnnpzH6yxdGQEyaRfncYe60iCQSXPxFx+YzarX1HT3ErG8aL0VSMNR
	8V3EqtoziLKQA3zHE0rgD/GcJiRQRU0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-s3dCzBAPP1yeVZORCWB8Og-1; Fri,
 09 Jan 2026 12:53:07 -0500
X-MC-Unique: s3dCzBAPP1yeVZORCWB8Og-1
X-Mimecast-MFC-AGG-ID: s3dCzBAPP1yeVZORCWB8Og_1767981185
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62D9B1956050;
	Fri,  9 Jan 2026 17:53:05 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.65.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5544B19560BA;
	Fri,  9 Jan 2026 17:53:02 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Tsai <danielsftsai@google.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Jared Kangas <jkangas@redhat.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] fixup! genirq: Add interrupt redirection infrastructure
Date: Fri,  9 Jan 2026 12:52:27 -0500
Message-ID: <20260109175227.1136782-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The previous version of this patch has two related bugs:
- irq_chip_redirect_set_affinity() doesn't update the effective affinity
  mask, which triggers the warning in irq_validate_effective_affinity().
  This bug was reported at [1].
- As a result, the cpumask_test_cpu(smp_processor_id(), m) condition in
  demux_redirect_remote() is always false, and the interrupt is always
  redirected, even if it's already running on the target CPU.

The solution is not ideal because it may lie about the effective
affinity of the demultiplexed ("child") interrupt. If the requested
affinity mask includes multiple CPUs, the effective affinity, in
reality, is the intersection between the requested mask and the
demultiplexing ("parent") interrupt's effective affinity mask, plus
the first CPU in the requested mask.

Accurately describing the effective affinity of the demultiplexed
interrupt is not trivial because it requires keeping track of the
demultiplexing interrupt's effective affinity. That is tricky in the
context of CPU hot(un)plugging, where interrupt migration ordering is
not guaranteed. The solution in the original version of the patch,
which stored the first CPU of the demultiplexing interrupt's effective
affinity in the `target_cpu` field, has its own drawbacks and
limitations.

[1] https://lore.kernel.org/all/44509520-f29b-4b8a-8986-5eae3e022eb7@nvidia.com/

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 kernel/irq/chip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 433f1dd2b0ca7..35bc17bc369e0 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1493,6 +1493,8 @@ int irq_chip_redirect_set_affinity(struct irq_data *data, const struct cpumask *
 	struct irq_redirect *redir = &irq_data_to_desc(data)->redirect;
 
 	WRITE_ONCE(redir->target_cpu, cpumask_first(dest));
+	irq_data_update_effective_affinity(data, dest);
+
 	return IRQ_SET_MASK_OK;
 }
 EXPORT_SYMBOL_GPL(irq_chip_redirect_set_affinity);
-- 
2.52.0

