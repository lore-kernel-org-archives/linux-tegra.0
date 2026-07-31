Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F56403E82
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498103; cv=none; b=EwN94vNc35Hxr8ZxsnnBHMjU3fcw/eE81OHunKpHSSQb/bNf5S0brfyN+aY6r5bv7E64K4P2Hva115ln1U96YOdpt1ZRyk/zcC8H/VD+FH8txrllkimx8/nj6eYTjpKDJ1gWMfmyxTx9q9a4OUJSDkXAd/vTj/FVFUq9qaLe4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498103; c=relaxed/simple;
	bh=BDw0F7ULes1bte4YSLBHljJWq38T4e6moNgPJnN3yok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTtKojPM55Kd3ggZ5+MVzsG3ME7v97mAUEMbx/6KSSJJOuAKak8o9jZS95Wm+Nwp3/nSEU36feLqvwZbYmFrzHXouS3qiFUTBOrd/xRBdOknnPDb4p4FZuOj1HM/7pJ1RcjfJ9jpHbVFKIq2/+Y5bVt/Px1Evxz0fTlvarV9T/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6FIc3Xs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6FIc3Xs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so228897f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498098; x=1786102898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnYQKk++RFxqo7/Nlh6ltid4alJ0dkCuFh5DT65IXeQ=;
        b=A6FIc3XsAOmkPYBXMiE3bIl4XsHXPHUIxZz5dzSujYtWdUVQ4DrxBZtDKCvvBZRs6/
         Js92iGC+1xhZ1m9n3G+azDsbsRqCMhV6kIK9lV43uyUUFpoVm4uHIo3Mq6AqwObLUdSy
         ChCbYGA2r0N4c6y6pIhp9M3OMnuoudiGyGyeNOouiIWzqgF/k6Iv/wd1Ir+9VyCRCruH
         469xjlKrpNMXt/AAxV3+MUK0ZPf7eXQgKRVL3G1FS96fzGO8UeY4+c+K6dbtxWiFs3kr
         wj8vxoU6d7K6ZkgkrXyxhTXiImpCvn9Q8K5uFOOHot9QHIIqPX1oXENPjfyJ3IxLnCXz
         Es6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498098; x=1786102898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnYQKk++RFxqo7/Nlh6ltid4alJ0dkCuFh5DT65IXeQ=;
        b=DHhREghBCv5trb0ullf2djG3uwiXSES85UPDaDuhteWukSV75ADalnppxFsmwf+0eg
         wdBfQnB59BcPSC3b9HhOVYenE+IRwYEutyFJbWWU0zlpCUA3ut+RKwMzqRCgjwBrRbzj
         lZATvF6vE8NjS7i1oMbTlpqYCgT7eQhU8N/kQSTgQLHj64kDlS6nYn0ltb4Zk6cI9dC9
         HcqxB+iMTv0btcW5EnehHQSbmm+jByiZZG328PZi5Z/oXvxEYJfzpbvUWWE4GiCHKQCJ
         zIsd7MyZr1c2bXm0rm1RPvYxhMycpt3HfklXaVzwH6UGj7RRwNwqOVwb2o76BHkBb/KH
         D6zg==
X-Forwarded-Encrypted: i=1; AHgh+RpfgDHraDhMvGRRJQLyD9BkC32nLcF+HMqhlLFs6PjHxrQ8Bz6RtmrTb4wQiEUCYfEZv47WcjYCXQJGCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9U7gZSqE4D7zve3LxZ32tTlwmISLa3oKFwZy/eyLfeQG1LrO
	Fnh+QXZY4OEzAf+rOvdESaGQMA2PhJqArz3zAoP5OSoIQoAUXHCTzc/X
X-Gm-Gg: AR+sD12u1+xcrTsTrPT2ccYlCZPpi3j6rAm1IX9TGedJlHQKmzPQFd/sCpyRov6W7wa
	An5+o5FlWEt550PmDfEM8sMzIAugHKup7kaJdNty/0Fh7GV0r7FGAkp1kd2in1EGRgnqr3685bf
	ap8VghQvvmOl222zVeUlTxJAjpAt6SsCoUtbPtPf+8Sn9F7ILVXKkDLw2PvhOqSRM6Zf/0D/3WI
	uulLj8/ezTjTODuubi629uLGDdiUD5b81XwVxIz19/33kfPV/arynhimxNykx4bN7sw4Y2O6ttE
	Eyh2Sd73Wb+gSVWSYVnvQQyPyYh9ZV3rBEtRyjWLAx+HL33NvDlEem1AIRHHlhifw28RmKgNie/
	YT+dq+hZdMiFNsPCVSw2v0xStYuQ0J++1n2kJv9EUgbKlks4BMIA6lvm3JBEwKmbBSJNxeIpG+q
	Fiv5ytJJXEqCdJLGthfZxjgAqoitqZ6t0zQRzgwlR/dq4KlxTz2UkCAzwwaD0WLm0I9z3HhGWmO
	qOsMfFx5LMHUVrIaGqQ
X-Received: by 2002:a05:6000:1ac6:b0:47f:8ed4:133c with SMTP id ffacd0b85a97d-47fd2b40daemr4232740f8f.31.1785498098058;
        Fri, 31 Jul 2026 04:41:38 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Fri, 31 Jul 2026 14:41:05 +0300
Message-ID: <20260731114106.169398-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set UART-B line to use hsuart since it has GPS device linked to it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 32d55c18c7446..0d182fa5c1af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1283,6 +1283,11 @@ drive-gma {
 	};
 
 	serial@70006040 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
 		/* GPS */
 	};
 
-- 
2.53.0

