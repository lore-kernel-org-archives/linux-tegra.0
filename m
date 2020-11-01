Return-Path: <SRS0=92L0=EH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8918BC2D0A3
	for <linux-tegra@archiver.kernel.org>; Sun,  1 Nov 2020 17:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CCA72225C
	for <linux-tegra@archiver.kernel.org>; Sun,  1 Nov 2020 17:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UxsJQ+Mx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgKARYW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 1 Nov 2020 12:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39461 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726790AbgKARYW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 1 Nov 2020 12:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604251460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=ar42oVriuRci3B5JCt0ie/o9rZYCCxXolg155/aarmA=;
        b=UxsJQ+MxAQM5o4IjHP8nhqiVIWywmDJyMbPmvK61v1CzSfwQbFp74W2t6dOKmtaluZVWT4
        6c0pD2fQwDnr5sjyt8Q6UEPrnS5E78JWXieKlJ+qanD5wjw3ZGEnMhktNXsxyqQouz1eWK
        /I6fWF1nz3m/SA0nccdGNGBV/P7RYas=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-4SGm4JSvOu-2KTgk_I_yCQ-1; Sun, 01 Nov 2020 12:24:19 -0500
X-MC-Unique: 4SGm4JSvOu-2KTgk_I_yCQ-1
Received: by mail-ot1-f70.google.com with SMTP id 5so5284556oti.20
        for <linux-tegra@vger.kernel.org>; Sun, 01 Nov 2020 09:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ar42oVriuRci3B5JCt0ie/o9rZYCCxXolg155/aarmA=;
        b=hfDtME59YpGKKyBSHfQpGmh4ItnJsiVnxmW4VPnv8zn4hT+pmVLoQsyK7Q94dopZgk
         Y9X2+DEocgjYe42DTBzNxVm1lWhTfgJzRwa7yl4O5G1pFTgT0Rd7fC1oOlWXqBGhO6NC
         KKoMVzTJlCFP8YBUvjl8lr+x+UY8E0dsEaILs/S4aNV1bWZ9a1pcohPvp9vuwj+h6CE1
         eLpBybhPBdjghspZ+g1IpdLfYjLxXgO1H+4nXVDAiH/s4Nx9oxtP7zCJVQBRfuTnn/EN
         E5fvBQuVEAzOOEq6oIdZCdNgFNg2Hcji3IcXoG7t0Uw24p9h+uwMN/r5PC/F/Od2DWPm
         BBwg==
X-Gm-Message-State: AOAM533qepzGkcfFt/D+bwCOy9LcYBuFOtiBNVVd9xu/u7vuItqzD0Ph
        Zui4jHPMnbeKblOpKFjWBYlBwFJvyav4bbcumIV1UDhDfs8ZNMbKLxLQc0ew4wWUcXQAt6zFpJC
        X2b2z5UiXQAkEPO+WZ/A5k1c=
X-Received: by 2002:a05:6830:1254:: with SMTP id s20mr8926217otp.314.1604251458348;
        Sun, 01 Nov 2020 09:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQkolyAC8MckoqHgNScKCXFlJJ5Cm2sr+AdV7ggKnHMboMeTp7z/vvKJ6QiYpG4hS1bmUcUw==
X-Received: by 2002:a05:6830:1254:: with SMTP id s20mr8926198otp.314.1604251458172;
        Sun, 01 Nov 2020 09:24:18 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id g3sm2941188oif.26.2020.11.01.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 09:24:17 -0800 (PST)
From:   trix@redhat.com
To:     lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        spujar@nvidia.com
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: tegra: remove unneeded semicolon
Date:   Sun,  1 Nov 2020 09:24:12 -0800
Message-Id: <20201101172412.2306144-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/tegra/tegra186_dspk.c | 6 +++---
 sound/soc/tegra/tegra210_dmic.c | 6 +++---
 sound/soc/tegra/tegra210_i2s.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 0cbe31e2c7e9..7d9948fb2ca7 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -310,7 +310,7 @@ static bool tegra186_dspk_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra186_dspk_rd_reg(struct device *dev, unsigned int reg)
@@ -326,7 +326,7 @@ static bool tegra186_dspk_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
@@ -339,7 +339,7 @@ static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra186_dspk_regmap = {
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index a661f40bc41c..ead2c99bf72e 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -322,7 +322,7 @@ static bool tegra210_dmic_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_dmic_rd_reg(struct device *dev, unsigned int reg)
@@ -338,7 +338,7 @@ static bool tegra210_dmic_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
@@ -353,7 +353,7 @@ static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra210_dmic_regmap_config = {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index a383bd5c51cd..ca31ec92e508 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -662,7 +662,7 @@ static bool tegra210_i2s_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_i2s_rd_reg(struct device *dev, unsigned int reg)
@@ -682,7 +682,7 @@ static bool tegra210_i2s_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
@@ -701,7 +701,7 @@ static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra210_i2s_regmap_config = {
-- 
2.18.1

