Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A69480345
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628683; cv=none; b=hiyNWSkfV+eid0x/zPoYqXSf2tUk4pwH1gsxfYWmpR/wfgRKMqNKQiM4YH9eziSghd3P/GpabwmZ4XSwAgHED7kjvheaxJaQYciG8YVRoRbEAmRunazGCTWP4TG3jl7oGu909ytX54EtGUKZgOpL1952muR7GsQtt2ASE5qaBxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628683; c=relaxed/simple;
	bh=A6l+WAt/iV+zJkzc8AbsZF5IIolZynYw+uY6h48QsEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOSXkYRiFiynS7avjwtgwBwkfFcvOwObRvx3gI8ATnpehhRwyRf0a5ydXVLJwf1/4LB+nR+/Cz3cbx2FXMVu6qXU9SWCCOdvFcwh2hEiJZFd/qM0bWjhkbutuGeG7O+5xmKzwqNL6r+hvpJ5fUFCas7ErL/ceuX7quNfo1rDkkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YabLRbEu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YabLRbEu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso31799985e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628678; x=1785233478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyQq8J9mZvpdXLAlP3nVs/VYUqZVy26W3Uq5hIZpY2Q=;
        b=YabLRbEuJxdboNUyeZUQFEok1QI2uc2ogbGomL2AEpxkVhB9Az/8UIfHbPE1lqwBui
         BM2Pp6sBS/rVt1QC7bX1r3yZB0At6ljeGObuRu1G95otZvewNNby7UO2kMXqStFqmz8A
         QQoHvZLnU41eY30Ox7s3Kv4coFkFAjwnv4oBrKIoQxT5aThk6NtIW2YKbvCn8ht4Utag
         3YTfnMOaHOzB1CeJDUw7XgYcEjdZjGCIurDi/pPvC3nTbTqZX9KkEPyoHuSCKAI6usON
         jsmWLtLslp2lLZQUz6a4BfUFJ66goupJNrbeqtcHh2Qmovqmdt51Cxgp7dfnHVSuwsYQ
         82bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628678; x=1785233478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyQq8J9mZvpdXLAlP3nVs/VYUqZVy26W3Uq5hIZpY2Q=;
        b=RypcfhEWBnRvd5U0Vwei+lRIrPVOJTcWUa6+zqOdw1yzHjhPV0L7ZLXBkmhbIoonpA
         1OXpxL9LYlt4vc8XAdDSj8IVknsPnCX4dwgsm6CiFatZKnQUeLIoXXchOakE7WwYA/Ay
         cP/R3neOMZQ23yvm9LwGRqFjpu/XRDYxXvau68SPUwAwtyYZIaT/+ZK7SAVHwv7KiEYO
         UmA9ZOwDAT41zEO8yGPKrh6EauZu5VPk6ShO9g5cBRfUww9s7pGI+2LFbQl+50MQMrqP
         t5L0XMbT4a7ARQQrofWZd4Sxnxk9wKiq+b/JBRUR6BChr/i/1WAHhkzZkYToFMeFWkFH
         JEZw==
X-Forwarded-Encrypted: i=1; AHgh+Rph+f/9mNE+D6Cn5IFbgpFqOyX1Ag7W4GkBDNd9SouKRyPI2ox1p3JKWtzRAxhDRK5ojNHFGJH+NtizUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDlRsKo2LWKXiXoyyxb3LpASmr/2628Gjt8sSDHJbszYS6aJui
	5rK45d7RvpbeSHeRpKC/CKZt4hd2Mv0T4e0a178biiHK0hVEBGHw8Lvn
X-Gm-Gg: AfdE7cnRcrGSWxG/2ZQgdUvwN5K3ud3dL4szPqF56ouWUenUbvtWgKZgdFL41l3vbWP
	W90tRBDlFo6XCaDNrNjVPlnxZZYsnpS6EUfTd54LOeaBG6bsjD11k3i3YyEFizBlJyiegoVs+Au
	wUROcyW4ztMapV8nRYp98h15Yd6+5ya6wrmVMCXHvhLFIQsPN/2tm2bP8kuoY5NgBa0G9L7jndt
	DNZv7FK8Dhdq+Mi9Ak3rkmhKiaMZmWyDR6GkTsabpbvawOtJlgstAz4jIqgRWduEF7j0WY8w5Ws
	0uDJLjyirloACBSSPiPrmHiIGCin0ovwq1T6AP99RFBYONpjEuhMyzEviHTsHu8I0rLYARoi2Np
	/51MJXIJNgrPzyRZZO810g9zG8e1WGyfTewVRIdQutIo19YcTpkCO1IjZrFCH5/Ns55Y8/lDT0c
	FZtU1VYO0Mm025LA+3CcmgDuw=
X-Received: by 2002:a05:600c:3587:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-4954a3d06d9mr190116565e9.2.1784628678459;
        Tue, 21 Jul 2026 03:11:18 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Tue, 21 Jul 2026 13:10:57 +0300
Message-ID: <20260721101059.451699-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index b71a02b3fd86f..32d55c18c7446 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

