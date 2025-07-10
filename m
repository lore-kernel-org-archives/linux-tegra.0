Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA34292B4A
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 21:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183952; cv=none; b=JSKgffxy0sexjpO8hiXwk6IWbGlqgZkX6SkcPzVskCAgnAxkpon59MZiYFstsH39qRBLuID8+I4BwoBm5Bpn8OQf5xMYYUMoewbMKzNsZEjr4LM1/46ymaEk7K/7KX8esQ3dz7KRzJUuUBqoGVVLiuB9M6wCQou5gIjta98u+a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183952; c=relaxed/simple;
	bh=zfaKbsjTIJUhXHmziLeatyZLED8TfK/HMSac+637Klw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C+y2JzVkPXJMUMGk/eIncDeTs4OUMb1ZOcgd2XmAWBHByDgGdoPN0s81qLByEdVeJeLbu5OA4locvVpQE/bTwnRMmW1Za/oxGofyjn/sfIOckMmOCp9IZcNho5knYOZ7TfpDd6tphHt59oOXjUjtMiS+Bb19DE07QatIfwmG3IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDsfn0Dk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDsfn0Dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2nR8oPeDizANp1JR9NBRrDAUbozrEEG5H7dIC150e9E=;
	b=bDsfn0DkjiQJo1aXuyaFrP1hjmD9MZPz/mEjBF/bXwnhbP+S/XB5SKlIWmL+cx3HAI6/ee
	m4epsOJAammxjp4y/VOnlLAfV4kj7cRhMRjkLhviqOO2xMel+ppt0EtU30hgJ5MyH1zC4B
	Nz4RvqWUy1hxmASgB+kxttILTW7ffJ4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-pfYvU9ZNNVW2mTOQCvrrHg-1; Thu, 10 Jul 2025 17:45:43 -0400
X-MC-Unique: pfYvU9ZNNVW2mTOQCvrrHg-1
X-Mimecast-MFC-AGG-ID: pfYvU9ZNNVW2mTOQCvrrHg_1752183942
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-61200aa771dso809002eaf.3
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 14:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183940; x=1752788740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nR8oPeDizANp1JR9NBRrDAUbozrEEG5H7dIC150e9E=;
        b=e0xAg7vFXIxJBGuWgqkOz7+B8zZH1u6Mdk7DQE6BspcSQV1viJ3843qVuFio07FNU4
         3+9Go14UkrrUaAFUURMQJ0DomoteCKvPpd/lhBYkWKgjVsStd2fDpSGqF4LZI4UTUDdh
         P/iyzLN147u/8DfoEC15+LKVqMXd7Y1GB/UUhUO3VVScKQqoMBFjJCCIhWYn8SaPts+t
         0gu4ZyY666D8Xzedbui0TUv3kFTolFnMhSSw0yvGTir2QwAqlDmCOsIoa0+dtCTPaDO8
         kpPLr23yFPM33wQpkRRwB79TpYhKQJCxqcI6QE0Vbdwagxo0kot+M+/Sc9QLkxgUcskw
         dBfw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EP4xTsg3nx0ZPyrZPOOpw7+wgr/uQPqFGgVZK8Kh19eayiFjI48RMV2fWMsZa4nimeUKBJLfCl+ZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+j5J41jp7pG6N/ziX6XKdgrjzPo1eUTEIW7MjWwrlonTs6jTg
	KWxxoUeFnyT3VUb1aASCGHyqWD02t6SNNPgT52pak2+Y4c/svdAGMMqiWU3NC0XY8NyQw24gIID
	OkO72d2tC2ZM6G9I+fPydtWJVfN8t+2LKXGIb99BDHzGGnUJTincnnx6IGrNLzVwT
X-Gm-Gg: ASbGncuPqZmXo+GgBS/tfwu0S10H+a0cJlMSacvI522QT1Ua92t7QLRFqXi49JhMFLZ
	KPqdSjKGwzGDfVDisOWLSL8zZj9k6AdLro/2LlDN+dXjjjhbcCTWBsFnwOnpFt84+KV09ikxNl6
	7KD87uP015EDqPOfjj632bHfz6Z7E19Dyw0n2eTPFfB470085hAomKvJUrgXjJHNq/blbmg4D2k
	Hg5sjINrQsdo8zJMOdgMjNKU+q7mqjVkLAhMq1pXUbwwcrEBQhC/uUoehwzGxW+0WxGYPO+3hQn
	6GvsvwmNDMOaUm92W+9UX3W0WyOVh5LPlzRbUEcTS2M4
X-Received: by 2002:a05:6808:5242:b0:40a:561a:9e8c with SMTP id 5614622812f47-41537567287mr381012b6e.3.1752183940561;
        Thu, 10 Jul 2025 14:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS2ydIqC7N3ypSjKNKB/xVuCJZSu15TeV2crSJSiS9mMLiIvIupf3/H79OOLOFsQdfgJIMDQ==
X-Received: by 2002:a05:6808:5242:b0:40a:561a:9e8c with SMTP id 5614622812f47-41537567287mr380988b6e.3.1752183940159;
        Thu, 10 Jul 2025 14:45:40 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/6] clk: tegra: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 17:45:12 -0400
Message-Id: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGg0cGgC/x3MSwqAMAwA0atI1gbagt+riIsSowalSqoiiHe3u
 HyLmQciq3CENntA+ZIoW0iweQY0+zAxypAMzrjCVNYgrQsePKlH3c4woPqDseCGyNZl3TiClO7
 Ko9z/tuvf9wMQ0irmZgAAAA==
X-Change-ID: 20250710-clk-tegra-round-rate-5e9cc186892c
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=5139;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zfaKbsjTIJUhXHmziLeatyZLED8TfK/HMSac+637Klw=;
 b=hHP8hjDdq+Hf7u4Bde6o43O1tYdLVAMLKLlWelILbNA6pcpdIRkJ+ww0xIC5nKyF1uyIWDVSq
 r1EMB7T+SKyBKiQ5dbzV5lY7ABM2CptyK85fXHvSWhNHpObGqLR2xUO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the clk/tegra subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

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
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-clk-tegra-round-rate-5e9cc186892c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

