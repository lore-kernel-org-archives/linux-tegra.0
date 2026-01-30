Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24A37F0F9
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777400; cv=none; b=Sphnp9i+TUA2rxsbl+Vs6JJYqpyE8RZeggUFWOso5icS4Aw/x0+hmmk8EZ3MAl1om8R+l3+PNXQfN+gyj4yu7dA9yspA7R3S5ysjWrQQp/eQhY5lKlI90FDhKRmN57b5kD0GZhImKhjAhW3p5F0YdupolrVLOPksRHEr0nzFU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777400; c=relaxed/simple;
	bh=/SlcgcoXh6qESEbxV+NcpVqvXpkWkqApdJg+bzGWNTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxvKMBzFpJ78Sk8Pz9eL3J88Rnjh4+FGVhUrYiySvwjgCkh6aoV411QxFpdjkF/psxMLX+z2sMvXcO61sTNDG5gAPYGnq6yyK2bGHh1TdvR9bOCXYt4yXrbiNzs2q7PvjJ7NJ+tRM9q4e5FZKZe3P0/zZ3xfp40+Y03Q1hpPFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIf2q0LT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIf2q0LT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806bf03573so11389645e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777397; x=1770382197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=QIf2q0LTJikh21uLKDT1MMoq0ewo3Fi0t2yjMv+M1Yj/t+pNu7VGQK61Bfd2GH1+s9
         bHKEF0NzMYHX7kmjWnWHy62tYfBEFvbVofvRS+9mgkI+0kY2JoLslZf9TgrXwGfI9szY
         w+bxkBWihfkTUtrYqAtchcCEdA78cbi+05fLyPYkxYTDcWA47uBWmXuGg5TgXeNaxxGz
         Lbih4T8X9fDIm+dSkFHKhvo0G1/04KOeusmcF2kPoZcVnd+hd3F2ratVsuOV7AyD9Z51
         OoEZLClTc3KOr9d/LOCEYOi57k0MWfRAt8XWc1FVUPTJQm6T/uSnM4d4vx8FxIhc/l5H
         C4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777397; x=1770382197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=N/taKtERwYzqiQrLQLd75X9BuZei+ExcJIYb09h7QpT8/b9o/tKRf6fu6SRrLfQi1B
         VkPTUqD3C9uU4MdxYtu4WpRGPbr/eG+d4VTjhqWkNXwWpmDiqhpR+KeaHabH9Pg1Ny7L
         hDAFsIXdY1vPd8SOC3fovnyg4lTVSnSnEC8c/sAoHP1uxA62pHAm8NFXY3Ari2Y/rCXd
         WZzjUl/tViQrf8B4HW9IMXfFbUdVRMDiEImRViSJruBoE+1JbTkIxFvurNqIf8OZE/3G
         m4a5nFkeMAB6ZXrAoRIy5cjUwet2E8k8c9dmaX8cwEpcW7J5O9MXnQbz09bu8fptJdZo
         3HJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx/IaZYBJsVGDUwTBnwyuxQacXBm3BwfvR8DxMJ5W42nNSt8tqLRnnJ7ViFKy3jMpkMR6odm5dihMZqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwifOak+sazm3SHPo2UUNSWaUGEjZIN0LlXW7O4LtAK8FoGv44X
	gN1u8H0ogUA7VsuPIGaSujttE2hw2JV4uVWm2gl8P++8qIHFzCKUKb0m
X-Gm-Gg: AZuq6aKqqOaOhRv/MaGAnqhTkaTPaWE8w+vSxhKKQen8AWg3vFhiy5JlKQH+5abg0xg
	Y9t612l9ZY5lZHoRe/4fIk/8bxNl4NSaPnFGDjgIvCe6alkAycSvsuaqO+MNd8lD8P3/LMRMBdW
	fGzF3r8c7cdGIo8qc2kgpwBAdWQMcUZdILTaUK60R1l8aLNdhw9+GweR7DU4YfRUJ0vpqoeU4Rp
	XroX3G/oD7SdOTrYPCR5TWHtucW9P128L8v0VP2Lr9mgn6Yxvnt4g7tQFbjx4fObI3q2o0bhit8
	T8fI9J9FjE8fdfyb8EU+R7rbnDXXZqStgoYayCYPhmGLGLZfVsftvzCg4x+sAbSp5NBl0GRqtcd
	DOYnmTaIzG1dtXZNcVIsxqBJkddhQB/qPefyoIP2JMqQ7d+ZSfYmkRSn/MSny5sF7FfUmme58u2
	JhKikHWp1NdFA=
X-Received: by 2002:a05:600c:a00e:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-482db4bda8dmr37743845e9.16.1769777396741;
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Fri, 30 Jan 2026 14:49:19 +0200
Message-ID: <20260130124932.351328-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4b80086f8c05..70a84158b589 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0

