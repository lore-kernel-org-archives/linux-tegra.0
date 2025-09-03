Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0F233136
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912540; cv=none; b=aBAB/ltWjQJz2rEIPwdpB7sAcEKdopC6mtXZDQwazjn7jAxU2vY6jgU9z7lAup3o3XWBpF+ASu4arDT7J2EYefeHUelTCos5wZ7XmQKJnBUPaSbay00WYtDwudlS0M1TD1lk63cCFc98JT+Ssa6nXjJAI3WCinEQCqWsCPus4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912540; c=relaxed/simple;
	bh=Xu0cBEqi7Psy9OdAnHfnNSejeDcVKnoUS6N7NxTCby8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ffr7xSYDC3P8KyIIaPcLjfUdaZ9wG4QyenFoWzLKlQaZMzCd0/Ldv91rgG8CO0lio4DGYXU+wJDZudt65TXN6xDFQsZLLUdf1LBp9qof7u5u2RtrCJ3A3+ORXgE2lvoVs5d+g5FRNZ46D7I5Uxo1w0zxykx3T4JkcmLZccwsCFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Df2LGZhI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Df2LGZhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LdY3eJT+Y0XdvlnzE2zEJKsg9kAaBz/9qglzunIg0gk=;
	b=Df2LGZhIZJGPiK5iGSSSaHoU9ZBn8wR6UjyO+jzZVom3CDfh8h3EcIVjHJOiCweainLdVp
	SCGQQ1Y58c2/ltcAW1yS8/LfzborBZQ8u/wPPl2MyLZot+XH6pTwJzxq/Sy8+PVEUyQlu3
	Vil9PXsl1fnDIaO1e9PW7FrnW8OCZmU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-gtaND0Z2OeexaRfIrWkuxg-1; Wed, 03 Sep 2025 11:15:36 -0400
X-MC-Unique: gtaND0Z2OeexaRfIrWkuxg-1
X-Mimecast-MFC-AGG-ID: gtaND0Z2OeexaRfIrWkuxg_1756912535
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726aec6cf9fso10790876d6.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 08:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912534; x=1757517334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdY3eJT+Y0XdvlnzE2zEJKsg9kAaBz/9qglzunIg0gk=;
        b=YJblervPl4QBrvvJY/UXxu5nl9y8j8c6dn9Wn9vWPaqQ8UsNr3ZWcsVyTD1s2Pl8x9
         fgO4uXoRylyoXrLjgkFIL3lLqpqNyl143OR2QiD+wuUzEUMOlTyBlvrebarSjSDyXMOA
         YuZKfIKoNy8r7WuZjnk/EaNIP2Y0lXTif8AVTMnbkJshLA8yS8/pVHl4OXdiOQLTFztb
         +NZuSwYqh7beVIOLfzLZg6xYdihPOvkiV1xSqTBSV4zqOCqK91d/7FbUYX3geZ2w3Rdi
         aCXla1s4A1SUfspLA1duFXVPzqa0knEhmPnVSuk4D98YzlzF0Qyi2GIWoi5ACnHOmods
         UEug==
X-Forwarded-Encrypted: i=1; AJvYcCXMwy9rGpA0kNQmECWgGRNPgOXAQWmdNbcj2BEsCi/EUuTCqsodfNIXi6IqyCSG2gq3Q3t+jy73aqAnQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmF4UzUdsHIc01HrS9eTsZaTBz7EME4nJKWf3d+Ata/Z9mCu4
	Y6hjI1EVHneaYxyuQSxmuTgDfq9KhqPCXfNiCS+4iqUpcGc8h+vYElPfuE8a/GZiIy+fg4mKgI6
	9fzTdHQHojGgyOiHPmMtiuHpSnV+8wif+2GNH2iJXy7t34RnQnzA1i3uPKuyAV9w5E5mcttDKUu
	c2suXnG/Txzt7KTNkZ3RlNgbmdcYzGLlkP6aPFySzPMSZa7h4=
X-Gm-Gg: ASbGncs0YOoO2qFO73bWf5gJczZVqraPimjCQTrAG/VMz1VyIJyoGEFLdUIzT2/sG76
	wM+yw41uF1GDRyfsE21+0OUpz/aCPRfV1g5uPrA02DrmIPuoafPqjPCVdc+/XNPZuyKfHA7LZzM
	QDLH+sZqIpeLb957otykuxI9Fwf9qTTlbPwA277CKphOshDTu2Dqw+3l+rzP9Vw2m0rDgJZl+AW
	kayk0ThYq7Oj18xLhHy8ZuLpsDTHU/wae3wAJODAumq5KOVIy7n6LPHq/V0IM8+rtMTK0uS1ylM
	WigCTFnNgfjXMbwbeQmCVHho6o7b3ChBVVcrHcfX94LmbArVpDDHoHlWYxND4dAeA3s2QctMIlE
	=
X-Received: by 2002:a05:6214:76d:b0:716:17e0:2466 with SMTP id 6a1803df08f44-71617e02b67mr159467926d6.34.1756912530478;
        Wed, 03 Sep 2025 08:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkWebP2Qk177v4NSM1pvKjg7uVb9XRiSsSjX1ArIElnPlsqqP/rGsp6ulP8idla98+4xureg==
X-Received: by 2002:a05:6214:76d:b0:716:17e0:2466 with SMTP id 6a1803df08f44-71617e02b67mr159461546d6.34.1756912525636;
        Wed, 03 Sep 2025 08:15:25 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/6] clk: tegra: convert from clk round_rate() to
 determine_rate()
Date: Wed, 03 Sep 2025 11:15:01 -0400
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVbuGgC/x2MQQ5AMBAAvyJ7tkkVB74iDqsWG1KypZGIv2scJ
 5mZBwKrcIA2e0A5SpDdJ7B5Bm4hPzPKmBissbVpTIluW/HkWQl1v/yISidjtEhTMgZyTeUKSPW
 hPMn9n7v+fT+G+jpKaQAAAA==
X-Change-ID: 20250903-clk-tegra-round-rate-v2-af025bac94c1
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=5345;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Xu0cBEqi7Psy9OdAnHfnNSejeDcVKnoUS6N7NxTCby8=;
 b=NcgiVd9SVHO/Mdpi8r0JCLnx5fe5/PII/AMdsLbqulhKFwkgOZbUK4cYUnd4Ko03VbNBh82L/
 Qy2Al6Q9Ao2DpmVWLyPovFd8KUFwookPysJXxiff6BX58YhhLTFZuza
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the clk/tegra subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v1:
- Fix merge conflict against drivers/clk/tegra/clk-periph.c since
  v1 was posted.
https://lore.kernel.org/linux-clk/20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com/T/

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (6):
      clk: tegra: audio-sync: convert from round_rate() to determine_rate()
      clk: tegra: divider: convert from round_rate() to determine_rate()
      clk: tegra: periph: divider: convert from round_rate() to determine_rate()
      clk: tegra: pll: convert from round_rate() to determine_rate()
      clk: tegra: super: convert from round_rate() to determine_rate()
      clk: tegra: tegra210-emc: convert from round_rate() to determine_rate()

 drivers/clk/tegra/clk-audio-sync.c   | 10 +++----
 drivers/clk/tegra/clk-divider.c      | 28 ++++++++++++-------
 drivers/clk/tegra/clk-periph.c       |  8 +-----
 drivers/clk/tegra/clk-pll.c          | 52 +++++++++++++++++++++---------------
 drivers/clk/tegra/clk-super.c        |  9 +------
 drivers/clk/tegra/clk-tegra210-emc.c | 24 +++++++++++------
 6 files changed, 72 insertions(+), 59 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250903-clk-tegra-round-rate-v2-af025bac94c1

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

