Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB728850E;
	Wed, 11 Jun 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638682; cv=none; b=AbtcxnF8WmEBf9F7pGXStHPMSvuTQUcUWOWoA7Z+26CCBvwQPKVYOxIfL/R7GFYbL55JgUjsSZ4QCF6euKqjLAQ0k6fdN119jaLUpILb7LmtaXc1uiD0f+C12/CnDSX0lVDBaOAYp7qSqsHF2o+zsR/6fH+FD96/BIis26Xk224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638682; c=relaxed/simple;
	bh=NLnT5+LOFbAWdUD6OEeMhq8wMEwsqTEbDWDE/LB5oWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrZBBiA+5D+VfrOoDryOk70RtqQDO0iQ/W4k/FY7w2LCPfYV7YQK/K/vFA5MHVis7OqRDQEELMcmTMRKwIUsGegkoSjDBceLQgkC9jeGxIzjAl2DUohvfSweKjkQWYO3h7ql1ccrL2hMEKPqsf+830Y23SMB+NClZEE1352J4kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhJu2rvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhJu2rvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC8EC4CEF2;
	Wed, 11 Jun 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638682;
	bh=NLnT5+LOFbAWdUD6OEeMhq8wMEwsqTEbDWDE/LB5oWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhJu2rvffdhuDVYngs0/mJHh/Ii4qb2QtctIipm4DBUJclR7bsCSEQGuTxOzsfrfd
	 Tn7OMefVMV6axO7RrfvnO8OMXp5QKHdplyCFpuiVX3N9XIeci0hEtQCurRRXEoNS47
	 5oZjNV8VHM9DH7/3p/qvdnQz1P7LRnMlqmILblb6ZJAW41cFP8LhyauvBLQrtkAfWY
	 nm5aGIbCO8SY0LuJpQe5iQZ1I9feFo0r+Vho7MCYLp7c6CU4howsxj+6Yr+olrWmg6
	 evu2rEF7aJz8wsiiOu7o+21ahm9P3mc3P2Ioqhcq69dKyjhSWfLsmpSZ15C0ivm/ty
	 yuu2qvRW95l+A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:47 +0200
Message-ID: <20250611104348.192092-19-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org

---
Cc: linux-tegra@vger.kernel.org
---
 drivers/soc/fsl/qe/qe_ic.c | 3 +--
 drivers/soc/tegra/pmc.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 4068b501a3a3..943911053af6 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
 	void (*high_handler)(struct irq_desc *desc);
 	struct qe_ic *qe_ic;
 	struct resource *res;
-	struct device_node *node = pdev->dev.of_node;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
@@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
 		high_handler = NULL;
 	}
 
-	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
+	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
 						  &qe_ic_host_ops, qe_ic);
 	if (qe_ic->irqhost == NULL) {
 		dev_err(dev, "failed to add irq domain\n");
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e0d67bfe955c..9543bee0c321 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
 	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
-	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
-						  of_fwnode_handle(pmc->dev->of_node),
+	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
 						  &tegra_pmc_irq_domain_ops, pmc);
 	if (!pmc->domain) {
 		dev_err(pmc->dev, "failed to allocate domain\n");
-- 
2.49.0

