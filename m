Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B252327C13;
	Mon, 18 May 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100256; cv=none; b=NBrMi3eJQtCpeNyeLXWnXdg4Cy/nxQ/n3tNoyx1s/aofY9cf47LLlirt9I5jAWng9Qx1KWTTqfn9XKskGof8xrCjkQPvLsnEBlYZ1M9FGek2giL6Aja02fmKDK//aTpnMNCuHDt9Fwp06veh7aGfXh+TeNseZzItA8UL5L69zos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100256; c=relaxed/simple;
	bh=50TjhgnVmYRUF6Xy+gJCwmaxbDzOViHP9xJuJuhoEVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arCT83TczSdauJwylg41I4243xLC+YcBduhINVtAu4ETQgJ50kEKX2jj4MeluE3TVQTQ+9BttJxwSeVq8ow6ZUMyToMz2pkj9F9pNKf8bcBqg0eVkLUpGvBkTTmVxaBewiFbzTmU4sA/+U68E3xXdhKZlN5Q4Gfeiw6FQ6zuFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VqEQFLf8; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VqEQFLf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779100243; x=1810636243;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=57BKhrzrww/oj2bQTyT2tJUOOogiCFZ1vx7aZ99NI/s=;
  b=VqEQFLf81PXMqObVdG7itwjKWHkV8pxGEq1qezh6/XZ3whE0dT6LMGWW
   xcwp3RLXQ9q6tixEgdw6AXTaubtFEaBX9GxEWYqIPCv55krsWdDpIsKHx
   NOQkRVvdwie77KMTQX7M+4jwXtjh+zw1q/FhDO9TdYd7gX+lzpbsgXLbD
   u/55b4K6MOw3QHF6bMER0lj0BUSExNVOQxrn77lgaP9W0/9cVguBfrGhc
   oVNBiTQVPhppLxvSYE7vHSGOuk6G2pJPznLmmLC2lEhOva3BNF0p3Xeiy
   CAKLmJic8h5I4w3I7bLuV07i9zfL+v6ZXQ9D6EOrKec5gf4bv9dNFdP4n
   w==;
X-CSE-ConnectionGUID: LMr5h8RXTJ65sbn4Ssps7g==
X-CSE-MsgGUID: 731x69l5S825Um3O2xXqEQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:04 +0900
X-CSE-ConnectionGUID: 4jQSlB5ITpKgajH3gphI2g==
X-CSE-MsgGUID: spYUaIejTPeTbctKBbAqhA==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041670"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:04 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:19:58 +0900
Subject: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=50TjhgnVmYRUF6Xy+gJCwmaxbDzOViHP9xJuJuhoEVo=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xdWZa8Xc9j/a/HiLfnr7GZMC0mpaJOM53hY9ts7L
 vfTnPfBHaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRAGlGhp35Qbwq4genvz/c
 eqls3p7zR5wUv7ScuuN55aj5/X/+XJYMf+X3CN8/0yHf2HpXsvXSPRsfwZ+H1wVz7Up/0GhxY2f
 iTUYA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Commit "driver core: platform: set mod_name in driver registration" will set
struct device_driver's mod_name member for platform driver registration. For a
driver to be registered with its mod_name set, module_kset needs to be
initialized, which currently happens in a subsys_initcall in param_sysfs_init().
The tegra cbb drivers register themselves before module_kset init, in a
core_initcall. This works currently because lookup_or_create_module_kobject(),
which dereferences module_kset via kset_find_obj(), is not called if mod_name
is not set, which is the case now.

So in preparation for the commit "driver core: platform: set mod_name in driver registration",
move module_kset init to pure_initcall level, ensuring it happens before tegra
cbb driver registration.

Suggested-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Patch 4 depends on this patch
---
 kernel/params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..ac088d4b09a9 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+pure_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter

-- 
2.43.0

