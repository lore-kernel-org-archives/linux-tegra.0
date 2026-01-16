Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B811221726
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560129; cv=none; b=aQQ30Dd8G2PRZOMCuRxLe/2FBHSBeCxX6JUVy6PBKKPTYeU2GZs2qBMveKTFQ7uAbp+kVdjirXxGNnvRmdLl5HBgKXsyitQNAAmlwniWCPW6JHgwR/pEfMpbBEv77VApRP+jrb+EPXsbwU1HZxKoWFqPgkQNP7E2ZeVNvQN+3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560129; c=relaxed/simple;
	bh=7Bs83/3GKpZIet4A+GEy6AGATI40T938TARAD1FqpVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDEMy1lwwGyVZ8sJjmo5kDQGlg2htgk0EBJXBdYPrPlASdXMjfHSZF/bD7epf6VBPUjs7ZQ5oY79duFAORnAPWmKTVwoxrC0gSrPyIhhqeSVVBoIns3w2bsxYOzT1N9A7qGBOEpf/o7bRPakdqS60919cHIPzZ4Rebk1bPOhvCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6611c401aa2so205836eaf.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 02:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560119; x=1769164919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH5vxI6dNW/ff+71XEyDBEVLOLjPNS7CrwRsoGXUEMk=;
        b=mSQ/TJcST+e2RmmuP5fG5c8/jHpv6wRUCJk5Q5QBYsMcYCT7ovzihtTpOhrZWd/EwA
         /j6/0WzwNg9ZYo0XTlaR+oizJeJw6xlrE9RP+RADxqqB1ZZJn48h8LAXVRNayODCBfnh
         aZmrWW3H4bdmDe882HqD5QaCJRPQ3nsSK/qbODCCwPoIONTqwaWcxQaQ1nq4IrCziTUH
         RgDbsybuUi8CsrSNs6azqsjoYoQC2gee+joz/IaI6a91aw8DvUMPBKm7koAAmgj0mfWZ
         iy1b5G7cQsk6uRecV9pCvMGGPEl1FNcIJddAZjEUfCCaq5xn+QOKQnb3kxtR+TkJpL2g
         86zw==
X-Forwarded-Encrypted: i=1; AJvYcCXwAMeBSXl1sOueHiQkbtPjJQFc8lTZc9JEktStRumnUh0ivYlbmx90GIPnbh9s7tJWL+kbMBNyd5mNRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMIi9XIOukMJDmkG/+GPgP0fgXbU2Aezh/q/63Lgm4BWK10L+
	++eA008HGUUi3g9GZzCCeu0ZeKKMQwi6NC+ZMXajvBLtS8RXMyIT55CR
X-Gm-Gg: AY/fxX63CBQeZLMx0au/1rKzROn2w71jK05a8F9JO6IH42ThfYgXGhpsKF1p6cO+DPw
	yUx95BkyZ5qRS1Z30xri8JLZiz5lS308yVXAEINJvXYpkKbRrqS9LDU4W2Bz3aCFMi9cli3bqA9
	R2lJycjtefRsaojzkd8+dJOAo8vxZMDB1A7D8101FzTFN6Gm91IJpEcd+zNUIcj7rUDaADZKFTq
	nOXHyJtkSSHgT2fEht0IvbtD7RMw4or11mycQZEg3OC/CzOk0+nUpIVqEzzgi8Jso1P/f+4GUAA
	ELYxgDb8M0qxnpn9Wylo9noi4oRwKlpt/x49JJmgnjyE5D7+qPzFnQXORj0mC69VMX9NffMBsp9
	nAZZVawB/gPCr/ZDfOpnv/uV5vLPpX+mEPaGGaBs5KXbvxCd896awjkOhRc3Y/mRS4C6CRX1MYy
	VkPYqFQ5GvN6vh
X-Received: by 2002:a05:6820:222a:b0:65d:363:b874 with SMTP id 006d021491bc7-66117990118mr1027149eaf.32.1768560119255;
        Fri, 16 Jan 2026 02:41:59 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:56::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bd150dasm1639426fac.14.2026.01.16.02.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:58 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Jan 2026 02:41:42 -0800
Subject: [PATCH 2/6] spi: tegra210-quad: Move curr_xfer read inside
 spinlock
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-tegra_xfer-v1-2-02d96c790619@debian.org>
References: <20260116-tegra_xfer-v1-0-02d96c790619@debian.org>
In-Reply-To: <20260116-tegra_xfer-v1-0-02d96c790619@debian.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, 
 Vishwaroop A <va@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com, puranjay@kernel.org, 
 usamaarif642@gmail.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=leitao@debian.org;
 h=from:subject:message-id; bh=7Bs83/3GKpZIet4A+GEy6AGATI40T938TARAD1FqpVU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpahXyQcmiX+lZ6+VH1IlXn9H2/Ow+031UEs7B1
 9pJkFfc28SJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWoV8gAKCRA1o5Of/Hh3
 bS7DD/9DE0jwX2tOQ8Bch5QwkoSGgWuEnWGW62EJ8jGhgF8Q4Zuqhdwg45Fol0ls57+b1n/JoHt
 so8t5Cc9inZQqQqUJyifNjdhj168nrbkWC0Wn+hXlSL2mXT/Pt9peV+9yv+zpmQ0a4eSbdzMcUe
 YZZGMMTSyLdrJ+6RAvKWOxeOzPqOfWrX/hoi5cdSVEcTYChZUYlJbfuEEYw55iY9dmYBgjMiqgG
 KzRawCzdM3l98ObQluHtv212HYJlRWAUijDNsl3HpKHWHvdL8oi0kI0MVvw6C511kKAvlRlmnLy
 HDqsj/u8rsjZoSzYz0rOkXIyb8Z839JjE2be6zPGAbKo5W4jtzzg/AIRskCsTwWgobkvCVL0+B4
 v+WLk/qN54dWt/dyShTJgE7t9CTTMGcdIW51PGy4/FPe1B2GaOc7pwkEhDBQQDZUsxhlhzHMTlw
 zufcm2X99yGwpd5DnSzDc0a7QwOOAoGYm65xizvqsAtsqUAEG3/hjwXrgp4Azcm5qyG8tCWcb1X
 GxOWmT+Yn0CYs2s8ZtPjEj2dNSGSKG6+HRywgZtfnReBgYWfRDtGlbb2Cme1Ffuhmj7LlMSdLS/
 eeTIDkht/+X42QhFBiNGh4Un+EjnEaQeBIpj2j+RBCwHg/qAEuBm5wRM4Z8goI+BbVANHqO8E29
 hQnDuJEl5Wybfyw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Move the assignment of the transfer pointer from curr_xfer inside the
spinlock critical section in both handle_cpu_based_xfer() and
handle_dma_based_xfer().

Previously, curr_xfer was read before acquiring the lock, creating a
window where the timeout path could clear curr_xfer between reading it
and using it. By moving the read inside the lock, the handlers are
guaranteed to see a consistent value that cannot be modified by the
timeout path.

Fixes: 921fc1838fb0 ("spi: tegra210-quad: Add support for Tegra210 QSPI controller")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/spi/spi-tegra210-quad.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index f0408c0b4b98..ee291b9e9e9c 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -1440,10 +1440,11 @@ static int tegra_qspi_transfer_one_message(struct spi_controller *host,
 
 static irqreturn_t handle_cpu_based_xfer(struct tegra_qspi *tqspi)
 {
-	struct spi_transfer *t = tqspi->curr_xfer;
+	struct spi_transfer *t;
 	unsigned long flags;
 
 	spin_lock_irqsave(&tqspi->lock, flags);
+	t = tqspi->curr_xfer;
 
 	if (tqspi->tx_status ||  tqspi->rx_status) {
 		tegra_qspi_handle_error(tqspi);
@@ -1474,7 +1475,7 @@ static irqreturn_t handle_cpu_based_xfer(struct tegra_qspi *tqspi)
 
 static irqreturn_t handle_dma_based_xfer(struct tegra_qspi *tqspi)
 {
-	struct spi_transfer *t = tqspi->curr_xfer;
+	struct spi_transfer *t;
 	unsigned int total_fifo_words;
 	unsigned long flags;
 	long wait_status;
@@ -1513,6 +1514,7 @@ static irqreturn_t handle_dma_based_xfer(struct tegra_qspi *tqspi)
 	}
 
 	spin_lock_irqsave(&tqspi->lock, flags);
+	t = tqspi->curr_xfer;
 
 	if (num_errors) {
 		tegra_qspi_dma_unmap_xfer(tqspi, t);

-- 
2.47.3

