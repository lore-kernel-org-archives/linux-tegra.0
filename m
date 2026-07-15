Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650323B42D8
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092312; cv=none; b=VujbLUwmIfcT0rCKRjH/t+2JIIpeYA7Nw2NPp01roT/6qWxAa+10fXDA71AULngETkZy6F0hEOIQ+WTmszoZ76Q6zNdoaFhYeQFSwHNfh1HBG8nitT5mHtoMFJ/hXv8kdT5ZDX9QQy8QGoLBqKIZ92TTMTP1zwi6nQm4YxTBHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092312; c=relaxed/simple;
	bh=HKOtwDSzyfpc4r+p71+NekAihXrkWUS0xjBtkIxY3a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkDkeyGI/NqxY/Vy2dOVEbVH/OrFZ2prlmDX7np0F2GUXtCVWJqqc4Q1IDu5kH0tmfxk53w5scFum5Tv9ddzxA3XEol3hB4+GtrMEv4tSBRIc6VcV2lFSAZt7Nv3pqGLpGUpeNuvP/K6VYivpwHvEMdKAiAOBG93RJxfQu0FLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/qJ02+5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/qJ02+5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845c92bc464so1657458b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 22:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092311; x=1784697111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDk3AaOarzS5zPuAPo5vxdFtas51v1EJSd2mFAJXgc4=;
        b=X/qJ02+5iP9Swftp/W96SZTTJ49wpKdzAeWmUzy6y4nucKsC49D1FBMkU6atdEOcgq
         buubdqCXqzZydW4k2DNTmDtB7AfANYjRFD7463d+jxCZwMREp8oTqjIin9CcsmcUJR23
         pGF9DbcA6Ax0yyL2NMWpUWwvZ7oN7MfZpfBvhEsNNkws6lPgSiwlhzoKjeIClsNjslSE
         xnsWJbs2khVPU1Oes51ApmnLLx48yEIAhAE4GGbZYDm1Up6M21uLoCRLiMNnrdoZ2/Vn
         ye4LsFmmop5a527KQZiK8DKznLERPEysg3AVQloPMLba2gn1ikeTETytCQYxs9abVIJE
         J2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092311; x=1784697111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDk3AaOarzS5zPuAPo5vxdFtas51v1EJSd2mFAJXgc4=;
        b=JzMB/RCU2+kk2oc+Yuh7PzrakCHvihigX+E0tAw8s//bWHs98sAqsXPOAHVNq57pDt
         e0la2PquJxlYaK0BMqjELWG0glHuIwgBrbuu7vPXVnIi0r4GzAXPW2jnFkzIhTG5mJkJ
         9jYFqlrNmoYLEgBgNWf6v99nPx5nTVbfwx+jRvSzNhCoz2H5/EhdlX3Bnz6dr4HMaoGv
         1/6VagIqSgKPztrn5Z709kORbhIQya8jClM5LPecUKye0z8t5CLy+wNpInZ2NNVnyMCA
         JwsKmo4DLh1qWr6KAqy1ddn0OfUbC+LKrDW3PrJMas2ThJgXfZeBICCd0Z6jtDtG+Vxt
         TFqw==
X-Forwarded-Encrypted: i=1; AHgh+RqAjapbNTynsnWBuGiT0ZkD/PlvU7uSeIy8s9HFPnSfnSygfdrpnKvdINaVOL+ymaijamZFjjjuJXBzVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7//pp3WQkCtNt9qC/N9QBuXgKINbmbJ9c/EoAHLG3gpsRSwZj
	Pj9ZAhVUwf0hid0YhOUlrrbsIwtIOQ06XLOWFnUOdqQvgoGuCAFkgxuj
X-Gm-Gg: AfdE7ckGhvS4/Sz3+u8dRbpAgVckvqPJmfvtdx9OVJ6QVdvctT4j+B2Amvmb0+564+L
	v7QUnWUjVj9aifo5y2sgdZLXQXDe1fGk3lKjlBG4cSAmp2Htb6ekfE8XmNDWmnvWU22QkJSU/Xw
	QqrWzOsiGd5gDtbRLnqiPr0hjBg1LDSLRHvhjkrPC2iZh0fe2fU4HVahoS3B1GtA9Ke81V+0Pqb
	USdUDKva9MqIVAKw1WUQhuBQvIihb3mD6WouU2bCcxsTybPeWBNM4NA0iCcC99kRMALGEdETeem
	0bCSN6nMT8y+AmzzMjFI2qSh02BaT4sBkJjfd2ekugkdDkPXN+QZQlDXIeh3s9TeTTnTF4TD6Nw
	LaRHDDMft/RNwkP7UerIiL5ABDFYClG3DBNe4z6PNqGIpQajvDxFkBC0xCJyuZKZKGCav+P7+ur
	m7bhSW2s8yuCzgJNYoV652xcOmA52UB6vwTdexnojtQJy7mS4=
X-Received: by 2002:a05:6a00:4605:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-848895db193mr14552722b3a.9.1784092310681;
        Tue, 14 Jul 2026 22:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: tegra: tegra210_adx: Return the original error directly
Date: Wed, 15 Jul 2026 12:11:13 +0700
Message-ID: <20260715051115.17385-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_add_component_controls() already reports failures internally.
Return its error code directly instead of logging the error again in the
component probe callback. Also remove the now unnecessary local error
variable.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 15a94196ee1a..e75bf50f8fb0 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -496,16 +496,12 @@ static struct snd_kcontrol_new tegra264_adx_controls[] = {
 static int tegra210_adx_component_probe(struct snd_soc_component *component)
 {
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(component);
-	int err = 0;
 
-	if (adx->soc_data->num_controls) {
-		err = snd_soc_add_component_controls(component, adx->soc_data->controls,
-						     adx->soc_data->num_controls);
-		if (err)
-			dev_err(component->dev, "can't add ADX controls, err: %d\n", err);
-	}
+	if (adx->soc_data->num_controls)
+		return snd_soc_add_component_controls(component, adx->soc_data->controls,
+						      adx->soc_data->num_controls);
 
-	return err;
+	return 0;
 }
 
 static const struct snd_soc_component_driver tegra210_adx_cmpnt = {
-- 
2.43.0

