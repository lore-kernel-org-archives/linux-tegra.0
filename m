Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792862686;
	b=v/qqB/G3dG8Pr6QiUfxmugmR0ne+bd8Jhn//R9qHYIfoCz7p8kW1S7EgOxB0WkeItQPj
	 gztAkL6g5BmIarJCGFLw5NrqzGW6BkkFEnyHua0qDjZmy3aAryXLEisnYjcs/xuIVnLDR
	 Dk6Iitv3Vnzcw2T1Lfy/Z+JWbA8ScRhPEbFdIUIiHNqC/Yf078OjZZy92a7o6Ue1ZY/CD
	 bgtDKnKC41tbVI5Si8pbzHamE3qOnxg0hpmwU2GcwAGUr7AAww6eGT46pTEBp2Sx+Mn9L
	 7LOfrSznUD8TvhpJtHyi5vUiFGHFvTTHnR6u/31j5Bdj6+VDiCYltsQ6H7jkV9x7+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
	b=zj6iZ+x+NkHkSlJdtf+jT1kOO6d9YawTdrk3F83OS4wmD43msRYq+cvwJKM5tWjr3F5n
	 u2FvhnOffyfukAwBcyWB//woN+ZEo6spvvCrmtflDFwAac17myNUjhwRJaekeMAyC/SX0
	 YVEAySbNazppZasT7uFqkp4do9b54DPbbpnUq2X/AaiYlEFWq776grX4SZGxgXyawzFrz
	 9K44x3SCRAD4VTyH9IqFCIauGwPGCZOmV1ocI/15UPMbWmBZIwq/HV5062sWC0pZiMhMS
	 X36K4M/rggMUarTIz3pzFXbsPzBnc1OevQNhJ3hk0knW2zy1FJ/YzADjtxv5+0w/3GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0IOMheK;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F18606A31A
	for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 17:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F18606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0IOMheK
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so19527295e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792862684; x=1793467484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
        b=B0IOMheKeJThOLJjE9YVnNnLE4knkhDF1KSxEAHHEFIPyfIrux6NO1XXW7Ycphaywn
         vicXEK/ohXujqc+LrTcilWa7mpUFujtikDK+oehOcYJ55ZOvxaNfKum7wrhC0CwHPubq
         FQ1V9FuQwey4q14tKOtgojzlIVpniG92Exk0//ROLd9vsNlXx4lpvlMjvQda5ybOdVq/
         U9cwslKcgVHh5rgOkgRkkSggIghMJEsZl61nmeBL/Rmoj0VlQtaRBgKueH9UAjex5886
         +4Fb1T02IPSBtRp1WCpr7y4FOELCG/3aylWnE1wsqgpuVFEFgM8yg0E+mb5+0N1LEI06
         CWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792862684; x=1793467484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
        b=i67izlO5mO9JHLtvzFajwjv2sljxSpEB5+VGCNL+fN/MJogbkamfPSNcM+qnbeiTfY
         G/sPxUXs96OIHxDW882au6qUUKI4vngIISwyjnzY4tYul5162BPD7SCBJaAlofiIL6z1
         hnt834oJChXc+/NyvlM3Osvm4VKBvOXc5v4lXwso357JthQofwikoYQ2tGXd4ttHOn/T
         LutPhfHtsRcD+VivTtGODtMgiIclRJ04DqH9PwXAtzuwj+AiCf0ve4SNBgl7wHA3NUrS
         BvT48sfBCT6p2ETmPimrbWqEEhsnxo4dgn9upg/To5tEBOJWvEmNXbLUNkrYwxozSbBj
         RSKg==
X-Forwarded-Encrypted: i=1; AKwUvBxSPuqf0Nzwex3BavoFlrtVghBkVgB81nN0g0fWlU5KocQncE3EH2/EYy8H0PIYhnhpwTssbkdC8AUARA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJYglA1kG2uEhvZ8LL9hD28TVWu9fQ8YcBvRw8A+4Ao1+XAoGD
	T81sdxRaMSbZH2WkDjOjfRD5ST9ISP8NPhEygjjeyswfJraG1pYA5XHd
X-Gm-Gg: AYBFou1ja9IISZ0LNmivSs6O10PM8x5OiwxdxnLBLjf8PhBBJrfFFHi7IeHqcivzd1H
	apxs4Vs/lIGPX4rYEdnFmiyPibeGdCrH69qpt04tY+zh2lz/1wLU1xRQx5C8lomK697/B+xg84e
	qKQSVr/yyRzt0GiUPfpyE+wM/tqZXiPTWSDFgkfVPHqReXDuHrwTrFFjbvmMkw+gPnyLZ7aDXei
	ixhze79fKRXE3Yr68D+au3cUfx3bVOUD8cnoxPCob5iFrqvVYngfFvxFaoBgn1DmCe3CT4//KF3
	zQRHLDHu5vzdpQS9fNWd+4YrVwBRw+b0tcXdwTIsejbhlLrI2PchkXIYyZ4QgBBzm8NfsWGM2b0
	nUe50RiQ5JyFuDdoB/FcJdH/0xz5FSx8L3onJStpEQw8zs9Sgr7yDEO9EULglFHgY1Ahw3pGKq5
	3ocr2MW1A3Mv9hbUIpvtT4x7iM77rJ7sZEhAhgKqzSF0Z1T7jW2Kho5OfqUCFU5gX3UQ4Gg9LPo
	BFqy8ftAhQHAzYwTM1xF2NGlDr+t2EbI8qjQedgmRoA3YNZQieVdIGCqEyR+g3Z4jqIgG5eidao
	rIUhPjYdKoH5Y3a2XxJ6tfZjOt3xvbKUdT42OD9lYCZX/EvpjvLjwhMZGkCtKX0QKL1HRTeFU7v
	lpiILreSyO3O9wmGjqViT7SB58uFKqsg3zvjDfjwweYk+0QVjJwhKlMQbzk9BqF2F/XFiw8g9yJ
	Pq3lmp
X-Received: by 2002:a05:600c:19d4:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4a35ac9114dmr35075715e9.10.1792862684213;
        Sat, 24 Oct 2026 10:24:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm80685955e9.1.2026.10.24.10.24.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 10:24:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: quirks: Skip nv_msi_ht_cap_quirk when host bridge 00:00.0 is absent
Date: Sat, 24 Oct 2026 19:24:26 +0200
Message-Id: <20261024172426.85842-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__nv_msi_ht_cap_quirk() runs on all PCI_VENDOR_ID_NVIDIA devices to
enable or disable HyperTransport MSI mapping relative to a host bridge
at bus 0, slot 0, function 0.

On NVIDIA Tegra SoCs (such as Tegra210 on Jetson Nano), the PCIe
controller exposes root ports at 00:01.0 and 00:02.0 with no device at
00:00.0, and the root port's HT MSI mapping capability is already
disabled (found == 1). Looking up 00:00.0 returns NULL and logs a
false-positive warning on every boot:

  pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

Return silently when no 00:00.0 device exists on the domain, matching
nv_ht_enable_msi_mapping().

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Observed on a Jetson Nano 4GB (Tegra210, p3450-0000) booting v7.3
(c03c1a14507d), where the Tegra PCIe controller (1003000.pcie)
enumerates the active root port at 0000:00:02.0 ([10de:0faf]) with no
0000:00:00.0 device on bus 00:

  pci 0000:00:02.0: [10de:0faf] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

 drivers/pci/quirks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 1aa87a3..47778c1 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3115,10 +3115,8 @@ static void __nv_msi_ht_cap_quirk(struct pci_dev *dev, int all)
 	 */
 	host_bridge = pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus), 0,
 						  PCI_DEVFN(0, 0));
-	if (host_bridge == NULL) {
-		pci_warn(dev, "nv_msi_ht_cap_quirk didn't locate host bridge\n");
+	if (!host_bridge)
 		return;
-	}
 
 	pos = pci_find_ht_capability(host_bridge, HT_CAPTYPE_SLAVE);
 	if (pos != 0) {

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.39.5 (Apple Git-154)

