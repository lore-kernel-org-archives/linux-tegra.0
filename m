Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A41A9F90
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 01:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415397; cv=none; b=TtfyJus/sDScEXSJFTHABtssjRqrkOZ+2Hxyl5eHh2dlfQ5thoPqmq5wx2UbBUifqSgHkf1wWgoiJfljWXB20DjuxPY3WtlHm1dFnFB/CvG/3dhunTe+iFotBqe9qLk+ahY9aIZnmBatMYKPwoaI4EQOxK/5FE9WmaNwpgKdQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415397; c=relaxed/simple;
	bh=HAn8Q0qD46S52DsoD8KOFk0HLdGDwh1bHqGsoxSYe94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQyk0xIkBMPOSkVyG3jEaURQCc58ZF7g9crrGQVjjR0y8x+hz+zE1pd1TI/KNNqzdVaYxFlDl925Q5OzCl2SLfU/uzzbub5Wb1ibur+7wBd9X6qrPv0Kbwoa+H+ijD56QCCEfhAeQrm52v3lYc3xIvZBY+yXyjYP9z6lvN9QHlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6qeI3En; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6qeI3En"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8272c559597so3880316b3a.1
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 17:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772415396; x=1773020196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=g6qeI3En8hFrDuE0M+rIBSDNhOKFpAFcfN87wr9TyqCtF19rj4+IWbcrGGqfpJ3tXc
         5BNHfATfSyVPdT+VGqZ4O9UpYCFF7yEySoGnCZ69Yazzm32njlP/SxfIa/HB5Ogt0SpL
         7gV3pSGK3hJmzjHepJRWSjTKF9h/lOBU/2bxrP/GQCulgjRdcfj1oACpwH9F64GbyLGJ
         NlmJk1wnXqgCaSZ6j4QfOM0I5yRF221BNk6WyjOwtUp+yvQG4fZCR9mnYLF0tA9roETC
         feKe/TxHriqI9B60NqkRdjIQgjQYDZ0dHF0kUR5pxGI0ZEkrWPz2iUn6Nz3t0gqPYNiL
         Gltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415396; x=1773020196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=i+sVuwZRwGba4ggDMx3wfSoY6lah4Wo8acBhCqBqdNPVYF0mzZ8T+/HVEUQPiiUSSG
         5TFC/egKZvSsTam4we+aBVWa5MmQ/b9y+Dh28LQRoMP/VNJVHvb3xeKtoTrolE6FyykH
         1+KS7a1jiNEHZk/FRfWtb0iLTbGEdCHB7r9ixH73HFTox0gj5uO9E6OLFCq58nYZ7g7J
         6A9B5BVsH8RdShFI5MLYdCzqGeGmTenTSYDwcAAnJSZbHdsj+ZqoIGMo1vFDxTYTr299
         ikzEm2EilKCT0ABfDjgA+TdNZ8o0QbLXrWWa75JDdnZue8xHPV/j+LocpX+ReUAyk7wT
         L+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLh1oyBvQC8hpduAWW3tElWJW2h4VLKG2DA/NSSTjSglvekLv6yKY1vR8W4DSxKxsB/Wu+0PqPirBc5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsBEZ33e97gQJqq4DYnI5TDh66HIkgOIQDsG5jWJSIMcbWR3f
	4IjiYa6lmix7ZPH5Rd9PULbysDVShEh/UfEjwu7o/vm/aU4NNAwjCIaO
X-Gm-Gg: ATEYQzxekPcki6dHZfIbimLmj4LZYpiRXGXmFeSyPYHCD0yXFYEOXyRZ7yA/UVI+5b+
	hwsZjUyMDl+ACBcXiKD89AdTFCUOvtoFdblcfez6Hyly02w0jalPb91H/WPztIE8vFXRun9JNjE
	1edDqnQEKmBDnqLKA+lx/d6yje+SgMTPb9FYEvGP+wQ6ilcqL5C8b01V6wIqklX2B+f5OWLLZ7n
	CtdHAbA+FQqwexY3/T4F5nhu0FbwNq212HpXfmPx6vpSsRN+3Uyq4WayWOYiWKOZLVyVOXOt0n9
	9taDrL+2ODaHmwmInmFa/KeItMqwyCr5oElbOcUKJZjw6uwLw+cpkj88nRWWNSrYyTO0xo1ldkk
	L7V4zxFvr5BZFY3Cc+pv2Bq8PYFJnqdbNvG0wXQCjQC7qbk2EAZLHxjXynHlgHyvz4wwY/Eufi6
	OF0RZupwGoo+hOix42lWbz+lVbzIA=
X-Received: by 2002:a05:6a00:3010:b0:827:28ba:ff03 with SMTP id d2e1a72fcca58-8274da1294amr9148648b3a.44.1772415396047;
        Sun, 01 Mar 2026 17:36:36 -0800 (PST)
Received: from linux-dev.. ([104.28.157.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff324esm12202688b3a.38.2026.03.01.17.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 17:36:35 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Date: Mon,  2 Mar 2026 01:36:09 +0000
Message-ID: <20260302013610.3815-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing commas after "e.g." and "i.e." in the KVM API
documentation to improve readability and follow standard
punctuation usage.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 Documentation/virt/kvm/api.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fc5736839edd..c8500f0e913a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6346,12 +6346,12 @@ A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) an
 userspace_addr (shared memory).  However, "valid" for userspace_addr simply
 means that the address itself must be a legal userspace address.  The backing
 mapping for userspace_addr is not required to be valid/populated at the time of
-KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
+KVM_SET_USER_MEMORY_REGION2, e.g., shared memory can be lazily mapped/allocated
 on-demand.
 
-When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
+When mapping a gfn into the guest, KVM selects shared vs. private, i.e., consumes
 userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
-state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
+state.  At VM creation time, all memory is shared, i.e., the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
-- 
2.43.0

