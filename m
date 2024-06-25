Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE017DE0D;
	Tue, 25 Jun 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348970; cv=none; b=SmrYd3EpLRYdEEHJ9wneF7uxGfIZSeGcltPlrbO1ACd1iGRYbVDVoaFdmbeAK9Sw6LHh9NabMbyKwHzQzafS4RBDVwOijgXN/PPOSXcwOKyjiQQSbbzX+TYRwzWTUlFE3ukc5+8btKv2YNekED40YYA6FaGZMIwfSNtqAohHTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348970; c=relaxed/simple;
	bh=4TZx/NfkObkpzkc/APTFna1AeS4OYt2PJPB+5fHGxJA=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=O7IoVaJ9I+cGsGM1lzriK5DK7gF1q4dbTAllu7Jgi2OpMbc0fVTMsUGQuYnDvTn8Jqbm3IyQJY2Vhm4vqwGNRVa3bzGcHyy3QrXEVMUQu7VvsnDtl+xqN2qyqk0/6OM5c2WIqGNa2TLzY8IlGqDBrHURx3MXtFNkPqzg0OguT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU2nVr7U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU2nVr7U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4248ff53f04so19081775e9.0;
        Tue, 25 Jun 2024 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348967; x=1719953767; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+Ls/mue/yKH5kT6gkdnCfSWbjbKMTHc7IBMS9nMVyE=;
        b=iU2nVr7UwlhmVIdfU4ZOlgkctUcBcOKDgNJiL36KxgL6HWohZkGdCoHkKc18akxJtc
         Q8i4Rk11TzUJMjKPjGqvXSp1YofZZ0rwk/qruF8pDzRn1XyBmjKzk2z/zpkXdANgfh6f
         +UKl5m4+BW3JvYker9cmb8iVENkF/ICIWloJARw3pzUPd+EN9ajCKZG41lIq55/I45yq
         41pBkJnp+IUlMPZYOlbpSU3RW0o2HEeTk1OYW+2T5c7Xxg9eIIyEXDcdGLbOZKOR4UMf
         NSOeuCfzqRUQ0LBlvPuE2dJAeybkGqku0wWmFsZoF+TKHQPtsm6RGx4Q/EOLmrKQkpX8
         HA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348967; x=1719953767;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+Ls/mue/yKH5kT6gkdnCfSWbjbKMTHc7IBMS9nMVyE=;
        b=XoTw7VedVBt7KGH/cAxrE4aSI00XUqY9oArhEWXOhlpVgdKDjIVi+Mf1cguoRKzX7J
         qBbqCgpoEZwWEQkYQSy3WNAkmZ09m9AHblaxXLOvsUDNARXQ/uoPjpL6rha45mz2COwo
         qtCcDv/J0ViFKbbOaWyUL2ODWF40vvpqAHjLXHGXi2JT+g0sHFJYmj6ak+E86kyrjqmZ
         tvzlKecxauPmDuMuuFZyNUdoceuXRK2fKap1WfSuWFB/CcQ1Nguca/mBvYo4lj9c4Wqh
         CONKRFwUC/A9JvPqX5Q3v5g25sb2hy4qCvbzAwDlqDM+7F4pfkkwT8w0iv3e3juR43Yv
         KrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdyUuIBL2Hv7vQHec5iLpPkPDu0Er5yOcvTGBEcRGFp76Yc1bLXTH5bfNhSh49soyCvFzwsHkCdIqGzlK2IHchxugfuhAJwFe+dfxSKIHkZxn8+bcdoW0JiJfpxeDeyP4a1o/7Gx7Qk7o=
X-Gm-Message-State: AOJu0YzCDMCNHdcj/0KEyelwqCyoahjnr+O8mrdCkD5QZjsJkG4xVjnj
	YXdB4FtsPIK6K2mZiR7sLXh/R3uo40/9nyQA+0FvIFgIhqwFPXn/lMX1dwtk
X-Google-Smtp-Source: AGHT+IHw9TipA593kOXWiJMUeI5WtU1PYeHcpZuyczazsGbDyEnBHO3M4WOBMwEhgG/AgFK/9XRE6Q==
X-Received: by 2002:a5d:5f48:0:b0:366:e90f:3758 with SMTP id ffacd0b85a97d-366e90f38b2mr7658299f8f.10.1719348967222;
        Tue, 25 Jun 2024 13:56:07 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366fa9f612fsm4334598f8f.106.2024.06.25.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 13:56:06 -0700 (PDT)
Message-ID: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
X-Google-Original-Message-ID: <Znsu5ZeV539ZdT8x@laptom.>
Date: Tue, 25 Jun 2024 22:56:05 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: nvec: use x instead of x != NULL
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Comply with coding rules defined in checkpatch

Signed-off-by: Tom Mounet <tommounet@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57..814eb121c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);
 
-	if (msg != NULL)
+	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
@@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
 
-	if (msg != NULL)
+	if (msg)
 		*msg = nvec->last_sync_msg;
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
-- 
2.39.2

