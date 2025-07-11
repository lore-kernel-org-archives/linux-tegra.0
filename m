Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1AA21FF45
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271799; cv=none; b=PhA/EAhIZjyyGFkEGNPALIJq/w/aJP9Gn68ebeZWmFkI7KsvFnyXFk78x9nNjeOaTQqjzoD2cMAYH+HMo8wTYKjHOXXf0o9srDCXDLMmZq1xm/AVR2bMhG/cJE6SZC5hHSN8CnINJXn/5s8NrlrbVGCIXKgxQOP/QoWMKeYCEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271799; c=relaxed/simple;
	bh=sBUY8HVbOqjRcVUZTWuZzJD7O75c+3tJ5HBIki1OZ2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A3L91tdIHEehSeXiuL8OZYOZZPrm/zdTlxyXXSXxYmzD8bVHPmEHJs8gBb6j1AOkInPTtJW7WOa59qvvnmgyX2JfeHknu5uEMkVKuxyHRiWCYeNmgXJB1uwiBlMzES52XZ9WovGv6iV5clY6yP4Hrqd9mKEcark8q5EmOZS9GDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWnXrs48; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWnXrs48"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1233907f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271796; x=1752876596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=iWnXrs48sI/maTZxXxAsiiv/xocFKFTqQte2w8DxXqHrvoeK6O5yuxj1yXwm0vfvKg
         EnuHbkes/LhCjgVGTPCPNUCynAVPGMqz4/YNOpbksS8JuAF3M+ZTWXOf43OBhaecDjGh
         WyhQf6/I8eyxx/mqkbVoQgoW8m60CnnmjyptRlXVMOIh2pmOsXBjaO0oDDhbjDU/96n9
         kYgcXjKRbX7jDovZulIxR+BdcrpvPH+Qs6A0KApnXtEAjItadDpWJ2XqKbsAzjxSKMYf
         9LYStHuD8Dm5aA0MJ7UEAzoFsFyQ8z60FXA5tm2pemnkCVQZUiHyXmgpzbb5z4NpG/NO
         OIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271796; x=1752876596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=CeYDyG23RcM7hyG7bpfoulXdhrn48mlDGitRxT07RWq5CHPpHOmJBZrbPuJOHP3jBW
         VWnB2DTUUrBLK+F3eDAZBk7i8EKyLdqJgea713MFOd5Ymg07P+ETprtcAjnKzzjcim9e
         9a593SNx1TEjSkozxPqcdtTYHciVToWFaDviBg7xBwiVV9YSTdgkjpXInXSdVQ4jnIBM
         r57HOhmXa5b7kKtEEa/byw12NY1lPEXCf7SVbokgKTnq0Bvc9AhdzGhUMOjNWkDkIhg+
         PjHLeOSzf6oj7BRI2giigsx5U0Nmuo8/37DEkpbRUgTQoRhKtjijZapKddDCS0ozUJ6g
         GGtw==
X-Forwarded-Encrypted: i=1; AJvYcCX0tclmyNthMEsNM0pRnYm4S257l49FtZzlwXK5UOQXeChn7ezzVblTOgfyzGog8VbHuRcx59IpenKNnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLD0RqZnYfRTYZyn7yQMjB03Lo4tjUEchlkzdkz7FcacoVtSQN
	5FTCrc7a8OAqxrBh3cYDI8le5aPrPjTuviuAyZtksC/aTcQOhXAssfmhuXo4vQ==
X-Gm-Gg: ASbGncs+AZ8ckr8oGrTHxPyzITdNHaxyba3mp94UUI/7Stmv7ZPIJ/tM6OjmmEmT4fz
	P+fRY8fQntOu8TRUoJ3UM227O7IJofZ8eqkYISh2I3U7hj7BxsO2gj30397OHFtIl/fqPw0XSdM
	zHjZlxl9/Drf8sGvUZJRJpXbuK0+Y8QaqrfeqspgEn3duiK7ruUeqvyHLd6D1PhzQgFkCovoGK3
	FHCbwvia1d4AGWeMS5B8I9GlLcbvRWle96r4cQD9K/qLHpQ3WlVpvNgO1HaHCP1SfOb/VxytHuT
	tzJtr/8BUkkxwImasP3ZZbU29zfg0FjVjuixdJTn4cWwUPL2yLfo3yotdGrBfmMVBJ4QYFAmiDC
	ZSrpdNrAJ8MFbcg5vvkN/sstod4PAprQH/HEx/0EiWSvxFD/QZombgluC/k+6pVQq5Q2XEDx1Px
	oW2mPgDqtVzfpoiw==
X-Google-Smtp-Source: AGHT+IENH1hy3RB3Y6IqQfb9Wk7lIQp/dnXlD6dHrZhbvQVNIhOUcU051VDc+cLy6tZHWGLWzJ29fA==
X-Received: by 2002:a05:6000:643:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b5f1875e37mr4907758f8f.7.1752271795585;
        Fri, 11 Jul 2025 15:09:55 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d76fsm5704960f8f.64.2025.07.11.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:38 +0200
Message-ID: <20250711220943.2389322-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-core

for you to fetch changes up to 398e67e0f5ae04b29bcc9cbf342e339fe9d3f6f1:

  ARM: tegra: Use I/O memcpy to write to IRAM (2025-07-09 14:20:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.17-rc1

Fixes an issue when copying data to IRAM using memcpy() and use the
memcpy_toio() function instead.

----------------------------------------------------------------
Aaron Kling (1):
      ARM: tegra: Use I/O memcpy to write to IRAM

 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
