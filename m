Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF012DD81
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710538; cv=none; b=qXXod/Nzu68PeoAmkIDtW7eNyPt/o+BJUjMwk6NfVvIbedWX/KTy5gbrO0tvxhD3STzJy61JBzyNZ/OHCf6CluR0Q/zKSxlImJ/Kz8YwAuU8K+lPTYNuSdRDexasrAyHyi1QENiQfCZNXi3PTr9RJdlGfp5CCwtcACJpy6TTC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710538; c=relaxed/simple;
	bh=QkpTprrKT2TZ93skOn3rLJLSb+3ndKn0SYQlvOzt6Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EEAChorFhOh209QuGurpeebWNBSzc1NUrSLILEL0ocLPCQtjh7orkWMjTEZVOtAs6KvMj3O3FKzwdr2IhsIH0WQ3dQcYAifpNrOgFIO0ho37MAuaWCfVd+s5ziZPBEu0B2/g2fFFvwjhGtjLWEZLyD+k5yXxMXJejlXgxtAbh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhyHpgHq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhyHpgHq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512c2e8c6cfso1383949e87.1
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710530; x=1709315330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jWqHEoxxzUOvlYupo07VDA1pvQHF1z0gFvXnzb45H8Y=;
        b=nhyHpgHqaoP201YT83cz9SmciQuH0lLE4XPVkhjGNaF9+as/gMAd/DH8oyDuzZkOhj
         g8HpV0eSw3L0UPzGcQ1fBkY2X03CAxRbP0y+izaeZv/aJ9sgCHBW2IqBqV4Q4jCdbrtq
         eaOCCuxBT2+aiRL1w5rieROOf3GZR5+GbwUyiVv22uKix9t72yjcZg+r7+L0HaY2F6ly
         COM5Tun8pxHD5XZ4Dit5i7qII7qwcAn+C2wDgtN4LbZ6GaFkd4NxnwAMPq4F95rlzSyh
         HhD4QpHLs+MmEmRToNANnxdsqJB8nY9VyBGXumruywp3/zVOMOo70thTwAARNbgkCq9V
         bfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710530; x=1709315330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWqHEoxxzUOvlYupo07VDA1pvQHF1z0gFvXnzb45H8Y=;
        b=CLCbsxRJpCbEt6o8JpOrviOY1iyWTPZSuLzYIlf2FmKhlMQ42AhZ0LrnkAo6ZjrAU0
         SM8zKN+9DootHwSK4OJWCXSCGA5eghcA3kphM20Jg4J+WpwxJC8LR0QAhiWqZdP4VOkd
         1UIN8qxh5O2KgeZLRSf+Lrj7ERJhRij62Mrzc1pwO1loRZztombYDGCoD84MQDnBwCBb
         Z+OBU2lk2ypBdn4hvIXRK2SIIukd/tEaOxRlo7wgmkJeqsS8AcKY2GcvEvFzs8OV5G2w
         JHK6fTOW7gz9mHHb6nw0BpSU/ZT7W/LeM5SDWFEGolJVPvyG3rCXwwbzTlx4yJ8LgANO
         Pl0w==
X-Forwarded-Encrypted: i=1; AJvYcCWREidc+sC3pEH/d2ufAUQhu4erwv4AFwplj6oUwKrJy0LmDGckQ1UeTbCZsGAY/OzHARIno/VX1PILB7G7T/3xmf7bW2O5EbVRJhM=
X-Gm-Message-State: AOJu0YyLfI3GWVwKBBfXTFg0CPGHZhrXAJzKnc62Pm3EpxhHcGItnxk8
	htLc07NHn38xyeQ59l+gV58e1Hko2yHJGsT3HGlvR48ETCfJpmGp
X-Google-Smtp-Source: AGHT+IF+YHxf6+N4f7BSNbZgJbWUlupChV5Rx5tgLoc4hLGB+ca4OnJ85aye3A1U9orIOsnFVcxZlA==
X-Received: by 2002:a19:8c5c:0:b0:512:e051:ac2c with SMTP id i28-20020a198c5c000000b00512e051ac2cmr333457lfj.3.1708710530282;
        Fri, 23 Feb 2024 09:48:50 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r16-20020a1709067fd000b00a3e88f99cf1sm5459033ejs.149.2024.02.23.09.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:49 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:44 +0100
Message-ID: <20240223174849.1509465-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-soc

for you to fetch changes up to ae7d2d9b8ebe9f107c500808d5bcd68397645720:

  soc/tegra: pmc: Add SD wake event for Tegra234 (2024-02-16 12:35:56 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.9-rc1

This set of changes adds ACPI support for the APBMISC driver and cleans
up a few things like dependencies and unused code.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc/tegra: Fix build failure on Tegra241

Christophe JAILLET (1):
      soc/tegra: pmc: Remove some old and deprecated functions and constants

Jon Hunter (1):
      soc/tegra: fuse: Fix crash in tegra_fuse_readl()

Kartik (9):
      mm/util: Introduce kmemdup_array()
      soc/tegra: fuse: Use dev_err_probe for probe failures
      soc/tegra: fuse: Refactor resource mapping
      soc/tegra: fuse: Add tegra_acpi_init_apbmisc()
      soc/tegra: fuse: Add function to add lookups
      soc/tegra: fuse: Add function to print SKU info
      soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234
      soc/tegra: fuse: Add support for Tegra241
      soc/tegra: fuse: Define tegra194_soc_attr_group for Tegra241

Peter Robinson (1):
      bus: tegra-aconnect: Update dependency to ARCH_TEGRA

Petlozu Pravareshwar (2):
      soc/tegra: pmc: Update address mapping sequence for PMC apertures
      soc/tegra: pmc: Update scratch as an optional aperture

Prathamesh Shete (1):
      soc/tegra: pmc: Add SD wake event for Tegra234

 drivers/bus/Kconfig                    |   5 +-
 drivers/soc/tegra/Kconfig              |   5 ++
 drivers/soc/tegra/fuse/fuse-tegra.c    | 118 +++++++++++++++++++++++++--------
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  23 ++++++-
 drivers/soc/tegra/fuse/fuse.h          |   8 ++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 108 +++++++++++++++++++++++++-----
 drivers/soc/tegra/pmc.c                |  87 +++++++++++-------------
 include/linux/string.h                 |   1 +
 include/soc/tegra/fuse.h               |   1 +
 include/soc/tegra/pmc.h                |  18 -----
 mm/util.c                              |  17 +++++
 11 files changed, 277 insertions(+), 114 deletions(-)
