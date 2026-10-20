Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484299;
	b=FQAOGl6gIewx9avSwdAaQaxtoBFQcfjpwvcvAnGmp5vbA4Vl7yJcbjqCuDwAveCNP74T
	 KMb7aJE0sDI6Oe/RrIrXi9RfTUpZQbhfUgaOC8KIW1vuV01HqaAB+vxCsq7bS2wVcHiyM
	 FSIlFIWY/PR2YY3Llp52LFuI3yltJEP6APlMLHljRWUuVdMkD7Q8nK3ad+LaPH3AcxmO/
	 ZR+GFnJAznlUum+ilsubq11lwynP2q9norsUIJNb0NJE2VwlUM4pOMSV33baQau3nkQk1
	 itaOk5RbXUO8sAnK6WxqgEri6CPnIf5eeJwUo4QDh0ROoYyIW88tmbrXJ2hu6G3gAVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484299;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oqyb34NJt+mKr4mCCkLuPOBnP+Hrp3mJFwETCEQdsGg=;
	b=tIquLF+ECie8CXCfHEBmtje4h7jG2DB21kKHBc+GCbaqlDDaVIXebekz/HltLGv89oXB
	 1leakwK68zmlLkD1zxZGEU81icg1x50lG1R+z7NIhZA1q9gl0JkoIyckzxLUCj2lT4DVs
	 GGUSLN0hJE5LOqp2y8QkbSuZP9fDxBvGZV9rfYVUCtCVoNgmHYgTftCSLcG5AMQ4lpMNY
	 11gH/JIEs1V/Fr9ec17wf6NjsjMWY3qLH1g/Z7RhKK2mPPGHrImURMfxM/qvPhl1InGgE
	 5W8GTLohVJR6SRBgn6WbM4ppy//J4tLvkN+sTvKgOAvC1DRpM9hlne+Ry40ZweBETFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YP6cOuvL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABC606A319;
	Tue, 20 Oct 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YP6cOuvL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484298;
	b=upoDMnRwnvZvqxkeUrd/bLqS6L4CQ6VTw3vCJwbZjMHI+DA558FB8zenLNloTjyVysBv
	 XiR0VEEF7O+0MB2LgTj+4AtZV00Tuh0Q0lQQm/iGOj2JpH5/3qBSFd8YSj7E2j3SdvEl8
	 IYyj+ApAZNTKjCCooRZX1wSAoRB+kBLndWuO0TSEo6+MsXLHiCRnjEX3nVV5aGB74ip/Q
	 /XsMo5PZF2lNn09VT6+yH3dmiBhsau9XpJqefl3QRYwN6sW/qvdBWERPTgggjAnX/KJui
	 sCqjdLh432vWP8wGsbFH0swuf2h2c9CuUxGNmM1M69hnaf1yImHePPTU21SHk/LzJNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484298;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oqyb34NJt+mKr4mCCkLuPOBnP+Hrp3mJFwETCEQdsGg=;
	b=PEIW56s6y6Nfp9drp8mUy5Di3DJwXKGNkKSE/W4pond63xKWAl6apF38Z4zRcbfF4Rgc
	 F7r83sXwyFmzUi32diEBWYniBC2eTHjKcTQ0cGn0AeZ8nAfMkzTZFkhWuhKhDbPZoJhhR
	 cRy/5vQV+9oGl1igtIvlSDaRCDm0cDTSQ8Va0kHbtApHA/WlFFnYdDA8wHcBNYdJo3kDy
	 dtNUpRYv2/CrwUL1mO8/yYOCSbUI598laYYlYVUFL8Y0CH9qVILJoxj1q8F0/GF07wNEu
	 M/Qq3vhxVwpCld2YsT+UHc6S3xH8acbG8+a2S6pcmEqkucNRwjLmFx5hf9yBJMgv3eA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D748A1F000C4;
	Tue, 20 Oct 2026 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484298;
	bh=oqyb34NJt+mKr4mCCkLuPOBnP+Hrp3mJFwETCEQdsGg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YP6cOuvLXYS5Ml8kJifhM5+Zc30RE9F08hkD71cm6NVgsAyxSCjQxoOEMVNg5LGSv
	 PUEiNKrR8T4YOlhxKU1TESP0MzOFLHCYVCfPOYpe/8babnoMCFRXFNiUtCnFPSz/kE
	 W1eWieI59RL1P5JiM5hU9gFnJdxd2LZK3h7FwTE16Gj9Y7vhpnIuc6ry+X7f4fAaeR
	 MFW199FN+vxcRUfKr8G9eWIahc7RVIOIh0pGNklkxd+96IfFtEQ+lmdcnuG2T0/Ybp
	 s4OJAMH/xIYPlyiO+T9sNqnylz0XUrsHoUbVT1TBRa0k9W4xydFzxjK6gEmgo21SWk
	 Bez8X1o9Zw2Rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3607740612;
	Tue, 20 Oct 2026 08:18:17 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 20 Oct 2026 03:18:14 -0500
Subject: [PATCH v2] ALSA: hda/hdmi: Enable HBR capability
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-tegra-hda-hbr-v2-1-6968017f585b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ7CIBBFr9LMWgxD04quvIfpopQpTGKLgYZoG
 u4udu/iL95P3tshUWRKcGt2iJQ5cVgrqFMDkx9XR4JtZVBS9ShRi41cHIW3dSaKtkN5Ua02vbp
 CdV6RZn4fvcdQ2XPaQvwc+Yy/918po0BhtDE4o9UWu7tbRn6ep7DAUEr5AmwhUV2qAAAA
X-Change-ID: 20261018-tegra-hda-hbr-35107238b629
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484297; l=3023;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ABJMYi6wtZe91Rymkn3xsq8E4KBzp1tYt+2VfPsra24=;
 b=bVoDPBipwOi09/R8hJx5+RRUGyN1s4FqNUs/cHVBhOrpt7uE3YJMMs1kkqY9IGev/7PPJCVqa
 la2qswWv3J8BEprLp9mFGz/S21e4zprgHMd8qj8YTXuBb6w/5BUWl1A
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
Content-Transfer-Encoding: 7bit

From: Aaron Kling <webgeek1234@gmail.com>

Tegra HDA does not set the HBR capability bit, however every SoC since
Tegra114 does support HBR. Override the hbr setup function for these
SoCs to unconditionally enable the feature. Since Tegra30 does not
support HBR, this override will not be applied.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Before this, any attempt to open an hbr stream resulted in a rejection
on Tegra hardware. Looking at the downstream support, that just bypassed
the capbility check for all supported Tegra hardware in the common code.
This replicates that in a driver specific hook.

This has been tested on a SHIELD TV 2019 Pro trying to bitstream an
Atmos demo video. It attempts to play, but mostly just underruns the
entire time, with a few spurts of correct noise. My expectation is that
issue is userspace, since that is a WIP android audio hal. But even if
there are more kernel problems, this should be correct as a standalone
change.
---
Changes in v2:
- As suggested by Takashi, just don't apply the override for unsupported
  SoCs instead of trying to replicate the unsupported path.
- Link to v1: https://lore.kernel.org/r/20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com
---
 sound/hda/codecs/hdmi/tegrahdmi.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index ebb6410a48313..171d1ee154d9c 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -227,6 +227,37 @@ static int nvhdmi_chmap_validate(struct hdac_chmap *chmap,
 	return 0;
 }
 
+static int tegrahdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
+				   int dev_id, bool hbr)
+{
+	int pinctl, new_pinctl;
+
+	snd_hda_set_dev_select(codec, pin_nid, dev_id);
+	pinctl = snd_hda_codec_read(codec, pin_nid, 0,
+				    AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
+
+	if (pinctl < 0)
+		return hbr ? -EINVAL : 0;
+
+	new_pinctl = pinctl & ~AC_PINCTL_EPT;
+	if (hbr)
+		new_pinctl |= AC_PINCTL_EPT_HBR;
+	else
+		new_pinctl |= AC_PINCTL_EPT_NATIVE;
+
+	codec_dbg(codec, "%s: NID=0x%x, %spinctl=0x%x\n",
+		    __func__, pin_nid,
+		    pinctl == new_pinctl ? "" : "new-",
+		    new_pinctl);
+
+	if (pinctl != new_pinctl)
+		snd_hda_codec_write(codec, pin_nid, 0,
+				    AC_VERB_SET_PIN_WIDGET_CONTROL,
+				    new_pinctl);
+
+	return 0;
+}
+
 static int tegra_hdmi_init(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -255,6 +286,10 @@ static int tegra_hdmi_init(struct hda_codec *codec)
 	spec->chmap.ops.chmap_validate = nvhdmi_chmap_validate;
 	spec->nv_dp_workaround = true;
 
+	// Tegra 3 does not support HBR
+	if (codec->core.vendor_id != 0x10de0020)
+		spec->ops.pin_hbr_setup = tegrahdmi_pin_hbr_setup;
+
 	return 0;
 }
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261018-tegra-hda-hbr-35107238b629

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


